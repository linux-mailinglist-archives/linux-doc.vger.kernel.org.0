Return-Path: <linux-doc+bounces-61894-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CBEBA329C
	for <lists+linux-doc@lfdr.de>; Fri, 26 Sep 2025 11:35:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4244C3B952C
	for <lists+linux-doc@lfdr.de>; Fri, 26 Sep 2025 09:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 876EF29D287;
	Fri, 26 Sep 2025 09:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aOjyiz76"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32042BE021
	for <linux-doc@vger.kernel.org>; Fri, 26 Sep 2025 09:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758879261; cv=none; b=CFQo5cxbb8Wd7w8UW+CR5A3Z5X2/OpbkGXXM5t+Z00MzsNcyPDqSXl4jScohV5MvQWiZDhNBOxeKl1bIU3DMKLQODbiIV+0rgIwKQFgZu3HyVSTyB5O1mj59zFJYEch5AlOC8YY4n7eNh3EKZaJg5SaKh+h87/JKJW2XxvR685A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758879261; c=relaxed/simple;
	bh=E04frglNkA3VvQRUXJHLpZqQuBz1La1Ik0IcgqmEqYg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NUs1M8VEXMrrDg8H3atPuy5u3LJFQQMnQz5QuZu/TgTNkEtbIaCgN/+3pRJMnKXsWWbp7+t/9t4T003PM68tywBQCb9OJ5sGLuoOEABAPgmOGWJq0ZbT+elmX/MWqinvtp5hNjY04/Di4pYsr5c8umv4iwc0i8cOwPUrilvXCyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aOjyiz76; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-267f0fe72a1so16101775ad.2
        for <linux-doc@vger.kernel.org>; Fri, 26 Sep 2025 02:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758879259; x=1759484059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8F1HkzqHjtZ4asrnu6+OCuquE7j2zJ/cOO3f5j6VRt0=;
        b=aOjyiz76H/2qv4Bc1/LyOkHigfsgd8rbZjmOImLy5Xi4TJsru8tBz1U4RHYKvCoP/Z
         WAeu9AxXZHdVAz6rk3UdlIYKyXmH7t0ws+xwlgsxeo3ZlNnQIqamE1RRrREkscUexVT/
         8gUjewd8r2IbxZ1fUMZwzNkTZdoB3s4s8Aaq21boyZWkLnF7eCECfOyfHCIOZ1ekXg2d
         09SUUa0LWLAkQsBqEmoMi+o2fKrN+3rYJWL350pQgNIKvWsCLEfF0kFZnzXAtH56ewPr
         1r44SFzVSHWTdnKIn8/qf7hYUlLbpZ6Vf3hHd1WLvDc6tOOrlT27P1m0CuL9pOFmo87B
         R6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758879259; x=1759484059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8F1HkzqHjtZ4asrnu6+OCuquE7j2zJ/cOO3f5j6VRt0=;
        b=PhC/Z0USDEKeMUhQa45+Fypq6hnaXb7ZGky//S8YXvd+llNzc0sGF/0yKIveMuwBZM
         iKM9r0IErMYvkiTZGBDjluViY2IY291johAPXSEfl5uIRUhTiaPYpFS+di22uGpuV9Hh
         4y0p1CKV5MGJZKX1t4/n4HJC+hYKQQJ1Us9MgxoeDWkqdG5/aFwSeYeV8T0jiwG/AbdF
         3Zjw9nSQnvAL51mTY9SxKDHXht+aak5k+K/D1Ya/4vxuSYztfPnG1dPPmvrHwamdKFkb
         X4GVwqu6JfE1FzxyJQLmK3967dkNiX+u8Taz3hNz3w0sWkiFN5NNqPjXtfVn2LRqdusT
         /U8g==
X-Forwarded-Encrypted: i=1; AJvYcCV42ekX5svR5IiV2sQmddFWmfBDAC5JyHfy+pritBmd4uqWEwqjNyCUNwfJs/qWaMlMcyUMG5keAvo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq31rpShRxvwCPupkUfSqj5IsCWVCLFemQxo+U/LBOKN9qCnJ0
	95NoCwo84oFkM0Rk3nNTp0bjz8+oA/AnhhxSqJSLnUIouPOz89M2Q/rJ
