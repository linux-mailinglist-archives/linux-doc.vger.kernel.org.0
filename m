Return-Path: <linux-doc+bounces-82386-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJo7N2Hrz2lF1wYAu9opvQ
	(envelope-from <linux-doc+bounces-82386-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Apr 2026 18:31:29 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E66893966BE
	for <lists+linux-doc@lfdr.de>; Fri, 03 Apr 2026 18:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6709A30A5B2F
	for <lists+linux-doc@lfdr.de>; Fri,  3 Apr 2026 16:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05ED23D0916;
	Fri,  3 Apr 2026 16:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="POaCsvSW"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A084E3D75B7
	for <linux-doc@vger.kernel.org>; Fri,  3 Apr 2026 16:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775232613; cv=none; b=QQB8s/n/w1+WEEkWifyjVi8ha0kUzcZEMfbMYkq16qob/snvsCytvI77klnuby20KtQygQhD8zKlhtyOkAUf2UqYgRUO+O0J2XfTTxOzqNAu4Kzv5pYeR9iPmnQSrkjBkZtiL8lTEd5MfY6OnXJDBpSUBYF0jMIv1KHBiNmmyBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775232613; c=relaxed/simple;
	bh=2EFf5xOFrTZzA3C6TJkuzrE465Ubjd3W8p3pWLusQN4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pvg4EXqlmsqbvML2yilU3Z3DHdQDfrK41VAEFDKgPQcywkXR/4ymEFZpjf7EuN43dpSxpSMAacKbmxWGSXbcnNyA9gwN6catZdC+gvI2JHB9IKAJ+DHK5uhptPcKs9H2KiaS/OchjFouFexjBj9RaxB7ybhvGCWabFr+ERBP6r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=POaCsvSW; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6B1234E428D5;
	Fri,  3 Apr 2026 16:10:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3FBD3603C1;
	Fri,  3 Apr 2026 16:10:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3F13010450102;
	Fri,  3 Apr 2026 18:10:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775232610; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=myF1jFvrCgWbnH0NLIBXbT8w17K7kgr7HnwXrOW3SAM=;
	b=POaCsvSWv8pvL4ZxIPvr/kU4sumw6OyoWfrbwOe2J6TLuAhC7PwCME9zGOGgU4i0L+K5Lk
	hZGbjToX16mDPh9uU4OC230WtiySEsFuDRMLn/o1jAZSGJI13DL2oszZJkrsU2/VBEkaK5
	Xp2+He6lV21tLxJlBGh5y4CXDQ7vQ4qdDsrj3e0h22MyxToVnxm2oD2t8rRtFLWFYeXKBo
	3lSgc5KNJTfsVEl1OL/Z+L07d+ATfu/KayA8SiP3Ez6SY6yR9sPAK/PQbzJCoyPH+3ZBc2
	IaNnxR3HGT+yg/JilhioanY+yf1/kTtCOM77/hHFhcVfQdSWVJiLxCmXB359Bg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 03 Apr 2026 18:09:32 +0200
Subject: [PATCH v4 14/27] mtd: spi-nor: swp: Simplify checking the
 locked/unlocked range
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-14-833dab5e7288@bootlin.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-82386-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E66893966BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In both the locking/unlocking steps, at the end we verify whether we do
not lock/unlock more than requested (in which case an error must be
returned).

While being possible to do that with very simple mask comparisons, it
does not scale when adding extra locking features such as the CMP
possibility. In order to make these checks slightly easier to read and
more future proof, use existing helpers to read the (future) status
register, extract the covered range, and compare it with very usual
algebric comparisons.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/swp.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index e2e423b20989..c45a9ddd5788 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -198,7 +198,8 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	u64 min_prot_len;
 	int ret;
 	u8 status_old[1] = {}, status_new[1] = {};
-	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
+	loff_t ofs_old, ofs_new;
+	u64 len_old, len_new;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
@@ -246,10 +247,6 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	if (ret)
 		return ret;
 
-	/* Don't "lock" with no region! */
-	if (!(status_new[0] & bp_mask))
-		return -EINVAL;
-
 	/*
 	 * Disallow further writes if WP# pin is neither left floating nor
 	 * wrongly tied to GND (that includes internal pull-downs).
@@ -262,8 +259,16 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	if (status_new[0] == status_old[0])
 		return 0;
 
+	spi_nor_get_locked_range_sr(nor, status_old, &ofs_old, &len_old);
+	spi_nor_get_locked_range_sr(nor, status_new, &ofs_new, &len_new);
+
+	/* Don't "lock" with no region! */
+	if (!len_new)
+		return -EINVAL;
+
 	/* Only modify protection if it will not unlock other areas */
-	if ((status_new[0] & bp_mask) < (status_old[0] & bp_mask))
+	if (len_old &&
+	    (ofs_old < ofs_new || (ofs_new + len_new) < (ofs_old + len_old)))
 		return -EINVAL;
 
 	return spi_nor_write_sr_and_check(nor, status_new[0]);
@@ -279,7 +284,8 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 	u64 min_prot_len;
 	int ret;
 	u8 status_old[1], status_new[1];
-	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
+	loff_t ofs_old, ofs_new;
+	u64 len_old, len_new;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
@@ -344,7 +350,10 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 		return 0;
 
 	/* Only modify protection if it will not lock other areas */
-	if ((status_new[0] & bp_mask) > (status_old[0] & bp_mask))
+	spi_nor_get_locked_range_sr(nor, status_old, &ofs_old, &len_old);
+	spi_nor_get_locked_range_sr(nor, status_new, &ofs_new, &len_new);
+	if (len_old && len_new &&
+	    (ofs_new < ofs_old || (ofs_old + len_old) < (ofs_new + len_new)))
 		return -EINVAL;
 
 	return spi_nor_write_sr_and_check(nor, status_new[0]);

-- 
2.53.0


