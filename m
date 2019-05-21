Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C55C2259CD
	for <lists+linux-doc@lfdr.de>; Tue, 21 May 2019 23:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727854AbfEUVR3 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 21 May 2019 17:17:29 -0400
Received: from ms.lwn.net ([45.79.88.28]:42970 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726907AbfEUVR2 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 21 May 2019 17:17:28 -0400
Received: from meer.lwn.net (localhost [127.0.0.1])
        by ms.lwn.net (Postfix) with ESMTPA id C75FEA78;
        Tue, 21 May 2019 21:17:27 +0000 (UTC)
From:   Jonathan Corbet <corbet@lwn.net>
To:     linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Markus Heiser <markus.heiser@darmarit.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 2/2] doc: Cope with the deprecation of AutoReporter
Date:   Tue, 21 May 2019 15:17:14 -0600
Message-Id: <20190521211714.1395-3-corbet@lwn.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190521211714.1395-1-corbet@lwn.net>
References: <20190521211714.1395-1-corbet@lwn.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

AutoReporter is going away; recent versions of sphinx emit a warning like:

  /stuff/k/git/kernel/Documentation/sphinx/kerneldoc.py:125:
      RemovedInSphinx20Warning: AutodocReporter is now deprecated.
      Use sphinx.util.docutils.switch_source_input() instead.

Make the switch.  But switch_source_input() only showed up in 1.7, so we
have to do ugly version checks to keep things working in older versions.
---
 Documentation/sphinx/kerneldoc.py | 38 ++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
index e8891e63e001..d3216f7b4170 100644
--- a/Documentation/sphinx/kerneldoc.py
+++ b/Documentation/sphinx/kerneldoc.py
@@ -37,7 +37,17 @@ import glob
 from docutils import nodes, statemachine
 from docutils.statemachine import ViewList
 from docutils.parsers.rst import directives, Directive
-from sphinx.ext.autodoc import AutodocReporter
+
+#
+# AutodocReporter is only good up to Sphinx 1.7
+#
+import sphinx
+
+Use_SSI = sphinx.__version__[:3] >= '1.7'
+if Use_SSI:
+    from sphinx.util.docutils import switch_source_input
+else:
+    from sphinx.ext.autodoc import AutodocReporter
 
 import kernellog
 
@@ -125,13 +135,7 @@ class KernelDocDirective(Directive):
                     lineoffset += 1
 
             node = nodes.section()
-            buf = self.state.memo.title_styles, self.state.memo.section_level, self.state.memo.reporter
-            self.state.memo.reporter = AutodocReporter(result, self.state.memo.reporter)
-            self.state.memo.title_styles, self.state.memo.section_level = [], 0
-            try:
-                self.state.nested_parse(result, 0, node, match_titles=1)
-            finally:
-                self.state.memo.title_styles, self.state.memo.section_level, self.state.memo.reporter = buf
+            self.do_parse(result, node)
 
             return node.children
 
@@ -140,6 +144,24 @@ class KernelDocDirective(Directive):
                            (" ".join(cmd), str(e)))
             return [nodes.error(None, nodes.paragraph(text = "kernel-doc missing"))]
 
+    def do_parse(self, result, node):
+        if Use_SSI:
+            save = self.state.memo.title_styles, self.state.memo.section_level
+            try:
+                with switch_source_input(self.state, result):
+                    self.state.nested_parse(result, 0, node, match_titles=1)
+            finally:
+                self.state.memo.title_styles, self.state.memo.section_level = save
+        else:
+            save = self.state.memo.title_styles, self.state.memo.section_level, self.state.memo.reporter
+            self.state.memo.reporter = AutodocReporter(result, self.state.memo.reporter)
+            self.state.memo.title_styles, self.state.memo.section_level = [], 0
+            try:
+                self.state.nested_parse(result, 0, node, match_titles=1)
+            finally:
+                self.state.memo.title_styles, self.state.memo.section_level, self.state.memo.reporter = save
+
+
 def setup(app):
     app.add_config_value('kerneldoc_bin', None, 'env')
     app.add_config_value('kerneldoc_srctree', None, 'env')
-- 
2.21.0

