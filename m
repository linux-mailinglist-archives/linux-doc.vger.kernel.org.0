Return-Path: <linux-doc+bounces-83680-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WF1gAxbP4Wm0yQAAu9opvQ
	(envelope-from <linux-doc+bounces-83680-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 17 Apr 2026 08:11:34 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F097341742B
	for <lists+linux-doc@lfdr.de>; Fri, 17 Apr 2026 08:11:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 031303016D29
	for <lists+linux-doc@lfdr.de>; Fri, 17 Apr 2026 06:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3FD636C0DC;
	Fri, 17 Apr 2026 06:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DHY1uT9N"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDD5351C28;
	Fri, 17 Apr 2026 06:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776406287; cv=none; b=QNALrsPw5HCdp0VkN5WKjHIn3M67NGS+NVS2rzPFIMxFw7hYHfKiDvKm5hn2vFuaMQ19Lyt1UHS64zQaDL6hcw5g42ofR8reynoWQ7zXtWKWIv2gbJqYRGZMpd7M6iYn4025NRjYvsZ2vxFGxSTmXo8uI4tVjGf5ymV0rUEXNeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776406287; c=relaxed/simple;
	bh=lpFijLl6DOvM61uAD6IUooTPFM8/pj/MpyljGy4dY4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=renc0+mQzGJGYIDnVUjaq2ND76d7CtacVrEYqtVcfv+pUJHlm62KS8yINc78yBzXo5zmSTY8YTo5J9ub7yINjjvNlLKz6ipiuj22mNVDKMh+51IVNbp/d4qo6SZ/NagzYTzMUbZbcvWuEUnxTeiH4Pn3YjtWcY9kkPQWCZU4Ax0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DHY1uT9N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551E9C2BCB4;
	Fri, 17 Apr 2026 06:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776406287;
	bh=lpFijLl6DOvM61uAD6IUooTPFM8/pj/MpyljGy4dY4Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DHY1uT9NosBb/2dwmUGHX98luF3zEZhY/hJps+A4+PnRfToUlWvtIP7O8VaOvoXTc
	 PApGzrjZAYu4HPiaz/JDTsXhpCzBEiFI4GUDrWdKw+ckuTBrNxv2Gh9ENCuO+M+mUY
	 QKY0oT7ARpOGCkV/BapoE8Lf/LxAZO2zRky5ROf3Tsm2RfKU3jMVMeQMquZimoaUqU
	 8v9CVHc9dQOIRVygm0oht2rcAlgOP/EfcTO3IUTBsAPYaYh19tL0gI5VeXm7vNztPQ
	 mjZnJ1Uxn6k7QvLG7JFiasicpDVPoD1p8s2PmTecexWwHZQGdcRubXC0lTpHRyPDNa
	 6S2zoszcW0Pkw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wDcQH-0000000H8sZ-28uc;
	Fri, 17 Apr 2026 08:11:25 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Dan Williams <djbw@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 03/11] docs: maintainers_include: auto-generate maintainer profile TOC
Date: Fri, 17 Apr 2026 08:11:13 +0200
Message-ID: <b54f1bd9687aef11dc9bae51ab409663b0ef7ccb.1776405189.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1776405189.git.mchehab+huawei@kernel.org>
References: <cover.1776405189.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-83680-lists,linux-doc=lfdr.de,huawei];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F097341742B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a feature to allow auto-generating media entry profiles from the
corresponding field inside MAINTAINERS file(s).

Suggested-by: Dan Williams <djbw@kernel.org>
Closes: https://lore.kernel.org/linux-doc/69dd6299440be_147c801005b@djbw-dev.notmuch/
Acked-by: Dan Williams <djbw@kernel.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <4e9512a3d05942c98361d06d60a118d7c78762b6.1776176108.git.mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 93 +++++++++++++++++----
 1 file changed, 76 insertions(+), 17 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 519ad18685b2..1dac83bf1a65 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -21,6 +21,8 @@ import sys
 import re
 import os.path
 
+from textwrap import indent
+
 from docutils import statemachine
 from docutils.parsers.rst import Directive
 from docutils.parsers.rst.directives.misc import Include
@@ -30,20 +32,11 @@ def ErrorString(exc):  # Shamelessly stolen from docutils
 
 __version__  = '1.0'
 
