Return-Path: <linux-doc+bounces-61507-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B14BB93B1D
	for <lists+linux-doc@lfdr.de>; Tue, 23 Sep 2025 02:34:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B07987A6835
	for <lists+linux-doc@lfdr.de>; Tue, 23 Sep 2025 00:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80EBF1C9DE5;
	Tue, 23 Sep 2025 00:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XzYHos0j"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49E4184540
	for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 00:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758587636; cv=none; b=JqEfJQggFrymPbYBnUesRAtCy/30zWFBxNKRxisJ/PWiYS0X6iRgkvjU8h5q4vhebzUyjp0/cnfxbvqUyq6mk5N1i+2fwuHSoEh78JLvuY2EDoz2rBCxldeNa73m1BK3+jlMlCzTFAL98QNRObVEhn4ilreWKtuQyErFG02aHRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758587636; c=relaxed/simple;
	bh=CSiGtKrWb8zqpNUe8yL7Pevqy9qFJhFmaY58ZJGrYSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s/1dyhWgZHRJVrhm5Uj1ZHTontThDRO9aHNwEpkK8Z/HsbP8TFvd7ofjsR1puT3jX2igwtLSx/D8yv311UlxPs/7ooUOu9cvcqOjJL8Ta/fhQn8otuB8XbN/d22UXRD7O1Hblk2NFN2dDrBhDEEv5JWy5j8Giq65JOBXTd0Q2Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XzYHos0j; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-77dedf198d4so5391310b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 17:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758587634; x=1759192434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L8Zc1MP+97msutqoeYloSdkN6RJEwl1bHJXdXkLR+a8=;
        b=XzYHos0jTd0Cc+zCh4if+nFQs5Qe9MqaHzNgescPY6ANwnsfhs/BsI8D2MAbDOHTgU
         4teujGeqxpxArLOapynGfV3o0DVDb/BFjNNn/dT42chj0cHr3ncU6UpDQ0qgDAYuG3rm
         ypTEPCYI64jouXY71ZkM4fPSnW+KyL2inDzlbkkJQdrmjylLK0/ayvtQPlX/ErjBC73K
         uTa6ewd50dW5aGpTp96GHnb/T9fETG1zbpGvk1cSvphV12THa563vKzXWuW4pwrC3CLX
         897Sb9RYlEoPFYtWN3yxJ+0JTShC2H6JTvW64TldOz7RQFZorvEuJeT4h/kJsbbgaNzF
         HAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758587634; x=1759192434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L8Zc1MP+97msutqoeYloSdkN6RJEwl1bHJXdXkLR+a8=;
        b=gOgXj9UnCACbh9gNO34/CylZBXzqygB6Mp4AknKDjeIgXauBP1CVI82Oxffq224MNx
         uNFior0mmTxVJBjvpqS+1Te6ciO3dxRTbxDocn5lxipzW1Qgy4NQafNHNDzHVfrsbMBG
         ic71ijJTQJPg5oD+9wAQyBSul/GHxYvLsb4805zXFZfWCxK5jchYubNGjm1+DSipmEIG
         4/xLxrwhU4F4IY09bcNBfXi/4Io+ubUk4kIXDQUgHka6Zhj4A1ca1xKUSj3ggrc2okQr
         jm1y5uDfxAQ6hLhIo8ppWYenCdA+vR0MkNQ1vbnErRlUrF6NWMN5hiRZ0lrSAN2bz84J
         FEwg==
X-Forwarded-Encrypted: i=1; AJvYcCUz2RuOoniGaw3hfBG2mUYXbif/c5NlY2Q8k9OmET367fECPx0jYbR8RnwgP0kWj7A3YpyYFs486JY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPktQVwnD6yIh1YcxEckcHdnGEVpOXlTVJtKzA1uy+NgVo1PsM
	iXSeOVssynPkrBWB3M+vbXQQr/25gm9vuLiQL8zDtCBrNyqzCi22+Z5Q
X-Gm-Gg: ASbGnctmmqREb2HCtma5I9s5x3iXEpICTq03f0LfVijBNjOlxFo6+fd2H3NqtAUD5h1
	as50Z/puPZ7eFYd1TDSzh+SOnN25LPDRHz2wxnaPWSBUohjf2NBq0Ur84drtQPq9ybi81/1k7bf
	dDJlZVypjSEfYWv84iXiEDsiyng84bXta3Njz/PsFMF5kxKXWhPFhkdAX/g2BbhkYiL45wzZT/o
	lWe8gdoNO9Mbg/ox7yyUTsX9s8m5A0Ntf2EXceNS3okdq8JnI7ROOjAm77oAoSlhOYsEEL8YV3w
	6/H50C6eB91Sa4NXOYsyFvWVxGDLdaQDZGmCdoqgcwITYsFvvgUds5wieb9zXtLjrsvCmBbo+iT
	VP+rxd3agQV0Welg3j+wmYK/qya0turpWfbleXj7KQz0fsA==
X-Google-Smtp-Source: AGHT+IE9UTk9DOOxHIk7V9AusMOVMJaA+o0ouKvy94Kuhd+S63mgnV20FB06J29O2ckAhaW6BtwlSg==
X-Received: by 2002:a05:6a20:258b:b0:262:c083:bb38 with SMTP id adf61e73a8af0-2cfbb09d4e3mr1348063637.0.1758587633950;
        Mon, 22 Sep 2025 17:33:53 -0700 (PDT)
