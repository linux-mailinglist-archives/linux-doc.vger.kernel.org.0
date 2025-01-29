Return-Path: <linux-doc+bounces-36304-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C06D2A21CAF
	for <lists+linux-doc@lfdr.de>; Wed, 29 Jan 2025 12:55:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 870697A20D5
	for <lists+linux-doc@lfdr.de>; Wed, 29 Jan 2025 11:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F223F1DE2BA;
	Wed, 29 Jan 2025 11:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N1nw3rxa"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B7D1DDC3F
	for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 11:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738151669; cv=none; b=nAYWud6CqtSE4bUxmYA/hAaSN1eZL0TzjGyRj0InQe19fi7Jox9eSml4YytD/ngS/kmWlfzpoCxa37fMbKl9FaCCgURJSCVSFv9DJ3EYcqHgkaLbVjLpnSEqUNurH1+o77KMtNJCawBbUukYsIBlhsgo8ysh3MU1dJBpsJ2/guk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738151669; c=relaxed/simple;
	bh=nB56LEt4BweD7fZ7V8P6ZzKJLqYCpn9GIE9wy+WIsGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kniv22I72Dj2TvEMyh9gOFUkppKreyr2UyRaN5L7e1mJyFdEIhtffPXW5g8iyILbPNBhJVSqI910R1zZVtwbmAAvELmQhOms2YB0wkVnZ6e7q0JSgmihkDYEHa6H6IltBTpPxZAp3vw4D7cc5QTd2MT306GvRwne2NrQMLflV5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N1nw3rxa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738151666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FbpRkzZA4TilYwHsov5kO/PS96AeznJfw9pJaA8wpMg=;
	b=N1nw3rxaCjaMMKo5m7OvbxQYP1a+kPUcfXjWPQguOW9x+z6acMCIdpuCUDGFiMnF3DGQsJ
	CPlQmBO7pRLrIobPOAkbWVxfgXhn+62N5OU0GCgt2Spf7FeiPGA6mHVOlSEljcY5zt9D0n
	BqTXXfoYGnJoY1saCfLlCzptlmjBzoo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-100-VeeuVl9hMrexrwtEtAQiqw-1; Wed, 29 Jan 2025 06:54:25 -0500
X-MC-Unique: VeeuVl9hMrexrwtEtAQiqw-1
X-Mimecast-MFC-AGG-ID: VeeuVl9hMrexrwtEtAQiqw
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-385d7611ad3so3636819f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 03:54:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738151664; x=1738756464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FbpRkzZA4TilYwHsov5kO/PS96AeznJfw9pJaA8wpMg=;
        b=qt73KnaQRuH83SyMy6leoFXWTskmuI+hVt+X6ydYW6KMrLM3ED6yb3exYgiT1OaZL1
         m+fFkSGQXAmQSJHBPBH8c9yzh6L95MzrCkXKt0Wtk43rOsQZm365ICRI8k624gwqpCgU
         3reAWU4JE8j1ly34ktIEupc7Bs//ezz2vlaQOMwN8pVVDtkIRZ5otbfx4rdxDaYW5pIF
         l9Bw7+snqW1hB64WHDT9gMizLQWlcZdXxxQtVGoZS+5gQZ5JfYeK6CFqewQWJ8PPXrUu
         MaM+24RnMSW9uj5HgarNR3Jx32bC37jE6/vffgr8AgsqnjFB2G2HK0Bn91UBVFQsGqDF
         /sqw==
X-Gm-Message-State: AOJu0Yz09zs6EZ4Zwj4Kxk7t9VFcmQiupG62KxiQ5IHVSvhO6SrUj4IQ
	OSr45I5lthfQ/1kk4Fr+a2RVeKUO/iL8+DTWXLh2qlPLYvbXbOhWHnNYOY5AJR9G+VRw0PDciZ8
	0QDva0XHSGr2MPtB7hpDNbRVQTslqiDXOGjqy/gfdKTs5GAYzuMF+WACM9Q==
X-Gm-Gg: ASbGnctxHlH1wXoK5RWCOPAVaejJhyvThmpxP0+Rl5YZ3p5NERT7owT8+iDKkU3WaiX
	ErrsTruuZ+0omHsBLnrtsdhp9B9rrhdO/TdfXh0WDJWaYFOaU1nmRDMVfbDFU+mt4yuxQFDvpbT
	zyYgKwXDtfWeyd82X6S0F5ZIKU3f884gnpePCAksceqxh0SUEZ5GHzr5wDz/W+ifsTnecJaGpty
	mYca/xxoyj/AyU2Sxm8FBHw7GA+o3lfpoMcK3es3A4XLiTmJ1E8yT3RBLFBVEjol2Ao1DglCETG
	wLkB4K5eTzJB12eqFyURX+9xqWabpN+vEpSNk+iNynC8wLjs6D/n+AV/n+wQq9ZB5A==
