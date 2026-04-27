Return-Path: <linux-doc+bounces-84781-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEFNAJZx72kBBgEAu9opvQ
	(envelope-from <linux-doc+bounces-84781-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 16:24:22 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E7D4744D4
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 16:24:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CD888300A249
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 14:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 334663D566C;
	Mon, 27 Apr 2026 14:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FDWrdDXh"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5BE3D5258;
	Mon, 27 Apr 2026 14:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777299757; cv=none; b=paIKeWc9jxFlAkFU2x/Y6yVBkWuVoGmPCIEMnjkoTpg898H536QmxqzODzInIt/b+iMFtGpfxfwCzCMuOiXgmjpGidoe5aa+8uudSb+RiG6CF6pZzjDIeTPsYXpXu1bHMVfh0rAwhrsiN+Ac0PiUDJ97JmILA5cy9PpDLqzhspI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777299757; c=relaxed/simple;
	bh=eFz8XAM9SiBNlLtIZjPZ85JxZ3rANvBqFGiI57xq6pg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YKc0MNWXlKddviejbgLDhr+JhnLuj95CC3JvdarWUwkJAw64SP+FSeaZR/NAC2W0RqDb3I8B3l18rDGSXjdmP2qOAMVt3VvlmOTCyeYyQfHaFIHk6a2QVJgvIYDTYkT4YkCYpfcpnDOXUwlI9MKL0N7PqD9SBJ4nyfw5JNSox2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FDWrdDXh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D50DFC2BCB4;
	Mon, 27 Apr 2026 14:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777299756;
	bh=eFz8XAM9SiBNlLtIZjPZ85JxZ3rANvBqFGiI57xq6pg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FDWrdDXhnM9SGHEd65ZvmkRefIelu7R38FBdiVDvQJ4yMfucw7PbvXY0nSEKnt2lS
	 nAQF3TgUG0UT0JvN01L5GLAQRko2eecfKcn9apqpgcfZCxnd973AaiV9W+27u1awe5
	 nWG+yEc86HL1I2D8H+Ow8Hrug38v3MMdPSk/Ve/qqcrI0v7wDTXaXV4+5TxU30F1+b
	 P/6NedC89m/nr1cvlyXuknfZ2d0QmRubot2bn6R9lLiOk41i5EGBhQdEkIkxRMJLXV
	 UmREdsu4vZtqdcmAjJLSSkWeYnt97EEUODYV9AHdiCVjwdEdnX/+qKtqdLRfwQmmo3
	 duMRagZlxRWcA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wHMr5-0000000C8b1-0jdP;
	Mon, 27 Apr 2026 16:22:35 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v4 10/10] docs: maintainers_include: parse MAINTAINERS just once
Date: Mon, 27 Apr 2026 16:22:28 +0200
Message-ID: <8060589074f54a276e563db8cad124d3f88346c7.1777295258.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777295258.git.mchehab+huawei@kernel.org>
References: <cover.1777295258.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Rspamd-Queue-Id: F0E7D4744D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84781-lists,linux-doc=lfdr.de,huawei];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

Change the logic to parse MAINTAINERS file content just once,
while still allowing using it multiple times.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 61 +++++++--------------
 1 file changed, 21 insertions(+), 40 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index ae52e8198750..436e7ac42ffc 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -37,14 +37,13 @@ def ErrorString(exc):  # Shamelessly stolen from docutils
 
 __version__  = '1.0'
 
-app_dir = "."
+maint_parser = None
 
 class MaintainersParser:
     """Parse MAINTAINERS file(s) content"""
 
-    def __init__(self, path):
-        global app_dir
-
+    def __init__(self, app_dir, path):
+        self.path = path
         self.profile_toc = set()
         self.profile_entries = {}
 
@@ -67,7 +66,6 @@ class MaintainersParser:
         subsystem_name = None
 
         base_dir, doc_dir, sphinx_dir = app_dir.partition("Documentation")
-        print("BASE DIR", base_dir)
 
         for line in open(path):
             # Have we reached the end of the preformatted Descriptions text?
@@ -105,8 +103,6 @@ class MaintainersParser:
                 else:
                     entry = "/" + entry
 
-                print(f"{name}: entry: {entry} FULL: {full_name} path: {path}")
-
                 if "*" in entry:
                     for e in glob(entry):
                         self.profile_toc.add(e)
