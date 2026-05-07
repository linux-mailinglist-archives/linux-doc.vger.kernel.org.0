Return-Path: <linux-doc+bounces-86238-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ExWD7DC/GnSTAAAu9opvQ
	(envelope-from <linux-doc+bounces-86238-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 07 May 2026 18:49:52 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF514EC70C
	for <lists+linux-doc@lfdr.de>; Thu, 07 May 2026 18:49:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 242883016B1F
	for <lists+linux-doc@lfdr.de>; Thu,  7 May 2026 16:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE1B244E045;
	Thu,  7 May 2026 16:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RYLmPhfh"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C173472785
	for <linux-doc@vger.kernel.org>; Thu,  7 May 2026 16:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778172432; cv=none; b=AR83iiWcGeYjsejZ+bw5gVh64J+siFL46D1VzRz6K2CH+0xgtBavNxlwg8hSQwpvr/RhxSUidIwvvLJciUJ+cnnZ600TmwIsP+MsEktjWjctu87jy8tWD9e2eFbIFStQYfIrIAZR9IHIT9UuThsTzWKyKiOndi4G/QvBKjF49sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778172432; c=relaxed/simple;
	bh=cgD61f3kJ0Ok5o1W55uyE1PnBczkMq8cG3xlLRmKt2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CcnOUM0aXjNIXmzdPIsVbsVjVbPvd3UzBPt6kh39RbV4U508naRpYYecWV9tBYAqSr9RBwY52dwn3GOoKJHV0BjATN46YrgyTKSKQLaurF0lEn0BbVoeeO/sqx/yY8MS1p4eeMgkQQtE4Vjj2r1n5kxpvZDWoeUgZ7K6WMF9J9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RYLmPhfh; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 08D374E42C34;
	Thu,  7 May 2026 16:47:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D1645605CF;
	Thu,  7 May 2026 16:47:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A1E61108194E4;
	Thu,  7 May 2026 18:47:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778172429; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DW149RMGV1/vK6x3sFt0RygGY7FkmmkXRKSFTd7Ff0M=;
	b=RYLmPhfh3SJ3G9X1Ki2MPVUIx7P+vpnqqgc+rqVzTt+N6K5Galn1WlAH+X3veVvSxJy63j
	Faxykj9QRUYAZD7MQa/qtwM5v+zsVsCHZpnAwRJFHdwWTHyWmF6IZr/9JqVv/bt1l7UKAg
	g4Bwyrys16IcUYpYmlRjLuUXRETcZCONlEDcegO2LpWClALgtb7aJEphPzefI1S+bY1RRX
	FtTmPwFKOdtWewvD24vWCGH1uW12qYzIDXBL6uakXGGM5uiUkCDlt9PzpRMIrdR4OkB6Nd
	6xJ0RXpl/CH249ybB0elNdcO0jF7UtvJ/NOoti1OlmS2ksjdKh/71TXjyONxCw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 07 May 2026 18:46:49 +0200
Subject: [PATCH v5 08/28] mtd: spi-nor: swp: Explain the MEMLOCK ioctl
 implementation behaviour
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-8-93453e1a9597@bootlin.com>
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
In-Reply-To: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 6CF514EC70C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-86238-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Add more details about how these requests are actually handled in the
SPI NOR core. Their behaviour was not entirely clear to me at first, and
explaining them in plain English sounds the way to go.

Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index e838c40a2589..22f21497c720 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -279,9 +279,14 @@ struct spi_nor_erase_map {
 
 /**
  * struct spi_nor_locking_ops - SPI NOR locking methods
- * @lock:	lock a region of the SPI NOR.
- * @unlock:	unlock a region of the SPI NOR.
- * @is_locked:	check if a region of the SPI NOR is completely locked
+ * @lock:	lock a region of the SPI NOR, never locks more than what is
+ *		requested, ie. may lock less.
+ * @unlock:	unlock a region of the SPI NOR, never unlocks more than what is
+ *		requested, ie. may unlock less.
+ * @is_locked:	check if a region of the SPI NOR is completely locked, returns
+ *		false otherwise. This feeback may be misleading because users
+ *		may get an "unlocked" status even though a subpart of the region
+ *		is effectively locked.
  */
 struct spi_nor_locking_ops {
 	int (*lock)(struct spi_nor *nor, loff_t ofs, u64 len);

-- 
2.53.0


