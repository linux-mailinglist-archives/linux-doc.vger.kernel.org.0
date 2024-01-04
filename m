Return-Path: <linux-doc+bounces-6203-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D31824660
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jan 2024 17:38:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 571E51F2423B
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jan 2024 16:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE5FC28E3D;
	Thu,  4 Jan 2024 16:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cBkECTkO"
X-Original-To: linux-doc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650B228DDC;
	Thu,  4 Jan 2024 16:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=aZj4TXqM8ZIvwknuYzi4oB5rm2nce5j8RynT3CHy7a8=; b=cBkECTkOWW4pOh/TNmRm6UVVoX
	65shNd94fhxPdTMLBgunC/QHObuVzIdnkyoLqIhpCDRSAqeAaleu6sEBQ4rpxIBV9qsIQDCxJG3nB
	jHfTUhMjAORhOCpO3plmSOHy0dPqlpyPYj35g1H9chW+R1OQewuDSJb5bDuYni+GCkVBt/rTioiYm
	QNczoLPT5EOvy/oe6ZxzDm52OEnT8qnpp1/CTWj8rfjkoUW58Mv4jFU0RSiA8M+Gf4nSAOtxhPubf
	j9aq2dgWfPlVhESyNoYscesUIMSVuFPjkeiS/1EY9p8JJy7SsB3+86Fyb+7+qSOYzBMIpKjRyrlDc
	HSav5OCg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1rLQiE-00FY2T-Kb; Thu, 04 Jan 2024 16:36:54 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] buffer: Add kernel-doc for block_dirty_folio()
Date: Thu,  4 Jan 2024 16:36:49 +0000
Message-Id: <20240104163652.3705753-3-willy@infradead.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20240104163652.3705753-1-willy@infradead.org>
References: <20240104163652.3705753-1-willy@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Turn the excellent documentation for this function into kernel-doc.
Replace 'page' with 'folio' and make a few other minor updates.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/buffer.c | 54 +++++++++++++++++++++++++++++------------------------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index 5c29850e4781..31e171382e00 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -687,30 +687,36 @@ void mark_buffer_dirty_inode(struct buffer_head *bh, struct inode *inode)
 }
 EXPORT_SYMBOL(mark_buffer_dirty_inode);
 
-/*
- * Add a page to the dirty page list.
- *
- * It is a sad fact of life that this function is called from several places
- * deeply under spinlocking.  It may not sleep.
- *
- * If the page has buffers, the uptodate buffers are set dirty, to preserve
- * dirty-state coherency between the page and the buffers.  It the page does
- * not have buffers then when they are later attached they will all be set
- * dirty.
- *
- * The buffers are dirtied before the page is dirtied.  There's a small race
- * window in which a writepage caller may see the page cleanness but not the
- * buffer dirtiness.  That's fine.  If this code were to set the page dirty
- * before the buffers, a concurrent writepage caller could clear the page dirty
- * bit, see a bunch of clean buffers and we'd end up with dirty buffers/clean
- * page on the dirty page list.
- *
- * We use private_lock to lock against try_to_free_buffers while using the
- * page's buffer list.  Also use this to protect against clean buffers being
- * added to the page after it was set dirty.
- *
- * FIXME: may need to call ->reservepage here as well.  That's rather up to the
- * address_space though.
+/**
+ * block_dirty_folio - Mark a folio as dirty.
+ * @mapping: The address space containing this folio.
+ * @folio: The folio to mark dirty.
+ *
+ * Filesystems which use buffer_heads can use this function as their
+ * ->dirty_folio implementation.  Some filesystems need to do a little
+ * work before calling this function.  Filesystems which do not use
+ * buffer_heads should call filemap_dirty_folio() instead.
+ *
+ * If the folio has buffers, the uptodate buffers are set dirty, to
+ * preserve dirty-state coherency between the folio and the buffers.
+ * It the folio does not have buffers then when they are later attached
+ * they will all be set dirty.
+ *
+ * The buffers are dirtied before the folio is dirtied.  There's a small
+ * race window in which writeback may see the folio cleanness but not the
+ * buffer dirtiness.  That's fine.  If this code were to set the folio
+ * dirty before the buffers, writeback could clear the folio dirty flag,
+ * see a bunch of clean buffers and we'd end up with dirty buffers/clean
+ * folio on the dirty folio list.
+ *
+ * We use private_lock to lock against try_to_free_buffers() while
+ * using the folio's buffer list.  This also prevents clean buffers
+ * being added to the folio after it was set dirty.
+ *
+ * Context: May only be called from process context.  Does not sleep.
+ * Caller must ensure that @folio cannot be truncated during this call,
+ * typically by holding the folio lock or having a page in the folio
+ * mapped and holding the page table lock.
  */
 bool block_dirty_folio(struct address_space *mapping, struct folio *folio)
 {
-- 
2.43.0


