Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9537B10310E
	for <lists+linux-doc@lfdr.de>; Wed, 20 Nov 2019 02:18:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727465AbfKTBSe (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 19 Nov 2019 20:18:34 -0500
Received: from mail-vs1-f73.google.com ([209.85.217.73]:56175 "EHLO
        mail-vs1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727403AbfKTBSd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Nov 2019 20:18:33 -0500
Received: by mail-vs1-f73.google.com with SMTP id m15so3381064vsj.22
        for <linux-doc@vger.kernel.org>; Tue, 19 Nov 2019 17:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=w9Omy1J67am0DPSN962nybp2oZPVeQHQ9zsVOB2Amks=;
        b=FJ0ltWBXhHWMS0c6GYfvc7PNf8AS021jwUj0V0MjCocgzuIQFtz4uj0xKxoyn9Qt4+
         9hV7m7495hw0RPTIjK6ezDyw/TMzulHepf/M8Mot6xoocvC4ZJiJHhmYcFlhWsg92RVz
         Q5kcZKqBlpdLjvnbjGzb8MorfL9Ayg3gS4jMkVUUAqcLehC5FkVT/TjW4jNhQ+qZz0uJ
         PkWzUCEBgkFrFc5NPdw2eAZYJmvIGQnlDI1LvFswJ5P8vV5YpX5ydmGOpoticF6AU/17
         XCMeMCu6iIHCmlSP76ZU5sjsQaCafRJGSu3J3kezKnjGV6do1Nrk28ErOr3wMFlCfc4c
         4c2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=w9Omy1J67am0DPSN962nybp2oZPVeQHQ9zsVOB2Amks=;
        b=gLDioeYC+JKlg2YQ47NjCuBJkqpjOvdO1To2Wbas7rlDllklnwts32iEXr4//XNHjB
         E8Uozz6gNOZZ0nBTpZwPVLL2Hi6ghbzKMhGwBhZLwTvwGUj9jh9Cv6RqQIw9T+Dm5kFz
         E+KK/tXq88je5zgpsG8OoAdUemT6yOP1LRPoYVbkIsDwAe0IxICBRMc9pUoAekgPaTA/
         6hD6eJrCOTeytrdjmNG5ZVgt3y3JpgW6FxIxXtq9YaNfzSio37sgsLUYOhxC3lKiWURL
         V1H6b8C+lUbG0qTQGMWLffbEal3W+8aTfSMuCpk/JBo9vDW8VLA5P0H0ubf1yNd6ioyH
         izjg==
X-Gm-Message-State: APjAAAVMm07/VvUY5GmeSuCxWewOwlxin4BIHMYBKreYk1cB8UzLX2CH
        5clAiifL5HIWIDa/Y88EBer3GBHqoY4LTWyIN5N58A==
X-Google-Smtp-Source: APXvYqxQewPInxd/AtoPMDTkgVX/7xnpnYyb2wBOV92EeCfsP7+Eyye5IOJ7B3k6OI2S+cNda5S6ozT9Cf7YrTIB/GEILg==
X-Received: by 2002:a67:efd5:: with SMTP id s21mr34622vsp.136.1574212712570;
 Tue, 19 Nov 2019 17:18:32 -0800 (PST)
Date:   Tue, 19 Nov 2019 17:17:00 -0800
Message-Id: <20191120011700.227543-1-brendanhiggins@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
Subject: [PATCH linux-kselftest/test v4] Documentation: kunit: add
 documentation for kunit_tool
From:   Brendan Higgins <brendanhiggins@google.com>
To:     shuah@kernel.org, davidgow@google.com
Cc:     kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net, tytso@mit.edu,
        Brendan Higgins <brendanhiggins@google.com>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add documentation for the Python script used to build, run, and collect
results from the kernel known as kunit_tool. kunit_tool
(tools/testing/kunit/kunit.py) was already added in previous commits.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: David Gow <davidgow@google.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/dev-tools/kunit/index.rst      |  1 +
 Documentation/dev-tools/kunit/kunit-tool.rst | 57 ++++++++++++++++++++
 Documentation/dev-tools/kunit/start.rst      |  5 +-
 3 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/dev-tools/kunit/kunit-tool.rst

diff --git a/Documentation/dev-tools/kunit/index.rst b/Documentation/dev-tools/kunit/index.rst
index 26ffb46bdf99d..c60d760a0eed1 100644
--- a/Documentation/dev-tools/kunit/index.rst
+++ b/Documentation/dev-tools/kunit/index.rst
@@ -9,6 +9,7 @@ KUnit - Unit Testing for the Linux Kernel
 
 	start
 	usage
+	kunit-tool
 	api/index
 	faq
 
diff --git a/Documentation/dev-tools/kunit/kunit-tool.rst b/Documentation/dev-tools/kunit/kunit-tool.rst
new file mode 100644
index 0000000000000..50d46394e97e3
--- /dev/null
+++ b/Documentation/dev-tools/kunit/kunit-tool.rst
@@ -0,0 +1,57 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=================
+kunit_tool How-To
+=================
+
+What is kunit_tool?
+===================
+
+kunit_tool is a script (``tools/testing/kunit/kunit.py``) that aids in building
+the Linux kernel as UML (`User Mode Linux
+<http://user-mode-linux.sourceforge.net/>`_), running KUnit tests, parsing
+the test results and displaying them in a user friendly manner.
+
+What is a kunitconfig?
+======================
+
+It's just a defconfig that kunit_tool looks for in the base directory.
+kunit_tool uses it to generate a .config as you might expect. In addition, it
+verifies that the generated .config contains the CONFIG options in the
+kunitconfig; the reason it does this is so that it is easy to be sure that a
+CONFIG that enables a test actually ends up in the .config.
+
+How do I use kunit_tool?
+========================
+
+If a kunitconfig is present at the root directory, all you have to do is:
+
+.. code-block:: bash
+
+	./tools/testing/kunit/kunit.py run
+
+However, you most likely want to use it with the following options:
+
+.. code-block:: bash
+
+	./tools/testing/kunit/kunit.py run --timeout=30 --jobs=`nproc --all`
+
+- ``--timeout`` sets a maximum amount of time to allow tests to run.
+- ``--jobs`` sets the number of threads to use to build the kernel.
+
+If you just want to use the defconfig that ships with the kernel, you can
+append the ``--defconfig`` flag as well:
+
+.. code-block:: bash
+
+	./tools/testing/kunit/kunit.py run --timeout=30 --jobs=`nproc --all` --defconfig
+
+.. note::
+	This command is particularly helpful for getting started because it
+	just works. No kunitconfig needs to be present.
+
+For a list of all the flags supported by kunit_tool, you can run:
+
+.. code-block:: bash
+
+	./tools/testing/kunit/kunit.py run --help
diff --git a/Documentation/dev-tools/kunit/start.rst b/Documentation/dev-tools/kunit/start.rst
index aeeddfafeea20..f4d9a4fa914f8 100644
--- a/Documentation/dev-tools/kunit/start.rst
+++ b/Documentation/dev-tools/kunit/start.rst
@@ -19,7 +19,10 @@ The wrapper can be run with:
 
 .. code-block:: bash
 
-   ./tools/testing/kunit/kunit.py run
+	./tools/testing/kunit/kunit.py run --defconfig
+
+For more information on this wrapper (also called kunit_tool) checkout the
+:doc:`kunit-tool` page.
 
 Creating a kunitconfig
 ======================
-- 
2.24.0.432.g9d3f5f5b63-goog

