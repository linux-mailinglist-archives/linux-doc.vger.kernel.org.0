Return-Path: <linux-doc+bounces-43389-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F236FA90FE9
	for <lists+linux-doc@lfdr.de>; Thu, 17 Apr 2025 02:07:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 680C93BE4D8
	for <lists+linux-doc@lfdr.de>; Thu, 17 Apr 2025 00:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82FA58836;
	Thu, 17 Apr 2025 00:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GvSIsseY"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACABB22098
	for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 00:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744848414; cv=none; b=AS7x235NP4V6DEIw/QJCfzwrn1D0vsoXKzYDB4yZmU2e6LAb+LeGoVfNWVrC1B/PARNnOjIkRvrP/5CCcUiw0MIeSBQTzr4XqAhVIleRtWBM2ewcCQCpER8dV8NLgbQF0QnrclS2WOMMikP0vyi+YdGbIn6OrFwemMzOyQm4Ac0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744848414; c=relaxed/simple;
	bh=tHCa6Q1aekeHz7FyQTZpx9iFyF28pEkBoerZdJhk0t0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ty8y+/+tFoFreluvyFkgQjOOaPp2FbhGCAwPpERdwgqmQMi/XcRZTvi7qP850qe6YzAhfzeOdp1iCB0/yKuVFX5KIbmuIp7cACcjKN2EEzU9zdcM1W5HqV0UYp7fQ2YhdbOFlpcuEDj1IyStMVgqFQNuL3fV3kpgiL3YckjeuZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GvSIsseY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744848411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IpV3zuxCR2eY4+V1cO1t7OWP+UORQhBI3uuugTMEKsQ=;
	b=GvSIsseYFu/2KaPCFzVuQifc3Zi+ezSrCnbhQW7VCxNC8XdHl2olfzyK5xNpvNt6nosVT5
	evkV7Vo8b6DIlBTXv7XxrRfgLOFpnv4LfwiDQxCI7vo24XS81zxQ6YKvHVewb3c6vbCiBK
	3UYJfXCNsGBEYLooYY1dzKNTF6GlBUU=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-664-O-JFbqzDPICFF8BYyTu_uQ-1; Wed,
 16 Apr 2025 20:06:49 -0400
X-MC-Unique: O-JFbqzDPICFF8BYyTu_uQ-1
X-Mimecast-MFC-AGG-ID: O-JFbqzDPICFF8BYyTu_uQ_1744848404
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7E94D1800264;
	Thu, 17 Apr 2025 00:06:44 +0000 (UTC)
Received: from h1.redhat.com (unknown [10.22.88.34])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 96FDD180045B;
	Thu, 17 Apr 2025 00:06:36 +0000 (UTC)
From: Nico Pache <npache@redhat.com>
To: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	corbet@lwn.net,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	david@redhat.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	ryan.roberts@arm.com,
	willy@infradead.org,
	peterx@redhat.com,
	ziy@nvidia.com,
	wangkefeng.wang@huawei.com,
	usamaarif642@gmail.com,
	sunnanyong@huawei.com,
	vishal.moola@gmail.com,
	thomas.hellstrom@linux.intel.com,
	yang@os.amperecomputing.com,
	kirill.shutemov@linux.intel.com,
	aarcange@redhat.com,
	raquini@redhat.com,
	dev.jain@arm.com,
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
Subject: [PATCH v4 05/12] khugepaged: generalize __collapse_huge_page_* for mTHP support
Date: Wed, 16 Apr 2025 18:02:31 -0600
Message-ID: <20250417000238.74567-6-npache@redhat.com>
In-Reply-To: <20250417000238.74567-1-npache@redhat.com>
References: <20250417000238.74567-1-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

generalize the order of the __collapse_huge_page_* functions
to support future mTHP collapse.

mTHP collapse can suffer from incosistant behavior, and memory waste
"creep". disable swapin and shared support for mTHP collapse.

No functional changes in this patch.

