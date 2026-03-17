Return-Path: <linux-doc+bounces-79671-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIFgFFMtuWmVtQEAu9opvQ
	(envelope-from <linux-doc+bounces-79671-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 11:30:43 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B241D2A7EC9
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 11:30:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 438D430C9A82
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 10:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F9A53A6F0F;
	Tue, 17 Mar 2026 10:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oOGaC2i9"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C59D3A6F1E
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 10:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773743069; cv=none; b=FequRf0VTMpl0VpyhY+sAnjiD97DPG2lldBb349+N9ABahmhwm3dFNbCxfXsv7sQTYuoU3niB8I+QXwA1ODwMjWOfzRfuKhq1ExNlpHX/jTgjXTu9t8zabJSbRWY36GYkAbZ+LDugQGFFWbpJ1qlSeCNVIwej6SMFExPG1wypCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773743069; c=relaxed/simple;
	bh=m8EezPdj5/zLpTZs6LAb34kiI2GknFW1YMmMypIYx5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ayrkjhdR7ZT/dqjgjlBXeub847P530nK7RmhYhtHtddzOEGBDcT/iZDmhE/bMrVuZ6sOHC5MXL0aCLY7kU2JZY3LgeZi75O0q6gvMj5SFhsVFuQNzE/xOeZIAMS8NlYjb+gz0oWNzVBhzwdaicwb39qkQbDjUPCLoWdYnKHBDFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oOGaC2i9; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AABC5C55055;
	Tue, 17 Mar 2026 10:24:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AF1145FC9A;
	Tue, 17 Mar 2026 10:24:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 95C80104503A6;
	Tue, 17 Mar 2026 11:24:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773743064; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uBSfAslupKiDUjYa9VdOz+tUE+1u7aYrr2OFADafudU=;
	b=oOGaC2i9lLEU64q+oZ0r2QGoz4idF7IPxDdsm3W4fLhv+7mnI+EUblWRysxMQg/Aqdryyv
	MlkyUFxKs+avwRfmAaHynkoVoqQxzC9/g3zWQtBP0D9jvYL0rTnWu0K79vhVckeMbRIo2X
	x/xcd57dsca5KaQirVOm/bv7flu3vbomsgBkWt5r9+Lhkxn9m1Qy8Vpx4gI3f06Uibv5Xn
	VPIXWqQoAyROOv05XR7Eup+PD5AOdWV9c7R5K5NoRfQLkTPLyNJBzQkjGN5GVj4aVrGHF1
	sQJgfU4A++wePdwIQKHBu+/aYaelsdg7Fr5/JL3C6HWxmUiOKQ8TSwQicz2V7g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 17 Mar 2026 11:24:10 +0100
Subject: [PATCH v3 07/27] mtd: spi-nor: swp: Explain the MEMLOCK ioctl
 implementation behaviour
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-winbond-v6-18-rc1-spi-nor-swp-v3-7-2ca9ea4e7b9b@bootlin.com>
References: <20260317-winbond-v6-18-rc1-spi-nor-swp-v3-0-2ca9ea4e7b9b@bootlin.com>
In-Reply-To: <20260317-winbond-v6-18-rc1-spi-nor-swp-v3-0-2ca9ea4e7b9b@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-79671-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid]
X-Rspamd-Queue-Id: B241D2A7EC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add comments about how these requests are actually handled in the SPI
NOR core. Their behaviour was not entirely clear to me at first, and
explaining them in plain English sounds the way to go.

Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/swp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 1d50db1ef1a0..64a917543928 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -346,6 +346,14 @@ static int spi_nor_sr_is_locked(struct spi_nor *nor, loff_t ofs, u64 len)
 	return spi_nor_is_locked_sr(nor, ofs, len, nor->bouncebuf[0]);
 }
 
+/*
+ * These ioctls behave according to the following rules:
+ * ->lock(): Never locks more than what is requested, ie. may lock less
+ * ->unlock(): Never unlocks more than what is requested, ie. may unlock less
+ * -is_locked(): Checks if the region is *fully* locked, returns false otherwise.
+ *               This feeback may be misleading because users may get an "unlocked"
+ *               status even though a subpart of the region is effectively locked.
+ */
 static const struct spi_nor_locking_ops spi_nor_sr_locking_ops = {
 	.lock = spi_nor_sr_lock,
 	.unlock = spi_nor_sr_unlock,

-- 
2.51.1


