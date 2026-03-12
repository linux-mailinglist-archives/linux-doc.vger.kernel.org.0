Return-Path: <linux-doc+bounces-79028-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIESCgrUsmlDQAAAu9opvQ
	(envelope-from <linux-doc+bounces-79028-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 12 Mar 2026 15:56:10 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D58273BD8
	for <lists+linux-doc@lfdr.de>; Thu, 12 Mar 2026 15:56:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E9EE530584F4
	for <lists+linux-doc@lfdr.de>; Thu, 12 Mar 2026 14:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D083C8736;
	Thu, 12 Mar 2026 14:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZQ6/04TI"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DD53C7E1D;
	Thu, 12 Mar 2026 14:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773327302; cv=none; b=IdyPqWbzNNKO7TJ+f5q/g37ZDUKmL/doQQr/SbiE0trPcN1viJUEXbfQgy3oTH73oO3m19qQHrk5p3VmsQbFaUiO0h50FiIuguyMG1OeCk3E6ZRAQqv60VaSDbiOZwYGzGlZtvwDvb26SEotP1pxhMqwiQDNV4cFo67PZcU2Awg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773327302; c=relaxed/simple;
	bh=IJSnRIO93NxR2KWmARf1NOwTNiZnK4e1wz54iqqYRaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NDxrzQAc2mgA3LHtG/rWSYpyrj72JtizI/YEeGR3JhM1uQgBrXfn/T1IeBnHRlXSrmsefzENL/+KIeaL4vCcb+8af3iyAj4ldsYtjUcfNQgmtaD7TQs/noopo3pHxcNG+6HyP4EmwmBIuuZs3UkafwjgNr8c5hcgKBnwRhsOtF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZQ6/04TI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00EB8C4AF09;
	Thu, 12 Mar 2026 14:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773327302;
	bh=IJSnRIO93NxR2KWmARf1NOwTNiZnK4e1wz54iqqYRaY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZQ6/04TIt//juwtwiLcMiyEexNQ+nq9ATNEWbgz53whRglhoqMGUs/RaH//iZRTyY
	 J+wdhlk4xbhgQ5Siu++Nj07XJdi9smoBEpVir1jQBzeRSOv+yCoEjZVGSzwPu9VbEI
	 +QKdFpVbxzMkkW4gfv4d+7KyJFuiI0fFdTsmWS7YTI6hKO3A1lEmDw9/YDj8VJg2uD
	 bdAtx0ogItpomJS/FN/c4x9N5lbCplrxMSND8UYrXLWPmK/SGrvFssLTQnBYEEmQTl
	 YPvehOk+jdhIBomJh54VRf6F/trJ+B31eSMx4P2PtP7LjHYLctbUjdEl9M6GtXh9XF
	 hkmF31ec0q1zw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w0hRE-00000008yGa-16kN;
	Thu, 12 Mar 2026 15:55:00 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 25/28] docs: c_lex: better handle BEGIN/END at search
Date: Thu, 12 Mar 2026 15:54:45 +0100
Message-ID: <37627b24590ac26f638ce2c460a5cd400bef14cb.1773326442.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1773326442.git.mchehab+huawei@kernel.org>
References: <cover.1773326442.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-79028-lists,linux-doc=lfdr.de,huawei];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C2D58273BD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently, the logic is emitting warnings after finishing
to parse a prototype like:

    static inline unsigned \
        read_seqretry(const seqlock_t *sl, unsigned start)
        __releases_shared(sl) __no_context_analysis

The problem is that the last CMatch there doesn't have BEGIN/END,
but this is already expected.

Make the logic more restrict by:
    - ensure that BEGIN/END there refers to function-like calls,
      e.g. foo(...);
    - only emit a warning after BEGIN is detected.

Instead of hardcoding "(" delim, let the caller specify if a different
one would be required.

While here, remove an uneeded elsif.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/c_lex.py | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/tools/lib/python/kdoc/c_lex.py b/tools/lib/python/kdoc/c_lex.py
index 8beac59166fc..e641bace5d69 100644
--- a/tools/lib/python/kdoc/c_lex.py
+++ b/tools/lib/python/kdoc/c_lex.py
@@ -463,8 +463,9 @@ class CMatch:
     """
 
 
-    def __init__(self, regex):
+    def __init__(self, regex, delim="("):
         self.regex = KernRe("^" + regex + r"\b")
+        self.start_delim = delim
 
     def _search(self, tokenizer):
         """
@@ -506,15 +507,15 @@ class CMatch:
                 if tok.kind == CToken.SPACE:
                     continue
 
-                if tok.kind == CToken.BEGIN:
+                if tok.kind == CToken.BEGIN and tok.value == self.start_delim:
                     started = True
                     continue
-                else:
-                    # Name only token without BEGIN/END
-                    if i > start:
-                        i -= 1
-                    yield start, i
-                    start = None
+
+                # Name only token without BEGIN/END
+                if i > start:
+                    i -= 1
+                yield start, i
+                start = None
 
             if tok.kind == CToken.END and tok.level == stack[-1][1]:
                 start, level = stack.pop()
@@ -528,8 +529,10 @@ class CMatch:
         # picking an incomplete block.
         #
         if start and stack:
-            s = str(tokenizer)
-            log.warning(f"can't find a final end at {s}")
+            if started:
+                s = str(tokenizer)
+                log.warning(f"can't find a final end at {s}")
+
             yield start, len(tokenizer.tokens)
 
     def search(self, source):
-- 
2.52.0


