Return-Path: <linux-doc+bounces-92998-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3Om9FQ0lN2qDJgcAu9opvQ
	(envelope-from <linux-doc+bounces-92998-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 21 Jun 2026 01:41:01 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 486656A9E1F
	for <lists+linux-doc@lfdr.de>; Sun, 21 Jun 2026 01:41:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=RrMVjZ0F;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92998-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-92998-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A789E300F5D8
	for <lists+linux-doc@lfdr.de>; Sat, 20 Jun 2026 23:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88A23446BC;
	Sat, 20 Jun 2026 23:40:57 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA20333442
	for <linux-doc@vger.kernel.org>; Sat, 20 Jun 2026 23:40:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781998857; cv=none; b=L2KkZK0sl/sn+ZoMixFxPp37UO5/j5sQCYX51n9wnWjDjbz+p7Mg7YJHk3DZyyztLOFdYnEFnwFsRbqASydHf4XZyxS/BUQwlJrdOJ+TKrM7pnojWXHd3bx8vu1L+vkJqbFW41TXAcu//K2zOqTZ+GFBFsutO19KMQXc8mFIVsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781998857; c=relaxed/simple;
	bh=EJ+ncXroWLtZ9H7/gwXd9ATkB2lmEAPQ9RDGHXVTYKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lj0YD8mHqBF+rUKMzq3+hquw3PYxwhWaGh9eeNxTcuOBsXqAT7sp+Bdnhb8SKpMRVWHVCuLey38ppnVopXMsH+gpFugHDZQDX9NAT/0xs/RcFv9Zk00aDNpHAz8+UGT31ualhONvkTYTN7dYc6FTjFCERHkkISWInw2lSbokom0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RrMVjZ0F; arc=none smtp.client-ip=95.215.58.187
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781998853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lSKWN4XhE0iVF3MV1+FCHMSccBdXHVwnsKiwh7XXNe4=;
	b=RrMVjZ0FwSnuIPgb7jx/LK5EBxNcpdwXEV/Vu776DuVNRlYqeTm2IznPu5bloZ8dQ9h7tO
	vPZ2XpO1Wp0dFcOGF53AlVgVla0lcmSN99Nm+oJ7LjdKeWU7ADKLH9vadmtbNLSq3hVz6d
	uFytfavYR1EE0j9cxB4xz0RF2tuDLmU=
From: Zenghui Yu <zenghui.yu@linux.dev>
To: kgdb-bugreport@lists.sourceforge.net,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jason.wessel@windriver.com,
	danielt@kernel.org,
	dianders@chromium.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	Zenghui Yu <zenghui.yu@linux.dev>
Subject: [PATCH] docs: kgdb: Fix path of driver options
Date: Sun, 21 Jun 2026 07:40:35 +0800
Message-ID: <20260620234035.9917-1-zenghui.yu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92998-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kgdb-bugreport@lists.sourceforge.net,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jason.wessel@windriver.com,m:danielt@kernel.org,m:dianders@chromium.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:rdunlap@infradead.org,m:zenghui.yu@linux.dev,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[zenghui.yu@linux.dev,linux-doc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zenghui.yu@linux.dev,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:email,linux.dev:mid,linux.dev:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 486656A9E1F

The correct path of driver options should be
/sys/module/<driver>/parameters/<option>. Fix it.

Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
---
 Documentation/process/debugging/kgdb.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/debugging/kgdb.rst b/Documentation/process/debugging/kgdb.rst
index c4d0a9121d52..316b1d74e9c8 100644
--- a/Documentation/process/debugging/kgdb.rst
+++ b/Documentation/process/debugging/kgdb.rst
@@ -513,7 +513,7 @@ unregister all the kernel hook points.
 
 All kgdb I/O drivers can be reconfigured at run time, if
 ``CONFIG_SYSFS`` and ``CONFIG_MODULES`` are enabled, by echo'ing a new
-config string to ``/sys/module/<driver>/parameter/<option>``. The driver
+config string to ``/sys/module/<driver>/parameters/<option>``. The driver
 can be unconfigured by passing an empty string. You cannot change the
 configuration while the debugger is attached. Make sure to detach the
 debugger with the ``detach`` command prior to trying to unconfigure a
-- 
2.53.0


