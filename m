Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE01325E30
	for <lists+linux-doc@lfdr.de>; Fri, 26 Feb 2021 08:22:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbhBZHTr (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 26 Feb 2021 02:19:47 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:9360 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230024AbhBZHTq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Feb 2021 02:19:46 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B6038a0e90002>; Thu, 25 Feb 2021 23:19:05 -0800
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 26 Feb
 2021 07:19:04 +0000
From:   Alistair Popple <apopple@nvidia.com>
To:     <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
        <bskeggs@redhat.com>, <akpm@linux-foundation.org>
CC:     <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <jhubbard@nvidia.com>,
        <rcampbell@nvidia.com>, <jglisse@redhat.com>, <jgg@nvidia.com>,
        <hch@infradead.org>, <daniel@ffwll.ch>,
        Alistair Popple <apopple@nvidia.com>
Subject: [PATCH v3 4/8] mm/rmap: Split migration into its own function
Date:   Fri, 26 Feb 2021 18:18:28 +1100
Message-ID: <20210226071832.31547-5-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210226071832.31547-1-apopple@nvidia.com>
References: <20210226071832.31547-1-apopple@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1614323945; bh=uwlSJa1JI7gh5le65pKveBuWQEpnwuhdYYEE3y8stas=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding:Content-Type:
         X-Originating-IP:X-ClientProxiedBy;
        b=cRWcYucL2QetzZCqcMkfmaOP0sULsCGHtRqNBfsakG98U1aMO8TxE47CXAc1b/4rA
         p6W8SRGv5QFM9z7GrS0bkyT7E2+Qhhl4ff+R5ZON0VfCo80AhkhLVT+5lWgGVkV2bG
         GQ7WXUOGSz1LTeETTh2n+zn6A0G3alTqKSS3+7NG7F8pn2iEfMpSIE4DMOxa6R2LXo
         XDazq1PQ78jo1mQ15dlin+o+NZ3bC26sHXRqOgToqqXfT2aB+gO7ovLw9tOWQu0mIc
         ApIUmANxy3fjo57wUbVd/Wo/6VITu0bT38zNyx9Wr7rV2rBA6UOT+bdFYBkgnxzKS6
         haDBiqEJrbM2w==
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Migration is currently implemented as a mode of operation for
try_to_unmap_one() generally specified by passing the TTU_MIGRATION flag
or in the case of splitting a huge anonymous page TTU_SPLIT_FREEZE.

However it does not have much in common with the rest of the unmap
functionality of try_to_unmap_one() and thus splitting it into a
separate function reduces the complexity of try_to_unmap_one() making it
more readable.

Several simplifications can also be made in try_to_migrate_one() based
on the following observations:

 - All users of TTU_MIGRATION also set TTU_IGNORE_MLOCK.
 - No users of TTU_MIGRATION ever set TTU_IGNORE_HWPOISON.
 - No users of TTU_MIGRATION ever set TTU_BATCH_FLUSH.

TTU_SPLIT_FREEZE is a special case of migration used when splitting an
anonymous page. This is most easily dealt with by calling the correct
function from unmap_page() in mm/huge_memory.c  - either
try_to_migrate() for PageAnon or try_to_unmap().

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 include/linux/rmap.h |   4 +-
 mm/huge_memory.c     |  10 +-
 mm/migrate.c         |   9 +-
 mm/rmap.c            | 352 +++++++++++++++++++++++++++++++------------
 4 files changed, 269 insertions(+), 106 deletions(-)

diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index 7f1ee411bd7b..77fa17de51d7 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -86,8 +86,6 @@ struct anon_vma_chain {
 };
=20
 enum ttu_flags {
-	TTU_MIGRATION		=3D 0x1,	/* migration mode */
-
 	TTU_SPLIT_HUGE_PMD	=3D 0x4,	/* split huge PMD if any */
 	TTU_IGNORE_MLOCK	=3D 0x8,	/* ignore mlock */
 	TTU_IGNORE_HWPOISON	=3D 0x20,	/* corrupted page is recoverable */
@@ -96,7 +94,6 @@ enum ttu_flags {
 					 * do a final flush if necessary */
 	TTU_RMAP_LOCKED		=3D 0x80,	/* do not grab rmap lock:
 					 * caller holds it */
-	TTU_SPLIT_FREEZE	=3D 0x100,		/* freeze pte under splitting thp */
 };
=20
 #ifdef CONFIG_MMU
@@ -193,6 +190,7 @@ static inline void page_dup_rmap(struct page *page, boo=
l compound)
 int page_referenced(struct page *, int is_locked,
 			struct mem_cgroup *memcg, unsigned long *vm_flags);
=20
+bool try_to_migrate(struct page *page, enum ttu_flags flags);
 bool try_to_unmap(struct page *, enum ttu_flags flags);
=20
 /* Avoid racy checks */
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index d00b93dc2d9e..357052a4567b 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2351,16 +2351,16 @@ void vma_adjust_trans_huge(struct vm_area_struct *v=
ma,
=20
 static void unmap_page(struct page *page)
 {
-	enum ttu_flags ttu_flags =3D TTU_IGNORE_MLOCK |
-		TTU_RMAP_LOCKED | TTU_SPLIT_HUGE_PMD;
+	enum ttu_flags ttu_flags =3D TTU_RMAP_LOCKED | TTU_SPLIT_HUGE_PMD;
 	bool unmap_success;
=20
 	VM_BUG_ON_PAGE(!PageHead(page), page);
=20
 	if (PageAnon(page))
-		ttu_flags |=3D TTU_SPLIT_FREEZE;
-
-	unmap_success =3D try_to_unmap(page, ttu_flags);
+		unmap_success =3D try_to_migrate(page, ttu_flags);
+	else
+		unmap_success =3D try_to_unmap(page, ttu_flags |
+						TTU_IGNORE_MLOCK);
 	VM_BUG_ON_PAGE(!unmap_success, page);
 }
=20
diff --git a/mm/migrate.c b/mm/migrate.c
index 3033cc42892a..c677028ebe26 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -1124,7 +1124,7 @@ static int __unmap_and_move(struct page *page, struct=
 page *newpage,
 		/* Establish migration ptes */
 		VM_BUG_ON_PAGE(PageAnon(page) && !PageKsm(page) && !anon_vma,
 				page);
-		try_to_unmap(page, TTU_MIGRATION|TTU_IGNORE_MLOCK);
+		try_to_migrate(page, 0);
 		page_was_mapped =3D 1;
 	}
=20
@@ -1326,7 +1326,7 @@ static int unmap_and_move_huge_page(new_page_t get_ne=
w_page,
=20
 	if (page_mapped(hpage)) {
 		bool mapping_locked =3D false;
-		enum ttu_flags ttu =3D TTU_MIGRATION|TTU_IGNORE_MLOCK;
+		enum ttu_flags ttu =3D 0;
=20
 		if (!PageAnon(hpage)) {
 			/*
@@ -1343,7 +1343,7 @@ static int unmap_and_move_huge_page(new_page_t get_ne=
w_page,
 			ttu |=3D TTU_RMAP_LOCKED;
 		}
=20
-		try_to_unmap(hpage, ttu);
+		try_to_migrate(hpage, ttu);
 		page_was_mapped =3D 1;
=20
 		if (mapping_locked)
@@ -2750,7 +2750,6 @@ static void migrate_vma_prepare(struct migrate_vma *m=
igrate)
  */
 static void migrate_vma_unmap(struct migrate_vma *migrate)
 {
-	int flags =3D TTU_MIGRATION | TTU_IGNORE_MLOCK;
 	const unsigned long npages =3D migrate->npages;
 	const unsigned long start =3D migrate->start;
 	unsigned long addr, i, restore =3D 0;
@@ -2762,7 +2761,7 @@ static void migrate_vma_unmap(struct migrate_vma *mig=
rate)
 			continue;
=20
 		if (page_mapped(page)) {
-			try_to_unmap(page, flags);
+			try_to_migrate(page, 0);
 			if (page_mapped(page))
 				goto restore;
 		}
diff --git a/mm/rmap.c b/mm/rmap.c
index 850eecdd866a..6e6e77de1459 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1391,14 +1391,8 @@ static bool try_to_unmap_one(struct page *page, stru=
ct vm_area_struct *vma,
 	struct mmu_notifier_range range;
 	enum ttu_flags flags =3D (enum ttu_flags)(long)arg;
=20
-	if (IS_ENABLED(CONFIG_MIGRATION) && (flags & TTU_MIGRATION) &&
-	    is_zone_device_page(page) && !is_device_private_page(page))
-		return true;
-
-	if (flags & TTU_SPLIT_HUGE_PMD) {
-		split_huge_pmd_address(vma, address,
-				flags & TTU_SPLIT_FREEZE, page);
-	}
+	if (flags & TTU_SPLIT_HUGE_PMD)
+		split_huge_pmd_address(vma, address, false, page);
=20
 	/*
 	 * For THP, we have to assume the worse case ie pmd for invalidation.
@@ -1422,16 +1416,6 @@ static bool try_to_unmap_one(struct page *page, stru=
ct vm_area_struct *vma,
 	mmu_notifier_invalidate_range_start(&range);
=20
 	while (page_vma_mapped_walk(&pvmw)) {
-#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
-		/* PMD-mapped THP migration entry */
-		if (!pvmw.pte && (flags & TTU_MIGRATION)) {
-			VM_BUG_ON_PAGE(PageHuge(page) || !PageTransCompound(page), page);
-
-			set_pmd_migration_entry(&pvmw, page);
-			continue;
-		}
-#endif
-
 		/*
 		 * If the page is mlock()d, we cannot swap it out.
 		 * If it's recently referenced (perhaps page_referenced
@@ -1493,46 +1477,6 @@ static bool try_to_unmap_one(struct page *page, stru=
ct vm_area_struct *vma,
 			}
 		}
=20
-		if (IS_ENABLED(CONFIG_MIGRATION) &&
-		    (flags & TTU_MIGRATION) &&
-		    is_zone_device_page(page)) {
-			swp_entry_t entry;
-			pte_t swp_pte;
-
-			pteval =3D ptep_get_and_clear(mm, pvmw.address, pvmw.pte);
-
-			/*
-			 * Store the pfn of the page in a special migration
-			 * pte. do_swap_page() will wait until the migration
-			 * pte is removed and then restart fault handling.
-			 */
-			entry =3D make_readable_migration_entry(page_to_pfn(page));
-			swp_pte =3D swp_entry_to_pte(entry);
-
-			/*
-			 * pteval maps a zone device page and is therefore
-			 * a swap pte.
-			 */
-			if (pte_swp_soft_dirty(pteval))
-				swp_pte =3D pte_swp_mksoft_dirty(swp_pte);
-			if (pte_swp_uffd_wp(pteval))
-				swp_pte =3D pte_swp_mkuffd_wp(swp_pte);
-			set_pte_at(mm, pvmw.address, pvmw.pte, swp_pte);
-			/*
-			 * No need to invalidate here it will synchronize on
-			 * against the special swap migration pte.
-			 *
-			 * The assignment to subpage above was computed from a
-			 * swap PTE which results in an invalid pointer.
-			 * Since only PAGE_SIZE pages can currently be
-			 * migrated, just set it to page. This will need to be
-			 * changed when hugepage migrations to device private
-			 * memory are supported.
-			 */
-			subpage =3D page;
-			goto discard;
-		}
-
 		/* Nuke the page table entry. */
 		flush_cache_page(vma, address, pte_pfn(*pvmw.pte));
 		if (should_defer_flush(mm, flags)) {
@@ -1585,39 +1529,6 @@ static bool try_to_unmap_one(struct page *page, stru=
ct vm_area_struct *vma,
 			/* We have to invalidate as we cleared the pte */
 			mmu_notifier_invalidate_range(mm, address,
 						      address + PAGE_SIZE);
-		} else if (IS_ENABLED(CONFIG_MIGRATION) &&
-				(flags & (TTU_MIGRATION|TTU_SPLIT_FREEZE))) {
-			swp_entry_t entry;
-			pte_t swp_pte;
-
-			if (arch_unmap_one(mm, vma, address, pteval) < 0) {
-				set_pte_at(mm, address, pvmw.pte, pteval);
-				ret =3D false;
-				page_vma_mapped_walk_done(&pvmw);
-				break;
-			}
-
-			/*
-			 * Store the pfn of the page in a special migration
-			 * pte. do_swap_page() will wait until the migration
-			 * pte is removed and then restart fault handling.
-			 */
-			if (pte_write(pteval))
-				entry =3D make_writable_migration_entry(
-							page_to_pfn(subpage));
-			else
-				entry =3D make_readable_migration_entry(
-							page_to_pfn(subpage));
-			swp_pte =3D swp_entry_to_pte(entry);
-			if (pte_soft_dirty(pteval))
-				swp_pte =3D pte_swp_mksoft_dirty(swp_pte);
-			if (pte_uffd_wp(pteval))
-				swp_pte =3D pte_swp_mkuffd_wp(swp_pte);
-			set_pte_at(mm, address, pvmw.pte, swp_pte);
-			/*
-			 * No need to invalidate here it will synchronize on
-			 * against the special swap migration pte.
-			 */
 		} else if (PageAnon(page)) {
 			swp_entry_t entry =3D { .val =3D page_private(subpage) };
 			pte_t swp_pte;
@@ -1744,6 +1655,262 @@ bool try_to_unmap(struct page *page, enum ttu_flags=
 flags)
 		.anon_lock =3D page_lock_anon_vma_read,
 	};
=20
+	if (flags & TTU_RMAP_LOCKED)
+		rmap_walk_locked(page, &rwc);
+	else
+		rmap_walk(page, &rwc);
+
+	return !page_mapcount(page) ? true : false;
+}
+
+/*
+ * @arg: enum ttu_flags will be passed to this argument
+ */
+static bool try_to_migrate_one(struct page *page, struct vm_area_struct *v=
ma,
+		     unsigned long address, void *arg)
+{
+	struct mm_struct *mm =3D vma->vm_mm;
+	struct page_vma_mapped_walk pvmw =3D {
+		.page =3D page,
+		.vma =3D vma,
+		.address =3D address,
+	};
+	pte_t pteval;
+	struct page *subpage;
+	bool ret =3D true;
+	struct mmu_notifier_range range;
+	enum ttu_flags flags =3D (enum ttu_flags)(long)arg;
+
+	if (is_zone_device_page(page) && !is_device_private_page(page))
+		return true;
+
+	/*
+	 * unmap_page() in mm/huge_memory.c is the only user of migration with
+	 * TTU_SPLIT_HUGE_PMD and it wants to freeze.
+	 */
+	if (flags & TTU_SPLIT_HUGE_PMD)
+		split_huge_pmd_address(vma, address, true, page);
+
+	/*
+	 * For THP, we have to assume the worse case ie pmd for invalidation.
+	 * For hugetlb, it could be much worse if we need to do pud
+	 * invalidation in the case of pmd sharing.
+	 *
+	 * Note that the page can not be free in this function as call of
+	 * try_to_unmap() must hold a reference on the page.
+	 */
+	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma, vma->vm_mm,
+				address,
+				min(vma->vm_end, address + page_size(page)));
+	if (PageHuge(page)) {
+		/*
+		 * If sharing is possible, start and end will be adjusted
+		 * accordingly.
+		 */
+		adjust_range_if_pmd_sharing_possible(vma, &range.start,
+						     &range.end);
+	}
+	mmu_notifier_invalidate_range_start(&range);
+
+	while (page_vma_mapped_walk(&pvmw)) {
+#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
+		/* PMD-mapped THP migration entry */
+		if (!pvmw.pte) {
+			VM_BUG_ON_PAGE(PageHuge(page) ||
+				       !PageTransCompound(page), page);
+
+			set_pmd_migration_entry(&pvmw, page);
+			continue;
+		}
+#endif
+
+		/* Unexpected PMD-mapped THP? */
+		VM_BUG_ON_PAGE(!pvmw.pte, page);
+
+		subpage =3D page - page_to_pfn(page) + pte_pfn(*pvmw.pte);
+		address =3D pvmw.address;
+
+		if (PageHuge(page) && !PageAnon(page)) {
+			/*
+			 * To call huge_pmd_unshare, i_mmap_rwsem must be
+			 * held in write mode.  Caller needs to explicitly
+			 * do this outside rmap routines.
+			 */
+			VM_BUG_ON(!(flags & TTU_RMAP_LOCKED));
+			if (huge_pmd_unshare(mm, vma, &address, pvmw.pte)) {
+				/*
+				 * huge_pmd_unshare unmapped an entire PMD
+				 * page.  There is no way of knowing exactly
+				 * which PMDs may be cached for this mm, so
+				 * we must flush them all.  start/end were
+				 * already adjusted above to cover this range.
+				 */
+				flush_cache_range(vma, range.start, range.end);
+				flush_tlb_range(vma, range.start, range.end);
+				mmu_notifier_invalidate_range(mm, range.start,
+							      range.end);
+
+				/*
+				 * The ref count of the PMD page was dropped
+				 * which is part of the way map counting
+				 * is done for shared PMDs.  Return 'true'
+				 * here.  When there is no other sharing,
+				 * huge_pmd_unshare returns false and we will
+				 * unmap the actual page and drop map count
+				 * to zero.
+				 */
+				page_vma_mapped_walk_done(&pvmw);
+				break;
+			}
+		}
+
+		/* Nuke the page table entry. */
+		flush_cache_page(vma, address, pte_pfn(*pvmw.pte));
+		pteval =3D ptep_clear_flush(vma, address, pvmw.pte);
+
+		/* Move the dirty bit to the page. Now the pte is gone. */
+		if (pte_dirty(pteval))
+			set_page_dirty(page);
+
+		/* Update high watermark before we lower rss */
+		update_hiwater_rss(mm);
+
+		if (is_zone_device_page(page)) {
+			swp_entry_t entry;
+			pte_t swp_pte;
+
+			/*
+			 * Store the pfn of the page in a special migration
+			 * pte. do_swap_page() will wait until the migration
+			 * pte is removed and then restart fault handling.
+			 */
+			entry =3D make_readable_migration_entry(
+							page_to_pfn(page));
+			swp_pte =3D swp_entry_to_pte(entry);
+
+			/*
+			 * pteval maps a zone device page and is therefore
+			 * a swap pte.
+			 */
+			if (pte_swp_soft_dirty(pteval))
+				swp_pte =3D pte_swp_mksoft_dirty(swp_pte);
+			if (pte_swp_uffd_wp(pteval))
+				swp_pte =3D pte_swp_mkuffd_wp(swp_pte);
+			set_pte_at(mm, pvmw.address, pvmw.pte, swp_pte);
+			/*
+			 * No need to invalidate here it will synchronize on
+			 * against the special swap migration pte.
+			 *
+			 * The assignment to subpage above was computed from a
+			 * swap PTE which results in an invalid pointer.
+			 * Since only PAGE_SIZE pages can currently be
+			 * migrated, just set it to page. This will need to be
+			 * changed when hugepage migrations to device private
+			 * memory are supported.
+			 */
+			subpage =3D page;
+		} else if (PageHWPoison(page)) {
+			pteval =3D swp_entry_to_pte(make_hwpoison_entry(subpage));
+			if (PageHuge(page)) {
+				hugetlb_count_sub(compound_nr(page), mm);
+				set_huge_swap_pte_at(mm, address,
+						     pvmw.pte, pteval,
+						     vma_mmu_pagesize(vma));
+			} else {
+				dec_mm_counter(mm, mm_counter(page));
+				set_pte_at(mm, address, pvmw.pte, pteval);
+			}
+
+		} else if (pte_unused(pteval) && !userfaultfd_armed(vma)) {
+			/*
+			 * The guest indicated that the page content is of no
+			 * interest anymore. Simply discard the pte, vmscan
+			 * will take care of the rest.
+			 * A future reference will then fault in a new zero
+			 * page. When userfaultfd is active, we must not drop
+			 * this page though, as its main user (postcopy
+			 * migration) will not expect userfaults on already
+			 * copied pages.
+			 */
+			dec_mm_counter(mm, mm_counter(page));
+			/* We have to invalidate as we cleared the pte */
+			mmu_notifier_invalidate_range(mm, address,
+						      address + PAGE_SIZE);
+		} else {
+			swp_entry_t entry;
+			pte_t swp_pte;
+
+			if (arch_unmap_one(mm, vma, address, pteval) < 0) {
+				set_pte_at(mm, address, pvmw.pte, pteval);
+				ret =3D false;
+				page_vma_mapped_walk_done(&pvmw);
+				break;
+			}
+
+			/*
+			 * Store the pfn of the page in a special migration
+			 * pte. do_swap_page() will wait until the migration
+			 * pte is removed and then restart fault handling.
+			 */
+			if (pte_write(pteval))
+				entry =3D make_writable_migration_entry(
+							page_to_pfn(subpage));
+			else
+				entry =3D make_readable_migration_entry(
+							page_to_pfn(subpage));
+
+			swp_pte =3D swp_entry_to_pte(entry);
+			if (pte_soft_dirty(pteval))
+				swp_pte =3D pte_swp_mksoft_dirty(swp_pte);
+			if (pte_uffd_wp(pteval))
+				swp_pte =3D pte_swp_mkuffd_wp(swp_pte);
+			set_pte_at(mm, address, pvmw.pte, swp_pte);
+			/*
+			 * No need to invalidate here it will synchronize on
+			 * against the special swap migration pte.
+			 */
+		}
+
+		/*
+		 * No need to call mmu_notifier_invalidate_range() it has be
+		 * done above for all cases requiring it to happen under page
+		 * table lock before mmu_notifier_invalidate_range_end()
+		 *
+		 * See Documentation/vm/mmu_notifier.rst
+		 */
+		page_remove_rmap(subpage, PageHuge(page));
+		put_page(page);
+	}
+
+	mmu_notifier_invalidate_range_end(&range);
+
+	return ret;
+}
+
+/**
+ * try_to_migrate - try to replace all page table mappings with swap entri=
es
+ * @page: the page to replace page table entries for
+ * @flags: action and flags
+ *
+ * Tries to remove all the page table entries which are mapping this page =
and
+ * replace them with special swap entries. Caller must hold the page lock.
+ *
+ * If is successful, return true. Otherwise, false.
+ */
+bool try_to_migrate(struct page *page, enum ttu_flags flags)
+{
+	struct rmap_walk_control rwc =3D {
+		.rmap_one =3D try_to_migrate_one,
+		.arg =3D (void *)flags,
+		.done =3D page_mapcount_is_zero,
+		.anon_lock =3D page_lock_anon_vma_read,
+	};
+
+	/* Migration always ignores mlock */
+	if (WARN_ON_ONCE((flags & TTU_IGNORE_MLOCK)) ||
+	    WARN_ON_ONCE(flags & TTU_BATCH_FLUSH))
+		return false;
+
 	/*
 	 * During exec, a temporary VMA is setup and later moved.
 	 * The VMA is moved under the anon_vma lock but not the
@@ -1752,8 +1919,7 @@ bool try_to_unmap(struct page *page, enum ttu_flags f=
lags)
 	 * locking requirements of exec(), migration skips
 	 * temporary VMAs until after exec() completes.
 	 */
-	if ((flags & (TTU_MIGRATION|TTU_SPLIT_FREEZE))
-	    && !PageKsm(page) && PageAnon(page))
+	if (!PageKsm(page) && PageAnon(page))
 		rwc.invalid_vma =3D invalid_migration_vma;
=20
 	if (flags & TTU_RMAP_LOCKED)
--=20
2.20.1