X-Received: by 2002:a5d:64c3:0:b0:385:e5d8:2bea with SMTP id ffacd0b85a97d-38c519460aemr2346439f8f.20.1738151663870;
        Wed, 29 Jan 2025 03:54:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECXzKNlO/KxhDgtZSrbOQmu7i91GFToVYgJKpoIoUvo8DlvKFDTSa6/lsKfWQw3fetIFbvYQ==
X-Received: by 2002:a5d:64c3:0:b0:385:e5d8:2bea with SMTP id ffacd0b85a97d-38c519460aemr2346391f8f.20.1738151663351;
        Wed, 29 Jan 2025 03:54:23 -0800 (PST)
Received: from localhost (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de. [2003:cb:c705:3b00:64b8:6719:5794:bf13])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-438dcc27130sm20111455e9.16.2025.01.29.03.54.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 03:54:22 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org,
	nouveau@lists.freedesktop.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>,
	Alistair Popple <apopple@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v1 03/12] mm/rmap: convert make_device_exclusive_range() to make_device_exclusive()
Date: Wed, 29 Jan 2025 12:54:01 +0100
Message-ID: <20250129115411.2077152-4-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129115411.2077152-1-david@redhat.com>
References: <20250129115411.2077152-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The single "real" user in the tree of make_device_exclusive_range() always
requests making only a single address exclusive. The current implementation
is hard to fix for properly supporting anonymous THP / large folios and
for avoiding messing with rmap walks in weird ways.

So let's always process a single address/page and return folio + page to
minimize page -> folio lookups. This is a preparation for further
changes.

Reject any non-anonymous or hugetlb folios early, directly after GUP.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 Documentation/mm/hmm.rst                    |  2 +-
 Documentation/translations/zh_CN/mm/hmm.rst |  2 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c       |  5 +-
 include/linux/mmu_notifier.h                |  2 +-
 include/linux/rmap.h                        |  5 +-
 lib/test_hmm.c                              | 45 +++++------
 mm/rmap.c                                   | 90 +++++++++++----------
 7 files changed, 75 insertions(+), 76 deletions(-)

diff --git a/Documentation/mm/hmm.rst b/Documentation/mm/hmm.rst
index f6d53c37a2ca..7d61b7a8b65b 100644
--- a/Documentation/mm/hmm.rst
+++ b/Documentation/mm/hmm.rst
@@ -400,7 +400,7 @@ Exclusive access memory
 Some devices have features such as atomic PTE bits that can be used to implement
 atomic access to system memory. To support atomic operations to a shared virtual
 memory page such a device needs access to that page which is exclusive of any
-userspace access from the CPU. The ``make_device_exclusive_range()`` function
+userspace access from the CPU. The ``make_device_exclusive()`` function
 can be used to make a memory range inaccessible from userspace.
 
 This replaces all mappings for pages in the given range with special swap
diff --git a/Documentation/translations/zh_CN/mm/hmm.rst b/Documentation/translations/zh_CN/mm/hmm.rst
index 0669f947d0bc..22c210f4e94f 100644
--- a/Documentation/translations/zh_CN/mm/hmm.rst
+++ b/Documentation/translations/zh_CN/mm/hmm.rst
@@ -326,7 +326,7 @@ devm_memunmap_pages() 和 devm_release_mem_region() 当资源可以绑定到 ``s
 
 一些设备具有诸如原子PTE位的功能，可以用来实现对系统内存的原子访问。为了支持对一
 个共享的虚拟内存页的原子操作，这样的设备需要对该页的访问是排他的，而不是来自CPU
