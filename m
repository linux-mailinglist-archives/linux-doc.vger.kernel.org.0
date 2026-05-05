Return-Path: <linux-doc+bounces-85841-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GH5NNYO5+WmNBAMAu9opvQ
	(envelope-from <linux-doc+bounces-85841-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 05 May 2026 11:33:55 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F13B4C9CCE
	for <lists+linux-doc@lfdr.de>; Tue, 05 May 2026 11:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33A763036390
	for <lists+linux-doc@lfdr.de>; Tue,  5 May 2026 09:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1841431E834;
	Tue,  5 May 2026 09:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="feKYQx0S"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F350328610;
	Tue,  5 May 2026 09:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777973208; cv=none; b=W2u1xMg/ym2U+bChmv9t+4zvQya2dG8Klsa/P6TGtkkEJPT7pXK8TqIFeAhZfMNVpKN1hf1n/58yo0WJWMO4QT2003lusHisUX2/prBD/K0IAlw8wJgZYjiQfHe/2VhN+o2hQvnqf1bJDYZYSgWnPcLGttqhO8rKJrHnJRSdUSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777973208; c=relaxed/simple;
	bh=on5RSa3EvZp85/dED2BvXFuR/vPUMaxvQXxG7Jh74Ag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EXK/TD2CFXOqq6Ss069bg2rlanCE1gwNMKipFBjSL6jE8bH3h8mddunk0+kkwPvIJSyyPz+OZddxM4XoY+Zl2m6PIAl+ZAvtui1ILm0XXTPmudIV8p9uzKu+t3f9sgJm5eAvuZ7u81bJz7907E96NFpNR7FpS9QS1Qr0kRAEqNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b=feKYQx0S; arc=none smtp.client-ip=212.42.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1777973200; bh=on5RSa3EvZp85/dED2BvXFuR/vPUMaxvQXxG7Jh74Ag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=feKYQx0Sy5h5aBHTMg7p4yVIaOpblcsnF2SaQbKEpZnQb/vG/XtiUEdYxHHj/MUa0
	 0pDKJ9VTTe7OuvtkpwQjo0H9gkKcMaU4nK4hm3DplKyYUVpWzGP3chLv6+Hq723Bc1
	 NO/6aUCLGfRG3Clg1G4AHiC5XTL3u0T2HWLJUQLc=
Received: from [2001:bf0:244:244::71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.56.1)
	(envelope-from <p.hahn@avm.de>)
	id 69f9b7d0-88c8-7f0000032729-7f0000019244-1
	for <multiple-recipients>; Tue, 05 May 2026 11:26:40 +0200
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue,  5 May 2026 11:26:40 +0200 (CEST)
From: Philipp Hahn <p.hahn@avm.de>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Philipp Hahn <phahn-oss@avm.de>,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] watchdog: Separate kind of documentation
Date: Tue,  5 May 2026 11:26:15 +0200
Message-ID: <7d1b722205bab83603832e66750f7b5f1f73eaa5.1777972790.git.phahn-oss@avm.de>
In-Reply-To: <cover.1777972790.git.phahn-oss@avm.de>
References: <cover.1777972790.git.phahn-oss@avm.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: FRITZ! Technology GmbH, Berlin, Germany
Content-Transfer-Encoding: 8bit
X-purgate-ID: 149429::1777973200-69640582-005E6247/0/0
X-purgate-type: clean
X-purgate-size: 1087
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-Rspamd-Queue-Id: 2F13B4C9CCE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[avm.de,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[avm.de:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-85841-lists,linux-doc=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[avm.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[p.hahn@avm.de,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,avm.de:email,avm.de:dkim,avm.de:mid]

From: Philipp Hahn <phahn-oss@avm.de>

Currently there are several (sub-)documents for "Generic kernel
infrastructure API" and several "driver specific" documents. Put each
one into its own sub-section.

Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 Documentation/watchdog/index.rst | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/Documentation/watchdog/index.rst b/Documentation/watchdog/index.rst
index 1cea24681e6bd..293ed05ba6b87 100644
--- a/Documentation/watchdog/index.rst
+++ b/Documentation/watchdog/index.rst
@@ -4,15 +4,25 @@
 Watchdog Support
 ================
 
+Kernel infrastructure
+=====================
+
 .. toctree::
     :maxdepth: 1
 
-    hpwdt
-    mlx-wdt
-    pcwd-watchdog
     watchdog-api
     watchdog-kernel-api
-    watchdog-parameters
     watchdog-pm
-    wdt
     convert_drivers_to_kernel_api
+
+Driver specific
+===============
+
+.. toctree::
+    :maxdepth: 1
+
+    watchdog-parameters
+    hpwdt
+    wdt
+    mlx-wdt
+    pcwd-watchdog
-- 
2.43.0


