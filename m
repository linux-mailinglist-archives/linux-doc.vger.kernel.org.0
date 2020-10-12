Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53E7D28BC78
	for <lists+linux-doc@lfdr.de>; Mon, 12 Oct 2020 17:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390380AbgJLPlO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 12 Oct 2020 11:41:14 -0400
Received: from mga05.intel.com ([192.55.52.43]:1378 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390296AbgJLPkH (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 12 Oct 2020 11:40:07 -0400
IronPort-SDR: 8koNSdEZ5k9Vng1oHlk5CI6+ZUjhHESngJzHFIsTHJD4j0rEeAumFaHmeIcj1DtF3cHBHFVH18
 CHXkk5vTJAyw==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="250452686"
X-IronPort-AV: E=Sophos;i="5.77,367,1596524400"; 
   d="scan'208";a="250452686"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2020 08:39:53 -0700
IronPort-SDR: wjtrvKbogb9ov3C22unx12prcpqrKjrlTq++kjiHUlzs7pdi1GOxOnN7HVFU/D5KnO3BKYqyM/
 5BogER5dFWIg==
X-IronPort-AV: E=Sophos;i="5.77,367,1596524400"; 
   d="scan'208";a="530010871"
Received: from yyu32-desk.sc.intel.com ([143.183.136.146])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2020 08:39:52 -0700
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
        Pengfei Xu <pengfei.xu@intel.com>
Cc:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Subject: [PATCH v14 14/26] x86/mm: Update maybe_mkwrite() for shadow stack
Date:   Mon, 12 Oct 2020 08:38:38 -0700
Message-Id: <20201012153850.26996-15-yu-cheng.yu@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201012153850.26996-1-yu-cheng.yu@intel.com>
References: <20201012153850.26996-1-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Shadow stack memory is writable, but its VMA has VM_SHSTK instead of
VM_WRITE.  Update maybe_mkwrite() to include the shadow stack.

Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
---
 arch/x86/Kconfig        |  4 ++++
 arch/x86/mm/pgtable.c   | 18 ++++++++++++++++++
 include/linux/mm.h      |  2 ++
 include/linux/pgtable.h | 24 ++++++++++++++++++++++++
 mm/huge_memory.c        |  2 ++
 5 files changed, 50 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 415fcc869afc..7578327226e3 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1935,6 +1935,9 @@ config AS_HAS_SHADOW_STACK
 config X86_CET
 	def_bool n
 
+config ARCH_MAYBE_MKWRITE
+	def_bool n
+
 config ARCH_HAS_SHADOW_STACK
 	def_bool n
 
@@ -1945,6 +1948,7 @@ config X86_SHADOW_STACK_USER
 	depends on AS_HAS_SHADOW_STACK
 	select ARCH_USES_HIGH_VMA_FLAGS
 	select X86_CET
+	select ARCH_MAYBE_MKWRITE
 	select ARCH_HAS_SHADOW_STACK
 	help
 	  Shadow Stacks provides protection against program stack
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index dfd82f51ba66..a9666b64bc05 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -610,6 +610,24 @@ int pmdp_clear_flush_young(struct vm_area_struct *vma,
 }
 #endif
 
+#ifdef CONFIG_ARCH_MAYBE_MKWRITE
+pte_t arch_maybe_mkwrite(pte_t pte, struct vm_area_struct *vma)
+{
+	if (likely(vma->vm_flags & VM_SHSTK))
+		pte = pte_mkwrite_shstk(pte);
+	return pte;
+}
+
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+pmd_t arch_maybe_pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma)
+{
+	if (likely(vma->vm_flags & VM_SHSTK))
+		pmd = pmd_mkwrite_shstk(pmd);
+	return pmd;
+}
+#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
+#endif /* CONFIG_ARCH_MAYBE_MKWRITE */
+
 /**
  * reserve_top_address - reserves a hole in the top of kernel address space
  * @reserve - size of hole to reserve
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 12be96b061c7..4f6305106feb 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -969,6 +969,8 @@ static inline pte_t maybe_mkwrite(pte_t pte, struct vm_area_struct *vma)
 {
 	if (likely(vma->vm_flags & VM_WRITE))
 		pte = pte_mkwrite(pte);
+	else
+		pte = arch_maybe_mkwrite(pte, vma);
 	return pte;
 }
 
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 90654cb63e9e..157f5e726896 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1356,6 +1356,30 @@ static inline bool arch_has_pfn_modify_check(void)
 }
 #endif /* !_HAVE_ARCH_PFN_MODIFY_ALLOWED */
 
+#ifdef CONFIG_MMU
+#ifdef CONFIG_ARCH_MAYBE_MKWRITE
+pte_t arch_maybe_mkwrite(pte_t pte, struct vm_area_struct *vma);
+
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+pmd_t arch_maybe_pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma);
+#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
+
+#else /* !CONFIG_ARCH_MAYBE_MKWRITE */
+static inline pte_t arch_maybe_mkwrite(pte_t pte, struct vm_area_struct *vma)
+{
+	return pte;
+}
+
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+static inline pmd_t arch_maybe_pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma)
+{
+	return pmd;
+}
+#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
+
+#endif /* CONFIG_ARCH_MAYBE_MKWRITE */
+#endif /* CONFIG_MMU */
+
 /*
  * Architecture PAGE_KERNEL_* fallbacks
  *
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index da397779a6d4..01252b00cd06 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -464,6 +464,8 @@ pmd_t maybe_pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma)
 {
 	if (likely(vma->vm_flags & VM_WRITE))
 		pmd = pmd_mkwrite(pmd);
+	else
+		pmd = arch_maybe_pmd_mkwrite(pmd, vma);
 	return pmd;
 }
 
-- 
2.21.0

