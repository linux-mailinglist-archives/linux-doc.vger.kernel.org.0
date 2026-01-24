Return-Path: <linux-doc+bounces-73885-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0cGZACt3dGmP5wAAu9opvQ
	(envelope-from <linux-doc+bounces-73885-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 24 Jan 2026 08:39:23 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 502647CD3A
	for <lists+linux-doc@lfdr.de>; Sat, 24 Jan 2026 08:39:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 069503009B18
	for <lists+linux-doc@lfdr.de>; Sat, 24 Jan 2026 07:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1586347C7;
	Sat, 24 Jan 2026 07:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L5w/v0c4"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC873EBF1E;
	Sat, 24 Jan 2026 07:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769240357; cv=none; b=J3+wqzdTXRbsxtHc1NGxZJBE6+pyEYbj8R8mBAHnGTinbIPStN4uD1A/ot0Kx0cU5Nq7rs2iUOMNrD4on4LTBNpRZFYbBLJ2y/usU0fZvfKwS+RceQcfDXfSmfkvSmvmQxPqXDg/2iIiELRUL8U4JX6xSiwQ2zmfSfMYXdF7wlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769240357; c=relaxed/simple;
	bh=VIlaRMwPjIfEIQDuYa02KnJ1UgKS/LPF/904EgFNK3I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DZWgwOI34PBrPjuJ3EcXdpncKa0GR3gFAKHL5ooKi40q6cLjfNpk/ErylBmjOKroTkMieNUhqw57NOAxtEUfcxaefblx93lT0WxRccZPsCE90eSn5aJZgziYLLNAbLBAvY4wLzXys86Je06y4323Xz7coypon02ccOJhxKXJPpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L5w/v0c4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBFF7C116D0;
	Sat, 24 Jan 2026 07:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769240357;
	bh=VIlaRMwPjIfEIQDuYa02KnJ1UgKS/LPF/904EgFNK3I=;
	h=From:To:Cc:Subject:Date:From;
	b=L5w/v0c4/nMWzcM7T57T4tE7qmhJZZ3h6bXp0tB0ueMHsGIQIz9FKhKS1pSaFGn9T
	 NrpOoIpztwxqQDJDP1YG/N1k5wKdQHcIRt8WTVebsYTraPrlcHeDtaAmFMht31iTbp
	 i+Fh0mUZGGSp2rgpYvLfI/BFkdaNYzH6kN5CJomx1DaLlDUKgWSovCpaGUZA5/amcw
	 VAIMq0wYOAYV3YrJXPmQ4AgSnn4LgiwaX839AEkUPP1FKtvTtPqpn+8Xjo1qgJ7HKj
	 mAjYbaLp8ZEbYLfX42FKpvGtSpHLCZtIy5qMlR/3ShdZGDfafmH8UJuJZ9ovWiVxsm
	 3NlMKPmBuV8NQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vjYEk-000000072DC-3xaZ;
	Sat, 24 Jan 2026 08:39:14 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2] docs: kdoc: Fix pdfdocs build for tools
Date: Sat, 24 Jan 2026 08:39:08 +0100
Message-ID: <0a85ede84808f90a033b86a79858f410c889db9e.1769240345.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,lwn.net,infradead.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-73885-lists,linux-doc=lfdr.de,huawei];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 502647CD3A
X-Rspamd-Action: no action

the "\1" inside a docstring requires proper scaping to not be
considered a hex character and break the build.

Reported-by: Akira Yokosawa <akiyks@gmail.com>
Closes: https://lore.kernel.org/linux-doc/63e99049-cc72-4156-83af-414fdde34312@gmail.com/
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_re.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_re.py b/tools/lib/python/kdoc/kdoc_re.py
index 2816bd9f90f8..0bf9e01cdc57 100644
--- a/tools/lib/python/kdoc/kdoc_re.py
+++ b/tools/lib/python/kdoc/kdoc_re.py
@@ -228,14 +228,18 @@ class NestedMatch:
             yield line[t[0]:t[2]]
 
     def sub(self, regex, sub, line, count=0):
-        """
+        r"""
         This is similar to re.sub:
 
         It matches a regex that it is followed by a delimiter,
         replacing occurrences only if all delimiters are paired.
 
-        if r'\1' is used, it works just like re: it places there the
-        matched paired data with the delimiter stripped.
+        if the sub argument contains::
+
+            r'\1'
+
+        it will work just like re: it places there the matched paired data
+        with the delimiter stripped.
 
         If count is different than zero, it will replace at most count
         items.
-- 
2.52.0