X-Gm-Gg: ASbGncvI0c8RwZbUcmI5RR8aKBxha2WZ/iJzfYy0NFirwMDRH5XLsCDgCCyq6P9bbWV
	+2VZfWJwMR+J0sNantGNiVxtiXoyDyBVyIIoJHmmaAI/WkVyy/81XBWJPrA3IGDA9xd5MjGpXbG
	yoJKWj9lK5wMVSkhpD5oudh8cc0IuCO8Wa7vhQqwWOjmZ9QK8lYrpqqEgX60FJgugSqgd2SwkvJ
	VihAxf9FD6pCodhfQe/mI2XoAjf3AU6DVvfi5QKJ68EZdRJtVG+puiyTpjLIA532hSfX5OJ7B7T
	9xTNReXxxjyqddNEfiRT7ySICHiG2IAf0HEjLuqJ4H/fCi1Z2dIFVtEk7iOwynsZcbfYMJ7QNlN
	JY1T9oKfgSQY1D8YhEblJgLOjLal52vILUnKzvMMMsGD4C4ggSs9Ampbv4ue4dwjfEkLX/8YRIB
	qbYtWRcjs0MZJO
X-Google-Smtp-Source: AGHT+IGs2RVuLQNle2jpLDUn/dQyj5uYkBVBI0mgx8CiaNeXlryu+CMTBs4lU6XcwR9nFTCXObCvkg==
X-Received: by 2002:a17:902:cf09:b0:27e:f1d1:74e0 with SMTP id d9443c01a7336-27ef1d178a0mr18485445ad.17.1758879258795;
        Fri, 26 Sep 2025 02:34:18 -0700 (PDT)
Received: from localhost.localdomain ([2409:891f:1c21:566:e1d1:c082:790c:7be6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66cda43sm49247475ad.25.2025.09.26.02.34.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Sep 2025 02:34:18 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org,
	david@redhat.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	hannes@cmpxchg.org,
	usamaarif642@gmail.com,
	gutierrez.asier@huawei-partners.com,
	willy@infradead.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	ameryhung@gmail.com,
	rientjes@google.com,
	corbet@lwn.net,
	21cnbao@gmail.com,
	shakeel.butt@linux.dev,
	tj@kernel.org,
	lance.yang@linux.dev
Cc: bpf@vger.kernel.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v8 mm-new 03/12] mm: thp: remove vm_flags parameter from thp_vma_allowable_order()
Date: Fri, 26 Sep 2025 17:33:34 +0800
Message-Id: <20250926093343.1000-4-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20250926093343.1000-1-laoar.shao@gmail.com>
References: <20250926093343.1000-1-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Because all calls to thp_vma_allowable_order() pass vma->vm_flags as the
vma_flags argument, we can remove the parameter and have the function
access vma->vm_flags directly.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
---
 fs/proc/task_mmu.c      |  3 +--
 include/linux/huge_mm.h | 16 ++++++++--------
 mm/huge_memory.c        |  4 ++--
 mm/khugepaged.c         | 10 +++++-----
 mm/memory.c             | 11 +++++------
 mm/shmem.c              |  2 +-
 6 files changed, 22 insertions(+), 24 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index fc35a0543f01..e713d1905750 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -1369,8 +1369,7 @@ static int show_smap(struct seq_file *m, void *v)
 	__show_smap(m, &mss, false);
 
 	seq_printf(m, "THPeligible:    %8u\n",
-		   !!thp_vma_allowable_orders(vma, vma->vm_flags, TVA_SMAPS,
-					      THP_ORDERS_ALL));
+		   !!thp_vma_allowable_orders(vma, TVA_SMAPS, THP_ORDERS_ALL));
 
 	if (arch_pkeys_enabled())
 		seq_printf(m, "ProtectionKey:  %8u\n", vma_pkey(vma));
diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index f327d62fc985..a635dcbb2b99 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -101,8 +101,8 @@ enum tva_type {
 	TVA_FORCED_COLLAPSE,	/* Forced collapse (e.g. MADV_COLLAPSE). */
 };
 
-#define thp_vma_allowable_order(vma, vm_flags, type, order) \
-	(!!thp_vma_allowable_orders(vma, vm_flags, type, BIT(order)))
+#define thp_vma_allowable_order(vma, type, order) \
+	(!!thp_vma_allowable_orders(vma, type, BIT(order)))
 
 #define split_folio(f) split_folio_to_list(f, NULL)
 
@@ -266,14 +266,12 @@ static inline unsigned long thp_vma_suitable_orders(struct vm_area_struct *vma,
 }
 
 unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
-					 vm_flags_t vm_flags,
 					 enum tva_type type,
 					 unsigned long orders);
 
 /**
  * thp_vma_allowable_orders - determine hugepage orders that are allowed for vma
  * @vma:  the vm area to check
- * @vm_flags: use these vm_flags instead of vma->vm_flags
  * @type: TVA type
  * @orders: bitfield of all orders to consider
  *
@@ -287,10 +285,11 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
  */
 static inline
 unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
