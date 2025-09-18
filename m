Return-Path: <linux-doc+bounces-60844-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66357B7E918
	for <lists+linux-doc@lfdr.de>; Wed, 17 Sep 2025 14:53:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78CAD1C049E9
	for <lists+linux-doc@lfdr.de>; Tue, 16 Sep 2025 23:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD6642D3A9B;
	Tue, 16 Sep 2025 23:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5bzSSOm"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17862F39C1
	for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 23:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758066646; cv=none; b=aa52TLjFoediSWcIzVJW2b6KE7b7ZCcl6YoRUEUu1Cs39td23Ati/OVY0ziWdR20XOYsxJWxpBZdgi/SFZ4+WLFvm4WxW/I/Go8NU0BnYsdkcFLnTVp/pnOhpu/UD45z0H8ShNu0gzr4D6MY1nndwjmjyqP/bHG5owTwm73O1gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758066646; c=relaxed/simple;
	bh=sua7RRNIJB7r5gEFxD+eM+oiIu9kpRDBo0z2/22h+Go=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g8xQMHEG11T74RLFR9S+rWtgQDFT8HPacfX1Xar7lwvlrUWwZt3nZtAtdbL9EpPs1ZD2mJBu9L0RzEHpp53ZVMGanjn0dJaOpqadAqNTs/S3SPXSGa6Q8jlTsUlPPWpaC04u53ZU8inh67AWT6tBNJLKsoC7TR6w3tYicr+Mjro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5bzSSOm; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b54b3cafdcaso3091614a12.0
        for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 16:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758066644; x=1758671444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2EYh1OstgsSdDhWXjyWjkGOpRJOjSY/LXDGcpHs8u8s=;
        b=A5bzSSOm/Jmgdeuc78CXTnsbYMbpSO1Srqw0HzOVWbE6C9p58h/DyB7SUYTuhsVAHP
         NDYfSZfY6DVlmbkK/LwCPaxAeDNLbcwJhmin7li/7Sxnpa4dqb0TsOjtRdjs1XSLBxhk
         mTn7KO6KfLjEyaLid4MYYuBkx9H/S/5Oudbcvfrbj5ynf2xZS8BiDFkuxPam/0k1wOPh
         9wXPkj+j9Yg+nRseBeQX8yJRFKAojVO1WCxCQeABEubisdx531DvlAFSi1PJksVjAOwG
         Eo4mnsx1dsyTRoKX8fLN3bZ2ObdhI2diZqMoFKo/oLy/ArlojQsEv5361gka7XCE5YR8
         4MFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758066644; x=1758671444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2EYh1OstgsSdDhWXjyWjkGOpRJOjSY/LXDGcpHs8u8s=;
        b=XLo+ljxvcpObR6xWzbtEKAylM34+zEpDWfr1R/nMafPSmE9NmO/iK3T8xmOitRHt4Z
         +tAef5caTCLZ9GOL+8i0rw3KcyAURuj04JPHKKI8m606L3aeJdXwJWEYNVaiKPvECdMK
         mg5kY3UMZEDjHLSuhoHVgGvCi/WSbGZq2zV/F3VzgOMJoJhggBvXPCcWCPTmuh0HJsp3
         rv+Dyc66hCvtM258NeSmn3ccIsxggtGziYK46ySgWO8GFQWJljQj+HF3TjN9OJAm2pDw
         tNL/BlPM1LncImAG17svBaxdt1TKomlYLoAiKpdjdHCeFD3DnMM5eVpgUJaVI5i/5ow8
         8qkw==
X-Forwarded-Encrypted: i=1; AJvYcCVdD33BhIAgyWk1b4oF9Fk6pO+QYTW+dkdYjBKyxDdXmYNVZQbyvXxlxaEDnBY9jcZOVeTWTNNxKNY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2BrGFHdXMSJ5ylx2+FJR5BZIHmknXTXDfVnrh4zgDJjGZEQ0A
	aJth6VFiQH+7631FxgiKMrkN1guW9LnMmzNmMBu/0tuPZnZs378gcBtPwM1m3Q==
