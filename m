Return-Path: <linux-doc+bounces-80625-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GK+KJv8EwWlUPgQAu9opvQ
	(envelope-from <linux-doc+bounces-80625-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 10:16:47 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E49D2EED51
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 10:16:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3837A304226F
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 09:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B428386545;
	Mon, 23 Mar 2026 09:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W1nF5H6k"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D75386452;
	Mon, 23 Mar 2026 09:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257059; cv=none; b=V+iUoIYoiGjevZ3wdss8sAablpVE6/43ghHHIVL1evLwGPFLimyWziXohDp3K+pIILnO7Mewx5U3dDFpjYAbKQI1d7zm25gu2BENBpPbdOS0MFqBB6bcqJMvqxQfsYt+26wztMeHOnjq5kfS5Wi83+WILJNg9Owo5cGhioKG4Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257059; c=relaxed/simple;
	bh=a05Vd8qHdqT2ZnuRBv0SnC55B9ItAT/pJgyul5M5lIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uo2QzlvUDVhyztB7zmwyaF8U1wOW/Ptp1F3Ub50ytE/jCKNNYpxHBPBLXB7f07rWbydX71TLrXSGc2aWVShtgt2uNhM58Y56sPJ62VbAct+DGHenqR7LrHFYTLbQybqvLHYiCvGlsRGhOTDbGRp6qkQ9WsS9KHImUQibuQ+fIiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W1nF5H6k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3C41C4AF0C;
	Mon, 23 Mar 2026 09:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774257058;
	bh=a05Vd8qHdqT2ZnuRBv0SnC55B9ItAT/pJgyul5M5lIE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W1nF5H6klfS2mJn9aIZd43KfU7bK+Qy/KezTPgU5AJJZFaq93mlK330jq6vyGTPCm
	 dQDuZMJ/ZXhxG2PzIZ3HQi8VJxHSpDDE8MbUbYk6T2Nlb5spvakGvj/coIvHKg0aG7
	 ZN/UmOSiuc97oML14CsMoTaIor+bCyqTaDwnipAPFomANaOHLr1KllkSuun6cQkxuS
	 6dx307FQI8jgsOsLIu/VOYoeoPyJ7vZzZRNYtV11IaNFwunc5HgnoszVH0pJ/iIrX/
	 G3LocYeFG+uRcL+K+IC7cP6yw/zdubiXZ/yYT52jyn9m/uYF4NK07PVx+lBnpH/Ua/
	 R6QURklPtj5QA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w4bJI-00000002yWc-2B6s;
	Mon, 23 Mar 2026 10:10:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 06/10] docs: kdoc_output: fix handling of simple tables
Date: Mon, 23 Mar 2026 10:10:49 +0100
Message-ID: <dea95337c05040f95e5a95ae41d69ddef0aaa8d6.1774256269.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774256269.git.mchehab+huawei@kernel.org>
References: <cover.1774256269.git.mchehab+huawei@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-80625-lists,linux-doc=lfdr.de,huawei];
	RCVD_TLS_LAST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.234.253.10:from];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[10.30.226.201:received,100.90.174.1:received];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,self.data:url]
X-Rspamd-Queue-Id: 3E49D2EED51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix check for simple table delimiters.

ReST simple tables use "=" instead of "-". I ended testing it with
a table modified from a complex one, using "--- --- ---", instead
of searching for a real Kernel example.

Only noticed when adding an unit test and seek for an actual
example from kernel-doc markups.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_output.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index 1b54117dbe19..2bfcd356654b 100644
--- a/tools/lib/python/kdoc/kdoc_output.py
+++ b/tools/lib/python/kdoc/kdoc_output.py
@@ -846,14 +846,14 @@ class ManFormat(OutputFormat):
         colspec_row = None
 
         pos = []
-        for m in KernRe(r'\-+').finditer(lines[i]):
+        for m in KernRe(r'\=+').finditer(lines[i]):
             pos.append((m.start(), m.end() - 1))
 
         i += 1
         while i < len(lines):
             line = lines[i]
 
-            if KernRe(r"^\s*[\-]+[ \t\-]+$").match(line):
+            if KernRe(r"^\s*[\=]+[ \t\=]+$").match(line):
                 i += 1
                 break
 
@@ -969,7 +969,7 @@ class ManFormat(OutputFormat):
                     self.data += text
                     continue
 
-                if KernRe(r"^\-+[ \t]\-[ \t\-]+$").match(line):
+                if KernRe(r"^\=+[ \t]\=[ \t\=]+$").match(line):
                     i, text = self.simple_table(lines, i)
                     self.data += text
                     continue
-- 
2.53.0


