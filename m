Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19C2C32CCA6
	for <lists+linux-doc@lfdr.de>; Thu,  4 Mar 2021 07:19:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234910AbhCDGSD (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 4 Mar 2021 01:18:03 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:4532 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234864AbhCDGRt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Mar 2021 01:17:49 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B60407b640001>; Wed, 03 Mar 2021 22:17:08 -0800
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 4 Mar
 2021 06:17:08 +0000
Received: from localhost (172.20.145.6) by DRHQMAIL107.nvidia.com (10.27.9.16)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 4 Mar 2021 06:17:07
 +0000
From:   Alistair Popple <apopple@nvidia.com>
To:     <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
        <bskeggs@redhat.com>, <akpm@linux-foundation.org>
CC:     <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kvm-ppc@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <jhubbard@nvidia.com>, <rcampbell@nvidia.com>,
        <jglisse@redhat.com>, "Alistair Popple" <apopple@nvidia.com>
Subject: [PATCH v4 5/8] mm: Device exclusive memory access
Date:   Thu, 4 Mar 2021 17:16:42 +1100
Message-ID: <20210304061645.29747-6-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210304061645.29747-1-apopple@nvidia.com>
References: <20210304061645.29747-1-apopple@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1614838628; bh=hoEvOaAOVjWfFhzIIbnfE7wLP3jmU1Vny5LtVXS0MWc=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding:Content-Type:
         X-Originating-IP:X-ClientProxiedBy;
        b=m3B8Qhhx8JhLS5yNN9mT3PdaAinF8Tg4hfgTzAbW9q/zouemQcqE8jCNhmnfStP6L
         HUXPvIqEYZKZ9MlvqNyDRHIGk0y9J+oasj9gz2SdWxd/KSMmfYfq/2CbnEpgvLnf3Z
         +BS7+TgLrfpjO8U4GSpYrNtNuhn6jrjryixFhDPVhx0OLNOLrXsBE1ppDM29jANgah
         ijZr/UxyKbXSAli14odvEe7CwGpnkapkuKjuFFo1rFputhsAlRgxiyUztBDRTcyq+X
         37wZGhZCJ1qfTTyNtU9jAUzadi8MbSGPMViE4EzuIr1y/26vqkd9GBOtFQ5aisFtaQ
         ynXjqtqI27T2w==
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Some devices require exclusive write access to shared virtual
memory (SVM) ranges to perform atomic operations on that memory. This
requires CPU page tables to be updated to deny access whilst atomic
operations are occurring.

In order to do this introduce a new swap entry
type (SWP_DEVICE_EXCLUSIVE). When a SVM range needs to be marked for
exclusive access by a device all page table mappings for the particular
range are replaced with device exclusive swap entries. This causes any
CPU access to the page to result in a fault.

Faults are resovled by replacing the faulting entry with the original
mapping. This results in MMU notifiers being called which a driver uses
to update access permissions such as revoking atomic access. After
notifiers have been called the device will no longer have exclusive
access to the region.

Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

v4:
* Add function to check that mappings are still valid and exclusive.
* s/long/unsigned long/ in make_device_exclusive_entry().
---
 Documentation/vm/hmm.rst |  15 +++
 include/linux/rmap.h     |   5 +
 include/linux/swap.h     |   4 +-
 include/linux/swapops.h  |  44 +++++++-
 mm/hmm.c                 |   5 +
 mm/memory.c              | 107 +++++++++++++++++-
 mm/mprotect.c            |   8 ++
 mm/page_vma_mapped.c     |   9 +-
 mm/rmap.c                | 230 +++++++++++++++++++++++++++++++++++++++
 9 files changed, 420 insertions(+), 7 deletions(-)

diff --git a/Documentation/vm/hmm.rst b/Documentation/vm/hmm.rst
index 09e28507f5b2..f526ac4d8798 100644
--- a/Documentation/vm/hmm.rst
+++ b/Documentation/vm/hmm.rst
@@ -405,6 +405,21 @@ between device driver specific code and shared common =
code:
=20
    The lock can now be released.
=20
+Exclusive access memory
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Not all devices support atomic access to system memory. To support atomic
+operations to a shared virtual memory page such a device needs access to t=
hat
+page which is exclusive of any userspace access from the CPU. The
+``make_device_exclusive_range()`` function can be used to make a memory ra=
nge
+inaccessible from userspace.
+
+This replaces all mappings for pages in the given range with special swap
+entries. Any attempt to access the swap entry results in a fault which is
+resovled by replacing the entry with the original mapping. A driver gets
+notified that the mapping has been changed by MMU notifiers, after which p=
oint
+it will no longer have exclusive access to the page.
+
 Memory cgroup (memcg) and rss accounting
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index 77fa17de51d7..93cbb88f7253 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -193,6 +193,11 @@ int page_referenced(struct page *, int is_locked,
 bool try_to_migrate(struct page *page, enum ttu_flags flags);
 bool try_to_unmap(struct page *, enum ttu_flags flags);
=20
+int make_device_exclusive_range(struct mm_struct *mm, unsigned long start,
+				unsigned long end, struct page **pages);
+bool check_device_exclusive_range(struct mm_struct *mm, unsigned long star=
t,
+				  unsigned long end, struct page **pages);
+
 /* Avoid racy checks */
 #define PVMW_SYNC		(1 << 0)
 /* Look for migarion entries rather than present PTEs */
diff --git a/include/linux/swap.h b/include/linux/swap.h
index 57a7690966a4..2d8b8e7fb4c2 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -63,9 +63,11 @@ static inline int current_is_kswapd(void)
  * to a special SWP_DEVICE_* entry.
  */
 #ifdef CONFIG_DEVICE_PRIVATE
-#define SWP_DEVICE_NUM 2
+#define SWP_DEVICE_NUM 4
 #define SWP_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM=
)
 #define SWP_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+=
1)
+#define SWP_DEVICE_EXCLUSIVE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIG=
RATION_NUM+2)
+#define SWP_DEVICE_EXCLUSIVE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGR=
ATION_NUM+3)
 #else
 #define SWP_DEVICE_NUM 0
 #endif
diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index 81008b0179cc..20b726e27f37 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -120,6 +120,27 @@ static inline bool is_writable_device_private_entry(sw=
p_entry_t entry)
 {
 	return unlikely(swp_type(entry) =3D=3D SWP_DEVICE_WRITE);
 }
+
+static inline swp_entry_t make_readable_device_exclusive_entry(pgoff_t off=
set)
+{
+	return swp_entry(SWP_DEVICE_EXCLUSIVE_READ, offset);
+}
+
+static inline swp_entry_t make_writable_device_exclusive_entry(pgoff_t off=
set)
+{
+	return swp_entry(SWP_DEVICE_EXCLUSIVE_WRITE, offset);
+}
+
+static inline bool is_device_exclusive_entry(swp_entry_t entry)
+{
+	return swp_type(entry) =3D=3D SWP_DEVICE_EXCLUSIVE_READ ||
+		swp_type(entry) =3D=3D SWP_DEVICE_EXCLUSIVE_WRITE;
+}
+
+static inline bool is_writable_device_exclusive_entry(swp_entry_t entry)
+{
+	return unlikely(swp_type(entry) =3D=3D SWP_DEVICE_EXCLUSIVE_WRITE);
+}
 #else /* CONFIG_DEVICE_PRIVATE */
 static inline swp_entry_t make_readable_device_private_entry(pgoff_t offse=
t)
 {
@@ -140,6 +161,26 @@ static inline bool is_writable_device_private_entry(sw=
p_entry_t entry)
 {
 	return false;
 }
+
+static inline swp_entry_t make_readable_device_exclusive_entry(pgoff_t off=
set)
+{
+	return swp_entry(0, 0);
+}
+
+static inline swp_entry_t make_writable_device_exclusive_entry(pgoff_t off=
set)
+{
+	return swp_entry(0, 0);
+}
+
+static inline bool is_device_exclusive_entry(swp_entry_t entry)
+{
+	return false;
+}
+
+static inline bool is_writable_device_exclusive_entry(swp_entry_t entry)
+{
+	return false;
+}
 #endif /* CONFIG_DEVICE_PRIVATE */
=20
 #ifdef CONFIG_MIGRATION
@@ -219,7 +260,8 @@ static inline struct page *pfn_swap_entry_to_page(swp_e=
ntry_t entry)
  */
 static inline bool is_pfn_swap_entry(swp_entry_t entry)
 {
-	return is_migration_entry(entry) || is_device_private_entry(entry);
+	return is_migration_entry(entry) || is_device_private_entry(entry) ||
+	       is_device_exclusive_entry(entry);
 }
=20
 struct page_vma_mapped_walk;
diff --git a/mm/hmm.c b/mm/hmm.c
index 11df3ca30b82..fad6be2bf072 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -26,6 +26,8 @@
 #include <linux/mmu_notifier.h>
 #include <linux/memory_hotplug.h>
=20
+#include "internal.h"
+
 struct hmm_vma_walk {
 	struct hmm_range	*range;
 	unsigned long		last;
@@ -271,6 +273,9 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, uns=
igned long addr,
 		if (!non_swap_entry(entry))
 			goto fault;
=20
+		if (is_device_exclusive_entry(entry))
+			goto fault;
+
 		if (is_migration_entry(entry)) {
 			pte_unmap(ptep);
 			hmm_vma_walk->last =3D addr;
diff --git a/mm/memory.c b/mm/memory.c
index 957e00525a9a..7ad201710a35 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -769,6 +769,27 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct m=
m_struct *src_mm,
 				pte =3D pte_swp_mkuffd_wp(pte);
 			set_pte_at(src_mm, addr, src_pte, pte);
 		}
+	} else if (is_device_exclusive_entry(entry)) {
+		page =3D pfn_swap_entry_to_page(entry);
+
+		get_page(page);
+		rss[mm_counter(page)]++;
+
+		if (is_writable_device_exclusive_entry(entry) &&
+		    is_cow_mapping(vm_flags)) {
+			/*
+			 * COW mappings require pages in both
+			 * parent and child to be set to read.
+			 */
+			entry =3D make_readable_device_exclusive_entry(
+							swp_offset(entry));
+			pte =3D swp_entry_to_pte(entry);
+			if (pte_swp_soft_dirty(*src_pte))
+				pte =3D pte_swp_mksoft_dirty(pte);
+			if (pte_swp_uffd_wp(*src_pte))
+				pte =3D pte_swp_mkuffd_wp(pte);
+			set_pte_at(src_mm, addr, src_pte, pte);
+		}
 	}
 	set_pte_at(dst_mm, addr, dst_pte, pte);
 	return 0;
@@ -1275,7 +1296,8 @@ static unsigned long zap_pte_range(struct mmu_gather =
*tlb,
 		}
=20
 		entry =3D pte_to_swp_entry(ptent);
-		if (is_device_private_entry(entry)) {
+		if (is_device_private_entry(entry) ||
+		    is_device_exclusive_entry(entry)) {
 			struct page *page =3D pfn_swap_entry_to_page(entry);
=20
 			if (unlikely(details && details->check_mapping)) {
@@ -1291,7 +1313,10 @@ static unsigned long zap_pte_range(struct mmu_gather=
 *tlb,
=20
 			pte_clear_not_present_full(mm, addr, pte, tlb->fullmm);
 			rss[mm_counter(page)]--;
-			page_remove_rmap(page, false);
+
+			if (is_device_private_entry(entry))
+				page_remove_rmap(page, false);
+
 			put_page(page);
 			continue;
 		}
@@ -3245,6 +3270,81 @@ void unmap_mapping_range(struct address_space *mappi=
ng,
 }
 EXPORT_SYMBOL(unmap_mapping_range);
=20
+static void restore_exclusive_pte(struct vm_area_struct *vma,
+				  struct page *page, unsigned long address,
+				  pte_t *ptep)
+{
+	pte_t pte;
+	swp_entry_t entry;
+
+	pte =3D pte_mkold(mk_pte(page, READ_ONCE(vma->vm_page_prot)));
+	if (pte_swp_soft_dirty(*ptep))
+		pte =3D pte_mksoft_dirty(pte);
+
+	entry =3D pte_to_swp_entry(*ptep);
+	if (pte_swp_uffd_wp(*ptep))
+		pte =3D pte_mkuffd_wp(pte);
+	else if (is_writable_device_exclusive_entry(entry))
+		pte =3D maybe_mkwrite(pte_mkdirty(pte), vma);
+
+	set_pte_at(vma->vm_mm, address, ptep, pte);
+
+	/*
+	 * No need to take a page reference as one was already
+	 * created when the swap entry was made.
+	 */
+	if (PageAnon(page))
+		page_add_anon_rmap(page, vma, address, false);
+	else
+		page_add_file_rmap(page, false);
+
+	if (vma->vm_flags & VM_LOCKED)
+		mlock_vma_page(page);
+
+	/*
+	 * No need to invalidate - it was non-present before. However
+	 * secondary CPUs may have mappings that need invalidating.
+	 */
+	update_mmu_cache(vma, address, ptep);
+}
+
+/*
+ * Restore a potential device exclusive pte to a working pte entry
+ */
+static vm_fault_t remove_device_exclusive_entry(struct vm_fault *vmf)
+{
+	struct page *page =3D vmf->page;
+	struct vm_area_struct *vma =3D vmf->vma;
+	struct page_vma_mapped_walk pvmw =3D {
+		.page =3D page,
+		.vma =3D vma,
+		.address =3D vmf->address,
+		.flags =3D PVMW_SYNC,
+	};
+	vm_fault_t ret =3D 0;
+	struct mmu_notifier_range range;
+
+	lock_page(page);
+	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma, vma->vm_mm,
+				vmf->address & PAGE_MASK,
+				(vmf->address & PAGE_MASK) + PAGE_SIZE);
+	mmu_notifier_invalidate_range_start(&range);
+
+	while (page_vma_mapped_walk(&pvmw)) {
+		if (unlikely(!pte_same(*pvmw.pte, vmf->orig_pte))) {
+			page_vma_mapped_walk_done(&pvmw);
+			break;
+		}
+
+		restore_exclusive_pte(vma, page, pvmw.address, pvmw.pte);
+	}
+
+	unlock_page(page);
+
+	mmu_notifier_invalidate_range_end(&range);
+	return ret;
+}
+
 /*
  * We enter with non-exclusive mmap_lock (to exclude vma changes,
  * but allow concurrent faults), and pte mapped but not yet locked.
@@ -3272,6 +3372,9 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 		if (is_migration_entry(entry)) {
 			migration_entry_wait(vma->vm_mm, vmf->pmd,
 					     vmf->address);
+		} else if (is_device_exclusive_entry(entry)) {
+			vmf->page =3D pfn_swap_entry_to_page(entry);
+			ret =3D remove_device_exclusive_entry(vmf);
 		} else if (is_device_private_entry(entry)) {
 			vmf->page =3D pfn_swap_entry_to_page(entry);
 			ret =3D vmf->page->pgmap->ops->migrate_to_ram(vmf);
diff --git a/mm/mprotect.c b/mm/mprotect.c
index a6c757d87789..fc4a7622497f 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -165,6 +165,14 @@ static unsigned long change_pte_range(struct vm_area_s=
truct *vma, pmd_t *pmd,
 				newpte =3D swp_entry_to_pte(entry);
 				if (pte_swp_uffd_wp(oldpte))
 					newpte =3D pte_swp_mkuffd_wp(newpte);
+			} else if (is_writable_device_exclusive_entry(entry)) {
+				entry =3D make_readable_device_exclusive_entry(
+							swp_offset(entry));
+				newpte =3D swp_entry_to_pte(entry);
+				if (pte_swp_soft_dirty(oldpte))
+					newpte =3D pte_swp_mksoft_dirty(newpte);
+				if (pte_swp_uffd_wp(oldpte))
+					newpte =3D pte_swp_mkuffd_wp(newpte);
 			} else {
 				newpte =3D oldpte;
 			}
diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index eed988ab2e81..29842f169219 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -41,7 +41,8 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw)
=20
 				/* Handle un-addressable ZONE_DEVICE memory */
 				entry =3D pte_to_swp_entry(*pvmw->pte);
-				if (!is_device_private_entry(entry))
+				if (!is_device_private_entry(entry) &&
+				    !is_device_exclusive_entry(entry))
 					return false;
 			} else if (!pte_present(*pvmw->pte))
 				return false;
@@ -93,7 +94,8 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw)
 			return false;
 		entry =3D pte_to_swp_entry(*pvmw->pte);
=20
-		if (!is_migration_entry(entry))
+		if (!is_migration_entry(entry) &&
+		    !is_device_exclusive_entry(entry))
 			return false;
=20
 		pfn =3D swp_offset(entry);
@@ -102,7 +104,8 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw=
)
=20
 		/* Handle un-addressable ZONE_DEVICE memory */
 		entry =3D pte_to_swp_entry(*pvmw->pte);
