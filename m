Return-Path: <linux-doc+bounces-89558-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOLQMZq+FWrYZgcAu9opvQ
	(envelope-from <linux-doc+bounces-89558-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 26 May 2026 17:39:06 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B4B5D8E2F
	for <lists+linux-doc@lfdr.de>; Tue, 26 May 2026 17:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9B5B360E19D
	for <lists+linux-doc@lfdr.de>; Tue, 26 May 2026 15:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C6F428470;
	Tue, 26 May 2026 14:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jpodCC0J"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1181427A04;
	Tue, 26 May 2026 14:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807437; cv=none; b=fvL2R1QyUPMjo7/bWPHz42yt/Y8K40nBpxIdGx+ydb589AoOlo+l3I4fMaJR/FBmaqbEjVUrylWSKmd8rvlRyc1jyeX688tcdEacCMaZ72os1sDlCHqjqGYJF/lVgUOsmPFV54thj4DETbRVRx/iomlrKct1Cb1RBTD1JEMDwcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807437; c=relaxed/simple;
	bh=AJ5kgwcORFft8X7fGFxg332WWjDtcyKWpTMRFzOEUgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CuXVWCrY74Ogw/NxNK1FboKDrQCMHo2uOx4Y6XSx5krYhF1fqcJnlH08p/+6OlNQ2k8FWi9syvenddJIOi++L/NxUEXGgtBroprlqQ6zx1wWvnUIJ+EN0oYlePzitK3H5gABbBVa/NOLT4boyxQYY3Da6PT9dTl1JxwNS82P8tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jpodCC0J; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (unknown [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 626BEC79ABF;
	Tue, 26 May 2026 14:57:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E798A60735;
	Tue, 26 May 2026 14:56:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8FF88108888D2;
	Tue, 26 May 2026 16:56:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779807419; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=380DMxOtkVf4S8j1lpaF5rnIUMKJfHDNDSHsb4bomqI=;
	b=jpodCC0J/HI4BxzNyH/hQ9d7usrpD7o/C4+HxMswodZ8RXVNr5dOg9AkAjqTW61X1vGfxl
	VGSbVS8x8S8oShzcV7s24frPWQ+DCRl7UZYtJPRgj4ZDdxe4zWuXmq8bvVc3+bCIgfWGSU
	GusW3iD9iPhEv8b2cf0jw6cZ5wx8CmHToWf3jtA7ZsqhNDUg66MExHkV9ZpO+VIZDcpSos
	c2vj+B6Qr2Z9/2Qqu3rGvkR67EXZqGKqeoM8tXbC/yOtnE4mpRVIMyX6JaDjkuGGraFjaO
	Xg9uGYPbHxwXd90c8djUYPi8fFlGE+uImNDT2GTIJXVgTKzRfxtw3rq2lZXAEA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 26 May 2026 16:56:31 +0200
Subject: [PATCH v6 07/28] mtd: spi-nor: debugfs: Enhance output
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-7-4092f1419f8f@bootlin.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89558-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bootlin.com:email,bootlin.com:mid,bootlin.com:dkim]
X-Rspamd-Queue-Id: 25B4B5D8E2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Align the number of dashes to the bigger column width (the title in this
case) to make the output more pleasant and aligned with what is done
in the "params" file output.

Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index 69830ad43990..d0191eb9f879 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -144,7 +144,7 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 
 	seq_puts(s, "\nsector map\n");
 	seq_puts(s, " region (in hex)   | erase mask | overlaid\n");
-	seq_puts(s, " ------------------+------------+----------\n");
+	seq_puts(s, " ------------------+------------+---------\n");
 	for (i = 0; i < erase_map->n_regions; i++) {
 		u64 start = region[i].offset;
 		u64 end = start + region[i].size - 1;

-- 
2.53.0


