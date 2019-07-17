Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDD106BC4A
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jul 2019 14:28:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726326AbfGQM20 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 17 Jul 2019 08:28:26 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:53830 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbfGQM2Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Jul 2019 08:28:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ocB/ghOziF5jrEmXT3iT/mJY9Q0luzZaykQDOMO3bsQ=; b=BthEQ7koNA9Y6mXykztsK3IBdW
        RLiLobvmzX8tAbb9CdFJebwvZIo7jZApxiidX2MvYBalUtq+eDtPRKSSMrMnwLJXFASt81ynBI58X
        VszXMAEMnPM9i+RlhMKlZ30xhWWDv07V0WJHk0UNvh+gEKGaBjMih1u3YigzxrXFDTc6moTcYQ5UA
        66feRzX3iUdxpnD3xTkYd+SXhmtTFCogMukSB1zlO0N5ll2s/3vXvWwSVfDHYQw/M1pdlautUcBpI
        99whGi7rbxmpljtO4pshFxpo6hb+QRvcgQ7Ap2kXmL3HqnLJ9ohlDVFk+yYKbL2IC4WTTeSSaqkRG
        1f64Tn+g==;
Received: from [191.33.154.161] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hnj2m-0006fS-FN; Wed, 17 Jul 2019 12:28:24 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hnj2j-000528-TS; Wed, 17 Jul 2019 09:28:21 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v4 04/15] docs: kernel_abi.py: add a script to parse ABI documentation
Date:   Wed, 17 Jul 2019 09:28:08 -0300
Message-Id: <bca67d341676749467e51d658f4b43bc4eed338f.1563365880.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1563365880.git.mchehab+samsung@kernel.org>
References: <cover.1563365880.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The ABI documentation is special: it is not plain text files,
but, instead, files with an strict format, as specified by
Documentation/ABI/README.

Add a parser for it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/sphinx/kernel_abi.py | 158 +++++++++++++++++++++++++++++
 1 file changed, 158 insertions(+)
 create mode 100644 Documentation/sphinx/kernel_abi.py

diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
new file mode 100644
index 000000000000..3e2529a05b7b
--- /dev/null
+++ b/Documentation/sphinx/kernel_abi.py
@@ -0,0 +1,158 @@
+# -*- coding: utf-8; mode: python -*-
+# SPDX-License-Identifier: GPL-2.0
+#
+u"""
+    kernel-abi
+    ~~~~~~~~~~
+
+    Implementation of the ``kernel-abi`` reST-directive.
+
+    :copyright:  Copyright (C) 2016  Markus Heiser
+    :copyright:  Copyright (C) 2016-2019  Mauro Carvalho Chehab
+    :maintained-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
+    :license:    GPL Version 2, June 1991 see Linux/COPYING for details.
+
+    The ``kernel-abi`` (:py:class:`KernelCmd`) directive calls the
+    scripts/get_abi.pl script to parse the Kernel ABI files.
+
+    Overview of directive's argument and options.
+
+    .. code-block:: rst
+
+        .. kernel-abi:: <ABI directory location>
+            :debug:
+
+    The argument ``<ABI directory location>`` is required. It contains the
+    location of the ABI files to be parsed.
+
+    ``debug``
+      Inserts a code-block with the *raw* reST. Sometimes it is helpful to see
+      what reST is generated.
+
+"""
+
+import sys
+import os
+from os import path
+import subprocess
+
+from sphinx.ext.autodoc import AutodocReporter
+
+from docutils import nodes
+from docutils.parsers.rst import Directive, directives
+from docutils.statemachine import ViewList
+from docutils.utils.error_reporting import ErrorString
+
+
+__version__  = '1.0'
+
+# We can't assume that six is installed
+PY3 = sys.version_info[0] == 3
+PY2 = sys.version_info[0] == 2
+if PY3:
+    # pylint: disable=C0103, W0622
+    unicode     = str
+    basestring  = str
+
+def setup(app):
+
+    app.add_directive("kernel-abi", KernelCmd)
+    return dict(
+        version = __version__
+        , parallel_read_safe = True
+        , parallel_write_safe = True
+    )
+
+class KernelCmd(Directive):
+
+    u"""KernelABI (``kernel-abi``) directive"""
+
+    required_arguments = 1
+    optional_arguments = 0
+    has_content = False
+    final_argument_whitespace = True
+
+    option_spec = {
+        "debug"     : directives.flag
+    }
+
+    def warn(self, message, **replace):
+        replace["fname"]   = self.state.document.current_source
+        replace["line_no"] = replace.get("line_no", self.lineno)
+        message = ("%(fname)s:%(line_no)s: [kernel-abi WARN] : " + message) % replace
+        self.state.document.settings.env.app.warn(message, prefix="")
+
+    def run(self):
+
+        doc = self.state.document
+        if not doc.settings.file_insertion_enabled:
+            raise self.warning("docutils: file insertion disabled")
+
+        env = doc.settings.env
+        cwd = path.dirname(doc.current_source)
+        cmd = "get_abi.pl rest --dir "
+        cmd += self.arguments[0]
+
+        srctree = path.abspath(os.environ["srctree"])
+
+        fname = cmd
+
+        # extend PATH with $(srctree)/scripts
+        path_env = os.pathsep.join([
+            srctree + os.sep + "scripts",
+            os.environ["PATH"]
+        ])
+        shell_env = os.environ.copy()
+        shell_env["PATH"]    = path_env
+        shell_env["srctree"] = srctree
+
+        lines = self.runCmd(cmd, shell=True, cwd=cwd, env=shell_env)
+        nodeList = self.nestedParse(lines, fname)
+        return nodeList
+
+    def runCmd(self, cmd, **kwargs):
+        u"""Run command ``cmd`` and return it's stdout as unicode."""
+
+        try:
+            proc = subprocess.Popen(
+                cmd
+                , stdout = subprocess.PIPE
+                , stderr = subprocess.PIPE
+                , universal_newlines = True
+                , **kwargs
+            )
+            out, err = proc.communicate()
+            if err:
+                self.warn(err)
+            if proc.returncode != 0:
+                raise self.severe(
+                    u"command '%s' failed with return code %d"
+                    % (cmd, proc.returncode)
+                )
+        except OSError as exc:
+            raise self.severe(u"problems with '%s' directive: %s."
+                              % (self.name, ErrorString(exc)))
+        return unicode(out)
+
+    def nestedParse(self, lines, fname):
+        content = ViewList()
+        node    = nodes.section()
+
+        if "debug" in self.options:
+            code_block = "\n\n.. code-block:: rst\n    :linenos:\n"
+            for l in lines.split("\n"):
+                code_block += "\n    " + l
+            lines = code_block + "\n\n"
+
+        for c, l in enumerate(lines.split("\n")):
+            content.append(l, fname, c)
+
+        buf  = self.state.memo.title_styles, self.state.memo.section_level, self.state.memo.reporter
+        self.state.memo.title_styles  = []
+        self.state.memo.section_level = 0
+        self.state.memo.reporter      = AutodocReporter(content, self.state.memo.reporter)
+        try:
+            self.state.nested_parse(content, 0, node, match_titles=1)
+        finally:
+            self.state.memo.title_styles, self.state.memo.section_level, self.state.memo.reporter = buf
+        return node.children
-- 
2.21.0