Received: from localhost ([2a03:2880:ff::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff445dd7sm12934627a12.51.2025.09.22.17.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 17:33:53 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: brauner@kernel.org,
	miklos@szeredi.hu
Cc: djwong@kernel.org,
	hch@infradead.org,
	linux-block@vger.kernel.org,
	gfs2@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	linux-doc@vger.kernel.org,
	hsiangkao@linux.alibaba.com,
	kernel-team@meta.com
Subject: [PATCH v4 01/15] iomap: move bio read logic into helper function
Date: Mon, 22 Sep 2025 17:23:39 -0700
Message-ID: <20250923002353.2961514-2-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250923002353.2961514-1-joannelkoong@gmail.com>
References: <20250923002353.2961514-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the iomap_readpage_iter() bio read logic into a separate helper
function, iomap_bio_read_folio_range(). This is needed to make iomap
read/readahead more generically usable, especially for filesystems that
do not require CONFIG_BLOCK.

Additionally rename buffered write's iomap_read_folio_range() function
to iomap_bio_read_folio_range_sync() to better describe its synchronous
behavior.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
---
 fs/iomap/buffered-io.c | 68 ++++++++++++++++++++++++------------------
 1 file changed, 39 insertions(+), 29 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 9535733ed07a..7e65075b6345 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -367,36 +367,15 @@ struct iomap_readpage_ctx {
 	struct readahead_control *rac;
 };
 
-static int iomap_readpage_iter(struct iomap_iter *iter,
-		struct iomap_readpage_ctx *ctx)
+static void iomap_bio_read_folio_range(const struct iomap_iter *iter,
+		struct iomap_readpage_ctx *ctx, loff_t pos, size_t plen)
 {
+	struct folio *folio = ctx->cur_folio;
 	const struct iomap *iomap = &iter->iomap;
-	loff_t pos = iter->pos;
+	struct iomap_folio_state *ifs = folio->private;
+	size_t poff = offset_in_folio(folio, pos);
 	loff_t length = iomap_length(iter);
-	struct folio *folio = ctx->cur_folio;
-	struct iomap_folio_state *ifs;
-	size_t poff, plen;
 	sector_t sector;
-	int ret;
-
-	if (iomap->type == IOMAP_INLINE) {
-		ret = iomap_read_inline_data(iter, folio);
-		if (ret)
-			return ret;
-		return iomap_iter_advance(iter, length);
-	}
-
-	/* zero post-eof blocks as the page may be mapped */
-	ifs = ifs_alloc(iter->inode, folio, iter->flags);
-	iomap_adjust_read_range(iter->inode, folio, &pos, length, &poff, &plen);
-	if (plen == 0)
-		goto done;
-
-	if (iomap_block_needs_zeroing(iter, pos)) {
-		folio_zero_range(folio, poff, plen);
-		iomap_set_range_uptodate(folio, poff, plen);
-		goto done;
-	}
 
 	ctx->cur_folio_in_bio = true;
 	if (ifs) {
@@ -435,6 +414,37 @@ static int iomap_readpage_iter(struct iomap_iter *iter,
 		ctx->bio->bi_end_io = iomap_read_end_io;
 		bio_add_folio_nofail(ctx->bio, folio, plen, poff);
 	}
+}
+
+static int iomap_readpage_iter(struct iomap_iter *iter,
+		struct iomap_readpage_ctx *ctx)
+{
+	const struct iomap *iomap = &iter->iomap;
+	loff_t pos = iter->pos;
+	loff_t length = iomap_length(iter);
+	struct folio *folio = ctx->cur_folio;
+	size_t poff, plen;
+	int ret;
+
+	if (iomap->type == IOMAP_INLINE) {
+		ret = iomap_read_inline_data(iter, folio);
+		if (ret)
+			return ret;
+		return iomap_iter_advance(iter, length);
+	}
+
+	/* zero post-eof blocks as the page may be mapped */
+	ifs_alloc(iter->inode, folio, iter->flags);
+	iomap_adjust_read_range(iter->inode, folio, &pos, length, &poff, &plen);
+	if (plen == 0)
+		goto done;
+
+	if (iomap_block_needs_zeroing(iter, pos)) {
+		folio_zero_range(folio, poff, plen);
+		iomap_set_range_uptodate(folio, poff, plen);
+	} else {
+		iomap_bio_read_folio_range(iter, ctx, pos, plen);
+	}
 
 done:
 	/*
@@ -559,7 +569,7 @@ void iomap_readahead(struct readahead_control *rac, const struct iomap_ops *ops)
 }
 EXPORT_SYMBOL_GPL(iomap_readahead);
 
-static int iomap_read_folio_range(const struct iomap_iter *iter,
+static int iomap_bio_read_folio_range_sync(const struct iomap_iter *iter,
 		struct folio *folio, loff_t pos, size_t len)
 {
 	const struct iomap *srcmap = iomap_iter_srcmap(iter);
@@ -572,7 +582,7 @@ static int iomap_read_folio_range(const struct iomap_iter *iter,
 	return submit_bio_wait(&bio);
 }
 #else
-static int iomap_read_folio_range(const struct iomap_iter *iter,
+static int iomap_bio_read_folio_range_sync(const struct iomap_iter *iter,
 		struct folio *folio, loff_t pos, size_t len)
 {
 	WARN_ON_ONCE(1);
@@ -749,7 +759,7 @@ static int __iomap_write_begin(const struct iomap_iter *iter,
 				status = write_ops->read_folio_range(iter,
 						folio, block_start, plen);
 			else
-				status = iomap_read_folio_range(iter,
+				status = iomap_bio_read_folio_range_sync(iter,
 						folio, block_start, plen);
 			if (status)
 				return status;
-- 
2.47.3


