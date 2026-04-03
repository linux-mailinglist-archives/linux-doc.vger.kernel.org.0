Return-Path: <linux-doc+bounces-82383-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJgDEJvoz2kS1gYAu9opvQ
	(envelope-from <linux-doc+bounces-82383-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Apr 2026 18:19:39 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3223963F1
	for <lists+linux-doc@lfdr.de>; Fri, 03 Apr 2026 18:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3863F314DA01
	for <lists+linux-doc@lfdr.de>; Fri,  3 Apr 2026 16:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 973AD3CFF41;
	Fri,  3 Apr 2026 16:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fX0TW3G+"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274C33CF696
	for <linux-doc@vger.kernel.org>; Fri,  3 Apr 2026 16:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775232606; cv=none; b=jEPc8OJYhqsuaMOLxsulcdDSh8Cjazt7qZ1N6clxtufCc/UFB2wZ+gAiUjFXuaPwwquBDAac1lY40LBBq0fKR7UU2I41UGuZ89bcu7TPfEtjw2QB3OC5epmwiDkiBubhdU1UYCnh6ieYKT3crD4+hCxFajmABBdCEq6lfH9SRX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775232606; c=relaxed/simple;
	bh=Y83KYn/IVlv0CuC1jWDIk1uUyPw9VZxig3d2hhCSWLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dxODHTUTIN+9HUdyqpxhOfjr7JmGwpJSA+tv0OISHedCHi8KLwe0+kGHoEWhimunMHH0EsduyJ/KCLMLmCkPdG8aBVG/H2a6PR4pQLhDACQL57R8ZL2P0kdT10/zBpPbAshUKIwYLLndb4dbRmTiWeMiFa8oYs1mbeFuDpJTfpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fX0TW3G+; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 087D54E428D6;
	Fri,  3 Apr 2026 16:10:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CC75B603C1;
	Fri,  3 Apr 2026 16:10:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3796A104500FB;
	Fri,  3 Apr 2026 18:10:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775232602; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8PfJAvOeYuhH5dbaDKJSTXCqDQ9KrVUp5a2zaIJVtqQ=;
	b=fX0TW3G+QCtp4oSRisM4uUPTCgxO0PWqGemlRIr5nkFNOHaoSzkduz4HpALyNhrYLSq8/F
	kGdMa5s3r718SBxAkzFC/oda64BcExkVZ4ZZGV2f7IZLyesthcuL2kXtBQnW1R0UccIlf0
	slDX60Mz/1xNX6zErIDZnwBmC8Y01TPWCDH/JZ/uHHAaw5glgP918C7Rk6WHQHzjv/Oblj
	LJI4abbCNTT4UKd7Jyte5s8C2jbD8q8IeVkzjwLaDT5wP4aJMfRHDqF6MxzzB2DiIyuuPL
	RO8y4kgbaw4xBzGXVohvHl83fX3AdLQ0FUgHy7QRpmFOxyu/Y04Sh1/koj3bHQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 03 Apr 2026 18:09:29 +0200
Subject: [PATCH v4 11/27] mtd: spi-nor: swp: Rename a mask
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-11-833dab5e7288@bootlin.com>
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
In-Reply-To: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-82383-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BF3223963F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

"mask" is not very descriptive when we already manipulate two masks, and
soon will manipulate three. Rename it "bp_mask" to align with the
existing "tb_mask" and soon "cmp_mask".

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/swp.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index af6e577d9b42..66f85826ba0d 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -57,9 +57,9 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_
 					u64 *len)
 {
 	u64 min_prot_len;
-	u8 mask = spi_nor_get_sr_bp_mask(nor);
+	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
-	u8 bp, val = sr[0] & mask;
+	u8 bp, val = sr[0] & bp_mask;
 
 	if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3_BIT6)
 		val = (val & ~SR_BP3_BIT6) | SR_BP3;
@@ -160,7 +160,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	u64 min_prot_len;
 	int ret;
 	u8 status_old[1] = {}, status_new[1] = {};
-	u8 mask = spi_nor_get_sr_bp_mask(nor);
+	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
 	u8 pow, val;
 	loff_t lock_len;
@@ -199,7 +199,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 		lock_len = ofs + len;
 
 	if (lock_len == nor->params->size) {
-		val = mask;
+		val = bp_mask;
 	} else {
 		min_prot_len = spi_nor_get_min_prot_length_sr(nor);
 		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
@@ -208,15 +208,15 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3)
 			val = (val & ~SR_BP3) | SR_BP3_BIT6;
 
-		if (val & ~mask)
+		if (val & ~bp_mask)
 			return -EINVAL;
 
 		/* Don't "lock" with no region! */
-		if (!(val & mask))
+		if (!(val & bp_mask))
 			return -EINVAL;
 	}
 
-	status_new[0] = (status_old[0] & ~mask & ~tb_mask) | val;
+	status_new[0] = (status_old[0] & ~bp_mask & ~tb_mask) | val;
 
 	/*
 	 * Disallow further writes if WP# pin is neither left floating nor
@@ -234,7 +234,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 		return 0;
 
 	/* Only modify protection if it will not unlock other areas */
-	if ((status_new[0] & mask) < (status_old[0] & mask))
+	if ((status_new[0] & bp_mask) < (status_old[0] & bp_mask))
 		return -EINVAL;
 
 	return spi_nor_write_sr_and_check(nor, status_new[0]);
@@ -250,7 +250,7 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 	u64 min_prot_len;
 	int ret;
 	u8 status_old[1], status_new[1];
-	u8 mask = spi_nor_get_sr_bp_mask(nor);
+	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
 	u8 pow, val;
 	loff_t lock_len;
@@ -306,11 +306,11 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 			val = (val & ~SR_BP3) | SR_BP3_BIT6;
 
 		/* Some power-of-two sizes may not be supported */
-		if (val & ~mask)
+		if (val & ~bp_mask)
 			return -EINVAL;
 	}
 
-	status_new[0] = (status_old[0] & ~mask & ~tb_mask) | val;
+	status_new[0] = (status_old[0] & ~bp_mask & ~tb_mask) | val;
 
 	/* Don't protect status register if we're fully unlocked */
 	if (lock_len == 0)
@@ -324,7 +324,7 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 		return 0;
 
 	/* Only modify protection if it will not lock other areas */
-	if ((status_new[0] & mask) > (status_old[0] & mask))
+	if ((status_new[0] & bp_mask) > (status_old[0] & bp_mask))
 		return -EINVAL;
 
 	return spi_nor_write_sr_and_check(nor, status_new[0]);

-- 
2.53.0


