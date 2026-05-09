Return-Path: <linux-doc+bounces-86586-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id XWdRMrra/mnfxQAAu9opvQ
	(envelope-from <linux-doc+bounces-86586-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 09 May 2026 08:56:58 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5005B4FE532
	for <lists+linux-doc@lfdr.de>; Sat, 09 May 2026 08:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BE07430138A6
	for <lists+linux-doc@lfdr.de>; Sat,  9 May 2026 06:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0167037996C;
	Sat,  9 May 2026 06:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f27OjLSX"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07E82D739B;
	Sat,  9 May 2026 06:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778309812; cv=none; b=m8OFKcsY4/hIx65PLeI5XeViDO5l+xG/HxOse/x1kGTV1pSk7z+q878KGP3eVcZssVC7VtbY7y+QhKq+yf/Pewbk0hhOXKadjVbsddoYq19L9ONS5DCYqo3i3Hyn+A322a7mZA/QBtw5DYm7b08zi5CB+/Bwu/4fr4qyXoo5nsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778309812; c=relaxed/simple;
	bh=vvbVKXiMZTQ7JhI4IceyRauJ2Kf7XejKUUzqts3ZkGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=slikEW87SLYQqsk604J5VgqiQ6K7CyMTx/fgmthXZLT42KbEn8r0D9i3i6K3cczTb3ohEItAvQ6+ibLrjwtV5yy99GE5QBqMqcDvlXkFqhm76X8UPy+FgMww4xgRUMRB+kwDVLbuKd20FHqu49+EORIvCd5liUtzJ7izgE6+yjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f27OjLSX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89AC7C2BCF6;
	Sat,  9 May 2026 06:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778309812;
	bh=vvbVKXiMZTQ7JhI4IceyRauJ2Kf7XejKUUzqts3ZkGA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f27OjLSXF10mDRzIxJRJi2kMEbu7v5FrW83uIzrOrsTHwKumnDL1ZCgksuGRtJVrw
	 tzg8xxRMe/HpcdA/wJ7feWniqrGcArSEpLuKCp4Ec5/SRQ/+anBLcYLQix+K93mJSD
	 tI59ixx5AYPSId2RKFaVfhJhBlWM33nmBracqbwODidNB+jdqG/mrFTCUND2HoX6SD
	 PTzELDDkAI64fltlzu2vNM+6sZabfOHteGkrotpsiupO0nth4LoS03GMMH5y7aGwSG
	 isB5ZRaK1/JjKmGKcNTEnDLEkqz/U603EoK2ogmJqcomvX52B1Y3D0mvMZrT4I38FP
	 ll+hQcESUa75Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wLbcI-00000000GIn-2VLm;
	Sat, 09 May 2026 08:56:50 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v3 04/13] docs: maintainers_include: clean most SPHINXDIRS=process warnings
Date: Sat,  9 May 2026 08:56:37 +0200
Message-ID: <567200712771590d08e4da096b4def92bf729ffe.1778309595.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778309595.git.mchehab+huawei@kernel.org>
References: <cover.1778309595.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Rspamd-Queue-Id: 5005B4FE532
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-86586-lists,linux-doc=lfdr.de,huawei];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

building docs with SPHINXDIRS=process is too noisy, as it
generates lots of undefined refs. Fixing it is easy: just let
linkify generate html URLs for the broken links when SPHINXDIRS
is used.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <b57d83081c28aa52683b403f8836d098fcdd8530.1777987027.git.mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 44 +++++++++++++++------
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 615af227a8f8..d3ad01e5309e 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -58,8 +58,8 @@ class MaintainersParser:
         self.field_content = ""
         self.subsystem_name = None
 
-        self.app_dir = app_dir
-        self.base_dir, self.doc_dir, self.sphinx_dir = app_dir.partition("Documentation")
+        self.app_dir = os.path.abspath(app_dir)
+        self.base_dir, _, self.sphinx_dir = self.app_dir.partition("Documentation")
 
         self.re_doc = re.compile(r'(Documentation/([^\s\?\*]*)\.rst)')
 
@@ -104,10 +104,25 @@ class MaintainersParser:
 
     def linkify(self, text):
         """Linkify all non-wildcard refs to ReST files in Documentation/"""
+
         m = self.re_doc.search(text)
         if m:
-            # maintainers.rst is in a subdirectory, so include "../".
-            text = self.re_doc.sub(':doc:`%s <../%s>`' % (m.group(2), m.group(2)), text)
+            fname = m.group(1)
+            ename = m.group(2)
+
+            entry = os.path.relpath(self.base_dir + fname, self.app_dir)
+            entry = entry.removesuffix(".rst")
+
+            #
+            # When SPHINXDIRS is used, it will try to reference files
+            # outside srctree, causing warnings. To avoid that, point
+            # to the latest official documentation
+            #
+            if entry.startswith("../"):
+                html = KERNELDOC_URL + ename + ".html"
+                text = self.re_doc.sub(f'`{ename} <{html}>`_', text)
+            else:
+                text = self.re_doc.sub(f':doc:`{ename} </{entry}>`', text)
 
         return text
 
@@ -176,27 +191,32 @@ class MaintainersParser:
         if field == "P":
             match = self.re_doc.match(details)
             if match:
-                name = "".join(match.groups())
-                entry = os.path.relpath(self.base_dir + name, self.app_dir)
+                fname = match.group(1)
+                ename = match.group(2)
 
-                full_name = os.path.join(self.base_dir, name)
-                path = os.path.relpath(full_name, self.app_dir)
+                entry = os.path.relpath(self.base_dir + fname, self.app_dir)
+                entry = entry.removesuffix(".rst")
                 #
                 # When SPHINXDIRS is used, it will try to reference files
                 # outside srctree, causing warnings. To avoid that, point
                 # to the latest official documentation
                 #
-                if path.startswith("../"):
-                    entry = KERNELDOC_URL + "/" + match.group(2) + ".html"
+
+                if entry.startswith("../"):
+                    entry = KERNELDOC_URL + ename + ".html"
                 else:
                     entry = "/" + entry
 
                 if "*" in entry:
                     for e in glob(entry):
-                        self.profile_toc.add(e)
+                        if "html" not in e:
+                            self.profile_toc.add(e)
+
                         self.profile_entries[self.subsystem_name] = e
                 else:
-                    self.profile_toc.add(entry)
+                    if "html" not in entry:
+                        self.profile_toc.add(entry)
+
                     self.profile_entries[self.subsystem_name] = entry
             else:
                 match = re.match(r"(https?://.*)", details)
-- 
2.54.0


