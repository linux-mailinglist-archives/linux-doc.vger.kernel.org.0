Return-Path: <linux-doc+bounces-90087-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJ12GScDGmrM0ggAu9opvQ
	(envelope-from <linux-doc+bounces-90087-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 29 May 2026 23:20:39 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35690608D2E
	for <lists+linux-doc@lfdr.de>; Fri, 29 May 2026 23:20:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A06F63023FAC
	for <lists+linux-doc@lfdr.de>; Fri, 29 May 2026 21:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3463B585F;
	Fri, 29 May 2026 21:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Cu0cGVpg"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABB4376BE2;
	Fri, 29 May 2026 21:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780089629; cv=none; b=CM0YbtX/Y06HVhV8Pav8IQvBTQUJoXpLx79Hb16Unp7S0t+sv/1jJTe53aZkgkTucgwDuPL/q/JDGAu9AAaJgudXXnZUUH7xlaFzwmXPyREpTJ4NCCouwAsxFEYMWcKfWBshlZQ88YZlchpWH67/TP5vz5tEOnptyq0obMoq/mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780089629; c=relaxed/simple;
	bh=Tx4rfkWcgmObg6q+pcOAf1CA3ek4CJeffzJ7yJbqttc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NGEeoPCi3Ko1t8ewAUBGWVwEDRKycEy026X9xaQLoPwIlWhdaYd05vsyJuZck9KiSdtp6lmkp2iMOOl04ynRwEsVW/Mu5wJno4xW1x39SrG1030LbpamHhCPV5B3R8pC5dC9tCoktl/Vwb5VtqlU+uFotLKiCy2F0XenLAJ1Yg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Cu0cGVpg; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=e0ZbXbd/dw1VsVbUP0kZvfc279kxbpTeXOlDnyM1uAs=; b=Cu0cGVpgd3zgkvDl04AMBgR/UM
	HiQs/EZGpAxbnSR4rDU0tVoR93NnekQ5H97B8fcDeg0+tBbTtmw+n8tfv/JpLNGXcjUlb5nw4kF+n
	ZNnHGbqCFC6b/4tEjH7352Z1poVvwk8pAosXkIIu/E/3uiKewlXkZuWv2b+7FSNJG1YNa9ICPg8yd
	Yl5Zc/rhZs3V683nZsa66T2QSAuZK9Zx11QbRZjtW0yOZaQYRYSoiSDKeChW5NGiOOd8y4vM3UghF
	7pAvPddFUakdRtwBwhYK3I3oDqLXxhQzZmsWRqbBNHRx13pIVoL8My0+BAJOSrgx+PVtl+eYn4jlZ
	QWwbe2nQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT4d1-00000008F6L-1uXd;
	Fri, 29 May 2026 21:20:27 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 3/5] watchdog: uapi: add comments for what bit masks apply to
Date: Fri, 29 May 2026 14:20:22 -0700
Message-ID: <20260529212024.2119204-4-rdunlap@infradead.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529212024.2119204-1-rdunlap@infradead.org>
References: <20260529212024.2119204-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90087-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[infradead.org:+];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,infradead.org:mid,infradead.org:dkim]
X-Rspamd-Queue-Id: 35690608D2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add comments similar to those in include/linux/watchdog.h
so that the reader/user doesn't have to dig into the API documentation
files for this.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: s/Bit numbers/Bit masks/ per sashiko review

 include/uapi/linux/watchdog.h |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20260527.orig/include/uapi/linux/watchdog.h
+++ linux-next-20260527/include/uapi/linux/watchdog.h
@@ -36,6 +36,7 @@ struct watchdog_info {
 #define	WDIOF_UNKNOWN		-1	/* Unknown flag error */
 #define	WDIOS_UNKNOWN		-1	/* Unknown status error */
 
+/* Bit masks for watchdog_info.options, GETSTATUS and GETBOOTSTATUS ioctls */
 #define	WDIOF_OVERHEAT		0x0001	/* Reset due to CPU overheat */
 #define	WDIOF_FANFAULT		0x0002	/* Fan failed */
 #define	WDIOF_EXTERN1		0x0004	/* External relay 1 */
@@ -50,6 +51,7 @@ struct watchdog_info {
 					   other external alarm not a reboot */
 #define	WDIOF_KEEPALIVEPING	0x8000	/* Keep alive ping reply */
 
+/* Bit masks for WDIOC_SETOPTIONS ioctl */
 #define	WDIOS_DISABLECARD	0x0001	/* Turn off the watchdog timer */
 #define	WDIOS_ENABLECARD	0x0002	/* Turn on the watchdog timer */
 #define	WDIOS_TEMPPANIC		0x0004	/* Kernel panic on temperature trip */

