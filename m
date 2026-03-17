Return-Path: <linux-doc+bounces-79808-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eD++IKGauWn5KwIAu9opvQ
	(envelope-from <linux-doc+bounces-79808-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 19:17:05 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A632B0C85
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 19:17:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 593A031FDFBF
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 18:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A383F7A8E;
	Tue, 17 Mar 2026 18:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ENpKJELi"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4127C3F7A80;
	Tue, 17 Mar 2026 18:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773770988; cv=none; b=n0YSoF5B9K2ELP4p2QEPO+R1wGt3EMS4iPW0Z8BV6v1IoWXkXn+CISYFqUweRb/6dcJoVG1q7Xq7gN8rKIu6//Jts58xolGP7T52mbCJNPhdzdxvzNTuvLX1rKtf6M1UxOUgztPbvLAjoJdiQ1xA5eiT4Oak4Pshc/bHAU0S0M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773770988; c=relaxed/simple;
	bh=n3BVrBoQMdxdpoipeTxJikhOj3p5syl4ggfaedUESPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CoLjQD0Veio0oiyBORQrUilVzUFlp+N41zjIjNcJdbuaQndxqCz5amx5CNDrL4yJK78anS2LZhXZ/vKbFEQRwZq9/1+NZ9w2lKCIK0tNdgCKERJf8h+w0wRNVEWOUTzX7F9gRWFBGBIZil/e780cReqzZ/q8i11BebA2uuVR/gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ENpKJELi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BF6AC2BCB1;
	Tue, 17 Mar 2026 18:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773770988;
	bh=n3BVrBoQMdxdpoipeTxJikhOj3p5syl4ggfaedUESPo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ENpKJELilG38U9Y6eJMkTxNuBgIDfaRk2n/RPMGBhDzD6xGf0hRvllAxtMXsmjR9s
	 N0cg/rqxMnxbaiu6xpMwk5u7eQj4KODo6GWTjIZDQTbe0KfzLUEK7j44rg7D0Os8pD
	 /y2GyIl7DIXj/jo24Q3TuOdeozr3yJwi3lLRbIoetRYSJUALYLevHEoNmarumV+JHt
	 sC0kq7bp9Xt++8lyosR1aTiwcUVTkavHy7ejD8KzVVdM5KzpK0CvoRF4pxLgbUUEwa
	 GhCe9BobfbTNjVqCmxzotreiHbK6hy66SYX7bS6zH4EMPwI/5+E8ZAd6sEsgc9kmgx
	 t+sbJ2KsHsvtA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w2YrS-0000000H5JB-0QU3;
	Tue, 17 Mar 2026 19:09:46 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v3 04/22] docs: kdoc: properly handle empty enum arguments
Date: Tue, 17 Mar 2026 19:09:24 +0100
Message-ID: <640784283d52c5fc52ea597344ecd567e2fb6e22.1773770483.git.mchehab+huawei@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-79808-lists,linux-doc=lfdr.de,huawei];
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
X-Rspamd-Queue-Id: 23A632B0C85
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Depending on how the enum proto is written, a comma at the end
may incorrectly make kernel-doc parse an arg like " ".

Strip spaces before checking if arg is empty.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <4182bfb7e5f5b4bbaf05cee1bede691e56247eaf.1773074166.git.mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_parser.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index 086579d00b5c..4b3c555e6c8e 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -810,9 +810,10 @@ class KernelDoc:
         member_set = set()
         members = KernRe(r'\([^;)]*\)').sub('', members)
         for arg in members.split(','):
-            if not arg:
-                continue
             arg = KernRe(r'^\s*(\w+).*').sub(r'\1', arg)
+            if not arg.strip():
+                continue
+
             self.entry.parameterlist.append(arg)
             if arg not in self.entry.parameterdescs:
                 self.entry.parameterdescs[arg] = self.undescribed
-- 
2.52.0


