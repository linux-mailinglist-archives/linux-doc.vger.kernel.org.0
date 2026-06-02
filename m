Return-Path: <linux-doc+bounces-90457-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDrFJ6FuHmrEjAkAu9opvQ
	(envelope-from <linux-doc+bounces-90457-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 07:48:17 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 209AB628B87
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 07:48:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8343E304AFB7
	for <lists+linux-doc@lfdr.de>; Tue,  2 Jun 2026 05:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3CD139283C;
	Tue,  2 Jun 2026 05:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Fpe7B2C2"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4171D39281B;
	Tue,  2 Jun 2026 05:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780379203; cv=none; b=Lmj3e7nCAWsfWLpGCRSxgpAfmqCfjxbSrceEB3M1w0rCaIH/OapyuTx++7tmj8PkKpi0WYzQVSuih+BcmwXUo5v5/rq+ivhHizthwp6Xhuk18zD7g9j1NUly3rXScgxJjVcfNMrdbF0KK+gO+DEzT4DonK/IFUoeMu75YS086GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780379203; c=relaxed/simple;
	bh=5TrcEEOwg2G5UZVVhpbaLwXyR3XhTPVzwPK4Kph3teY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M3cIVIpQz+NSWsiz2pDS5UNyl99O4wRg4XFfYL3ubOOGTQCmBJY0mYGJ38H4EwPXKFucfaF5PtSr5yuBU6zurgayz4DenNarnFvDjUHDqv5/LrdLah3PcI6xnvJTynftMoz8osqQNvVAAGnfvxjUVLumLTw1z9WhsJDjwaKP44w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Fpe7B2C2; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=6ahslBsamV/VZT2yefppQaSNngurEt5bgzwc1S+kUYc=; b=Fpe7B2C21R0w19oTy1za8yx0Se
	fxsDMhEWAgsCOccd7Kz2YRSVyOTQ+ahz2gMIIa9QzGC9iSOxBDvMY13ZV4rNzkW64ucm+hpJT9APn
	IbZu7WveDCzNilDF4/QewlwMnunwLfWz2LREpj36V/xoxmRbKiAhkzZaEUnlCZfox+MedZmQj9LAX
	MRHqSUvyDui9a90A15HLPhWPnX1ntmbKwIFPvCZv3r+r2ICvmEuuEx5yJIVbSomCHvs4oLO3TaCZa
	YVfHp4/s+3K8hR7LuEo+hJWdNW6jG3zj+rCKGBkOdxHZtLPyEo6T56tEU0ejcmmhxvjNJ2kGAOo8R
	GM+8Pvtw==;
Received: from 2a02-8389-2341-5b80-decc-1a96-daaa-a2cc.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:decc:1a96:daaa:a2cc] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUHxZ-0000000CLBC-23P7;
	Tue, 02 Jun 2026 05:46:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Jonathan Corbet <corbet@lwn.net>,
	linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 6/9] block: add a "tag" for block status codes
Date: Tue,  2 Jun 2026 07:45:38 +0200
Message-ID: <20260602054615.3788425-7-hch@lst.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260602054615.3788425-1-hch@lst.de>
References: <20260602054615.3788425-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spamd-Result: default: False [-0.06 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-90457-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,lst.de:mid,lst.de:email,infradead.org:dkim]
X-Rspamd-Queue-Id: 209AB628B87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The full name of the status codes is not good for user interfaces as it
can contain white spaces.  Add the name of the status code without the
BLK_STS_ prefix as a tag so that it can be used for user interfaces.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-core.c | 24 ++++++++++++++++++++++++
 block/blk.h      |  2 ++
 2 files changed, 26 insertions(+)

diff --git a/block/blk-core.c b/block/blk-core.c
index 1ab666fc2e27..19a4d0672b3d 100644
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
@@ -203,6 +205,28 @@ const char *blk_status_to_str(blk_status_t status)
 	return blk_errors[idx].name;
 }
 
+const char *blk_status_to_tag(blk_status_t status)
+{
+	int idx = (__force int)status;
+
+	if (WARN_ON_ONCE(idx >= ARRAY_SIZE(blk_errors)))
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
+	return BLK_STS_OK;
+}
+
 /**
  * blk_sync_queue - cancel any pending callbacks on a queue
  * @q: the queue
diff --git a/block/blk.h b/block/blk.h
index 250a6eee700a..1e80338af858 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -50,6 +50,8 @@ struct blk_flush_queue *blk_alloc_flush_queue(int node, int cmd_size,
 void blk_free_flush_queue(struct blk_flush_queue *q);
 
 const char *blk_status_to_str(blk_status_t status);
+const char *blk_status_to_tag(blk_status_t status);
+blk_status_t tag_to_blk_status(const char *tag);
 
 bool __blk_mq_unfreeze_queue(struct request_queue *q, bool force_atomic);
 bool blk_queue_start_drain(struct request_queue *q);
-- 
2.53.0


