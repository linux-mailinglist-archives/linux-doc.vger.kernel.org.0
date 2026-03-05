Return-Path: <linux-doc+bounces-78020-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOTbHMeeqWnGAwEAu9opvQ
	(envelope-from <linux-doc+bounces-78020-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 05 Mar 2026 16:18:31 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7198214567
	for <lists+linux-doc@lfdr.de>; Thu, 05 Mar 2026 16:18:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17E7331325F6
	for <lists+linux-doc@lfdr.de>; Thu,  5 Mar 2026 15:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44C23C3C14;
	Thu,  5 Mar 2026 15:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UoI/y0Ow"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06CE3C3C0C;
	Thu,  5 Mar 2026 15:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772723788; cv=none; b=ZrKXHeRgljZnef6MII26RRYGiA8yIiyDaGqwaasmk2IdlTVAYZsbE2HP5lSJePNB70wwUQS1vS0dSVQe7BZb9K8HnRwoT53AWoGOoqDiqybXcbuo1e+kTdv8BLN9I5ZM3lk+KNW8HKR1nAW8vPGzYJXLJqE6353MeO38oDx7XiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772723788; c=relaxed/simple;
	bh=P85ihOR34EEBJ4aigkm1P5PoviijGjWWN5/y18JiWZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ppZVjBtun1+Wxd8Pcq5W7j5nTPq+6QMqOfpTjbD5KqvgPFZBd0Htk73h7S9DZDSVrqbx5ZOR+KfTAbycIHPKI6XMcTV+oRu+PMdH8l/5BL+Bq6YY3DQSVUVEJPwM7gewFzCDwjlbVmH+Si45t9ZAd37lHOZeXK7dhLBwvCr2hzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UoI/y0Ow; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E083C19423;
	Thu,  5 Mar 2026 15:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772723788;
	bh=P85ihOR34EEBJ4aigkm1P5PoviijGjWWN5/y18JiWZo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UoI/y0OwuOStGlQOB/mn3B75ViUp3uyuMesvL51nPEhU6ZMoFqBWxHkXZUcwtRmJi
	 lG6ZGIbiOgonfRO5djeVCsvaV0TTgnJh+/k51RG1U1KJvQrGN0RZYhQU2yL6U0TPg9
	 u82kHnaO4cJ8Km0tnDgHfG+3Ep9C+0l2oJItaUaj+JdwNxWsQj5NkdPikiHJ3tzvfv
	 UwQVYBpDaHh+M+m/ZGHmhZZkp7b2lkvLu8ju91XcgK0AGcGPxGG0F4lPfXSOFqRpOK
	 ZleEsG81DCosS+ML3+1Ig6qCpP+RSWZLp4xyHdozvtJm8Ygb6oeqcTvWkvspVdPDxo
	 F7PhamdB/1T7g==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vyAR8-0000000HKBk-2UJX;
	Thu, 05 Mar 2026 16:16:26 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/11] docs: kdoc_output: don't use a different modulename for functions
Date: Thu,  5 Mar 2026 16:16:15 +0100
Message-ID: <be889c209109e5f84eccffcc49d99f9c7d233809.1772722474.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1772722474.git.mchehab+huawei@kernel.org>
References: <cover.1772722474.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Rspamd-Queue-Id: C7198214567
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-78020-lists,linux-doc=lfdr.de,huawei];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,self.data:url,self.date:url]
X-Rspamd-Action: no action

It doesn't make much sense to have a different modulename just
for functions, but not for structs/enums/...

Use the same header everywere.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_output.py | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index 24ee1fad681e..62e300e65405 100644
--- a/tools/lib/python/kdoc/kdoc_output.py
+++ b/tools/lib/python/kdoc/kdoc_output.py
@@ -607,14 +607,11 @@ class ManFormat(OutputFormat):
         "%m %d %Y",
     ]
 
-    def emit_th(self, name, modulename = None):
+    def emit_th(self, name):
         """Emit a title header line."""
         name = name.strip()
 
-        if not modulename:
-            modulename = self.modulename
-
-        self.data += f'.TH "{modulename}" {self.section} "{name}" '
+        self.data += f'.TH "{self.modulename}" {self.section} "{name}" '
         self.data += f'"{self.date}" "{self.manual}"\n'
 
     def __init__(self, modulename, section="9", manual="Kernel API Manual"):
@@ -748,7 +745,7 @@ class ManFormat(OutputFormat):
 
         out_name = self.arg_name(args, name)
 
-        self.emit_th(out_name, modulename = name)
+        self.emit_th(out_name)
 
         self.data += ".SH NAME\n"
         self.data += f"{name} \\- {args['purpose']}\n"
-- 
2.52.0


