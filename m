Return-Path: <linux-doc+bounces-79931-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBiSHqltumnRWQIAu9opvQ
	(envelope-from <linux-doc+bounces-79931-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 10:17:29 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D2F2B8CB7
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 10:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D8AF30BE1D2
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 09:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ACDD3A6EE8;
	Wed, 18 Mar 2026 09:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nbz+tnB7"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0C73A5E89;
	Wed, 18 Mar 2026 09:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825081; cv=none; b=RLPeB861EtlmyD0DkqyrOz0vkXu+h8gIfiZxo67Rbl5KjTVxcAWXFwcFhMfSfKsehvbET/V4OdAhAcyLDxAONe/HIFXYFVzjidQTlvdVmyx+pmy7y6x/kXTNmm5FWQZVjXyM4rTkraQ/Zacz0HM0HxFZoNFuM+yzDhyVrMFvhr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825081; c=relaxed/simple;
	bh=dOysoiiVSubxrcejiWzvM4dwgqXYUK8uzfq5tdoOHI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U/ip3k/ttzb6LKFPpPMbWp+8+q6Pqfos7YnB6bqj3prTMX7Coafa4FsKUvf1zPn9A5g7PZWzFUY94mL+xZuA+h3gpYx0LwmrEOyRaTq18+xrnSRmV9v20aNe9xKrq2Zz/0dvzLzQ5fJDG39LZR1qoVHH5KmAynPNUnvnQUjldwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nbz+tnB7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CA72C2BCB5;
	Wed, 18 Mar 2026 09:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773825080;
	bh=dOysoiiVSubxrcejiWzvM4dwgqXYUK8uzfq5tdoOHI4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nbz+tnB7kpzO6Go7QVUEXdVNoHBrdyN1ZkAtfOIWrjrcaFPlSM21KY2wzLjy1o/j5
	 yBLOy+qvVBnJbFmIH6zVi5hjzh78y3mw8rwcGAqBHLBM7wmc33E3togGBgM4ygduUF
	 Qs+W0B0127N8xT108vCcKJq8iyhIk8DW+79XVYZoE5CqfZzOFkrfrnYr+eJ7uyVAWF
	 0JJu3cOtX5ZTRQySUp1KrVAh2IhABJMp0LVM5iLADDelrjsOOWapBqrVd9B35Q9xLB
	 CFHoxS+LKmRxy5c10haPe9551cQPFGGrufxSFYbt+ygDAJ9DZdLc0GM83yqnM2WODL
	 ehfOyc7JdEXzQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w2mvu-00000002fpa-2QJx;
	Wed, 18 Mar 2026 10:11:18 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 05/14] docs: kdoc_files: move output symbols logic to kdoc_output
Date: Wed, 18 Mar 2026 10:11:05 +0100
Message-ID: <4ebc26e37a0b544c50d50b8077760f147fa6a535.1773823995.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773823995.git.mchehab+huawei@kernel.org>
References: <cover.1773823995.git.mchehab+huawei@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-79931-lists,linux-doc=lfdr.de,huawei];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 20D2F2B8CB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When writing unittests for kdoc_output, it became clear that
the logic with handles a series of KdocItem symbols from
a single file belons to kdoc_output, and not to kdoc_files.

Move the code to it.

While here, also ensure that self.config will be placed
together with set.out_style.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_files.py  | 18 ++----------------
 tools/lib/python/kdoc/kdoc_output.py | 21 +++++++++++++++++++++
 2 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_files.py b/tools/lib/python/kdoc/kdoc_files.py
index 1c5cb9e5f0e8..58f4ee08e226 100644
--- a/tools/lib/python/kdoc/kdoc_files.py
+++ b/tools/lib/python/kdoc/kdoc_files.py
@@ -269,6 +269,7 @@ class KernelFiles():
         # Initialize variables that are internal to KernelFiles
 
         self.out_style = out_style
+        self.out_style.set_config(self.config)
 
         self.errors = 0
         self.results = {}
@@ -311,8 +312,6 @@ class KernelFiles():
         returning kernel-doc markups on each interaction.
         """
 
-        self.out_style.set_config(self.config)
-
         if not filenames:
             filenames = sorted(self.results.keys())
 
@@ -336,25 +335,12 @@ class KernelFiles():
                                       function_table, enable_lineno,
                                       no_doc_sections)
 
-            msg = ""
             if fname not in self.results:
                 self.config.log.warning("No kernel-doc for file %s", fname)
                 continue
 
             symbols = self.results[fname]
-            self.out_style.set_symbols(symbols)
-
-            for arg in symbols:
-                m = self.out_msg(fname, arg.name, arg)
-
-                if m is None:
-                    ln = arg.get("ln", 0)
-                    dtype = arg.get('type', "")
-
-                    self.config.log.warning("%s:%d Can't handle %s",
-                                            fname, ln, dtype)
-                else:
-                    msg += m
 
+            msg = self.out_style.output_symbols(fname, symbols)
             if msg:
                 yield fname, msg
diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index 08539dd92cbb..73d71cbeabb5 100644
--- a/tools/lib/python/kdoc/kdoc_output.py
+++ b/tools/lib/python/kdoc/kdoc_output.py
@@ -222,6 +222,27 @@ class OutputFormat:
 
         return None
 
+    def output_symbols(self, fname, symbols):
+        """
+        Handles a set of KdocItem symbols.
+        """
+        self.set_symbols(symbols)
+
+        msg = ""
+        for arg in symbols:
+            m = self.msg(fname, arg.name, arg)
+
+            if m is None:
+                ln = arg.get("ln", 0)
+                dtype = arg.get('type', "")
+
+                self.config.log.warning("%s:%d Can't handle %s",
+                                        fname, ln, dtype)
+            else:
+                msg += m
+
+        return msg
+
     # Virtual methods to be overridden by inherited classes
     # At the base class, those do nothing.
     def set_symbols(self, symbols):
-- 
2.53.0


