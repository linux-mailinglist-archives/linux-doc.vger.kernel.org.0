Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 275FB284D59
	for <lists+linux-doc@lfdr.de>; Tue,  6 Oct 2020 16:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726138AbgJFOHy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 6 Oct 2020 10:07:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:32846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725902AbgJFODy (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Oct 2020 10:03:54 -0400
Received: from mail.kernel.org (ip5f5ad5bd.dynamic.kabel-deutschland.de [95.90.213.189])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 577AC20782;
        Tue,  6 Oct 2020 14:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601993033;
        bh=8Ugy8JtQBg0iQvd2yN/ML4tDaHJflxT3n0hmWb/m5F8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FYRax+YqyD52SDk0aYQqvvFDZ1mtyKOGVrs73tWyc54mtRBlrC35HiKlffeSF9FNX
         QoEY2XUTNjFyteulqX2glPPWfHPrqo937CsWGoY64Pjn5RwssZ4apNg5hMfu8Np+Cw
         7VECNZRDOQ+aGR1PC7+rSFSL9aYAjAtFrZ9HuGOA=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kPnZH-0019EY-1f; Tue, 06 Oct 2020 16:03:51 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 01/52] docs: cdomain.py: add support for a new Sphinx 3.1+ tag
Date:   Tue,  6 Oct 2020 16:02:58 +0200
Message-Id: <f84573321f88b059b8040bd5fd0f2962ee505985.1601992016.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601992016.git.mchehab+huawei@kernel.org>
References: <cover.1601992016.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Since Sphinx 3.0, the C domain code was rewritten, but only
after version 3.1 it got support for setting namespaces on
C domains, with is something that it is required, in order to
document system calls, like ioctl() and others.

As part of changing the documentation subsystem to properly
build with Sphinx 3.1+, add support for such new tag:

	.. c:namespace::"

Such tag optionally replaces the optional "name" tag for functions,
setting a single namespace domain for all C references found
at the file.

With that, it should be possible to convert existing
documentation to be compatible with both Sphinx 1.x/2.x and
3.1+.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/cdomain.py | 55 ++++++++++++++++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

diff --git a/Documentation/sphinx/cdomain.py b/Documentation/sphinx/cdomain.py
index cbac8e608dc4..35805c44a4fc 100644
--- a/Documentation/sphinx/cdomain.py
+++ b/Documentation/sphinx/cdomain.py
@@ -40,14 +40,56 @@ from sphinx import addnodes
 from sphinx.domains.c import c_funcptr_sig_re, c_sig_re
 from sphinx.domains.c import CObject as Base_CObject
 from sphinx.domains.c import CDomain as Base_CDomain
+from itertools import chain
+import re
 
-__version__  = '1.0'
+__version__  = '1.1'
 
 # Get Sphinx version
 major, minor, patch = sphinx.version_info[:3]
 
+# Namespace to be prepended to the full name
+namespace = None
+
+#
+# Handle trivial newer c domain tags that are part of Sphinx 3.1 c domain tags
+# - Store the namespace if ".. c:namespace::" tag is found
+
+RE_namespace = re.compile(r'^\s*..\s*c:namespace::\s*(\S+)\s*$')
+
+def markup_namespace(match):
+    global namespace
+
+    namespace = match.group(1)
+
+    return ""
+
+def c_markups(app, docname, source):
+    result = ""
+    markup_func = {
+        RE_namespace: markup_namespace,
+    }
+
+    lines = iter(source[0].splitlines(True))
+    for n in lines:
+        match_iterators = [regex.finditer(n) for regex in markup_func]
+        matches = sorted(chain(*match_iterators), key=lambda m: m.start())
+        for m in matches:
+            n = n[:m.start()] + markup_func[m.re](m) + n[m.end():]
+
+        result = result + n
+
+    source[0] = result
+
+#
+# Now implements support for the cdomain namespacing logic
+#
+
 def setup(app):
 
+    # Handle easy Sphinx 3.1+ simple new tags: :c:expr and .. c:namespace::
+    app.connect('source-read', c_markups)
+
     if (major == 1 and minor < 8):
         app.override_domain(CDomain)
     else:
@@ -75,6 +117,8 @@ class CObject(Base_CObject):
         function-like macro, the name of the macro is returned. Otherwise
         ``False`` is returned.  """
 
+        global namespace
+
         if not self.objtype == 'function':
             return False
 
@@ -107,11 +151,16 @@ class CObject(Base_CObject):
             param += nodes.emphasis(argname, argname)
             paramlist += param
 
+        if namespace:
+            fullname = namespace + "." + fullname
+
         return fullname
 
     def handle_signature(self, sig, signode):
         """Transform a C signature into RST nodes."""
 
+        global namespace
+
         fullname = self.handle_func_like_macro(sig, signode)
         if not fullname:
             fullname = super(CObject, self).handle_signature(sig, signode)
@@ -122,6 +171,10 @@ class CObject(Base_CObject):
             else:
                 # FIXME: handle :name: value of other declaration types?
                 pass
+        else:
+            if namespace:
+                fullname = namespace + "." + fullname
+
         return fullname
 
     def add_target_and_index(self, name, sig, signode):
-- 
2.26.2

