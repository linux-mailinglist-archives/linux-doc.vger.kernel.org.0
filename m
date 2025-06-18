Return-Path: <linux-doc+bounces-49613-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8585ADF48F
	for <lists+linux-doc@lfdr.de>; Wed, 18 Jun 2025 19:45:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CF493A3C19
	for <lists+linux-doc@lfdr.de>; Wed, 18 Jun 2025 17:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0121E3009AF;
	Wed, 18 Jun 2025 17:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X/xKM/TK"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9532F4A0C
	for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 17:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268465; cv=none; b=S759T18OV17Z8ZU6DovOM/wMPkWhxmqTcogtHHC6w4qS7L/AiJUlCu1MYyi/4W4GbMmF/51K3NajFjodBY8896ER0pX5L7+qZY+G7u0g6MesUneF/EHnmlmhB5dl+bxxWEIYkp1H8mhSaCIxTMsmXon7xqupeXTkbJSYWrQoh3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268465; c=relaxed/simple;
	bh=medYXpX+TMULRTtTMKcGdqcFj+q0FGabFVW2TyLbuho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T62lTpjag/UXextLBtEkTVehW05IK+QdzDRMd9X/oLjvw3T6jp8gPxxEG1PxlPHrXhFV3WYU70frEAk8JKk9MpWsUwzpFcbFQV0vG4i/BmcRps08b5TcEjzaJ3g7BAs9jOztkwCaCdRZXDdAOCwKnEJtwXL7iO04jo6XAnhfL0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X/xKM/TK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ASXfJp4RHbfj4rINsJONSvcqE1rahDwcrPqymsVLDE=;
	b=X/xKM/TKMdlRRQYSkEjK0I7k7TmCb9j/kVUvzvTFOwOP1oBjXJlN/Hi5VYiAhjVSNkCJCm
	iahg3FQ3TrKyDbL2nkpIawgnWhuDKLjXebwWeJ7WovOC9dTGwbObzLE7PitPIEo4QvHJbJ
	kan6KbK5rggHckK7rqW4K2kSKK/htqA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-S7CnRgOjMfu9QuqQYEF1XQ-1; Wed, 18 Jun 2025 13:40:59 -0400
X-MC-Unique: S7CnRgOjMfu9QuqQYEF1XQ-1
X-Mimecast-MFC-AGG-ID: S7CnRgOjMfu9QuqQYEF1XQ_1750268458
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4530c186394so32131685e9.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 10:40:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268458; x=1750873258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ASXfJp4RHbfj4rINsJONSvcqE1rahDwcrPqymsVLDE=;
        b=nE7DlWbOhvx6wFwLh6JZmzqgiPz1y6rekNdbBTuOY5bsbWtPDdzO+Yw6Gx51A+ieiE
         gt7pk1MC6fjISTVlPztJm04SHaJyvFl+eKTyvVSRr3qcevqvqZH9FPijNd6XIcDO/e/A
         nTCQgf6Dt6xZ5hGN+E5qZ3XVTxpDBKttVnmcng1H2JJZ1i8SuTai6ygKlgGFSbX/2cV5
         eWpz/EcHgNJqiRuSGqYFNtlkx625zdIFpNDgnzAA2LMekF+QLh4cC/dcF7HHOi9ZCAP2
         CLOO492rxMFV1MRRN5ZBYL2nRLaHYGnGdYW1ou3Ct9slcGB07TAEeyBfE6bclHPkZ+xj
         4hUg==
X-Forwarded-Encrypted: i=1; AJvYcCVfpO8BvkVTaAC62sLx07y67gg8tB7KUKfdPgceA9cIbxgilzhM5SzZtgeDKV5xZp0y8fJoWiVnTzw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4yTk2ZF0Y/6CP7fUgWpEIkiQa+qMWu2KPRgAmbaukb1z2d+cZ
	eRV+dKazAiKpCcC5lMSubfcKfFNSZjtFwcqzzymQRKJc5WnGlAIXw3oSHuMNYw9MDAksT+0uMFW
	Qmk2y9Dlj7u4M87GEhkEt0MF4KeCdMLpqIuJcsvsCZbT0mi22JRnMUjjeo3uslFXc0WCNkDn+
X-Gm-Gg: ASbGnctIztXyt4xDsknDWPcGuGdwiQBXTig6Ro3fU2vsm4qwJaZwgF4rOwVJquD5k6u
	hGv1QNkhApCgYKqJCX+z6VexrWLdwkcc7YM73zEi29Ve2ytZF76pgMuRVMp3I4ZJcDoj0OJyzpM
	/yUt8//Z5gDAEgFvhouO0o9dUmsx2Iz9k2vdNQE1pD+01WKqSzLLCfyjsPyIX9v0MMHnJTxUi3V
	jkrjCxHnLrn4ofMbxwJ7PvNGQ4vGnQh4TwGAROi/Px7zHwClRzjf2e6yWClwAC1FZcDhABEcquH
	TnwBUQTCY4p8TEJSHhcFBezVsVBsVa+U98CKjKbmu4RwfMCiYAJec1qAUb9Vj12/OGF7H6TJs7o
	jG+yIuA==
