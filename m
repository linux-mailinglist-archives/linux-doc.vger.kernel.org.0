Return-Path: <linux-doc+bounces-86601-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOT3D676/mkN0wAAu9opvQ
	(envelope-from <linux-doc+bounces-86601-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 09 May 2026 11:13:18 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0FB4FEF3A
	for <lists+linux-doc@lfdr.de>; Sat, 09 May 2026 11:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EE0A63004607
	for <lists+linux-doc@lfdr.de>; Sat,  9 May 2026 09:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E07E739B481;
	Sat,  9 May 2026 09:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="w6+zZKLE"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311951D54FA
	for <linux-doc@vger.kernel.org>; Sat,  9 May 2026 09:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778317992; cv=none; b=NBZq+ZoB8SqmScuzsawwybZDlO6Qc7FpgLO5jqsiU3jSKYAJhBLvYaOfMkJlB/p91Na/lHt/C41n7K7MyEKJ1gm4wBnO2RYNiyaqdcxT9ErJ7x9OGayVgMdXP/DfOV5wug/hIsetBrbyTrJgJcjLvRu0BcWgevb7/9Q+vj6K3Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778317992; c=relaxed/simple;
	bh=sCg7nnsXGy69X87f/oAcPOYywNmjFFbbTNDYBHqeCXA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o+O0KAUdlD+0VZUpFjG/X4BFUeiXXz1ME2Bk4xX1oMk64un4m/EsXgehqx3DoAIiDsx/6YRVEkj5g0MOsM5LlLvMKEu8UzRh86nOyXsbtnRP43VC+7eYYpREM9TsuxkgkpOF0wcQq+EaInrhY4ExebyGcTQFR4XbN/KT+yVBhV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=w6+zZKLE; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778317979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Sm+Ivnv6uC1+wrWYZcZJzFI5gnWxCHEe1mPmLbZSffw=;
	b=w6+zZKLEid3pNgKj9iyr6JjrFxs0KEO1MFXzHSxVs2oCyK0O8EQJkaNJtWeudtsQzX52M2
	61L2L7IQvRj4bMrEoD/ZEAYJQWVPzAsaF9JKnWkxrcItSNY0WSea1gU0pZcnQ4AipwZtPy
	0faIZgFH2GA7FELP0Gpe3TUQFLYwy5c=
From: Kunwu Chan <kunwu.chan@linux.dev>
To: corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	paulmck@kernel.org,
	gustavold@gmail.com,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH] docs: Document panic_on_rcu_stall default behavior
Date: Sat,  9 May 2026 17:12:14 +0800
Message-ID: <20260509091214.1679194-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: 0D0FB4FEF3A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-86601-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kunwu.chan@linux.dev,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux.dev:mid,linux.dev:dkim]
X-Rspamd-Action: no action

From: Kunwu Chan <kunwu.chan@gmail.com>

Commit ab875b3e179f ("rcu: Add BOOTPARAM_RCU_STALL_PANIC
Kconfig option") made the default value of
kernel.panic_on_rcu_stall depend on
CONFIG_BOOTPARAM_RCU_STALL_PANIC.

Document this in kernel.rst

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 Documentation/admin-guide/sysctl/kernel.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index c6994e55d141..99598a83f830 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -948,6 +948,10 @@ panic_on_rcu_stall
 When set to 1, calls panic() after RCU stall detection messages. This
 is useful to define the root cause of RCU stalls using a vmcore.
 
+The default value can be configured at build time via
+``CONFIG_BOOTPARAM_RCU_STALL_PANIC``. Runtime updates to this sysctl
+always override the built-in default.
+
 = ============================================================
 0 Do not panic() when RCU stall takes place, default behavior.
 1 panic() after printing RCU stall messages.
-- 
2.43.0


