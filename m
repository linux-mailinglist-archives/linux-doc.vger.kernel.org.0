Return-Path: <linux-doc+bounces-79824-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id pNwhLs6auWlzLAIAu9opvQ
	(envelope-from <linux-doc+bounces-79824-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 19:17:50 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD542B0CC9
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 19:17:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98041321D1B0
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 18:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4609D3F9F28;
	Tue, 17 Mar 2026 18:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YjHMiAkv"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2033E3F7A80;
	Tue, 17 Mar 2026 18:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773770991; cv=none; b=FYT3cBVtyHHiBA++kvn8mazZMnUPxH8MrIFA16by+v61nQ8GTko4crtn7GGGo0SUolzfRZUfa+xfT0Yp9NxY1QiG2XBo8LDO17xBUxuyyH6HfpAhXroVcaIBNvIMTgyv78PV2WAbYE+pXWiUUAjMHS9jGNHCWR9Hh89rv9a0rHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773770991; c=relaxed/simple;
	bh=k+ehfP1sl6SdRybZAYJu9AFpJMlMcv42DU7JH8k+cI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dWmc6LQPFqoy/Sx9NtzSRNpQ3BLU/1u58cMPqkzGxm7WhNpg2vlJwAAF1jDkVgymui2gazn9nQxFOlGYyRLBy9D45dU1pr5H239kpHkQxMaxZwxDVSh1s3BuepEv2eOC8bAxPX/+vUsijJpuUqpAVBwmYzbi6+gmbh2m8EX28c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YjHMiAkv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02E63C2BC86;
	Tue, 17 Mar 2026 18:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773770991;
	bh=k+ehfP1sl6SdRybZAYJu9AFpJMlMcv42DU7JH8k+cI0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YjHMiAkvj+/rn7fQ0lMGt0R3CjBL810iXcsRr3N7Qk3hzPMqEpFHboi4aVaeEImBS
	 sk5lacZPxnqc6X1lzxXKY9H8awn0ffwa7qqW0edwpBAVGmqOKIg2YYjAEj17e+lW/K
	 idQ+tuX85uDRM4Udvc8UEFeoqoFZNwex+kLNFA63+WDCQQTbK430ZGT717At+BOWpC
	 qJjcxSWSUodzuFtitxb7P++u4EWWnfP7Fx5acS1fZtNnj4OaSAzZR/8iM6t9/3AlXL
	 wtp3ps7QGGjTmIpPnW01tHP/kqQMUZ6vu2IpnmSv/AeoL3DiV6u9CJqHgOKfPd2llC
	 aNwvY6aX+w5UQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w2YrV-0000000H5dD-1DqM;
	Tue, 17 Mar 2026 19:09:49 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v3 20/22] docs: kdoc: ensure that comments are dropped before calling split_struct_proto()
Date: Tue, 17 Mar 2026 19:09:40 +0100
Message-ID: <dcff37b6da5329aea415de31f543b6a1c2cbbbce.1773770483.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1773770483.git.mchehab+huawei@kernel.org>
References: <cover.1773770483.git.mchehab+huawei@kernel.org>
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
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-79824-lists,linux-doc=lfdr.de,huawei];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 4BD542B0CC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Changeset 2b957decdb6c ("docs: kdoc: don't add broken comments inside prototypes")
revealed a hidden bug at split_struct_proto(): some comments there may break
its capability of properly identifying a struct.

Fixing it is as simple as stripping comments before calling it.

Fixes: 2b957decdb6c ("docs: kdoc: don't add broken comments inside prototypes")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_parser.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index f90c6dd0343d..8b2c9d0f0c58 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -723,6 +723,7 @@ class KernelDoc:
         #
         # Do the basic parse to get the pieces of the declaration.
         #
+        proto = trim_private_members(proto)
         struct_parts = self.split_struct_proto(proto)
         if not struct_parts:
             self.emit_msg(ln, f"{proto} error: Cannot parse struct or union!")
@@ -763,6 +764,7 @@ class KernelDoc:
         # Strip preprocessor directives.  Note that this depends on the
         # trailing semicolon we added in process_proto_type().
         #
+        proto = trim_private_members(proto)
         proto = KernRe(r'#\s*((define|ifdef|if)\s+|endif)[^;]*;', flags=re.S).sub('', proto)
         #
         # Parse out the name and members of the enum.  Typedef form first.
@@ -770,7 +772,7 @@ class KernelDoc:
         r = KernRe(r'typedef\s+enum\s*\{(.*)\}\s*(\w*)\s*;')
         if r.search(proto):
             declaration_name = r.group(2)
-            members = trim_private_members(r.group(1))
+            members = r.group(1)
         #
         # Failing that, look for a straight enum
         #
@@ -778,7 +780,7 @@ class KernelDoc:
             r = KernRe(r'enum\s+(\w*)\s*\{(.*)\}')
             if r.match(proto):
                 declaration_name = r.group(1)
-                members = trim_private_members(r.group(2))
+                members = r.group(2)
         #
         # OK, this isn't going to work.
         #
-- 
2.52.0