X-Gm-Gg: ASbGncsiD+50BmC/vKsGh5t/IZk9/F8AQlMSPSPkWWDR/h/oxzM24HadPPJiXE275v1
	gO4t2Gii64AWYOvACTpXpVg2DgSLYy6YA+0T9pGlYCgczd18xE/WRlEtMAODB0lVxlWlqQkwCRE
	qsJ/VBL3QD8Rm1uslV+lMbXeSKPB1LC5SqhfCH1EkF3Jz/N4IYfEurQjyE++mvQg2y01rGq8xKs
	BoHdTfsCAUMINtecePAcle55vvPkHIOgfVnZ9pdvOetxyGmn9uN1kuB92bbX7tHIcZ88E0T3Sy2
	hZUKBqfa0WtYpgEM++P6FIysy6vDtH3lfho4AoH/msaZO+oy8O4Z2ttpTaiKB9zZWlZGeMH2jdZ
	VB6VL69brOA0JB3aI/LpNwDzqVsXhmhiaxenT4Y7PlOgLZ+tmbg==
X-Google-Smtp-Source: AGHT+IGNY4ccBMk+oHysDkTnRq9aBpSLyUEmmo+zWWpnDn0PaEoFWu5W6hOqN5wN3WEASkttSfg6wQ==
X-Received: by 2002:a17:90b:2243:b0:32e:cad:51f9 with SMTP id 98e67ed59e1d1-32ee3f42529mr230778a91.24.1758066643986;
        Tue, 16 Sep 2025 16:50:43 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:16::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed26a49a5sm697297a91.15.2025.09.16.16.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 16:50:43 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: brauner@kernel.org,
	miklos@szeredi.hu
Cc: hch@infradead.org,
	djwong@kernel.org,
	hsiangkao@linux.alibaba.com,
	linux-block@vger.kernel.org,
	gfs2@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	kernel-team@meta.com,
	linux-xfs@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 11/15] iomap: move buffered io bio logic into new file
Date: Tue, 16 Sep 2025 16:44:21 -0700
Message-ID: <20250916234425.1274735-12-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250916234425.1274735-1-joannelkoong@gmail.com>
References: <20250916234425.1274735-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move bio logic in the buffered io code into its own file and remove
CONFIG_BLOCK gating for iomap read/readahead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/iomap/Makefile      |  3 +-
 fs/iomap/bio.c         | 90 ++++++++++++++++++++++++++++++++++++++++++
 fs/iomap/buffered-io.c | 90 +-----------------------------------------
 fs/iomap/internal.h    | 12 ++++++
 4 files changed, 105 insertions(+), 90 deletions(-)
 create mode 100644 fs/iomap/bio.c

diff --git a/fs/iomap/Makefile b/fs/iomap/Makefile
index f7e1c8534c46..a572b8808524 100644
--- a/fs/iomap/Makefile
+++ b/fs/iomap/Makefile
@@ -14,5 +14,6 @@ iomap-y				+= trace.o \
 iomap-$(CONFIG_BLOCK)		+= direct-io.o \
 				   ioend.o \
 				   fiemap.o \
-				   seek.o
+				   seek.o \
+				   bio.o
 iomap-$(CONFIG_SWAP)		+= swapfile.o
