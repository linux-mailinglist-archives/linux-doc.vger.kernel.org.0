Return-Path: <linux-doc+bounces-74439-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qM7AGNMVe2n5BAIAu9opvQ
	(envelope-from <linux-doc+bounces-74439-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 29 Jan 2026 09:09:55 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 177AAAD397
	for <lists+linux-doc@lfdr.de>; Thu, 29 Jan 2026 09:09:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AE3463048DE9
	for <lists+linux-doc@lfdr.de>; Thu, 29 Jan 2026 08:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7177237C0EA;
	Thu, 29 Jan 2026 08:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D6iaNGnd"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4E937BE62;
	Thu, 29 Jan 2026 08:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769674111; cv=none; b=aXUvHwQlsCF2Wo/ODUwxQYh/DbG3EXOF56/Hby9UkYMF2E5CwyxkAbcZdig3BswdG2VEv/Q84ztWSNukPvK0wTTH4P1EhDBVkyTDM7ZkZCRmFy//KexkI+mqrpphsW31yElI3HlWG/UiDYA52GpfUGjMzCI1pzPOwT2hBsiEGzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769674111; c=relaxed/simple;
	bh=1OHigLaB0I9Gr4pd6M4Zc3FWOaEqquAXFRRO/Gxw3CM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YdbIdywY2w4l8CH3i967pIL+pzl4g2NfuI30DzfciceVuwdFFYdOsBJgKBx/BX3qMySo4uuvm0QBSqO0kiz77Tvda/eB6Gt0JLJWprJC4HwlgpUjTZ7CEJhefEg00ptD0iFwlsrgFHWo2n16+UYCVpcm9rt+cSPaRjo8zeq98Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D6iaNGnd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F6EC116D0;
	Thu, 29 Jan 2026 08:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769674110;
	bh=1OHigLaB0I9Gr4pd6M4Zc3FWOaEqquAXFRRO/Gxw3CM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D6iaNGndPXupEiDumBkRLVZUMruiYFF60cis6DEkfHTMrT1ojRfOsSFhzKX/Zl6oJ
	 1vihi+Xcwg3SCGXFyfkwhrQ52Yf25g53aaFKNYHcMfBSnpLiTS+bcBDtHDO2LX23bf
	 uDPjD6KwQgxEOXOw4ndW8UXPQW0yCWa5gRJmQ6A+JBxx2G7/mWgUjRZU5R9SneThS4
	 jq9xDUSGEkqrOePWqAA9ZLLY159RU9DIUHFKbb2X+D0pNpnUoUkBINLeyKUlNHHAu3
	 iFUhgeNG05Bc1iolBe7MxaMA9uMffQBDtoB8vOoSMV/IidVdHazt8c8Wt6T9r39bP7
	 kCQKG2s61cLtg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vlN4m-0000000ERMj-330l;
	Thu, 29 Jan 2026 09:08:28 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	bpf@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v3 03/30] docs: kdoc_parser: move var transformers to the beginning
Date: Thu, 29 Jan 2026 09:07:54 +0100
Message-ID: <aa7f027e5b2f8599c9e268790f9ffbca9f0634e6.1769673038.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1769673038.git.mchehab+huawei@kernel.org>
References: <cover.1769673038.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-74439-lists,linux-doc=lfdr.de,huawei];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 177AAAD397
X-Rspamd-Action: no action

Just like functions and structs had their transform variables
placed at the beginning, move variable transforms to there
as well.

No functional changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
---
 tools/lib/python/kdoc/kdoc_parser.py | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index fd57944ae907..0b68b140cd02 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -191,6 +191,18 @@ function_xforms  = [
     (KernRe(r"__attribute__\s*\(\((?:[\w\s]+(?:\([^)]*\))?\s*,?)+\)\)\s+"), ""),
 ]
 
+#
+# Transforms for variable prototypes
+#
+var_xforms = [
+    (KernRe(r"__read_mostly"), ""),
+    (KernRe(r"__ro_after_init"), ""),
+    (KernRe(r"(?://.*)$"), ""),
+    (KernRe(r"(?:/\*.*\*/)"), ""),
+    (KernRe(r";$"), ""),
+    (KernRe(r"=.*"), ""),
+]
+
 #
 # Ancillary functions
 #
@@ -971,15 +983,6 @@ class KernelDoc:
         ]
         OPTIONAL_VAR_ATTR = "^(?:" + "|".join(VAR_ATTRIBS) + ")?"
 
-        sub_prefixes = [
-            (KernRe(r"__read_mostly"), ""),
-            (KernRe(r"__ro_after_init"), ""),
-            (KernRe(r"(?://.*)$"), ""),
-            (KernRe(r"(?:/\*.*\*/)"), ""),
-            (KernRe(r";$"), ""),
-            (KernRe(r"=.*"), ""),
-        ]
-
         #
         # Store the full prototype before modifying it
         #
@@ -1003,7 +1006,7 @@ class KernelDoc:
         # Drop comments and macros to have a pure C prototype
         #
         if not declaration_name:
-            for r, sub in sub_prefixes:
+            for r, sub in var_xforms:
                 proto = r.sub(sub, proto)
 
         proto = proto.rstrip()
-- 
2.52.0