-		if (!is_device_private_entry(entry))
+		if (!is_device_private_entry(entry) &&
+		    !is_device_exclusive_entry(entry))
 			return false;
=20
 		pfn =3D swp_offset(entry);
diff --git a/mm/rmap.c b/mm/rmap.c
index 15c012d30f05..dbab4ec70c2a 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1990,6 +1990,236 @@ void try_to_munlock(struct page *page)
 	rmap_walk(page, &rwc);
 }
=20
+static bool try_to_protect_one(struct page *page, struct vm_area_struct *v=
ma,
+			unsigned long address, void *arg)
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
+	swp_entry_t entry;
+	pte_t swp_pte;
+
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
+		/* Unexpected PMD-mapped THP? */
+		VM_BUG_ON_PAGE(!pvmw.pte, page);
+
+		if (!pte_present(*pvmw.pte)) {
+			ret =3D false;
+			page_vma_mapped_walk_done(&pvmw);
+			break;
+		}
+
+		subpage =3D page - page_to_pfn(page) + pte_pfn(*pvmw.pte);
+		address =3D pvmw.address;
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
+		if (arch_unmap_one(mm, vma, address, pteval) < 0) {
+			set_pte_at(mm, address, pvmw.pte, pteval);
+			ret =3D false;
+			page_vma_mapped_walk_done(&pvmw);
+			break;
+		}
+
+		/*
+		 * Store the pfn of the page in a special migration
+		 * pte. do_swap_page() will wait until the migration
+		 * pte is removed and then restart fault handling.
+		 */
+		if (pte_write(pteval))
+			entry =3D make_writable_device_exclusive_entry(
+							page_to_pfn(subpage));
+		else
+			entry =3D make_readable_device_exclusive_entry(
+							page_to_pfn(subpage));
+		swp_pte =3D swp_entry_to_pte(entry);
+		if (pte_soft_dirty(pteval))
+			swp_pte =3D pte_swp_mksoft_dirty(swp_pte);
+		if (pte_uffd_wp(pteval))
+			swp_pte =3D pte_swp_mkuffd_wp(swp_pte);
+
+		/* Take a reference for the swap entry */
+		get_page(page);
+		set_pte_at(mm, address, pvmw.pte, swp_pte);
+
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
+ * try_to_protect - try to replace all page table mappings with swap entri=
es
+ * @page: the page to replace page table entries for
+ * @flags: action and flags
+ *
+ * Tries to remove all the page table entries which are mapping this page =
and
+ * replace them with special swap entries to grant a device exclusive acce=
ss to
+ * the page. Caller must hold the page lock.
+ *
+ * If is successful, return true. Otherwise, false.
+ */
+static bool try_to_protect(struct page *page)
+{
+	struct rmap_walk_control rwc =3D {
+		.rmap_one =3D try_to_protect_one,
+		.done =3D page_mapcount_is_zero,
+		.anon_lock =3D page_lock_anon_vma_read,
+	};
+
+	/*
+	 * During exec, a temporary VMA is setup and later moved.
+	 * The VMA is moved under the anon_vma lock but not the
+	 * page tables leading to a race where migration cannot
+	 * find the migration ptes. Rather than increasing the
+	 * locking requirements of exec(), migration skips
+	 * temporary VMAs until after exec() completes.
+	 */
+	if (!PageKsm(page) && PageAnon(page))
+		rwc.invalid_vma =3D invalid_migration_vma;
+
+	rmap_walk(page, &rwc);
+
+	return !page_mapcount(page) ? true : false;
+}
+
+/**
+ * make_device_exclusive_range() - Mark a range for exclusive use by a dev=
ice
+ * @mm: mm_struct of assoicated target process
+ * @start: start of the region to mark for exclusive device access
+ * @end: end address of region
+ * @pages: returns the pages which were successfully marked for exclusive =
access
+ *
+ * Returns: number of pages successfully marked for exclusive access
+ *
+ * This function finds ptes mapping page(s) to the given address range, lo=
cks
+ * them and replaces mappings with special swap entries preventing userspa=
ce CPU
+ * access. On fault these entries are replaced with the original mapping a=
fter
+ * calling MMU notifiers.
+ *
+ * A driver using this to program access from a device must use
+ * check_device_exclusive_range() under a mmu notifier critical section to=
 hold
+ * a device specific lock during programming. Once programming is complete=
 it
+ * should drop the page lock and reference.
+ */
+int make_device_exclusive_range(struct mm_struct *mm, unsigned long start,
+				unsigned long end, struct page **pages)
+{
+	unsigned long npages =3D (end - start) >> PAGE_SHIFT;
+	unsigned long i;
+
+	npages =3D get_user_pages_remote(mm, start, npages,
+				       FOLL_GET | FOLL_WRITE | FOLL_SPLIT_PMD,
+				       pages, NULL, NULL);
+	for (i =3D 0; i < npages; i++, start +=3D PAGE_SIZE) {
+		if (!trylock_page(pages[i])) {
+			put_page(pages[i]);
+			pages[i] =3D NULL;
+			continue;
+		}
+
+		if (!try_to_protect(pages[i])) {
+			unlock_page(pages[i]);
+			put_page(pages[i]);
+			pages[i] =3D NULL;
+		}
+	}
+
+	return npages;
+}
+EXPORT_SYMBOL_GPL(make_device_exclusive_range);
+
+/**
+ * check_device_exclusive_range() - Check a range is marked for exclusive =
use
+ * @mm: mm_struct of assoicated target process
+ * @start: start of the region to mark for exclusive device access
+ * @end: end address of region
+ * @pages: pages to check
+ *
+ * Returns: True if all pages are still mapped writable for exclusive use.
+ *
+ * Callers must use this to check the page is still mapped writable for
+ * exclusive use before programming any device access. This function does =
not
+ * take the PTL so callers must use a mmu interval notifier critical secti=
on for
+ * synchronisation.
+ */
+bool check_device_exclusive_range(struct mm_struct *mm, unsigned long star=
t,
+				  unsigned long end, struct page **pages)
+{
+	unsigned long address, i;
+	pgd_t *pgd;
+	p4d_t *p4d;
+	pud_t *pud;
+	pmd_t *pmd;
+	pte_t *ptep;
+	pte_t pte;
+
+	for (address =3D start, i =3D 0;
+	     address < end;
+	     address +=3D PAGE_SIZE, i++) {
+		pgd =3D pgd_offset(mm, address);
+		if (!pgd_present(*pgd))
+			return false;
+		p4d =3D p4d_offset(pgd, address);
+		if (p4d_none(*p4d))
+			return false;
+		pud =3D pud_offset(p4d, address);
+		if (pud_none(*pud))
+			return false;
+		pmd =3D pmd_offset(pud, address);
+		if (!pmd_present(*pmd) || pmd_huge(*pmd))
+			return false;
+		ptep =3D pte_offset_map(pmd, address);
+		pte =3D ptep_get(ptep);
+		pte_unmap(pte);
+		if (is_swap_pte(pte)) {
+			swp_entry_t entry =3D pte_to_swp_entry(pte);
+
+			if (!is_writable_device_exclusive_entry(entry))
+				return false;
+
+			if (pfn_swap_entry_to_page(entry) !=3D pages[i])
+				return false;
+		} else
+			return false;
+	}
+
+	return true;
+}
+EXPORT_SYMBOL_GPL(check_device_exclusive_range);
+
 void __put_anon_vma(struct anon_vma *anon_vma)
 {
 	struct anon_vma *root =3D anon_vma->root;
--=20
2.20.1