-def setup(app):
-    app.add_directive("maintainers-include", MaintainersInclude)
-    return dict(
-        version = __version__,
-        parallel_read_safe = True,
-        parallel_write_safe = True
-    )
+class MaintainersParser:
+    """Parse MAINTAINERS file(s) content"""
 
-class MaintainersInclude(Include):
-    """MaintainersInclude (``maintainers-include``) directive"""
-    required_arguments = 0
-
-    def parse_maintainers(self, path):
-        """Parse all the MAINTAINERS lines into ReST for human-readability"""
+    def __init__(self, base_path, path):
+        self.profiles = list()
 
         result = list()
         result.append(".. _maintainers:")
@@ -78,6 +71,12 @@ class MaintainersInclude(Include):
             # Drop needless input whitespace.
             line = line.rstrip()
 
+            match = re.match(r"P:\s*(Documentation/\S+)\.rst", line)
+            if match:
+                fname = os.path.relpath(match.group(1), base_path)
+                if fname not in self.profiles:
+                    self.profiles.append(fname)
+
             # Linkify all non-wildcard refs to ReST files in Documentation/.
             pat = r'(Documentation/([^\s\?\*]*)\.rst)'
             m = re.search(pat, line)
@@ -165,12 +164,23 @@ class MaintainersInclude(Include):
             for separated in field_content.split('\n'):
                 result.append(separated)
 
-        output = "\n".join(result)
+        self.output = "\n".join(result)
+
+        # Create a TOC class
+
+class MaintainersInclude(Include):
+    """MaintainersInclude (``maintainers-include``) directive"""
+    required_arguments = 0
+
+    def emit(self, base_path, path):
+        """Parse all the MAINTAINERS lines into ReST for human-readability"""
+
+        output = MaintainersParser(base_path, path).output
+
         # For debugging the pre-rendered results...
         #print(output, file=open("/tmp/MAINTAINERS.rst", "w"))
 
-        self.state_machine.insert_input(
-          statemachine.string2lines(output), path)
+        self.state_machine.insert_input(statemachine.string2lines(output), path)
 
     def run(self):
         """Include the MAINTAINERS file as part of this reST file."""
@@ -186,12 +196,61 @@ class MaintainersInclude(Include):
 
         # Append "MAINTAINERS"
         path = os.path.join(path, "MAINTAINERS")
+        base_path = os.path.dirname(self.state.document.document.current_source)
 
         try:
             self.state.document.settings.record_dependencies.add(path)
-            lines = self.parse_maintainers(path)
+            lines = self.emit(base_path, path)
         except IOError as error:
             raise self.severe('Problems with "%s" directive path:\n%s.' %
                       (self.name, ErrorString(error)))
 
         return []
+
+class MaintainersProfile(Include):
+    required_arguments = 0
+
+    def emit(self, base_path, path):
+        """Parse all the MAINTAINERS lines looking for profile entries"""
+
+        profiles = MaintainersParser(base_path, path).profiles
+
+        output  = ".. toctree::\n"
+        output += "   :maxdepth: 2\n\n"
+        output += indent("\n".join(profiles), "   ")
+
+        self.state_machine.insert_input(statemachine.string2lines(output), path)
+
+    def run(self):
+        """Include the MAINTAINERS file as part of this reST file."""
+        if not self.state.document.settings.file_insertion_enabled:
+            raise self.warning('"%s" directive disabled.' % self.name)
+
+        # Walk up source path directories to find Documentation/../
+        path = self.state_machine.document.attributes['source']
+        path = os.path.realpath(path)
+        tail = path
+        while tail != "Documentation" and tail != "":
+            (path, tail) = os.path.split(path)
+
+        # Append "MAINTAINERS"
+        path = os.path.join(path, "MAINTAINERS")
+        base_path = os.path.dirname(self.state.document.document.current_source)
+
+        try:
+            self.state.document.settings.record_dependencies.add(path)
+            lines = self.emit(base_path, path)
+        except IOError as error:
+            raise self.severe('Problems with "%s" directive path:\n%s.' %
+                      (self.name, ErrorString(error)))
+
+        return []
+
+def setup(app):
+    app.add_directive("maintainers-include", MaintainersInclude)
+    app.add_directive("maintainers-profile-toc", MaintainersProfile)
+    return dict(
+        version = __version__,
+        parallel_read_safe = True,
+        parallel_write_safe = True
+    )
-- 
2.53.0