-的任何用户空间访问。  ``make_device_exclusive_range()`` 函数可以用来使一
+的任何用户空间访问。  ``make_device_exclusive()`` 函数可以用来使一
 个内存范围不能从用户空间访问。
 
 这将用特殊的交换条目替换给定范围内的所有页的映射。任何试图访问交换条目的行为都会
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index b4da82ddbb6b..39e3740980bb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -609,10 +609,9 @@ static int nouveau_atomic_range_fault(struct nouveau_svmm *svmm,
 
 		notifier_seq = mmu_interval_read_begin(&notifier->notifier);
 		mmap_read_lock(mm);
-		ret = make_device_exclusive_range(mm, start, start + PAGE_SIZE,
-					    &page, drm->dev);
+		page = make_device_exclusive(mm, start, drm->dev, &folio);
 		mmap_read_unlock(mm);
-		if (ret <= 0 || !page) {
+		if (IS_ERR(page)) {
 			ret = -EINVAL;
 			goto out;
 		}
diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index e2dd57ca368b..d4e714661826 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -46,7 +46,7 @@ struct mmu_interval_notifier;
  * @MMU_NOTIFY_EXCLUSIVE: to signal a device driver that the device will no
  * longer have exclusive access to the page. When sent during creation of an
  * exclusive range the owner will be initialised to the value provided by the
- * caller of make_device_exclusive_range(), otherwise the owner will be NULL.
+ * caller of make_device_exclusive(), otherwise the owner will be NULL.
  */
 enum mmu_notifier_event {
 	MMU_NOTIFY_UNMAP = 0,
diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index 683a04088f3f..86425d42c1a9 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -663,9 +663,8 @@ int folio_referenced(struct folio *, int is_locked,
 void try_to_migrate(struct folio *folio, enum ttu_flags flags);
 void try_to_unmap(struct folio *, enum ttu_flags flags);
 
-int make_device_exclusive_range(struct mm_struct *mm, unsigned long start,
-				unsigned long end, struct page **pages,
-				void *arg);
+struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
+		void *owner, struct folio **foliop);
 
 /* Avoid racy checks */
 #define PVMW_SYNC		(1 << 0)
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 056f2e411d7b..9e1b07a227a3 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -780,10 +780,8 @@ static int dmirror_exclusive(struct dmirror *dmirror,
 	unsigned long start, end, addr;
 	unsigned long size = cmd->npages << PAGE_SHIFT;
 	struct mm_struct *mm = dmirror->notifier.mm;
-	struct page *pages[64];
 	struct dmirror_bounce bounce;
-	unsigned long next;
-	int ret;
+	int ret = 0;
 
 	start = cmd->addr;
 	end = start + size;
@@ -795,36 +793,31 @@ static int dmirror_exclusive(struct dmirror *dmirror,
 		return -EINVAL;
 
 	mmap_read_lock(mm);
-	for (addr = start; addr < end; addr = next) {
-		unsigned long mapped = 0;
-		int i;
-
-		next = min(end, addr + (ARRAY_SIZE(pages) << PAGE_SHIFT));
+	for (addr = start; addr < end; addr += PAGE_SIZE) {
+		struct folio *folio;
+		struct page *page;
 
-		ret = make_device_exclusive_range(mm, addr, next, pages, NULL);
-		/*
-		 * Do dmirror_atomic_map() iff all pages are marked for
-		 * exclusive access to avoid accessing uninitialized
-		 * fields of pages.
-		 */
-		if (ret == (next - addr) >> PAGE_SHIFT)
-			mapped = dmirror_atomic_map(addr, next, pages, dmirror);
-		for (i = 0; i < ret; i++) {
-			if (pages[i]) {
-				unlock_page(pages[i]);
-				put_page(pages[i]);
-			}
+		page = make_device_exclusive(mm, addr, &folio, NULL);
+		if (IS_ERR(page)) {
+			ret = PTR_ERR(page);
+			break;
 		}
 
-		if (addr + (mapped << PAGE_SHIFT) < next) {
-			mmap_read_unlock(mm);
-			mmput(mm);
-			return -EBUSY;
-		}
+		ret = dmirror_atomic_map(addr, addr + PAGE_SIZE, &page, dmirror);
+		if (!ret)
+			ret = -EBUSY;
+		folio_unlock(folio);
+		folio_put(folio);
+
+		if (ret)
+			break;
 	}
 	mmap_read_unlock(mm);
 	mmput(mm);
 
+	if (ret)
+		return -EBUSY;
+
 	/* Return the migrated data for verification. */
 	ret = dmirror_bounce_init(&bounce, start, size);
 	if (ret)
diff --git a/mm/rmap.c b/mm/rmap.c
index 17fbfa61f7ef..676df4fba5b0 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2495,70 +2495,78 @@ static bool folio_make_device_exclusive(struct folio *folio,
 		.arg = &args,
 	};
 
-	/*
-	 * Restrict to anonymous folios for now to avoid potential writeback
-	 * issues.
-	 */
-	if (!folio_test_anon(folio) || folio_test_hugetlb(folio))
-		return false;
-
 	rmap_walk(folio, &rwc);
 
 	return args.valid && !folio_mapcount(folio);
 }
 
 /**
- * make_device_exclusive_range() - Mark a range for exclusive use by a device
+ * make_device_exclusive() - Mark an address for exclusive use by a device
  * @mm: mm_struct of associated target process
- * @start: start of the region to mark for exclusive device access
- * @end: end address of region
- * @pages: returns the pages which were successfully marked for exclusive access
+ * @addr: the virtual address to mark for exclusive device access
  * @owner: passed to MMU_NOTIFY_EXCLUSIVE range notifier to allow filtering
+ * @foliop: folio pointer will be stored here on success.
+ *
+ * This function looks up the page mapped at the given address, grabs a
+ * folio reference, locks the folio and replaces the PTE with special
+ * device-exclusive non-swap entry, preventing userspace CPU access. The
+ * function will return with the folio locked and referenced.
  *
- * Returns: number of pages found in the range by GUP. A page is marked for
- * exclusive access only if the page pointer is non-NULL.
+ * On fault these special device-exclusive entries are replaced with the
+ * original PTE under folio lock, after calling MMU notifiers.
  *
- * This function finds ptes mapping page(s) to the given address range, locks
- * them and replaces mappings with special swap entries preventing userspace CPU
- * access. On fault these entries are replaced with the original mapping after
- * calling MMU notifiers.
+ * Only anonymous non-hugetlb folios are supported and the VMA must have
+ * write permissions such that we can fault in the anonymous page writable
+ * in order to mark it exclusive. The caller must hold the mmap_lock in read
+ * mode.
  *
  * A driver using this to program access from a device must use a mmu notifier
  * critical section to hold a device specific lock during programming. Once
  * programming is complete it should drop the page lock and reference after
  * which point CPU access to the page will revoke the exclusive access.
+ *
+ * Returns: pointer to mapped page on success, otherwise a negative error.
  */
-int make_device_exclusive_range(struct mm_struct *mm, unsigned long start,
-				unsigned long end, struct page **pages,
-				void *owner)
+struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
+		void *owner, struct folio **foliop)
 {
-	long npages = (end - start) >> PAGE_SHIFT;
-	long i;
+	struct folio *folio;
+	struct page *page;
+	long npages;
+
+	mmap_assert_locked(mm);
 
-	npages = get_user_pages_remote(mm, start, npages,
+	/*
+	 * Fault in the page writable and try to lock it; note that if the
+	 * address would already be marked for exclusive use by the device,
+	 * the GUP call would undo that first by triggering a fault.
+	 */
+	npages = get_user_pages_remote(mm, addr, 1,
 				       FOLL_GET | FOLL_WRITE | FOLL_SPLIT_PMD,
-				       pages, NULL);
-	if (npages < 0)
-		return npages;
-
-	for (i = 0; i < npages; i++, start += PAGE_SIZE) {
-		struct folio *folio = page_folio(pages[i]);
-		if (PageTail(pages[i]) || !folio_trylock(folio)) {
-			folio_put(folio);
-			pages[i] = NULL;
-			continue;
-		}
+				       &page, NULL);
+	if (npages != 1)
+		return ERR_PTR(npages);
+	folio = page_folio(page);
 
-		if (!folio_make_device_exclusive(folio, mm, start, owner)) {
-			folio_unlock(folio);
-			folio_put(folio);
-			pages[i] = NULL;
-		}
+	if (!folio_test_anon(folio) || folio_test_hugetlb(folio)) {
+		folio_put(folio);
+		return ERR_PTR(-EOPNOTSUPP);
+	}
+
+	if (!folio_trylock(folio)) {
+		folio_put(folio);
+		return ERR_PTR(-EBUSY);
 	}
 
-	return npages;
+	if (!folio_make_device_exclusive(folio, mm, addr, owner)) {
+		folio_unlock(folio);
+		folio_put(folio);
+		return ERR_PTR(-EBUSY);
+	}
+	*foliop = folio;
+	return page;
 }
-EXPORT_SYMBOL_GPL(make_device_exclusive_range);
+EXPORT_SYMBOL_GPL(make_device_exclusive);
 #endif
 
 void __put_anon_vma(struct anon_vma *anon_vma)
-- 
2.48.1


