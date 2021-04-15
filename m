Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D440F3614E4
	for <lists+linux-doc@lfdr.de>; Fri, 16 Apr 2021 00:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236813AbhDOWRJ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 15 Apr 2021 18:17:09 -0400
Received: from mga14.intel.com ([192.55.52.115]:22373 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235023AbhDOWQn (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 15 Apr 2021 18:16:43 -0400
IronPort-SDR: 1af1lhqTJzcDErH7vUg6a9cqMWJzzwDTbToT3N899IGmtVFALYBhAYn7WwGjGH92PJdhNe+Idl
 7ehIAxAWBClA==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="194513361"
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; 
   d="scan'208";a="194513361"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2021 15:15:37 -0700
IronPort-SDR: 8QKDQHvakxmEqG/LOITayInnTAP/ePp201BcMsAts0BnBeQ3ABafrYu9drXGbbTMfIOx3fFllT
 JUZsNO7FuPjg==
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; 
   d="scan'208";a="451270906"
Received: from yyu32-desk.sc.intel.com ([143.183.136.146])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2021 15:15:36 -0700
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
Subject: [PATCH v25 15/30] x86/mm: Update maybe_mkwrite() for shadow stack
Date:   Thu, 15 Apr 2021 15:14:04 -0700
Message-Id: <20210415221419.31835-16-yu-cheng.yu@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210415221419.31835-1-yu-cheng.yu@intel.com>
References: <20210415221419.31835-1-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When serving a page fault, maybe_mkwrite() makes a PTE writable if its vma
has VM_WRITE.

A shadow stack vma has VM_SHADOW_STACK.  Its PTEs have _PAGE_DIRTY, but not
_PAGE_WRITE.  In fork(), _PAGE_DIRTY is cleared to cause copy-on-write,
and in the page fault handler, _PAGE_DIRTY is restored and the shadow stack
page is writable again.

Introduce an x86 version of maybe_mkwrite(), which sets proper PTE bits
according to VM flags.

Apply the same changes to maybe_pmd_mkwrite().

Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Cc: Kees Cook <keescook@chromium.org>
---
v24:
- Instead of doing arch_maybe_mkwrite(), overwrite maybe*_mkwrite() with
  x86 versions.
- Change VM_SHSTK to VM_SHADOW_STACK.

 arch/x86/include/asm/pgtable.h |  6 ++++++
 arch/x86/mm/pgtable.c          | 20 ++++++++++++++++++++
 include/linux/mm.h             |  2 ++
 mm/huge_memory.c               |  2 ++
 4 files changed, 30 insertions(+)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 46d9394b884f..da5dea417663 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -308,6 +308,9 @@ static inline int pmd_trans_huge(pmd_t pmd)
 	return (pmd_val(pmd) & (_PAGE_PSE|_PAGE_DEVMAP)) == _PAGE_PSE;
 }
 
+#define maybe_pmd_mkwrite maybe_pmd_mkwrite
+extern pmd_t maybe_pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma);
+
 #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
 static inline int pud_trans_huge(pud_t pud)
 {
@@ -1686,6 +1689,9 @@ static inline bool arch_faults_on_old_pte(void)
 	return false;
 }
 
+#define maybe_mkwrite maybe_mkwrite
+extern pte_t maybe_mkwrite(pte_t pte, struct vm_area_struct *vma);
+
 #endif	/* __ASSEMBLY__ */
 
 #endif /* _ASM_X86_PGTABLE_H */
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index f6a9e2e36642..e778dbbef3d8 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -610,6 +610,26 @@ int pmdp_clear_flush_young(struct vm_area_struct *vma,
 }
 #endif
 
+pte_t maybe_mkwrite(pte_t pte, struct vm_area_struct *vma)
+{
+	if (likely(vma->vm_flags & VM_WRITE))
+		pte = pte_mkwrite(pte);
+	else if (likely(vma->vm_flags & VM_SHADOW_STACK))
+		pte = pte_mkwrite_shstk(pte);
+	return pte;
+}
+
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+pmd_t maybe_pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma)
+{
+	if (likely(vma->vm_flags & VM_WRITE))
+		pmd = pmd_mkwrite(pmd);
+	else if (likely(vma->vm_flags & VM_SHADOW_STACK))
+		pmd = pmd_mkwrite_shstk(pmd);
+	return pmd;
+}
+#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
+
 /**
  * reserve_top_address - reserves a hole in the top of kernel address space
  * @reserve - size of hole to reserve
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 08282eb2f195..6ac9b3e9a865 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -993,12 +993,14 @@ void free_compound_page(struct page *page);
  * pte_mkwrite.  But get_user_pages can cause write faults for mappings
  * that do not have writing enabled, when used by access_process_vm.
  */
+#ifndef maybe_mkwrite
 static inline pte_t maybe_mkwrite(pte_t pte, struct vm_area_struct *vma)
 {
 	if (likely(vma->vm_flags & VM_WRITE))
 		pte = pte_mkwrite(pte);
 	return pte;
 }
+#endif
 
 vm_fault_t do_set_pmd(struct vm_fault *vmf, struct page *page);
 void do_set_pte(struct vm_fault *vmf, struct page *page, unsigned long addr);
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index ae907a9c2050..8203bd6ae4bd 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -478,12 +478,14 @@ static int __init setup_transparent_hugepage(char *str)
 }
 __setup("transparent_hugepage=", setup_transparent_hugepage);
 
+#ifndef maybe_pmd_mkwrite
 pmd_t maybe_pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma)
 {
 	if (likely(vma->vm_flags & VM_WRITE))
 		pmd = pmd_mkwrite(pmd);
 	return pmd;
 }
+#endif
 
 #ifdef CONFIG_MEMCG
 static inline struct deferred_split *get_deferred_split_queue(struct page *page)
-- 
2.21.0

