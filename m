Return-Path: <linux-doc+bounces-85642-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKV1Dnd++GmHwAIAu9opvQ
	(envelope-from <linux-doc+bounces-85642-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 04 May 2026 13:09:43 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7CB4BC320
	for <lists+linux-doc@lfdr.de>; Mon, 04 May 2026 13:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46C3C3027967
	for <lists+linux-doc@lfdr.de>; Mon,  4 May 2026 11:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 345253A9D9A;
	Mon,  4 May 2026 11:08:56 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3103563E8;
	Mon,  4 May 2026 11:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777892936; cv=none; b=MPFlJIKa6UBCMUzRw/5y6+cFvadlZB95oV+oFp5zHMlzSeyKy9jF1/hJnmH7LwubJ2ahOe1wiTzZ83bnvYmq/MmbxlRTK3JXJ+u/I685eNyYUIDHFN0I9pJNDkxvcWNFqCAM/TZDXAioRH1T56KlRxKWwmUce9MPdqezAWCIEOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777892936; c=relaxed/simple;
	bh=lkpPY/uDMnfPDk+OR8wJwIuAcD8QR41hRJpYVkiBSc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QT+dbi73zrEuYDFg2ZFEsx7BP7jGpXIZO31b6lVQd5l9HkupSXZEowUV3JQ6kXXvQ5q2na4ulZ8vw1YVE6Egxic7b2jLYvKU2b/Q2GTj0MYBnPN2F1+ZM3+tMKgpNvdXPRk0HVz5C+oB1REVka1r8pMCepmYFGkoOANmK2a8JYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; arc=none smtp.client-ip=212.42.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
Received: from [212.42.244.71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.56.1)
	(envelope-from <p.hahn@avm.de>)
	id 69f87cec-88c8-7f0000032729-7f000001eafc-1
	for <multiple-recipients>; Mon, 04 May 2026 13:03:08 +0200
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Mon,  4 May 2026 13:03:08 +0200 (CEST)
From: Philipp Hahn <p.hahn@avm.de>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Philipp Hahn <phahn-oss@avm.de>,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] watchdog: Prefix WDT with ICS for clarity
Date: Mon,  4 May 2026 13:02:41 +0200
Message-ID: <a0a05dca5531c6a5ce0cc772dfa0c0522538e23f.1777892508.git.phahn-oss@avm.de>
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
X-purgate-ID: 149429::1777892588-71650582-642F227A/0/0
X-purgate-type: clean
X-purgate-size: 2016
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-Rspamd-Queue-Id: 8C7CB4BC320
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[avm.de : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-85642-lists,linux-doc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.975];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-doc];
	FROM_NEQ_ENVFROM(0.00)[p.hahn@avm.de,linux-doc@vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[avm.de:mid,avm.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

From: Philipp Hahn <phahn-oss@avm.de>

`wdt.rst` is only about the Watchdog timer from "Industrial Computer
Source" (ICS). Change the title to better express this.

Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 Documentation/watchdog/wdt.rst | 6 +++---
 drivers/watchdog/Kconfig       | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/watchdog/wdt.rst b/Documentation/watchdog/wdt.rst
index d97b0361535b0..be8cc0b9f31e1 100644
--- a/Documentation/watchdog/wdt.rst
+++ b/Documentation/watchdog/wdt.rst
@@ -1,6 +1,6 @@
-============================================================
-WDT Watchdog Timer Interfaces For The Linux Operating System
-============================================================
+================================================================
+ICS WDT Watchdog Timer Interfaces For The Linux Operating System
+================================================================
 
 Last Reviewed: 10/05/2007
 
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index dc78729ba2a5d..2cbf0391a065a 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -2270,10 +2270,10 @@ config MIXCOMWD
 	  Most people will say N.
 
 config WDT
-	tristate "WDT Watchdog timer"
+	tristate "ICS WDT Watchdog timer"
 	depends on ISA
 	help
-	  If you have a WDT500P or WDT501P watchdog board, say Y here,
+	  If you have an ICS WDT500P or WDT501P watchdog board, say Y here,
 	  otherwise N. It is not possible to probe for this board, which means
 	  that you have to inform the kernel about the IO port and IRQ that
 	  is needed (you can do this via the io and irq parameters)
@@ -2304,7 +2304,7 @@ config PCIPCWATCHDOG
 	  Most people will say N.
 
 config WDTPCI
-	tristate "PCI-WDT500/501 Watchdog timer"
+	tristate "ICS PCI-WDT500/501 Watchdog timer"
 	depends on PCI && HAS_IOPORT
 	help
 	  If you have a PCI-WDT500/501 watchdog board, say Y here, otherwise N.
-- 
2.43.0


