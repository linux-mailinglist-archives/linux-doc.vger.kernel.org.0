Return-Path: <linux-doc+bounces-79668-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Lm6H38suWmVtQEAu9opvQ
	(envelope-from <linux-doc+bounces-79668-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 11:27:11 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD912A7DBB
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 11:27:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DA8433028050
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 10:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2699C3A6B8F;
	Tue, 17 Mar 2026 10:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oAP6OoM4"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41703A5E6D
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 10:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773743063; cv=none; b=kDpzY/HHSDhcF7KS/ls7VKEFoeS2vQdq9QWAWQ9zFoWOltxMEns9ZxqOPaPBCz3PbW29gTEzE3MPH5cMpda52TTmTPrJkb1auxAttGwC//r12CKWeR7mduMCV3ZT5xe7NyZk/aHBLAJO7wC1ojGfh4doSybC3ubS9mdCk+I5zik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773743063; c=relaxed/simple;
	bh=fzE7Kbk6Kb/cBeCT1q00i3uy0oSMCu925oa9vdXVJ6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lkAbZ0BjYS17FpiizM2UYxj/Sz8cmqVyX6skr8LxDLzctFmKI9aR17DKzpoMAWHyQOp49OjhPjP8hF78IUsA2lVQMFJ3wy62m2vDtdAT4WU2SoZ05hhz88du+uqSTqkL6Hgi8VCO862xhf01Gal/clAj5thOb9GtGE5NF5M+194=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oAP6OoM4; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A632E4E425F5;
	Tue, 17 Mar 2026 10:24:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 795585FC9A;
	Tue, 17 Mar 2026 10:24:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4310C104503AE;
	Tue, 17 Mar 2026 11:24:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773743059; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hXc+5kjs1EF92jBqcrTSRSedlWRYjsDeVRr6sDpavVg=;
	b=oAP6OoM4wnXZe8QPqP/R2D2+8ULChbXgKjwQLTh4fQQSGl4WPp9glOl3sYE3wNmf4CDOHV
	FU6oITksTfbjkV3bqST9cM55oo/EqYrk8A73RYUyg+c1cTT+Xkm4gWfLkk3mNq3Gd6RCv6
	a0xuZ5bZCU5cBQw+9xc96f5NI7/kWt7UslhCD+0pxSMR8LSVfKut3KZw01FqAn28nVVvyX
	nysT5QgOgGXfqgYO3z5O9fOmEd229MylexMywTwvNjEt9QuxYARXsLFMvx8DmoQEbCK74g
	Y2RuINDi1BEV5NDe3d7KP+Np2FFLsdCoXeT3ReThrte7sIFJb6FgF8PY4A+L0A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 17 Mar 2026 11:24:07 +0100
Subject: [PATCH v3 04/27] mtd: spi-nor: Improve opcodes documentation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-winbond-v6-18-rc1-spi-nor-swp-v3-4-2ca9ea4e7b9b@bootlin.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-79668-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7FD912A7DBB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There are two status registers, named 1 and 2. The current wording is
misleading as "1" may refer to the status register ID as well as the
number of bytes required (which, in this case can be 1 or 2).

Clarify the comments by aligning them on the same pattern:
"{read,write} status {1,2} register"

Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/spi-nor.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index cdcfe0fd2e7d..90a0cf583512 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -21,8 +21,8 @@
 /* Flash opcodes. */
 #define SPINOR_OP_WRDI		0x04	/* Write disable */
 #define SPINOR_OP_WREN		0x06	/* Write enable */
-#define SPINOR_OP_RDSR		0x05	/* Read status register */
-#define SPINOR_OP_WRSR		0x01	/* Write status register 1 byte */
+#define SPINOR_OP_RDSR		0x05	/* Read status register 1 */
+#define SPINOR_OP_WRSR		0x01	/* Write status register 1 */
 #define SPINOR_OP_RDSR2		0x3f	/* Read status register 2 */
 #define SPINOR_OP_WRSR2		0x3e	/* Write status register 2 */
 #define SPINOR_OP_READ		0x03	/* Read data bytes (low frequency) */

-- 
2.51.1


