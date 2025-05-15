Return-Path: <linux-doc+bounces-46147-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2DDAB7BF9
	for <lists+linux-doc@lfdr.de>; Thu, 15 May 2025 05:04:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 691751BA7910
	for <lists+linux-doc@lfdr.de>; Thu, 15 May 2025 03:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71FC28F505;
	Thu, 15 May 2025 03:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UQt19pGu"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F5F288C27
	for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 03:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747278242; cv=none; b=gI9POAthGr1N3c+tiO6K9iWo3RxTKoDbivd0GNTzq1iLNzn//LQuczhuxmS/CCw1xzUOI8CehfONZKPr+EDbi9Zbdc+uGBOynhirpzitUaCTF3PepW1IyjBar5sJcCynKi5knmHYUbhHX/Zglcy91peZHaAteWf9XGMRW4LKt7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747278242; c=relaxed/simple;
	bh=2qMALW6G55buLUCjksxaiPiE2rST9/SQYvPOqsacLsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pExRC0aYFys2PnDZcZ8JWc4rS6X4HaLD3imEaFr7SgYZ0lSiTLeqMik6aR4qjXX/M8NSNwQYqht5+1sBKHYEshfDVTGnSj7N4GvYgpVl7hfz9Jr57oQCZ6ZupRvoceuOq11yDXPEYB1t8RLn+QwNd2oX8wmBwszPF4xyt+5BvVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UQt19pGu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747278239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U3u7LivjPSRMGH951nHgefWTU0wWJMR9QiQPGZAWh3s=;
	b=UQt19pGumozP8Kr1t5oB077KTpaT2Il6576AicuuI804+4BoO2MKalwbAHYL/LpvSHyL9c
	jU9w3cZ93HY8yze4JnSUcOwwLzxngOERmgBSkgoq9IXWWHxEAcdUEDbFVGdcdIcwx+IUl7
	7sled3kEgxkJf3TrmHyfYiOHkq2A1pE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-679-WXfWnq3YMuqoCvWT8eAp_A-1; Wed,
 14 May 2025 23:03:55 -0400
X-MC-Unique: WXfWnq3YMuqoCvWT8eAp_A-1
X-Mimecast-MFC-AGG-ID: WXfWnq3YMuqoCvWT8eAp_A_1747278231
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 978EE1800446;
	Thu, 15 May 2025 03:03:50 +0000 (UTC)