Co-developed-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Nico Pache <npache@redhat.com>
---
 mm/khugepaged.c | 46 ++++++++++++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 18 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 883e9a46359f..5e9272ab82da 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -565,15 +565,17 @@ static int __collapse_huge_page_isolate(struct vm_area_struct *vma,
 					unsigned long address,
 					pte_t *pte,
 					struct collapse_control *cc,
-					struct list_head *compound_pagelist)
+					struct list_head *compound_pagelist,
+					u8 order)
 {
 	struct page *page = NULL;
 	struct folio *folio = NULL;
 	pte_t *_pte;
 	int none_or_zero = 0, shared = 0, result = SCAN_FAIL, referenced = 0;
 	bool writable = false;
+	int scaled_none = khugepaged_max_ptes_none >> (HPAGE_PMD_ORDER - order);
 
-	for (_pte = pte; _pte < pte + HPAGE_PMD_NR;
+	for (_pte = pte; _pte < pte + (1 << order);
 	     _pte++, address += PAGE_SIZE) {
 		pte_t pteval = ptep_get(_pte);
 		if (pte_none(pteval) || (pte_present(pteval) &&
@@ -581,7 +583,7 @@ static int __collapse_huge_page_isolate(struct vm_area_struct *vma,
 			++none_or_zero;
 			if (!userfaultfd_armed(vma) &&
 			    (!cc->is_khugepaged ||
-			     none_or_zero <= khugepaged_max_ptes_none)) {
+			     none_or_zero <= scaled_none)) {
 				continue;
 			} else {
 				result = SCAN_EXCEED_NONE_PTE;
@@ -609,8 +611,8 @@ static int __collapse_huge_page_isolate(struct vm_area_struct *vma,
 		/* See hpage_collapse_scan_pmd(). */
 		if (folio_maybe_mapped_shared(folio)) {
 			++shared;
-			if (cc->is_khugepaged &&
-			    shared > khugepaged_max_ptes_shared) {
+			if (order != HPAGE_PMD_ORDER || (cc->is_khugepaged &&
+			    shared > khugepaged_max_ptes_shared)) {
 				result = SCAN_EXCEED_SHARED_PTE;
 				count_vm_event(THP_SCAN_EXCEED_SHARED_PTE);
 				goto out;
@@ -711,13 +713,14 @@ static void __collapse_huge_page_copy_succeeded(pte_t *pte,
 						struct vm_area_struct *vma,
 						unsigned long address,
 						spinlock_t *ptl,
-						struct list_head *compound_pagelist)
+						struct list_head *compound_pagelist,
+						u8 order)
 {
 	struct folio *src, *tmp;
 	pte_t *_pte;
 	pte_t pteval;
 
-	for (_pte = pte; _pte < pte + HPAGE_PMD_NR;
+	for (_pte = pte; _pte < pte + (1 << order);
 	     _pte++, address += PAGE_SIZE) {
 		pteval = ptep_get(_pte);
 		if (pte_none(pteval) || is_zero_pfn(pte_pfn(pteval))) {
@@ -764,7 +767,8 @@ static void __collapse_huge_page_copy_failed(pte_t *pte,
 					     pmd_t *pmd,
 					     pmd_t orig_pmd,
 					     struct vm_area_struct *vma,
-					     struct list_head *compound_pagelist)
+					     struct list_head *compound_pagelist,
+					     u8 order)
 {
 	spinlock_t *pmd_ptl;
 
@@ -781,7 +785,7 @@ static void __collapse_huge_page_copy_failed(pte_t *pte,
 	 * Release both raw and compound pages isolated
 	 * in __collapse_huge_page_isolate.
 	 */
-	release_pte_pages(pte, pte + HPAGE_PMD_NR, compound_pagelist);
+	release_pte_pages(pte, pte + (1 << order), compound_pagelist);
 }
 
 /*
@@ -802,7 +806,7 @@ static void __collapse_huge_page_copy_failed(pte_t *pte,
 static int __collapse_huge_page_copy(pte_t *pte, struct folio *folio,
 		pmd_t *pmd, pmd_t orig_pmd, struct vm_area_struct *vma,
 		unsigned long address, spinlock_t *ptl,
-		struct list_head *compound_pagelist)
+		struct list_head *compound_pagelist, u8 order)
 {
 	unsigned int i;
 	int result = SCAN_SUCCEED;
@@ -810,7 +814,7 @@ static int __collapse_huge_page_copy(pte_t *pte, struct folio *folio,
 	/*
 	 * Copying pages' contents is subject to memory poison at any iteration.
 	 */
-	for (i = 0; i < HPAGE_PMD_NR; i++) {
+	for (i = 0; i < (1 << order); i++) {
 		pte_t pteval = ptep_get(pte + i);
 		struct page *page = folio_page(folio, i);
 		unsigned long src_addr = address + i * PAGE_SIZE;
@@ -829,10 +833,10 @@ static int __collapse_huge_page_copy(pte_t *pte, struct folio *folio,
 
 	if (likely(result == SCAN_SUCCEED))
 		__collapse_huge_page_copy_succeeded(pte, vma, address, ptl,
-						    compound_pagelist);
+						    compound_pagelist, order);
 	else
 		__collapse_huge_page_copy_failed(pte, pmd, orig_pmd, vma,
-						 compound_pagelist);
+						 compound_pagelist, order);
 
 	return result;
 }
@@ -1000,11 +1004,11 @@ static int check_pmd_still_valid(struct mm_struct *mm,
 static int __collapse_huge_page_swapin(struct mm_struct *mm,
 				       struct vm_area_struct *vma,
 				       unsigned long haddr, pmd_t *pmd,
-				       int referenced)
+				       int referenced, u8 order)
 {
 	int swapped_in = 0;
 	vm_fault_t ret = 0;
-	unsigned long address, end = haddr + (HPAGE_PMD_NR * PAGE_SIZE);
+	unsigned long address, end = haddr + (PAGE_SIZE << order);
 	int result;
 	pte_t *pte = NULL;
 	spinlock_t *ptl;
@@ -1035,6 +1039,12 @@ static int __collapse_huge_page_swapin(struct mm_struct *mm,
 		if (!is_swap_pte(vmf.orig_pte))
 			continue;
 
+		/* Dont swapin for mTHP collapse */
+		if (order != HPAGE_PMD_ORDER) {
+			result = SCAN_EXCEED_SWAP_PTE;
+			goto out;
+		}
+
 		vmf.pte = pte;
 		vmf.ptl = ptl;
 		ret = do_swap_page(&vmf);
@@ -1154,7 +1164,7 @@ static int collapse_huge_page(struct mm_struct *mm, unsigned long address,
 		 * that case.  Continuing to collapse causes inconsistency.
 		 */
 		result = __collapse_huge_page_swapin(mm, vma, address, pmd,
-						     referenced);
+				referenced, HPAGE_PMD_ORDER);
 		if (result != SCAN_SUCCEED)
 			goto out_nolock;
 	}
@@ -1201,7 +1211,7 @@ static int collapse_huge_page(struct mm_struct *mm, unsigned long address,
 	pte = pte_offset_map_lock(mm, &_pmd, address, &pte_ptl);
 	if (pte) {
 		result = __collapse_huge_page_isolate(vma, address, pte, cc,
-						      &compound_pagelist);
+					&compound_pagelist, HPAGE_PMD_ORDER);
 		spin_unlock(pte_ptl);
 	} else {
 		result = SCAN_PMD_NULL;
@@ -1231,7 +1241,7 @@ static int collapse_huge_page(struct mm_struct *mm, unsigned long address,
 
 	result = __collapse_huge_page_copy(pte, folio, pmd, _pmd,
 					   vma, address, pte_ptl,
-					   &compound_pagelist);
+					   &compound_pagelist, HPAGE_PMD_ORDER);
 	pte_unmap(pte);
 	if (unlikely(result != SCAN_SUCCEED))
 		goto out_up_write;
-- 
2.48.1


