Return-Path: <linux-doc+bounces-91294-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AKbxLtJPJmrPUgIAu9opvQ
	(envelope-from <linux-doc+bounces-91294-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 07:14:58 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3797F652C03
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 07:14:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b="aO87j/7f";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91294-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-91294-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=lst.de (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D1CC3018082
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jun 2026 05:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A348835E1C5;
	Mon,  8 Jun 2026 05:14:27 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18121348C46;
	Mon,  8 Jun 2026 05:14:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780895667; cv=none; b=slbYU1D4varLOAe0PAYmc6I/V5Z/kf1qJOCUNupAxOBLhJK8LKjP0Cl3Ewcg2GbXN5sI2WPrx/J/97xTmArhoZfx3f/6c5x7NmugdO1cxCmc+0/3wVcJt15yt/lIMnWNCWg3mfKAR9W+uxbStRf77c34m/e4PywtqhzWkD1IKds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780895667; c=relaxed/simple;
	bh=ixucbRUooIqDvQpTd+6CETp/JbbVVoy4N7eN14a4NY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JLbLK1D01rFqri+VJk80XoZxBXKTR5pAn2TbweCHShbcwxJmntj48EGSW3MWHQZszPJ6sRQC28WQEp6M/Z65g0INzNFT+pbCt83hvxA18MNTBeWO9f4fN3cbeaURe6ZzNnr19Kzc5JGjQ4hUkOCrLmdGKrqnVnjuOytbX2xF4mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=aO87j/7f; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=1FKiyT+aBS7Na6mqtlrH/QYvMkDIxykytmZQ3Ah3EAQ=; b=aO87j/7fkguWbIBy89YAgXrNWv
	lLFibxWpP9kk4cSySWzc+Xa9StA/KAn4FPDs7rDE2wEgk5rWXnjAHF/57wuj/XXnVaAcExV5qLwbH
	61pe8ATYE4qdk34Au5wHtzzd/w0JP4kS+7xIpK3ZLkPWjBI7zJ8vQ/Binn1E4TD7vLvVO/qfb2PL3
	gmJOHkbaUG+9u5WFunFBcQwF/+PCGzfw7USLn4RJA2Six44SAkzBJyazkRDjAgeopX3vrIMkzzebv
	4PrdRPbAmQaLfszcAhDABYzEcBPff6Q+DRzDKlZaeTR/ctmGVRTWVM9i4REpConQ1LWGnm+efJZ2V
	leI0VF8g==;
Received: from 2a02-8389-2341-5b80-decc-1a96-daaa-a2cc.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:decc:1a96:daaa:a2cc] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSJc-00000002pVc-0PF4;
	Mon, 08 Jun 2026 05:14:24 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hannes Reinecke <hare@suse.de>,
	Keith Busch <kbusch@kernel.org>,
	linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Hannes Reinecke <hare@kernel.org>
Subject: [PATCH 1/4] block: add a macro to initialize the status table
Date: Mon,  8 Jun 2026 07:14:03 +0200
Message-ID: <20260608051416.1205282-2-hch@lst.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608051416.1205282-1-hch@lst.de>
References: <20260608051416.1205282-1-hch@lst.de>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-91294-lists,linux-doc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:axboe@kernel.dk,m:corbet@lwn.net,m:dlemoal@kernel.org,m:hare@suse.de,m:kbusch@kernel.org,m:linux-block@vger.kernel.org,m:linux-doc@vger.kernel.org,m:hare@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hch@lst.de,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lst.de:mid,lst.de:from_mime,lst.de:email,infradead.org:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3797F652C03

Prepare for adding a new value to the error table by adding a macro
to fill it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Reviewed-by: Hannes Reinecke <hare@kernel.org>
---
 block/blk-core.c | 45 +++++++++++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index b0f0a304ea0b..1614323282f1 100644
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


