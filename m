Return-Path: <linux-doc+bounces-91956-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aYnyMWXBKmoywQMAu9opvQ
	(envelope-from <linux-doc+bounces-91956-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 16:08:37 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6438D67298D
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 16:08:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=WcIM9UV9;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91956-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-91956-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=lst.de (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D4E903095165
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 14:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DC543EAC9B;
	Thu, 11 Jun 2026 14:07:14 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B13B21773D;
	Thu, 11 Jun 2026 14:07:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781186834; cv=none; b=kMS2frxSpmgZ/9U3i1OZOp9zrnq0yIxlzkOcEOqEr8dFU0eBBfPJJyp5NHWB+ZDK+L/Y3QqcoMjEYYmiKdZtNO4xIOssOXQby0L7NcZHQkuUrit8oN2FYqRJQs05Z+noFhVJbcMVgFoEHYXeGBrCU3ntcDqWnI4a+wYnM94QM4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781186834; c=relaxed/simple;
	bh=gr1BlwKyaA6Wk6/SuwU53UTp845bVytDgN3yX3SPDvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aWDH7wjCMHW2G3h/8AxVTMvvKc0qoyLJLRnQDcNvkHrU2w2RIDttmJpPkVJdGfY6tQR7QUXxXiwHGgn3IkNkbp+b5Hn3e/Rk8qQpin/05uwTX6IfRfHtXuA37bSxJTtgLweQB5cgAQc15g0P/BBNxC8kbmfTw1cwOdqfItM3ZQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WcIM9UV9; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=jZGPDaWDFPN+CVZ5uxpGVsNyw4lL+9is75/Aa2KUoao=; b=WcIM9UV9+eou7+/BQ6o7FRebmb
	+JKkkMMUDbg/NAAxdEj7togeGFkwaUIVIG1pFE/q75uOqcWz0Cs230VDQIUdAjEOBDDTFp4urIzw2
	vB4g30D6rHxSiu+/aWeGTbpyOoGf+PpBW0y1nTS0Y/MH4Lizw4JCmxvwDNfSR6i138if8AoKS6Sxm
	W/Oc8yFs+u73MpTssXpXrW+KiYISLylAl1Bc9alfiYRp/gvNtez6iz4aHyds0E39ILOMDr1xQvpOG
	uxXIm5k+ZcUhDaxtxdGuLM8GSWfx2v0FK7l6RT2+d4tci5fDLPy3GEjd1SgHs2j91QYcVCKWFdzPa
	vVhFdoCQ==;
Received: from 2a02-8389-2341-5b80-decc-1a96-daaa-a2cc.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:decc:1a96:daaa:a2cc] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXg3s-00000009ZY6-0XUm;
	Thu, 11 Jun 2026 14:07:12 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hannes Reinecke <hare@suse.de>,
	Keith Busch <kbusch@kernel.org>,
	linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>,
	Hannes Reinecke <hare@kernel.org>
Subject: [PATCH 1/4] block: add a macro to initialize the status table
Date: Thu, 11 Jun 2026 16:06:44 +0200
Message-ID: <20260611140703.2401204-2-hch@lst.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260611140703.2401204-1-hch@lst.de>
References: <20260611140703.2401204-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.06 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-91956-lists,linux-doc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:axboe@kernel.dk,m:corbet@lwn.net,m:dlemoal@kernel.org,m:hare@suse.de,m:kbusch@kernel.org,m:linux-block@vger.kernel.org,m:linux-doc@vger.kernel.org,m:bvanassche@acm.org,m:hare@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hch@lst.de,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,lst.de:mid,lst.de:from_mime,vger.kernel.org:from_smtp,infradead.org:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,acm.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6438D67298D

Prepare for adding a new value to the error table by adding a macro
to fill it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Reviewed-by: Hannes Reinecke <hare@kernel.org>
---
 block/blk-core.c | 45 +++++++++++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 1c637db79e59..43121a9f99f0 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -132,39 +132,44 @@ inline const char *blk_op_str(enum req_op op)
 }
 EXPORT_SYMBOL_GPL(blk_op_str);
 