Received: from h1.redhat.com (unknown [10.22.88.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EBB341800268;
	Thu, 15 May 2025 03:03:34 +0000 (UTC)
From: Nico Pache <npache@redhat.com>
To: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: david@redhat.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	corbet@lwn.net,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	akpm@linux-foundation.org,
	baohua@kernel.org,
	willy@infradead.org,
	peterx@redhat.com,
	wangkefeng.wang@huawei.com,
	usamaarif642@gmail.com,
	sunnanyong@huawei.com,
	vishal.moola@gmail.com,
	thomas.hellstrom@linux.intel.com,
	yang@os.amperecomputing.com,
	kirill.shutemov@linux.intel.com,
	aarcange@redhat.com,
	raquini@redhat.com,
	anshuman.khandual@arm.com,
	catalin.marinas@arm.com,
	tiwai@suse.de,
	will@kernel.org,
	dave.hansen@linux.intel.com,
	jack@suse.cz,
	cl@gentwo.org,
	jglisse@google.com,
	surenb@google.com,
	zokeefe@google.com,
	hannes@cmpxchg.org,
	rientjes@google.com,
	mhocko@suse.com,
	rdunlap@infradead.org
Subject: [PATCH v6 01/12] khugepaged: rename hpage_collapse_* to khugepaged_*
Date: Wed, 14 May 2025 21:03:01 -0600
Message-ID: <20250515030312.125567-2-npache@redhat.com>
In-Reply-To: <20250515030312.125567-1-npache@redhat.com>
References: <20250515030312.125567-1-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

functions in khugepaged.c use a mix of hpage_collapse and khugepaged
as the function prefix.

rename all of them to khugepaged to keep things consistent and slightly
shorten the function names.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Nico Pache <npache@redhat.com>
---
 mm/khugepaged.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index cdf5a581368b..806bcd8c5185 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -402,14 +402,14 @@ void __init khugepaged_destroy(void)
 	kmem_cache_destroy(mm_slot_cache);
 }
 
-static inline int hpage_collapse_test_exit(struct mm_struct *mm)
+static inline int khugepaged_test_exit(struct mm_struct *mm)
 {
 	return atomic_read(&mm->mm_users) == 0;
 }
 
-static inline int hpage_collapse_test_exit_or_disable(struct mm_struct *mm)
+static inline int khugepaged_test_exit_or_disable(struct mm_struct *mm)
 {
-	return hpage_collapse_test_exit(mm) ||
+	return khugepaged_test_exit(mm) ||
 	       test_bit(MMF_DISABLE_THP, &mm->flags);
 }
 
@@ -444,7 +444,7 @@ void __khugepaged_enter(struct mm_struct *mm)
 	int wakeup;
 
 	/* __khugepaged_exit() must not run from under us */
-	VM_BUG_ON_MM(hpage_collapse_test_exit(mm), mm);
+	VM_BUG_ON_MM(khugepaged_test_exit(mm), mm);
 	if (unlikely(test_and_set_bit(MMF_VM_HUGEPAGE, &mm->flags)))
 		return;
 
@@ -503,7 +503,7 @@ void __khugepaged_exit(struct mm_struct *mm)
 	} else if (mm_slot) {
 		/*
 		 * This is required to serialize against
-		 * hpage_collapse_test_exit() (which is guaranteed to run
+		 * khugepaged_test_exit() (which is guaranteed to run
 		 * under mmap sem read mode). Stop here (after we return all
 		 * pagetables will be destroyed) until khugepaged has finished
 		 * working on the pagetables under the mmap_lock.
@@ -851,7 +851,7 @@ struct collapse_control khugepaged_collapse_control = {
 	.is_khugepaged = true,
 };
 
-static bool hpage_collapse_scan_abort(int nid, struct collapse_control *cc)
+static bool khugepaged_scan_abort(int nid, struct collapse_control *cc)
 {
 	int i;
 
@@ -886,7 +886,7 @@ static inline gfp_t alloc_hugepage_khugepaged_gfpmask(void)
 }
 
 #ifdef CONFIG_NUMA
-static int hpage_collapse_find_target_node(struct collapse_control *cc)
+static int khugepaged_find_target_node(struct collapse_control *cc)
 {
 	int nid, target_node = 0, max_value = 0;
 
@@ -905,7 +905,7 @@ static int hpage_collapse_find_target_node(struct collapse_control *cc)
 	return target_node;
 }
 #else
-static int hpage_collapse_find_target_node(struct collapse_control *cc)
+static int khugepaged_find_target_node(struct collapse_control *cc)
 {
 	return 0;
 }
@@ -925,7 +925,7 @@ static int hugepage_vma_revalidate(struct mm_struct *mm, unsigned long address,
 	struct vm_area_struct *vma;
 	unsigned long tva_flags = cc->is_khugepaged ? TVA_ENFORCE_SYSFS : 0;
 
-	if (unlikely(hpage_collapse_test_exit_or_disable(mm)))
+	if (unlikely(khugepaged_test_exit_or_disable(mm)))
 		return SCAN_ANY_PROCESS;
 
 	*vmap = vma = find_vma(mm, address);
@@ -992,7 +992,7 @@ static int check_pmd_still_valid(struct mm_struct *mm,
 
 /*
  * Bring missing pages in from swap, to complete THP collapse.
- * Only done if hpage_collapse_scan_pmd believes it is worthwhile.
+ * Only done if khugepaged_scan_pmd believes it is worthwhile.
  *
  * Called and returns without pte mapped or spinlocks held.
  * Returns result: if not SCAN_SUCCEED, mmap_lock has been released.
@@ -1078,7 +1078,7 @@ static int alloc_charge_folio(struct folio **foliop, struct mm_struct *mm,
 {
 	gfp_t gfp = (cc->is_khugepaged ? alloc_hugepage_khugepaged_gfpmask() :
 		     GFP_TRANSHUGE);
-	int node = hpage_collapse_find_target_node(cc);
+	int node = khugepaged_find_target_node(cc);
 	struct folio *folio;
 
 	folio = __folio_alloc(gfp, HPAGE_PMD_ORDER, node, &cc->alloc_nmask);
@@ -1264,7 +1264,7 @@ static int collapse_huge_page(struct mm_struct *mm, unsigned long address,
 	return result;
 }
 
-static int hpage_collapse_scan_pmd(struct mm_struct *mm,
+static int khugepaged_scan_pmd(struct mm_struct *mm,
 				   struct vm_area_struct *vma,
 				   unsigned long address, bool *mmap_locked,
 				   struct collapse_control *cc)
@@ -1378,7 +1378,7 @@ static int hpage_collapse_scan_pmd(struct mm_struct *mm,
 		 * hit record.
 		 */
 		node = folio_nid(folio);
-		if (hpage_collapse_scan_abort(node, cc)) {
+		if (khugepaged_scan_abort(node, cc)) {
 			result = SCAN_SCAN_ABORT;
 			goto out_unmap;
 		}
@@ -1447,7 +1447,7 @@ static void collect_mm_slot(struct khugepaged_mm_slot *mm_slot)
 
 	lockdep_assert_held(&khugepaged_mm_lock);
 
-	if (hpage_collapse_test_exit(mm)) {
+	if (khugepaged_test_exit(mm)) {
 		/* free mm_slot */
 		hash_del(&slot->hash);
 		list_del(&slot->mm_node);
@@ -1740,7 +1740,7 @@ static void retract_page_tables(struct address_space *mapping, pgoff_t pgoff)
 		if (find_pmd_or_thp_or_none(mm, addr, &pmd) != SCAN_SUCCEED)
 			continue;
 
-		if (hpage_collapse_test_exit(mm))
+		if (khugepaged_test_exit(mm))
 			continue;
 		/*
 		 * When a vma is registered with uffd-wp, we cannot recycle
@@ -2262,7 +2262,7 @@ static int collapse_file(struct mm_struct *mm, unsigned long addr,
 	return result;
 }
 
-static int hpage_collapse_scan_file(struct mm_struct *mm, unsigned long addr,
+static int khugepaged_scan_file(struct mm_struct *mm, unsigned long addr,
 				    struct file *file, pgoff_t start,
 				    struct collapse_control *cc)
 {
@@ -2307,7 +2307,7 @@ static int hpage_collapse_scan_file(struct mm_struct *mm, unsigned long addr,
 		}
 
 		node = folio_nid(folio);
-		if (hpage_collapse_scan_abort(node, cc)) {
+		if (khugepaged_scan_abort(node, cc)) {
 			result = SCAN_SCAN_ABORT;
 			break;
 		}
@@ -2391,7 +2391,7 @@ static unsigned int khugepaged_scan_mm_slot(unsigned int pages, int *result,
 		goto breakouterloop_mmap_lock;
 
 	progress++;
-	if (unlikely(hpage_collapse_test_exit_or_disable(mm)))
+	if (unlikely(khugepaged_test_exit_or_disable(mm)))
 		goto breakouterloop;
 
 	vma_iter_init(&vmi, mm, khugepaged_scan.address);
@@ -2399,7 +2399,7 @@ static unsigned int khugepaged_scan_mm_slot(unsigned int pages, int *result,
 		unsigned long hstart, hend;
 
 		cond_resched();
-		if (unlikely(hpage_collapse_test_exit_or_disable(mm))) {
+		if (unlikely(khugepaged_test_exit_or_disable(mm))) {
 			progress++;
 			break;
 		}
@@ -2421,7 +2421,7 @@ static unsigned int khugepaged_scan_mm_slot(unsigned int pages, int *result,
 			bool mmap_locked = true;
 
 			cond_resched();
-			if (unlikely(hpage_collapse_test_exit_or_disable(mm)))
+			if (unlikely(khugepaged_test_exit_or_disable(mm)))
 				goto breakouterloop;
 
 			VM_BUG_ON(khugepaged_scan.address < hstart ||
@@ -2481,7 +2481,7 @@ static unsigned int khugepaged_scan_mm_slot(unsigned int pages, int *result,
 	 * Release the current mm_slot if this mm is about to die, or
 	 * if we scanned all vmas of this mm.
 	 */
-	if (hpage_collapse_test_exit(mm) || !vma) {
+	if (khugepaged_test_exit(mm) || !vma) {
 		/*
 		 * Make sure that if mm_users is reaching zero while
 		 * khugepaged runs here, khugepaged_exit will find
-- 
2.49.0