@@ -217,14 +213,17 @@ class MaintainersInclude(Include):
     """MaintainersInclude (``maintainers-include``) directive"""
     required_arguments = 0
 
-    def emit(self, path):
+    def emit(self):
         """Parse all the MAINTAINERS lines into ReST for human-readability"""
+        global maint_parser
 
-        output = MaintainersParser(path).output
+        path = maint_parser.path
+        output = maint_parser.output
 
         # For debugging the pre-rendered results...
         #print(output, file=open("/tmp/MAINTAINERS.rst", "w"))
 
+        self.state.document.settings.record_dependencies.add(path)
         self.state_machine.insert_input(statemachine.string2lines(output), path)
 
     def run(self):
@@ -232,19 +231,8 @@ class MaintainersInclude(Include):
         if not self.state.document.settings.file_insertion_enabled:
             raise self.warning('"%s" directive disabled.' % self.name)
 
-        # Walk up source path directories to find Documentation/../
-        path = self.state_machine.document.attributes['source']
-        path = os.path.realpath(path)
-        tail = path
-        while tail != "Documentation" and tail != "":
-            (path, tail) = os.path.split(path)
-
-        # Append "MAINTAINERS"
-        path = os.path.join(path, "MAINTAINERS")
-
         try:
-            self.state.document.settings.record_dependencies.add(path)
-            lines = self.emit(path)
+            lines = self.emit()
         except IOError as error:
             raise self.severe('Problems with "%s" directive path:\n%s.' %
                       (self.name, ErrorString(error)))
@@ -254,16 +242,17 @@ class MaintainersInclude(Include):
 class MaintainersProfile(Include):
     required_arguments = 0
 
-    def emit(self, path):
+    def emit(self):
         """Parse all the MAINTAINERS lines looking for profile entries"""
+        global maint_parser
 
-        maint = MaintainersParser(path)
+        path = maint_parser.path
 
         #
         # Produce a list with all maintainer profiles, sorted by subsystem name
         #
         output = ""
-        for profile, entry in sorted(maint.profile_entries.items()):
+        for profile, entry in sorted(maint_parser.profile_entries.items()):
             if entry.startswith("http"):
                 output += f"- `{profile} <{entry}>`_\n"
             else:
@@ -276,13 +265,12 @@ class MaintainersProfile(Include):
         output += "\n.. toctree::\n"
         output += "   :hidden:\n\n"
 
-        for fname in maint.profile_toc:
+        for fname in maint_parser.profile_toc:
             output += f"   {fname}\n"
 
         output += "\n"
 
-        print(output)
-
+        self.state.document.settings.record_dependencies.add(path)
         self.state_machine.insert_input(statemachine.string2lines(output), path)
 
     def run(self):
@@ -290,19 +278,8 @@ class MaintainersProfile(Include):
         if not self.state.document.settings.file_insertion_enabled:
             raise self.warning('"%s" directive disabled.' % self.name)
 
-        # Walk up source path directories to find Documentation/../
-        path = self.state_machine.document.attributes['source']
-        path = os.path.realpath(path)
-        tail = path
-        while tail != "Documentation" and tail != "":
-            (path, tail) = os.path.split(path)
-
-        # Append "MAINTAINERS"
-        path = os.path.join(path, "MAINTAINERS")
-
         try:
-            self.state.document.settings.record_dependencies.add(path)
-            lines = self.emit(path)
+            lines = self.emit()
         except IOError as error:
             raise self.severe('Problems with "%s" directive path:\n%s.' %
                       (self.name, ErrorString(error)))
@@ -310,13 +287,17 @@ class MaintainersProfile(Include):
         return []
 
 def setup(app):
-    global app_dir
+    global maint_parser
 
     #
     # NOTE: we're using os.fspath() here because of a Sphinx warning:
     #   RemovedInSphinx90Warning: Sphinx 9 will drop support for representing paths as strings. Use "pathlib.Path" or "os.fspath" instead.
     #
     app_dir = os.fspath(app.srcdir)
+    srctree = os.path.abspath(os.environ["srctree"])
+    path = os.path.join(srctree, "MAINTAINERS")
+
+    maint_parser = MaintainersParser(app_dir, path)
 
     app.add_directive("maintainers-include", MaintainersInclude)
     app.add_directive("maintainers-profile-toc", MaintainersProfile)
-- 
2.53.0


