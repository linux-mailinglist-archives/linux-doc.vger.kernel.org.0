Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C12F4284D54
	for <lists+linux-doc@lfdr.de>; Tue,  6 Oct 2020 16:08:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727123AbgJFOHe (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 6 Oct 2020 10:07:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:33144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726214AbgJFODy (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Oct 2020 10:03:54 -0400
Received: from mail.kernel.org (ip5f5ad5bd.dynamic.kabel-deutschland.de [95.90.213.189])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 69D2E2083B;
        Tue,  6 Oct 2020 14:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601993033;
        bh=8Wg4J7Lyd/Va8b7XV8z9jXdPVZ/IrSKHVEYF1TFbuSY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RYHQ7En3Ne/fphOiy+cchyN4h4mSWBgSxqgaRhgcnyF7Ukd6GKSO9Xj/StyeXXWMB
         +ZhjAbIdShSe//ARODaSgryqWpgJkozTyXZkJINiAhFDaoEnUmC7ZgUZeQAGtNiJlP
         XNSXmhvTkLVlrrULlX6mAz5lKTBDxedUi6Xsmbls=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kPnZH-0019Ea-2W; Tue, 06 Oct 2020 16:03:51 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 02/52] docs: cdomain.py: extend it to handle new Sphinx 3.x tags
Date:   Tue,  6 Oct 2020 16:02:59 +0200
Message-Id: <baadb994094af8b7de31622aae6ec95ccf55a35a.1601992016.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601992016.git.mchehab+huawei@kernel.org>
References: <cover.1601992016.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

While most of the C domain parsing is done via kernel-doc,
some RST files use C domain tags directly.

While several of them can be removed for Sphinx < 3.0, due
to automarkup.py, and several others that could be
converted into kernel-doc markups, changes like that are
time-consuming, and may not fit all cases.

As we already have the cdomain.py for handing backward
compatibility with Sphinx versions below 3.0, let's
make it more complete, in order to cover any usage of the
newer tags outside kernel-doc.

This way, it should be feasible to use the new tags inside
the Kernel tree, without losing backward compatibility.

This should allow fixing the remaining warnings with
the Kernel tags.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/cdomain.py | 40 ++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/Documentation/sphinx/cdomain.py b/Documentation/sphinx/cdomain.py
index 35805c44a4fc..014a5229e57a 100644
--- a/Documentation/sphinx/cdomain.py
+++ b/Documentation/sphinx/cdomain.py
@@ -54,7 +54,7 @@ namespace = None
 #
 # Handle trivial newer c domain tags that are part of Sphinx 3.1 c domain tags
 # - Store the namespace if ".. c:namespace::" tag is found
-
+#
 RE_namespace = re.compile(r'^\s*..\s*c:namespace::\s*(\S+)\s*$')
 
 def markup_namespace(match):
@@ -64,10 +64,48 @@ def markup_namespace(match):
 
     return ""
 
+#
+# Handle c:macro for function-style declaration
+#
+RE_macro = re.compile(r'^\s*..\s*c:macro::\s*(\S+)\s+(\S.*)\s*$')
+def markup_macro(match):
+    return ".. c:function:: " + match.group(1) + ' ' + match.group(2)
+
+#
+# Handle newer c domain tags that are evaluated as .. c:type: for
+# backward-compatibility with Sphinx < 3.0
+#
+RE_ctype = re.compile(r'^\s*..\s*c:(struct|union|enum|enumerator|alias)::\s*(.*)$')
+
+def markup_ctype(match):
+    return ".. c:type:: " + match.group(2)
+
+#
+# Handle newer c domain tags that are evaluated as :c:type: for
+# backward-compatibility with Sphinx < 3.0
+#
+RE_ctype_refs = re.compile(r':c:(var|struct|union|enum|enumerator)::`([^\`]+)`')
+def markup_ctype_refs(match):
+    return ":c:type:`" + match.group(2) + '`'
+
+#
+# Simply convert :c:expr: and :c:texpr: into a literal block.
+#
+RE_expr = re.compile(r':c:(expr|texpr):`([^\`]+)`')
+def markup_c_expr(match):
+    return '\ ``' + match.group(2) + '``\ '
+
+#
+# Parse Sphinx 3.x C markups, replacing them by backward-compatible ones
+#
 def c_markups(app, docname, source):
     result = ""
     markup_func = {
         RE_namespace: markup_namespace,
+        RE_expr: markup_c_expr,
+        RE_macro: markup_macro,
+        RE_ctype: markup_ctype,
+        RE_ctype_refs: markup_ctype_refs,
     }
 
     lines = iter(source[0].splitlines(True))
-- 
2.26.2

