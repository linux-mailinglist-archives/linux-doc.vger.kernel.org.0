Return-Path: <linux-doc+bounces-85674-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HX3AqbA+Gnh0AIAu9opvQ
	(envelope-from <linux-doc+bounces-85674-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 04 May 2026 17:52:06 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCB34C0EA4
	for <lists+linux-doc@lfdr.de>; Mon, 04 May 2026 17:52:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49DCA302F27C
	for <lists+linux-doc@lfdr.de>; Mon,  4 May 2026 15:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CCF03E0C6B;
	Mon,  4 May 2026 15:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gmmGL6em"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDF63DE431;
	Mon,  4 May 2026 15:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777909888; cv=none; b=TzAqnGBvOydvtsyUwuJsV9PuZfyjrWAqJoyZNkJWExVgnAgHzS3MizXmUtw7gWAMJelTvLOTGSZdpq+YtqrKOLrmS1YHpfPggFZTdWdUPvLiyLN5d3ree9GZAA+/Jh5gx2BgnFvw5c2ECKRaoznxUYeygLjU9CKmaWpzXa3KBtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777909888; c=relaxed/simple;
	bh=yjJsWgNJPSHvj8gL365g1AVkk3a95wZI901VABGTMZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R7aLu7brfSlXs35pQ6Ic00i0Jm6wH1YOLEDW/8eGfawVQV+jt1g/xHMuyqgbUhweNe/9w+hItewpS1JxbBHovowP2FrsaitPuqFR357hLIgkm5w7CfS43yWa4u04ifOlk9DS9lHo0sa6WqCGJ+ea1zW4YV7+QtyFMX3jFtmsI3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gmmGL6em; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76C0BC2BCF6;
	Mon,  4 May 2026 15:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777909888;
	bh=yjJsWgNJPSHvj8gL365g1AVkk3a95wZI901VABGTMZs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gmmGL6emdNRQ7dPqxKWSw/cJoYBQ4Po+Lf9FlPD6yknk+sKzrXVqWa2V9HOcbif6m
	 GO4F+GUhorUKbIHRyyuIKz1UJedYFDANLaUMpt4xJkByfWZaRM7pCpwFsDPFN8C37J
	 pwiKSyer5fzpTXe3Rws1BmdZS/e4qFEHTn4b6CRBp2OSr85sw+A0NhQchgdKI422Rz
	 juNQ9O8WynYpKCBKvGbdVpgWP+ZPlInR8s0jhIVby78XRjZj0+emZLfQUnwb8i9MRU
	 xOJo4bBKjC+q7u51gq738I0jvKt6SJfQQOhKhykXucEYAQtQSOBp4KuKnu98EnrVcr
	 DL40l8MI6JbHg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wJvZu-0000000Ey5Y-2UCb;
	Mon, 04 May 2026 17:51:26 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 1/9] docs: maintainers_include: keep hidden TOC sorted
Date: Mon,  4 May 2026 17:51:10 +0200
Message-ID: <899e9223d7533996b5a176d2b7b7c5718821cc1e.1777908711.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1777908711.git.mchehab+huawei@kernel.org>
References: <cover.1777908711.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Rspamd-Queue-Id: 8DCB34C0EA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-85674-lists,linux-doc=lfdr.de,huawei];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

There's no practical difference on keeping it sorted, but
it helps a lot when checking for differences after patches
to the tool.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 1b9ece431386..c7f9911ae45b 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -265,7 +265,7 @@ class MaintainersProfile(Include):
         output += "\n.. toctree::\n"
         output += "   :hidden:\n\n"
 
-        for fname in maint_parser.profile_toc:
+        for fname in sorted(maint_parser.profile_toc):
             output += f"   {fname}\n"
 
         output += "\n"
-- 
2.54.0


