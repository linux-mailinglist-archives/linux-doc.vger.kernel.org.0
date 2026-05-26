Return-Path: <linux-doc+bounces-89552-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cP4dFDS4FWrKYQcAu9opvQ
	(envelope-from <linux-doc+bounces-89552-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 26 May 2026 17:11:48 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEEE5D863C
	for <lists+linux-doc@lfdr.de>; Tue, 26 May 2026 17:11:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B9DD33B6C5A
	for <lists+linux-doc@lfdr.de>; Tue, 26 May 2026 15:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0B98425CD6;
	Tue, 26 May 2026 14:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="S3+CyI0g"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4FE3FF897;
	Tue, 26 May 2026 14:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807417; cv=none; b=aT0iivEQ/I3WhjRMtny63718Lce/eMLNk98Ylu9zAgd/9c8F+JHPaVusuIS25kUAIRdudcJ58LXp8k/EJYEd5YUu13DG5rprG1yvd+zvEBET7CsGvUM8jZghYyMcs3rX5zamwdFzGcyZ6uRTgG6vR/ni5vkRA/ExwZKmuoO0s8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807417; c=relaxed/simple;
	bh=qEOXCL1J2PuoJqHA5b7NcfdQfXQsyu5C2J+/CcvcScA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PEUgHLQ3fW78QXwdr8yH13cfHdQemgJ6NSUKjy/DjPgUvINaJGZWbx4HoRSunkxMJKHb97zmlLXSmIiylwh0ArXi+tseh7Nhxd1pNePP1PXiazzFpkNZRRpGvPt0LBjkGTZ8Q1a0ayhnkUd2DAEzOFdetAWivgPWiBR9n1t7j8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=S3+CyI0g; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0E9A94E42D5F;
	Tue, 26 May 2026 14:56:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D80676011D;
	Tue, 26 May 2026 14:56:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81040108888CB;
	Tue, 26 May 2026 16:56:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779807412; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fNfQtEn0rDKQ08xTLMyGfUSzqnBc/J5aa9LBz96hoMc=;
	b=S3+CyI0ghG88Z8U/qkK/B9aqs8PBZ1gfUkuD4dScLrjxiAc/Ut/ltlNVVUe9YTeBMEoPPR
	9B1E5PxL/eo+N/Y7f8U+HasYOV1kvYlLCBggX7p8VDXwi5EX04Oq7gJ6uIQ71v0jQIvIEO
	tbvv+qXGpPQmb1bMDtSykFZYQ0qo77GgwinYQx7yG1kRcO29n58WJC2zn+VckZLf18AUBU
	X2zc/cz8lyjGU6EzG8UT6iM8FL3sKEdQU0AWOBoVJ8k5IuBO8lJo0q+TjMtsCuu2pEOlYg
	Gw5QZpmpynGt6GxCyCBIp6vtE7HfYCCs1doVG1W9OLIEzBV2YC+sYIdjnitdKA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 26 May 2026 16:56:28 +0200
Subject: [PATCH v6 04/28] mtd: spi-nor: Make sure the QE bit is kept
 enabled if useful
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-4-4092f1419f8f@bootlin.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89552-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:mid,bootlin.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: BCEEE5D863C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Not all chips implement the 4BAIT table which typically indicates the
program capability, while many of them do implement the relevant SFDP
parts indicating the read capabilities. In such a situation, programs
can happen in single mode (1-1-1) and reads in quad mode (1-1-4 or
1-4-4). For the reads to work in such condition, the QE bit must be set.
In case we later use the spi_nor_write_16bit_sr_and_check() helper with
a chip with such configuration, the QE bit would get incorrectly
cleared.

Make sure this doesn't happen by keeping the QE bit under a simpler
condition:
- the quad enable hook is there (no change)
- and at least one of the two protocols is based on quad I/O cycles

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
---
 drivers/mtd/spi-nor/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 5dd0b3cb5250..394c27de02d6 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -869,8 +869,8 @@ static int spi_nor_write_16bit_sr_and_check(struct spi_nor *nor, u8 sr1)
 		ret = spi_nor_read_cr(nor, &sr_cr[1]);
 		if (ret)
 			return ret;
-	} else if (spi_nor_get_protocol_width(nor->read_proto) == 4 &&
-		   spi_nor_get_protocol_width(nor->write_proto) == 4 &&
+	} else if ((spi_nor_get_protocol_width(nor->read_proto) == 4 ||
+		    spi_nor_get_protocol_width(nor->write_proto) == 4) &&
 		   nor->params->quad_enable) {
 		/*
 		 * If the Status Register 2 Read command (35h) is not

-- 
2.53.0