+#define ENT(_tag, _errno, _desc)	\
+[BLK_STS_##_tag] = {				\
+	.errno		= _errno,		\
+	.name		= _desc,		\
+}
 static const struct {
 	int		errno;
 	const char	*name;
 } blk_errors[] = {
-	[BLK_STS_OK]		= { 0,		"" },
-	[BLK_STS_NOTSUPP]	= { -EOPNOTSUPP, "operation not supported" },
-	[BLK_STS_TIMEOUT]	= { -ETIMEDOUT,	"timeout" },
-	[BLK_STS_NOSPC]		= { -ENOSPC,	"critical space allocation" },
-	[BLK_STS_TRANSPORT]	= { -ENOLINK,	"recoverable transport" },
-	[BLK_STS_TARGET]	= { -EREMOTEIO,	"critical target" },
-	[BLK_STS_RESV_CONFLICT]	= { -EBADE,	"reservation conflict" },
-	[BLK_STS_MEDIUM]	= { -ENODATA,	"critical medium" },
-	[BLK_STS_PROTECTION]	= { -EILSEQ,	"protection" },
-	[BLK_STS_RESOURCE]	= { -ENOMEM,	"kernel resource" },
-	[BLK_STS_DEV_RESOURCE]	= { -EBUSY,	"device resource" },
-	[BLK_STS_AGAIN]		= { -EAGAIN,	"nonblocking retry" },
-	[BLK_STS_OFFLINE]	= { -ENODEV,	"device offline" },
+	ENT(OK,			0,		""),
+	ENT(NOTSUPP,		-EOPNOTSUPP,	"operation not supported"),
+	ENT(TIMEOUT,		-ETIMEDOUT,	"timeout"),
+	ENT(NOSPC,		-ENOSPC,	"critical space allocation"),
+	ENT(TRANSPORT,		-ENOLINK,	"recoverable transport"),
+	ENT(TARGET,		-EREMOTEIO,	"critical target"),
+	ENT(RESV_CONFLICT,	-EBADE,		"reservation conflict"),
+	ENT(MEDIUM,		-ENODATA,	"critical medium"),
+	ENT(PROTECTION,		-EILSEQ,	"protection"),
+	ENT(RESOURCE,		-ENOMEM,	"kernel resource"),
+	ENT(DEV_RESOURCE,	-EBUSY,		"device resource"),
+	ENT(AGAIN,		-EAGAIN,	"nonblocking retry"),
+	ENT(OFFLINE,		-ENODEV,	"device offline"),
 
 	/* device mapper special case, should not leak out: */
-	[BLK_STS_DM_REQUEUE]	= { -EREMCHG, "dm internal retry" },
+	ENT(DM_REQUEUE,		-EREMCHG,	"dm internal retry"),
 
 	/* zone device specific errors */
-	[BLK_STS_ZONE_OPEN_RESOURCE]	= { -ETOOMANYREFS, "open zones exceeded" },
-	[BLK_STS_ZONE_ACTIVE_RESOURCE]	= { -EOVERFLOW, "active zones exceeded" },
+	ENT(ZONE_OPEN_RESOURCE, -ETOOMANYREFS,	"open zones exceeded"),
+	ENT(ZONE_ACTIVE_RESOURCE, -EOVERFLOW,	"active zones exceeded"),
 
 	/* Command duration limit device-side timeout */
-	[BLK_STS_DURATION_LIMIT]	= { -ETIME, "duration limit exceeded" },
-
-	[BLK_STS_INVAL]		= { -EINVAL,	"invalid" },
+	ENT(DURATION_LIMIT,	-ETIME,		"duration limit exceeded"),
+	ENT(INVAL,		-EINVAL,	"invalid"),
 
 	/* everything else not covered above: */
-	[BLK_STS_IOERR]		= { -EIO,	"I/O" },
+	ENT(IOERR,		-EIO,		"I/O"),
 };
+#undef ENT
 
 blk_status_t errno_to_blk_status(int errno)
 {
-- 
2.53.0


