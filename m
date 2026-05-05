Return-Path: <linux-doc+bounces-85869-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPrYKgTy+WmcFQMAu9opvQ
	(envelope-from <linux-doc+bounces-85869-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 05 May 2026 15:35:00 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D2D4CE992
	for <lists+linux-doc@lfdr.de>; Tue, 05 May 2026 15:34:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EED593019046
	for <lists+linux-doc@lfdr.de>; Tue,  5 May 2026 13:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1791A4218A6;
	Tue,  5 May 2026 13:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SK4T6LlN"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E993E8C5D;
	Tue,  5 May 2026 13:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987565; cv=none; b=nffweJYK6PVZuqsg5aTR46PGFsD0c2rw8BIRgL8P6KU5UBjcgq1ERg29EYn/gcXLTXS0i2doIPLX0zN7fx8Rpnoh7BegSTMVj1a7ETzC3NSae8O7kCanYR6VpLI9wkW5L9IM+NwB74t8HYEaXouOAZh0KnXgP0t+6vNLciA5b4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987565; c=relaxed/simple;
	bh=2rCh0cm5RWMg9+ON81fn8pbk1MPx1pRqHPKriNZbsTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Owl8g7r6RlJgKu0niPvb4QlAqxrjVtBd6wJWfc2qWWflcIQWn+/ilN9DqNWbZhY3GXGNtaQEbrbStf2VeOX9KuwAgYI6PdqUEfQSws43txojFD+Df4F6MXpK9ohJzGMivb5YNQNEg0btwsd3OYb0Vg85okRE6QEeEJkZXfCfsDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SK4T6LlN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD50C2BCB4;
	Tue,  5 May 2026 13:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777987564;
	bh=2rCh0cm5RWMg9+ON81fn8pbk1MPx1pRqHPKriNZbsTw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SK4T6LlNaB+w5YFGd/oEcCVU8377bM8Q1F8a+ebVIQ0dQP3M4g1pj6rRgtQ4HTeXr
	 K+3UxO4Omte6C7dN8rIbb3DQ0W08NYOPXYr/43AnWiE57kEib+mtsRzan+9K7CyaPA
	 kw6fhN33fYCL4inDcWPoeBOnRPyTXoh2I0YlaRVViDRTwb1PhRVp3CHDZSDqmDQg55
	 gPA53w05Q2HFYJhZvwNczHO+88HuVfsCJ9LcquywK2xoNvi7EEcIhy103DjR+050UA
	 Jc7w03QaDFVyG6EDuNek2WgbhCbY4ASBgj3pT7hFrsZ3C4tU4yO3pRlc3bsTiVogku
	 0lxe5gjxlxJkQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wKFmk-00000004idJ-3IPB;
	Tue, 05 May 2026 15:26:02 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 01/11] docs: maintainers_include: keep hidden TOC sorted
Date: Tue,  5 May 2026 15:25:48 +0200
Message-ID: <e6b302f2826e6a5c0124bb33cc517e8b5888252b.1777987027.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1777987027.git.mchehab+huawei@kernel.org>
References: <cover.1777987027.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Rspamd-Queue-Id: B1D2D4CE992
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-85869-lists,linux-doc=lfdr.de,huawei];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

There's no practical difference on keeping it sorted, but
it helps a lot when checking for differences after patches
to the tool.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 436e7ac42ffc..694cdbdc4caf 100755
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