-				       vm_flags_t vm_flags,
 				       enum tva_type type,
 				       unsigned long orders)
 {
+	vm_flags_t vm_flags = vma->vm_flags;
+
 	/*
 	 * Optimization to check if required orders are enabled early. Only
 	 * forced collapse ignores sysfs configs.
@@ -309,7 +308,7 @@ unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
 			return 0;
 	}
 
-	return __thp_vma_allowable_orders(vma, vm_flags, type, orders);
+	return __thp_vma_allowable_orders(vma, type, orders);
 }
 
 struct thpsize {
@@ -329,8 +328,10 @@ struct thpsize {
  * through madvise or prctl.
  */
 static inline bool vma_thp_disabled(struct vm_area_struct *vma,
-		vm_flags_t vm_flags, bool forced_collapse)
+				    bool forced_collapse)
 {
+	vm_flags_t vm_flags = vma->vm_flags;
+
 	/* Are THPs disabled for this VMA? */
 	if (vm_flags & VM_NOHUGEPAGE)
 		return true;
@@ -560,7 +561,6 @@ static inline unsigned long thp_vma_suitable_orders(struct vm_area_struct *vma,
 }
 
 static inline unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
-					vm_flags_t vm_flags,
 					enum tva_type type,
 					unsigned long orders)
 {
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index ac6601f30e65..1ac476fe6dc5 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -98,7 +98,6 @@ static inline bool file_thp_enabled(struct vm_area_struct *vma)
 }
 
 unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
