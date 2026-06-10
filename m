Return-Path: <linux-doc+bounces-91795-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LIn8JszxKGoXOAMAu9opvQ
	(envelope-from <linux-doc+bounces-91795-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 07:10:36 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E8D665DD7
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 07:10:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=DuJZUdYa;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91795-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91795-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=lst.de (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C1CDD30185A7
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 05:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DC0B343D85;
	Wed, 10 Jun 2026 05:10:30 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20E232B112;
	Wed, 10 Jun 2026 05:10:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781068230; cv=none; b=G6aYSkj8fyNyQ3lqpMqT2RmeLUaCNZgav3zjQzR6HLIosfqsMGrit++ah6Sro57XT4n4PpYu0gn2lLQFN3V/uDgZMJGrYcmGzsVuhGTkg+D6sGwo/z24m2SQdiOXge9YKMbDnhVWi2OJjSMgkxeJJq+kJlhFVQt47FmySbWTrA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781068230; c=relaxed/simple;
	bh=vuSdk88zwjeGFr8fzwLIV7cj7nwQFF52yTgJ/h67AUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hHF/0fqq0Ou2BId87S68MHhsr4RYY/ZmtiiPhR04U099t4jJh8XFtQBKndEA0uG6QejOlor16UktcabgVbW9u6c6mNHzGTYQMXXrWrmRNbDHjhXVvA7tZDu9o7BkIo2g2yI946Tn9kBImLfdmmOg/v/VvV03a6R51hF3hNHgBoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=DuJZUdYa; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=eNcnXFwyahPkKYI9OBdA7esRxefWS4Jdn5Q7SvmX/Ow=; b=DuJZUdYa0igbGSL+9Z6vLHeF3s
	Ae769y208drP74qkJsqDM/Rm/Y6W+WGEjHbOP2ZPmTPexltC7+IUJ46AlhexMEfENS9briurVc4ko
	Tbk7YyLBLmKd6r4Zt+f2zsGlk5vLURXCPPCXMg4YQjL395SPXjXxg7ypxY2eckWsXlKNEd9Rizlmk
	uIkyJQ/ic0nKCyGNexcBvH6NCUYsrel1iPpbYl2EZYc2bLwTwKBh4QbNhK/okPfaQyPImuPGWdCC+
	8lcVuC+2WdjaQkrXBgjZpA1d+c/dyRVrZ/htrz8oO+F7NDmPzz8YRGZwpfbxzwcLVRfVrOBxTe75S
	cauSy9hQ==;
Received: from 2a02-8389-2341-5b80-decc-1a96-daaa-a2cc.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:decc:1a96:daaa:a2cc] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXBCt-00000006oIR-2OKQ;
	Wed, 10 Jun 2026 05:10:27 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hannes Reinecke <hare@suse.de>,
	Keith Busch <kbusch@kernel.org>,
	linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Hannes Reinecke <hare@kernel.org>
Subject: [PATCH 2/4] block: add a "tag" for block status codes
Date: Wed, 10 Jun 2026 07:08:03 +0200
Message-ID: <20260610051015.1906799-3-hch@lst.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260610051015.1906799-1-hch@lst.de>
References: <20260610051015.1906799-1-hch@lst.de>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:axboe@kernel.dk,m:corbet@lwn.net,m:dlemoal@kernel.org,m:hare@suse.de,m:kbusch@kernel.org,m:linux-block@vger.kernel.org,m:linux-doc@vger.kernel.org,m:hare@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hch@lst.de,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-91795-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 20E8D665DD7

The full name of the status codes is not good for user interfaces as it
can contain white spaces.  Add the name of the status code without the
BLK_STS_ prefix as a tag so that it can be used for user interfaces.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Reviewed-by: Hannes Reinecke <hare@kernel.org>
---
 block/blk-core.c | 28 ++++++++++++++++++++++++++++
 block/blk.h      |  2 ++
 2 files changed, 30 insertions(+)

diff --git a/block/blk-core.c b/block/blk-core.c
index 43121a9f99f0..842b5c6f2fb4 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -135,10 +135,12 @@ EXPORT_SYMBOL_GPL(blk_op_str);
 #define ENT(_tag, _errno, _desc)	\
 [BLK_STS_##_tag] = {				\
 	.errno		= _errno,		\
+	.tag		= __stringify(_tag),	\
 	.name		= _desc,		\
 }
 static const struct {
 	int		errno;
+	const char	*tag;
 	const char	*name;
 } blk_errors[] = {
 	ENT(OK,			0,		""),
@@ -203,6 +205,32 @@ const char *blk_status_to_str(blk_status_t status)
 	return blk_errors[idx].name;
 }
 
+const char *blk_status_to_tag(blk_status_t status)
+{
+	int idx = (__force int)status;
+
+	if (WARN_ON_ONCE(idx >= ARRAY_SIZE(blk_errors) || !blk_errors[idx].tag))
+		return "<null>";
+	return blk_errors[idx].tag;
+}
+
+blk_status_t tag_to_blk_status(const char *tag)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(blk_errors); i++) {
+		if (blk_errors[i].tag &&
+		    !strcmp(blk_errors[i].tag, tag))
+			return (__force blk_status_t)i;
+	}
+
+	/*
+	 * Return BLK_STS_OK for mismatches as this function is intended to
+	 * parse error status values.
+	 */
+	return BLK_STS_OK;
+}
+
 /**
  * blk_sync_queue - cancel any pending callbacks on a queue
  * @q: the queue
diff --git a/block/blk.h b/block/blk.h
index 7fdfb9012ce1..3ab2cdd6ed12 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -51,6 +51,8 @@ struct blk_flush_queue *blk_alloc_flush_queue(int node, int cmd_size,
 void blk_free_flush_queue(struct blk_flush_queue *q);
 
 const char *blk_status_to_str(blk_status_t status);
+const char *blk_status_to_tag(blk_status_t status);
+blk_status_t tag_to_blk_status(const char *tag);
 
 bool __blk_mq_unfreeze_queue(struct request_queue *q, bool force_atomic);
 bool blk_queue_start_drain(struct request_queue *q);
-- 
2.53.0