diff --git a/fs/iomap/bio.c b/fs/iomap/bio.c
new file mode 100644
index 000000000000..8a51c9d70268
--- /dev/null
+++ b/fs/iomap/bio.c
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2010 Red Hat, Inc.
+ * Copyright (C) 2016-2023 Christoph Hellwig.
+ */
+#include <linux/iomap.h>
+#include <linux/pagemap.h>
+#include "internal.h"
+#include "trace.h"
+
+static void iomap_read_end_io(struct bio *bio)
+{
+	int error = blk_status_to_errno(bio->bi_status);
+	struct folio_iter fi;
+
+	bio_for_each_folio_all(fi, bio)
+		iomap_finish_folio_read(fi.folio, fi.offset, fi.length, error);
+	bio_put(bio);
+}
+
+static void iomap_bio_submit_read(struct iomap_read_folio_ctx *ctx)
+{
+	struct bio *bio = ctx->read_ctx;
+
+	if (bio)
+		submit_bio(bio);
+}
+
+static int iomap_bio_read_folio_range(const struct iomap_iter *iter,
+		struct iomap_read_folio_ctx *ctx, size_t plen)
+{
+	struct folio *folio = ctx->cur_folio;
+	const struct iomap *iomap = &iter->iomap;
+	loff_t pos = iter->pos;
+	size_t poff = offset_in_folio(folio, pos);
+	loff_t length = iomap_length(iter);
+	sector_t sector;
+	struct bio *bio = ctx->read_ctx;
+
+	iomap_start_folio_read(folio, plen);
+
+	sector = iomap_sector(iomap, pos);
+	if (!bio || bio_end_sector(bio) != sector ||
+	    !bio_add_folio(bio, folio, plen, poff)) {
+		gfp_t gfp = mapping_gfp_constraint(folio->mapping, GFP_KERNEL);
+		gfp_t orig_gfp = gfp;
+		unsigned int nr_vecs = DIV_ROUND_UP(length, PAGE_SIZE);
+
+		if (bio)
+			submit_bio(bio);
+
+		if (ctx->rac) /* same as readahead_gfp_mask */
+			gfp |= __GFP_NORETRY | __GFP_NOWARN;
+		bio = bio_alloc(iomap->bdev, bio_max_segs(nr_vecs), REQ_OP_READ,
+				     gfp);
+		/*
+		 * If the bio_alloc fails, try it again for a single page to
+		 * avoid having to deal with partial page reads.  This emulates
+		 * what do_mpage_read_folio does.
+		 */
+		if (!bio)
+			bio = bio_alloc(iomap->bdev, 1, REQ_OP_READ, orig_gfp);
+		if (ctx->rac)
+			bio->bi_opf |= REQ_RAHEAD;
+		bio->bi_iter.bi_sector = sector;
+		bio->bi_end_io = iomap_read_end_io;
+		bio_add_folio_nofail(bio, folio, plen, poff);
+		ctx->read_ctx = bio;
+	}
+	return 0;
+}
+
+const struct iomap_read_ops iomap_bio_read_ops = {
+	.read_folio_range = iomap_bio_read_folio_range,
+	.submit_read = iomap_bio_submit_read,
+};
+EXPORT_SYMBOL_GPL(iomap_bio_read_ops);
+
+int iomap_bio_read_folio_range_sync(const struct iomap_iter *iter,
+		struct folio *folio, loff_t pos, size_t len)
+{
+	const struct iomap *srcmap = iomap_iter_srcmap(iter);
+	struct bio_vec bvec;
+	struct bio bio;
+
+	bio_init(&bio, srcmap->bdev, &bvec, 1, REQ_OP_READ);
+	bio.bi_iter.bi_sector = iomap_sector(srcmap, pos);
+	bio_add_folio_nofail(&bio, folio, len, offset_in_folio(folio, pos));
+	return submit_bio_wait(&bio);
+}
diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 667a49cb5ae5..72258b0109ec 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -8,6 +8,7 @@
 #include <linux/writeback.h>
 #include <linux/swap.h>
 #include <linux/migrate.h>
+#include "internal.h"
 #include "trace.h"
 
 #include "../internal.h"
@@ -352,74 +353,6 @@ void iomap_finish_folio_read(struct folio *folio, size_t off, size_t len,
 }
 EXPORT_SYMBOL_GPL(iomap_finish_folio_read);
 