-					 vm_flags_t vm_flags,
 					 enum tva_type type,
 					 unsigned long orders)
 {
@@ -106,6 +105,7 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
 	const bool in_pf = type == TVA_PAGEFAULT;
 	const bool forced_collapse = type == TVA_FORCED_COLLAPSE;
 	unsigned long supported_orders;
+	vm_flags_t vm_flags = vma->vm_flags;
 
 	/* Check the intersection of requested and supported orders. */
 	if (vma_is_anonymous(vma))
@@ -122,7 +122,7 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
 	if (!vma->vm_mm)		/* vdso */
 		return 0;
 
-	if (thp_disabled_by_hw() || vma_thp_disabled(vma, vm_flags, forced_collapse))
+	if (thp_disabled_by_hw() || vma_thp_disabled(vma, forced_collapse))
 		return 0;
 
 	/* khugepaged doesn't collapse DAX vma, but page fault is fine. */
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 04121ae7d18d..9eeb868adcd3 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -463,7 +463,7 @@ void khugepaged_enter_mm(struct mm_struct *mm)
 
 void khugepaged_enter_vma(struct vm_area_struct *vma)
 {
-	if (!thp_vma_allowable_order(vma, vma->vm_flags, TVA_KHUGEPAGED, PMD_ORDER))
+	if (!thp_vma_allowable_order(vma, TVA_KHUGEPAGED, PMD_ORDER))
 		return;
 
 	khugepaged_enter_mm(vma->vm_mm);
@@ -915,7 +915,7 @@ static int hugepage_vma_revalidate(struct mm_struct *mm, unsigned long address,
 
 	if (!thp_vma_suitable_order(vma, address, PMD_ORDER))
 		return SCAN_ADDRESS_RANGE;
-	if (!thp_vma_allowable_order(vma, vma->vm_flags, type, PMD_ORDER))
+	if (!thp_vma_allowable_order(vma, type, PMD_ORDER))
 		return SCAN_VMA_CHECK;
 	/*
 	 * Anon VMA expected, the address may be unmapped then
@@ -1526,7 +1526,7 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 	 * and map it by a PMD, regardless of sysfs THP settings. As such, let's
 	 * analogously elide sysfs THP settings here and force collapse.
 	 */
-	if (!thp_vma_allowable_order(vma, vma->vm_flags, TVA_FORCED_COLLAPSE, PMD_ORDER))
+	if (!thp_vma_allowable_order(vma, TVA_FORCED_COLLAPSE, PMD_ORDER))
 		return SCAN_VMA_CHECK;
 
 	/* Keep pmd pgtable for uffd-wp; see comment in retract_page_tables() */
@@ -2421,7 +2421,7 @@ static unsigned int khugepaged_scan_mm_slot(unsigned int pages, int *result,
 			progress++;
 			break;
 		}
-		if (!thp_vma_allowable_order(vma, vma->vm_flags, TVA_KHUGEPAGED, PMD_ORDER)) {
+		if (!thp_vma_allowable_order(vma, TVA_KHUGEPAGED, PMD_ORDER)) {
 skip:
 			progress++;
 			continue;
@@ -2752,7 +2752,7 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 	BUG_ON(vma->vm_start > start);
 	BUG_ON(vma->vm_end < end);
 
-	if (!thp_vma_allowable_order(vma, vma->vm_flags, TVA_FORCED_COLLAPSE, PMD_ORDER))
+	if (!thp_vma_allowable_order(vma, TVA_FORCED_COLLAPSE, PMD_ORDER))
 		return -EINVAL;
 
 	cc = kmalloc(sizeof(*cc), GFP_KERNEL);
diff --git a/mm/memory.c b/mm/memory.c
index 7e32eb79ba99..cd04e4894725 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4558,7 +4558,7 @@ static struct folio *alloc_swap_folio(struct vm_fault *vmf)
 	 * Get a list of all the (large) orders below PMD_ORDER that are enabled
 	 * and suitable for swapping THP.
 	 */
-	orders = thp_vma_allowable_orders(vma, vma->vm_flags, TVA_PAGEFAULT,
+	orders = thp_vma_allowable_orders(vma, TVA_PAGEFAULT,
 					  BIT(PMD_ORDER) - 1);
 	orders = thp_vma_suitable_orders(vma, vmf->address, orders);
 	orders = thp_swap_suitable_orders(swp_offset(entry),
@@ -5107,7 +5107,7 @@ static struct folio *alloc_anon_folio(struct vm_fault *vmf)
 	 * for this vma. Then filter out the orders that can't be allocated over
 	 * the faulting address and still be fully contained in the vma.
 	 */
-	orders = thp_vma_allowable_orders(vma, vma->vm_flags, TVA_PAGEFAULT,
+	orders = thp_vma_allowable_orders(vma, TVA_PAGEFAULT,
 					  BIT(PMD_ORDER) - 1);
 	orders = thp_vma_suitable_orders(vma, vmf->address, orders);
 
@@ -5379,7 +5379,7 @@ vm_fault_t do_set_pmd(struct vm_fault *vmf, struct folio *folio, struct page *pa
 	 * PMD mappings if THPs are disabled. As we already have a THP,
 	 * behave as if we are forcing a collapse.
 	 */
-	if (thp_disabled_by_hw() || vma_thp_disabled(vma, vma->vm_flags,
+	if (thp_disabled_by_hw() || vma_thp_disabled(vma,
 						     /* forced_collapse=*/ true))
 		return ret;
 
@@ -6280,7 +6280,6 @@ static vm_fault_t __handle_mm_fault(struct vm_area_struct *vma,
 		.gfp_mask = __get_fault_gfp_mask(vma),
 	};
 	struct mm_struct *mm = vma->vm_mm;
-	vm_flags_t vm_flags = vma->vm_flags;
 	pgd_t *pgd;
 	p4d_t *p4d;
 	vm_fault_t ret;
@@ -6295,7 +6294,7 @@ static vm_fault_t __handle_mm_fault(struct vm_area_struct *vma,
 		return VM_FAULT_OOM;
 retry_pud:
 	if (pud_none(*vmf.pud) &&
-	    thp_vma_allowable_order(vma, vm_flags, TVA_PAGEFAULT, PUD_ORDER)) {
+	    thp_vma_allowable_order(vma, TVA_PAGEFAULT, PUD_ORDER)) {
 		ret = create_huge_pud(&vmf);
 		if (!(ret & VM_FAULT_FALLBACK))
 			return ret;
@@ -6329,7 +6328,7 @@ static vm_fault_t __handle_mm_fault(struct vm_area_struct *vma,
 		goto retry_pud;
 
 	if (pmd_none(*vmf.pmd) &&
-	    thp_vma_allowable_order(vma, vm_flags, TVA_PAGEFAULT, PMD_ORDER)) {
+	    thp_vma_allowable_order(vma, TVA_PAGEFAULT, PMD_ORDER)) {
 		ret = create_huge_pmd(&vmf);
 		if (!(ret & VM_FAULT_FALLBACK))
 			return ret;
diff --git a/mm/shmem.c b/mm/shmem.c
index 4855eee22731..cc2c90656b66 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1780,7 +1780,7 @@ unsigned long shmem_allowable_huge_orders(struct inode *inode,
 	vm_flags_t vm_flags = vma ? vma->vm_flags : 0;
 	unsigned int global_orders;
 
-	if (thp_disabled_by_hw() || (vma && vma_thp_disabled(vma, vm_flags, shmem_huge_force)))
+	if (thp_disabled_by_hw() || (vma && vma_thp_disabled(vma, shmem_huge_force)))
 		return 0;
 
 	global_orders = shmem_huge_global_enabled(inode, index, write_end,
-- 
2.47.3


