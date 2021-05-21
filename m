Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7643838D0F9
	for <lists+linux-doc@lfdr.de>; Sat, 22 May 2021 00:15:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbhEUWQY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 21 May 2021 18:16:24 -0400
Received: from mga17.intel.com ([192.55.52.151]:65511 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230130AbhEUWPS (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 21 May 2021 18:15:18 -0400
IronPort-SDR: ZmXJ0a/ndiix9Kf/0erxlQ+Xnrn1L3fHY9H/KuKTQXdXTAOyEdh+8RQ3pzN5KwZpoWfKQz+lV0
 sbUZGdylfUAg==
X-IronPort-AV: E=McAfee;i="6200,9189,9991"; a="181874429"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="scan'208";a="181874429"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2021 15:13:15 -0700
IronPort-SDR: 0nI61sLnyA2sB4tdEpTwLDUPPv1FmH58By+rNyHttvLFkc7XFj8g8xpl/kV9C/4s4EuvXdw24t
 rhrGzws1lAhw==
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="scan'208";a="441116195"
Received: from yyu32-desk.sc.intel.com ([143.183.136.146])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2021 15:13:15 -0700
From:   Yu-cheng Yu <yu-cheng.yu@intel.com>
To:     x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@kernel.org>,
        Balbir Singh <bsingharora@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H.J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Weijiang Yang <weijiang.yang@intel.com>,
        Pengfei Xu <pengfei.xu@intel.com>,
        Haitao Huang <haitao.huang@intel.com>
Cc:     Yu-cheng Yu <yu-cheng.yu@intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCH v27 17/31] mm: Fixup places that call pte_mkwrite() directly
Date:   Fri, 21 May 2021 15:11:57 -0700
Message-Id: <20210521221211.29077-18-yu-cheng.yu@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210521221211.29077-1-yu-cheng.yu@intel.com>
References: <20210521221211.29077-1-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When serving a page fault, maybe_mkwrite() makes a PTE writable if it is in
a writable vma.  A shadow stack vma is writable, but its PTEs need
_PAGE_DIRTY to be set to become writable.  For this reason, maybe_mkwrite()
has been updated.

There are a few places that call pte_mkwrite() directly, but have the
same result as from maybe_mkwrite().  These sites need to be updated for
shadow stack as well.  Thus, change them to maybe_mkwrite():

- do_anonymous_page() and migrate_vma_insert_page() check VM_WRITE directly
  and call pte_mkwrite(), which is the same as maybe_mkwrite().  Change
  them to maybe_mkwrite().

- In do_numa_page(), if the numa entry was writable, then pte_mkwrite()
  is called directly.  Fix it by doing maybe_mkwrite().  Make the same
  changes to do_huge_pmd_numa_page().

- In change_pte_range(), pte_mkwrite() is called directly.  Replace it with
  maybe_mkwrite().

Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Cc: Kees Cook <keescook@chromium.org>
---
v25:
- Apply same changes to do_huge_pmd_numa_page() as to do_numa_page().

 mm/huge_memory.c | 2 +-
 mm/memory.c      | 5 ++---
 mm/migrate.c     | 3 +--
 mm/mprotect.c    | 2 +-
 4 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index e613278fe5e1..819f6c32eb5b 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1551,7 +1551,7 @@ vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf, pmd_t pmd)
 	pmd = pmd_modify(pmd, vma->vm_page_prot);
 	pmd = pmd_mkyoung(pmd);
 	if (was_writable)
-		pmd = pmd_mkwrite(pmd);
+		pmd = maybe_pmd_mkwrite(pmd, vma);
 	set_pmd_at(vma->vm_mm, haddr, vmf->pmd, pmd);
 	update_mmu_cache_pmd(vma, vmf->address, vmf->pmd);
 	unlock_page(page);
diff --git a/mm/memory.c b/mm/memory.c
index 730daa00952b..2b6d068587cb 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3602,8 +3602,7 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
 	__SetPageUptodate(page);
 
 	entry = mk_pte(page, vma->vm_page_prot);
-	if (vma->vm_flags & VM_WRITE)
-		entry = pte_mkwrite(pte_mkdirty(entry));
+	entry = maybe_mkwrite(pte_mkdirty(entry), vma);
 
 	vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd, vmf->address,
 			&vmf->ptl);
@@ -4225,7 +4224,7 @@ static vm_fault_t do_numa_page(struct vm_fault *vmf)
 	pte = pte_modify(old_pte, vma->vm_page_prot);
 	pte = pte_mkyoung(pte);
 	if (was_writable)
-		pte = pte_mkwrite(pte);
+		pte = maybe_mkwrite(pte, vma);
 	ptep_modify_prot_commit(vma, vmf->address, vmf->pte, old_pte, pte);
 	update_mmu_cache(vma, vmf->address, vmf->pte);
 	pte_unmap_unlock(vmf->pte, vmf->ptl);
diff --git a/mm/migrate.c b/mm/migrate.c
index b234c3f3acb7..1c307a01d995 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2939,8 +2939,7 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 		}
 	} else {
 		entry = mk_pte(page, vma->vm_page_prot);
-		if (vma->vm_flags & VM_WRITE)
-			entry = pte_mkwrite(pte_mkdirty(entry));
+		entry = maybe_mkwrite(pte_mkdirty(entry), vma);
 	}
 
 	ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
diff --git a/mm/mprotect.c b/mm/mprotect.c
index e7a443157988..819dd14c962a 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -135,7 +135,7 @@ static unsigned long change_pte_range(struct vm_area_struct *vma, pmd_t *pmd,
 			if (dirty_accountable && pte_dirty(ptent) &&
 					(pte_soft_dirty(ptent) ||
 					 !(vma->vm_flags & VM_SOFTDIRTY))) {
-				ptent = pte_mkwrite(ptent);
+				ptent = maybe_mkwrite(ptent, vma);
 			}
 			ptep_modify_prot_commit(vma, addr, pte, oldpte, ptent);
 			pages++;
-- 
2.21.0