X-Received: by 2002:a05:6000:402a:b0:3a5:2208:41e3 with SMTP id ffacd0b85a97d-3a572398dcfmr14347286f8f.4.1750268457665;
        Wed, 18 Jun 2025 10:40:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxU0kwdlscA0a/TfkuoDPVpV0SY0h1I0z821bVOupD96O2QJDPBeoneLN1ts9zfh0zY6p91g==
X-Received: by 2002:a05:6000:402a:b0:3a5:2208:41e3 with SMTP id ffacd0b85a97d-3a572398dcfmr14347224f8f.4.1750268457179;
        Wed, 18 Jun 2025 10:40:57 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568b74313sm17643014f8f.96.2025.06.18.10.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:40:56 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	virtualization@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Xu Xin <xu.xin16@zte.com.cn>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Oscar Salvador <osalvador@suse.de>,
	Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: [PATCH RFC 15/29] mm/migration: remove PageMovable()
Date: Wed, 18 Jun 2025 19:39:58 +0200
Message-ID: <20250618174014.1168640-16-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618174014.1168640-1-david@redhat.com>
References: <20250618174014.1168640-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As __ClearPageMovable() is gone that would have only made
PageMovable()==false but still __PageMovable()==true, now
PageMovable() == __PageMovable().

So we can replace PageMovable() checks by __PageMovable(). In fact,
__PageMovable() cannot change until a page is freed, so we can turn
some PageMovable() into sanity checks for __PageMovable().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/migrate.h |  2 --
 mm/compaction.c         | 15 ---------------
 mm/migrate.c            | 18 ++++++++++--------
 3 files changed, 10 insertions(+), 25 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index fb6e9612e9f0b..204e89eac998f 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -104,10 +104,8 @@ static inline int migrate_huge_page_move_mapping(struct address_space *mapping,
 #endif /* CONFIG_MIGRATION */
 
 #ifdef CONFIG_COMPACTION
-bool PageMovable(struct page *page);
 void __SetPageMovable(struct page *page, const struct movable_operations *ops);
 #else
-static inline bool PageMovable(struct page *page) { return false; }
 static inline void __SetPageMovable(struct page *page,
 		const struct movable_operations *ops)
 {
diff --git a/mm/compaction.c b/mm/compaction.c
index 889ec696ba96a..5c37373017014 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -114,21 +114,6 @@ static unsigned long release_free_list(struct list_head *freepages)
 }
 
 #ifdef CONFIG_COMPACTION
-bool PageMovable(struct page *page)
-{
-	const struct movable_operations *mops;
-
-	VM_BUG_ON_PAGE(!PageLocked(page), page);
-	if (!__PageMovable(page))
-		return false;
-
-	mops = page_movable_ops(page);
-	if (mops)
-		return true;
-
-	return false;
-}
-
 void __SetPageMovable(struct page *page, const struct movable_operations *mops)
 {
 	VM_BUG_ON_PAGE(!PageLocked(page), page);
diff --git a/mm/migrate.c b/mm/migrate.c
index db807f9bbf975..cf92075108f0c 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -87,9 +87,12 @@ bool isolate_movable_ops_page(struct page *page, isolate_mode_t mode)
 		goto out;
 
 	/*
-	 * Check movable flag before taking the page lock because
+	 * Check for movable_ops pages before taking the page lock because
 	 * we use non-atomic bitops on newly allocated page flags so
 	 * unconditionally grabbing the lock ruins page's owner side.
+	 *
+	 * Note that once a page has movable_ops, it will stay that way
+	 * until the page was freed.
 	 */
 	if (unlikely(!__PageMovable(page)))
 		goto out_putfolio;
@@ -108,7 +111,8 @@ bool isolate_movable_ops_page(struct page *page, isolate_mode_t mode)
 	if (unlikely(!folio_trylock(folio)))
 		goto out_putfolio;
 
-	if (!PageMovable(page) || PageIsolated(page))
+	VM_WARN_ON_ONCE_PAGE(!__PageMovable(page), page);
+	if (PageIsolated(page))
 		goto out_no_isolated;
 
 	mops = page_movable_ops(page);
@@ -149,11 +153,10 @@ static void putback_movable_ops_page(struct page *page)
 	 */
 	struct folio *folio = page_folio(page);
 
+	VM_WARN_ON_ONCE_PAGE(!__PageMovable(page), page);
 	VM_WARN_ON_ONCE_PAGE(!PageIsolated(page), page);
 	folio_lock(folio);
-	/* If the page was released by it's owner, there is nothing to do. */
-	if (PageMovable(page))
-		page_movable_ops(page)->putback_page(page);
+	page_movable_ops(page)->putback_page(page);
 	ClearPageIsolated(page);
 	folio_unlock(folio);
 	folio_put(folio);
@@ -189,10 +192,9 @@ static int migrate_movable_ops_page(struct page *dst, struct page *src,
 {
 	int rc = MIGRATEPAGE_SUCCESS;
 
+	VM_WARN_ON_ONCE_PAGE(!__PageMovable(src), src);
 	VM_WARN_ON_ONCE_PAGE(!PageIsolated(src), src);
-	/* If the page was released by it's owner, there is nothing to do. */
-	if (PageMovable(src))
-		rc = page_movable_ops(src)->migrate_page(dst, src, mode);
+	rc = page_movable_ops(src)->migrate_page(dst, src, mode);
 	if (rc == MIGRATEPAGE_SUCCESS)
 		ClearPageIsolated(src);
 	return rc;
-- 
2.49.0


