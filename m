Return-Path: <linux-doc+bounces-89574-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJLtMXS4FWrKYQcAu9opvQ
	(envelope-from <linux-doc+bounces-89574-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 26 May 2026 17:12:52 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5818F5D8688
	for <lists+linux-doc@lfdr.de>; Tue, 26 May 2026 17:12:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C301F30787C8
	for <lists+linux-doc@lfdr.de>; Tue, 26 May 2026 15:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE5643D4E6;
	Tue, 26 May 2026 14:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mcYDIShP"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801DF43CEF9
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 14:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807461; cv=none; b=DRw+VJmfuRKcAUmpqjsaaCdhxyn29pI8pyfgihXLnk0blyH0iR97cWxeT7ZW6FN74AF93x7sOGrt2Lni4CvuUqAzZVixfYd33UbqBV1hq9MLuWoqHl0xxh7U1+MqSiLepRQMySH055Gdzc4IZ/kjQqlb5vfbW4yElR9H3miYv48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807461; c=relaxed/simple;
	bh=rInX3kRv6yDK5iSVlOduYu1C3wNRfxf3HZdAXXBol6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MKE7gx+dP2lKLIEf93QPJPJ9Aieyxthxp5ZAuoGukR3ZgcAc66Q8YFnGYKgTReizuCkA6nVKb+fHDq/kGPCRORo9Ru+P4XNDsDZj0DHuOtmQCUdhySAr5361XAfezSQn2IIHGZeBhItPWN0uKHOm7XLfVNiqwOoC0+PFisk64AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mcYDIShP; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 41FCA4E42D5E;
	Tue, 26 May 2026 14:57:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 16A8D6011D;
	Tue, 26 May 2026 14:57:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5742D108888CA;
	Tue, 26 May 2026 16:57:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779807458; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KojwcP/r+lQUigQvs1nLbgljyHHODmHhZ8UlG/TVtXQ=;
	b=mcYDIShPzvtJJXl2TnCDJaENfXcuLepRRPY8JJ5sXAkh9Knrh+2mV8lHrP6zTBKqGnWAqc
	aY4Fy/jY2bKA349zSzXV6xecmsg/P9DyhZq2iW9hTq/hHTjm4JzjcIm6rEGwiWET3jhYNJ
	ttHZukvZgA4ePTbEYsLRvJJhesy5WijSuHCufV/92zDF/VIetli182SMSeSh6UqrO290q4
	02S/lRvM0CZS6IbJN4SBb36TJsHGT8tlG9emWVp7flnADDd2Lmu/dzs4qxSkwmK4XApcqN
	CmqmFfWf1eB9oa/YThgn2P4ErJyMhW9cfFN/4u0aaLfDX4CF1bVQg3CTD5wMXw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 26 May 2026 16:56:50 +0200
Subject: [PATCH v6 26/28] mtd: spi-nor: winbond: Add W25Q01NWxxIQ CMP
 locking support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-26-4092f1419f8f@bootlin.com>
References: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
In-Reply-To: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
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
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89574-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:mid,bootlin.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5818F5D8688
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This chip has support for the locking complement (CMP) feature. Add
the relevant bit to enable it.

Unfortunately, this chip also comes with an incorrect BFPT table,
indicating the Control Register cannot be read back. This is wrong,
reading back the register works and has no (observed) side effect. The
datasheet clearly indicates supporting the 35h command and all bits from
the CR are marked readable. QE and CMP bits are inside, and can be
properly read back.

Add a fixup for this, otherwise it would defeat the use of the CMP
feature.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Test run with W25Q01NWxxIQ:
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 $bs $all_but_one # all but the first
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-0000ffff | unlocked | 1
 00010000-07ffffff |   locked | 2047
$ flash_lock -u /dev/mtd0 $bs 1 # all but the two first
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-0001ffff | unlocked | 2
 00020000-07ffffff |   locked | 2046
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 0 $all_but_one # same from the other side
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-07feffff |   locked | 2047
 07ff0000-07ffffff | unlocked | 1
$ flash_lock -u /dev/mtd0 $(($size - (2 * $bs))) 1 # alll but two
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-07fdffff |   locked | 2046
 07fe0000-07ffffff | unlocked | 2
---
 drivers/mtd/spi-nor/winbond.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 2c48d6c4a0aa..3eca7baa4d5a 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -368,7 +368,9 @@ static const struct flash_info winbond_nor_parts[] = {
 	}, {
 		/* W25Q01NWxxIQ */
 		.id = SNOR_ID(0xef, 0x60, 0x21),
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
+		.fixups = &winbond_rdcr_fixup,
 	}, {
 		/* W25Q01NWxxIM */
 		.id = SNOR_ID(0xef, 0x80, 0x21),

-- 
2.53.0


