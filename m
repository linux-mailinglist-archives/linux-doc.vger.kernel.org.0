Return-Path: <linux-doc+bounces-61517-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 936A5B93B95
	for <lists+linux-doc@lfdr.de>; Tue, 23 Sep 2025 02:35:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23C311892F65
	for <lists+linux-doc@lfdr.de>; Tue, 23 Sep 2025 00:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A63B219A8A;
	Tue, 23 Sep 2025 00:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="maMfBFCF"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28E82066F7
	for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 00:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758587650; cv=none; b=NadHmMBUsq38796dzpWpA0vedvmCxJvGDikNzMxTBsf8YYHBBXLgN3twoDFudiWwRNVtkJCvzeU2PSSHGvSrtW4u+IMfOV59pKJUvLb0OIveBSnokV6YM101cYSvKxERnEYzCQKeosmBbmHfRfkQfZ15zuAgJf6QLhh/kbwAdgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758587650; c=relaxed/simple;
	bh=OmlJpwMjQnBUQlUFUCENW3a1N2DuoYNDBia6gKxNY/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NPDuOLZ/3EY4DLOdYYJtv66Pw/jAz6OS5+y0C6+vMpOGCvYc5KX8Z67O6tRwdZzYW5uDNWbEFLaZek3w0Y+G8zYUfPLTXXbamFXbcbRTUPRBKxjvOhMJtQ7qu/Uc2V82N395KBRqAS9dsG4lQ4ZNJmg3INgpltO0PekIBE6Bwkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=maMfBFCF; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-27a6c3f482dso10640435ad.1
        for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 17:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758587648; x=1759192448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zjJXLBoj+YcBLbbFZQaQL40cbl9fNsvtoy5dmImeRY=;
        b=maMfBFCFkBE2Nvf7N1a+Y+SPs4kU3OejXCECQaYfzyv9l98kP+2CERK3//JBlf6HcV
         eeYdnjQ8Lis9RcB/ioYDxDUTbj4rOMY17wF4fx7lu6cN5UQtC9oa7i3lz64MHQc4FxuZ
         Cnnjha9Q1mi4AH0Kp1PAO1jl9oe9BvHAN6Oq2OaFukyfOQtt3NgChc0qQJ6Q/ZPG+xZq
         jqtoGsqPoMlIijk/wrghwr6fSJ6zD0uRhDzVFasSzGDDMLqz+JIK0mZA0HIlEMT1vKNd
         FoxZREsut772OvTp3yc8+WCyKK4iKgEaFsKhSjtQuuhRlLb9aZPQR0LPg2i2mzCDKDDu
         yXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758587648; x=1759192448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7zjJXLBoj+YcBLbbFZQaQL40cbl9fNsvtoy5dmImeRY=;
        b=xQbmK61tme5y61Hg+nB8lUAA0k3VqjCnFePXzFNWWlmQ18jUgIiEDL4FK7ao2FsTq4
         lVgTwpFQtm9l9hgdA/UimhJTChWpBwLcI0rrxlx6PFnR5CKevZHcmvrqnsQDJEAA25kx
         lTV6KizvyGwzDpCKPINQ4e74J/Ruw0Z3xVZMB7Zr8Ti9ddLjdq7h1Zn8dX+swergmlfB
         zgapPX8wWhf5I1cILumfQPQGYAQ2XKQZKOL4KjjzM7WZPqdcRPGlMRcrs2RNYdd7WRhA
         RfOhjHisWlUpcFZ2y58RXB6HGzf7z055M+rPQ5+rWhWce/RCKRBHsSYaZxKCnDX0od+W
         Fc6g==
X-Forwarded-Encrypted: i=1; AJvYcCXamdukD9PmFo8h+XquS8Ycc5EUYdyQ5HwoqNquV6oiLYhIhIHn2r6c7prXC0p+kY/AVMOY6HK37rM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxGDa4jUdDJTmTrsrr3BDsmglKNai80zZ5hPZO6SbGUsG8d2nH
	0mSH89pmrjZmUVpv9Q8QlzDIKlk569IcT2FTJOZOiJDb4HNHKU/B9Uau
X-Gm-Gg: ASbGncu+MbO/z2msc9JQAsIVOZ6EaXyaCwOjCuWYu+1xYD7kXFHqUIx8ksB8DgAIngW
	PG8jNaqeLcJ94FOiu8on3dCe3Z4Cw+fwvuGaiHVx9FXHm/KmsPD3GEw/gLNggkWxD75iE6Oetfa
	UsOSrtf/+JpC2TVqs2/QB+AGvvCTRBbJ7h7ntibH6vhHypp+cdkZiLWxaznhBlSPxTc7kYBoCH0
	lCXvrzoV1RzRWLYD6Asg7JyzSZhJIgmCb4b/rKN+BOKG0Oi0/1DRF77FWFI75cAqCeFxzDuJKJ2
	KQC/2mHwah8kx4LshdDkRc97YGkVJSwwHS5GkqS5IMt0jv0S8G+sN7Ncub+AFwXk7VL3Lgpol5a
	EO5UTBKo1S5hblHgftzGs0S/wjAOA8s0YWi1fhnu42S6eGEdz
X-Google-Smtp-Source: AGHT+IHXT/3r4DzJZNk1pxFZqWoFUVW2Kcr9cAm7IMsradJq4pbE6QtordIx63ZBIuIspd8rIYAobw==
X-Received: by 2002:a17:903:1904:b0:27a:6c30:49c with SMTP id d9443c01a7336-27cc2d8f60fmr7680945ad.27.1758587647879;
        Mon, 22 Sep 2025 17:34:07 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:1::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698019665esm144780975ad.62.2025.09.22.17.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 17:34:07 -0700 (PDT)
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
Subject: [PATCH v4 11/15] iomap: move buffered io bio logic into new file
Date: Mon, 22 Sep 2025 17:23:49 -0700
Message-ID: <20250923002353.2961514-12-joannelkoong@gmail.com>
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

From: Christoph Hellwig <hch@lst.de> [1]

Move bio logic in the buffered io code into its own file and remove
CONFIG_BLOCK gating for iomap read/readahead.

[1] https://lore.kernel.org/linux-fsdevel/aMK2GuumUf93ep99@infradead.org/

Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
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
index 354819facfac..ed2acbcb81b8 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -8,6 +8,7 @@
 #include <linux/writeback.h>
 #include <linux/swap.h>
 #include <linux/migrate.h>
+#include "internal.h"
 #include "trace.h"
 
 #include "../internal.h"
@@ -362,74 +363,6 @@ void iomap_finish_folio_read(struct folio *folio, size_t off, size_t len,
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
@@ -635,27 +568,6 @@ void iomap_readahead(const struct iomap_ops *ops,
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
index d05cb3aed96e..3a4e4aad2bd1 100644
--- a/fs/iomap/internal.h
+++ b/fs/iomap/internal.h
@@ -6,4 +6,16 @@
 
 u32 iomap_finish_ioend_direct(struct iomap_ioend *ioend);
 
+#ifdef CONFIG_BLOCK
+int iomap_bio_read_folio_range_sync(const struct iomap_iter *iter,
+		struct folio *folio, loff_t pos, size_t len);
+#else
+static inline int iomap_bio_read_folio_range_sync(const struct iomap_iter *iter,
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


