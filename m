Return-Path: <linux-doc+bounces-85644-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJqXI5B++GmHwAIAu9opvQ
	(envelope-from <linux-doc+bounces-85644-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 04 May 2026 13:10:08 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E629B4BC367
	for <lists+linux-doc@lfdr.de>; Mon, 04 May 2026 13:10:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B15B300DA54
	for <lists+linux-doc@lfdr.de>; Mon,  4 May 2026 11:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B41E3A7851;
	Mon,  4 May 2026 11:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="ANZm3bag"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0EC3A544B;
	Mon,  4 May 2026 11:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777893005; cv=none; b=qS1Gfx3FOncDYLMmBdJHay4kHdCzaRpE0lQvkqr32qG7kt0/p5BLnj+H+XSc+iR6sbqwxn5K/C4sRHATVlkcmWo0e3WAAhwpv7m/u8427tzEn+Qemkp1wkZFlGYu2LG77o2mPk6pQOJr+9dKRyzMChHmKvcGOi+2pjQ5PU1CwPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777893005; c=relaxed/simple;
	bh=0+pnJbJtZojl0+g1hdLUgo7SUN68OmWxLYfO3SjEVfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A0OVjlP6Z/Rp0seD+XAJhxNxtt76MRKfdtSomoEsKYWwNqzWpPN0OTzBQipMmBwwVrKqnym79JnWeOdis3X/ZKTH9di5Ir8JdPpwX46HRvMRwGH0C9gXQCy+miSz4KoP8fzhTlCVBkK4QdDEVzaeG2FIaJvC4B0b0fxfGtmt4ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b=ANZm3bag; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1777892587; bh=0+pnJbJtZojl0+g1hdLUgo7SUN68OmWxLYfO3SjEVfc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ANZm3bag0x8NEyFEgUytDBBvO3g4i0ua7ijLH6+q7/QC/qyhLHeGH6D28z8bT6sSt
	 /O9xtHZh0zuxSZAS5a9IK3k3T7SUiwHDGSPwK5ggN8rYwJgQjtV72UYveDdK2VABrc
	 5YPf//sWuGnL33hdQ/FGG23F8kZ3l/uqE+OXMJRw=
Received: from [2001:bf0:244:244::71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.56.1)
	(envelope-from <p.hahn@avm.de>)
	id 69f87ceb-839b-7f0000032729-7f000001e27e-1
	for <multiple-recipients>; Mon, 04 May 2026 13:03:07 +0200
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Mon,  4 May 2026 13:03:07 +0200 (CEST)
From: Philipp Hahn <p.hahn@avm.de>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Philipp Hahn <phahn-oss@avm.de>,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] watchdog: Separate kind of documentation
Date: Mon,  4 May 2026 13:02:40 +0200
Message-ID: <9fa905187a14c33246d30735cb8df23ca6a7e077.1777892508.git.phahn-oss@avm.de>
In-Reply-To: <cover.1777892508.git.phahn-oss@avm.de>
References: <cover.1777892508.git.phahn-oss@avm.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: FRITZ! Technology GmbH, Berlin, Germany
Content-Transfer-Encoding: 8bit
X-purgate-ID: 149429::1777892587-93694EA9-0C938F5D/0/0
X-purgate-type: clean
X-purgate-size: 1087
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-Rspamd-Queue-Id: E629B4BC367
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[avm.de,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[avm.de:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-85644-lists,linux-doc=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[avm.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[p.hahn@avm.de,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[avm.de:email,avm.de:dkim,avm.de:mid]

From: Philipp Hahn <phahn-oss@avm.de>

Currently there are several (sub-)documents for "Generic kernel
infrastructure API" and several "driver specific" documents. Put each
one into its own sub-section.

Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 Documentation/watchdog/index.rst | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/Documentation/watchdog/index.rst b/Documentation/watchdog/index.rst
index 13e3d78254dd6..300ee142051dc 100644
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
+    wdt
+    hpwdt
+    mlx-wdt
+    pcwd-watchdog
-- 
2.43.0