-#ifdef CONFIG_BLOCK
-static void iomap_read_end_io(struct bio *bio)
-{
-	int error = blk_status_to_errno(bio->bi_status);
-	struct folio_iter fi;
-
-	bio_for_each_folio_all(fi, bio)
-		iomap_finish_folio_read(fi.folio, fi.offset, fi.length, error);
-	bio_put(bio);
-}
-
-static void iomap_bio_submit_read(struct iomap_read_folio_ctx *ctx)
-{
-	struct bio *bio = ctx->read_ctx;
-
-	if (bio)
-		submit_bio(bio);
-}
-
-static int iomap_bio_read_folio_range(const struct iomap_iter *iter,
-		struct iomap_read_folio_ctx *ctx, size_t plen)
-{
-	struct folio *folio = ctx->cur_folio;
-	const struct iomap *iomap = &iter->iomap;
-	loff_t pos = iter->pos;
-	size_t poff = offset_in_folio(folio, pos);
-	loff_t length = iomap_length(iter);
-	sector_t sector;
-	struct bio *bio = ctx->read_ctx;
-
-	iomap_start_folio_read(folio, plen);
-
-	sector = iomap_sector(iomap, pos);
-	if (!bio || bio_end_sector(bio) != sector ||
-	    !bio_add_folio(bio, folio, plen, poff)) {
-		gfp_t gfp = mapping_gfp_constraint(folio->mapping, GFP_KERNEL);
-		gfp_t orig_gfp = gfp;
-		unsigned int nr_vecs = DIV_ROUND_UP(length, PAGE_SIZE);
-
-		iomap_bio_submit_read(ctx);
-
-		if (ctx->rac) /* same as readahead_gfp_mask */
-			gfp |= __GFP_NORETRY | __GFP_NOWARN;
-		bio = bio_alloc(iomap->bdev, bio_max_segs(nr_vecs), REQ_OP_READ,
-				     gfp);
-		/*
-		 * If the bio_alloc fails, try it again for a single page to
-		 * avoid having to deal with partial page reads.  This emulates
-		 * what do_mpage_read_folio does.
-		 */
-		if (!bio)
-			bio = bio_alloc(iomap->bdev, 1, REQ_OP_READ, orig_gfp);
-		if (ctx->rac)
-			bio->bi_opf |= REQ_RAHEAD;
-		bio->bi_iter.bi_sector = sector;
-		bio->bi_end_io = iomap_read_end_io;
-		bio_add_folio_nofail(bio, folio, plen, poff);
-		ctx->read_ctx = bio;
-	}
-	return 0;
-}
-
-const struct iomap_read_ops iomap_bio_read_ops = {
-	.read_folio_range	= iomap_bio_read_folio_range,
-	.submit_read		= iomap_bio_submit_read,
-};
-EXPORT_SYMBOL_GPL(iomap_bio_read_ops);
-
 /*
  * Add a bias to ifs->read_bytes_pending to prevent the read on the folio from
  * being ended prematurely.
@@ -623,27 +556,6 @@ void iomap_readahead(const struct iomap_ops *ops,
 }
 EXPORT_SYMBOL_GPL(iomap_readahead);
 
-static int iomap_bio_read_folio_range_sync(const struct iomap_iter *iter,
-		struct folio *folio, loff_t pos, size_t len)
-{
-	const struct iomap *srcmap = iomap_iter_srcmap(iter);
-	struct bio_vec bvec;
-	struct bio bio;
-
-	bio_init(&bio, srcmap->bdev, &bvec, 1, REQ_OP_READ);
-	bio.bi_iter.bi_sector = iomap_sector(srcmap, pos);
-	bio_add_folio_nofail(&bio, folio, len, offset_in_folio(folio, pos));
-	return submit_bio_wait(&bio);
-}
-#else
-static int iomap_bio_read_folio_range_sync(const struct iomap_iter *iter,
-		struct folio *folio, loff_t pos, size_t len)
-{
-	WARN_ON_ONCE(1);
-	return -EIO;
-}
-#endif /* CONFIG_BLOCK */
-
 /*
  * iomap_is_partially_uptodate checks whether blocks within a folio are
  * uptodate or not.
diff --git a/fs/iomap/internal.h b/fs/iomap/internal.h
index d05cb3aed96e..7ab1033ab4b7 100644
--- a/fs/iomap/internal.h
+++ b/fs/iomap/internal.h
@@ -6,4 +6,16 @@
 
 u32 iomap_finish_ioend_direct(struct iomap_ioend *ioend);
 
+#ifdef CONFIG_BLOCK
+int iomap_bio_read_folio_range_sync(const struct iomap_iter *iter,
+		struct folio *folio, loff_t pos, size_t len);
+#else
+int iomap_bio_read_folio_range_sync(const struct iomap_iter *iter,
+		struct folio *folio, loff_t pos, size_t len)
+{
+	WARN_ON_ONCE(1);
+	return -EIO;
+}
+#endif /* CONFIG_BLOCK */
+
 #endif /* _IOMAP_INTERNAL_H */
-- 
2.47.3


