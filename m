Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45C1D3614ED
	for <lists+linux-doc@lfdr.de>; Fri, 16 Apr 2021 00:17:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236893AbhDOWRR (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 15 Apr 2021 18:17:17 -0400
Received: from mga14.intel.com ([192.55.52.115]:22370 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234985AbhDOWQv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 15 Apr 2021 18:16:51 -0400
IronPort-SDR: Fmbm4sy8a9fK63YYFAgvVapS8S9i6m5fH6AhBE2J8Dc5NNIqTTdmfK1ckrdzOjgFFy0do6Vo0K
 0pyjubQfwwDA==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="194513366"
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; 
   d="scan'208";a="194513366"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2021 15:15:37 -0700
IronPort-SDR: 9WiBEZshtAMDN97srUYWkz8eGsazEbPanaMdCF6rBu9hN8TTPWo41CiLgK86P1kZhwEQW1JFli
 b4xTMGhaJevA==
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; 
   d="scan'208";a="451270915"
Received: from yyu32-desk.sc.intel.com ([143.183.136.146])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2021 15:15:37 -0700
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
Subject: [PATCH v25 17/30] mm: Add guard pages around a shadow stack.
Date:   Thu, 15 Apr 2021 15:14:06 -0700
Message-Id: <20210415221419.31835-18-yu-cheng.yu@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210415221419.31835-1-yu-cheng.yu@intel.com>
References: <20210415221419.31835-1-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

INCSSP(Q/D) increments shadow stack pointer and 'pops and discards' the
first and the last elements in the range, effectively touches those memory
areas.

The maximum moving distance by INCSSPQ is 255 * 8 = 2040 bytes and
255 * 4 = 1020 bytes by INCSSPD.  Both ranges are far from PAGE_SIZE.
Thus, putting a gap page on both ends of a shadow stack prevents INCSSP,
CALL, and RET from going beyond.

Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Cc: Kees Cook <keescook@chromium.org>
---
v25:
- Move SHADOW_STACK_GUARD_GAP to arch/x86/mm/mmap.c.
v24:
- Instead changing vm_*_gap(), create x86-specific versions.

 arch/x86/include/asm/page_types.h |  7 +++++
 arch/x86/mm/mmap.c                | 46 +++++++++++++++++++++++++++++++
 include/linux/mm.h                |  4 +++
 3 files changed, 56 insertions(+)

diff --git a/arch/x86/include/asm/page_types.h b/arch/x86/include/asm/page_types.h
index a506a411474d..e1533fdc08b4 100644
--- a/arch/x86/include/asm/page_types.h
+++ b/arch/x86/include/asm/page_types.h
@@ -73,6 +73,13 @@ bool pfn_range_is_mapped(unsigned long start_pfn, unsigned long end_pfn);
 
 extern void initmem_init(void);
 
+#define vm_start_gap vm_start_gap
+struct vm_area_struct;
+extern unsigned long vm_start_gap(struct vm_area_struct *vma);
+
+#define vm_end_gap vm_end_gap
+extern unsigned long vm_end_gap(struct vm_area_struct *vma);
+
 #endif	/* !__ASSEMBLY__ */
 
 #endif	/* _ASM_X86_PAGE_DEFS_H */
diff --git a/arch/x86/mm/mmap.c b/arch/x86/mm/mmap.c
index f3f52c5e2fd6..3f6455d14d18 100644
--- a/arch/x86/mm/mmap.c
+++ b/arch/x86/mm/mmap.c
@@ -250,3 +250,49 @@ bool pfn_modify_allowed(unsigned long pfn, pgprot_t prot)
 		return false;
 	return true;
 }
+
+/*
+ * Shadow stack pointer is moved by CALL, RET, and INCSSP(Q/D).  INCSSPQ
+ * moves shadow stack pointer up to 255 * 8 = ~2 KB (~1KB for INCSSPD) and
+ * touches the first and the last element in the range, which triggers a
+ * page fault if the range is not in a shadow stack.  Because of this,
+ * creating 4-KB guard pages around a shadow stack prevents these
+ * instructions from going beyond.
+ */
+#define SHADOW_STACK_GUARD_GAP PAGE_SIZE
+
+unsigned long vm_start_gap(struct vm_area_struct *vma)
+{
+	unsigned long vm_start = vma->vm_start;
+	unsigned long gap = 0;
+
+	if (vma->vm_flags & VM_GROWSDOWN)
+		gap = stack_guard_gap;
+	else if (vma->vm_flags & VM_SHADOW_STACK)
+		gap = SHADOW_STACK_GUARD_GAP;
+
+	if (gap != 0) {
+		vm_start -= gap;
+		if (vm_start > vma->vm_start)
+			vm_start = 0;
+	}
+	return vm_start;
+}
+
+unsigned long vm_end_gap(struct vm_area_struct *vma)
+{
+	unsigned long vm_end = vma->vm_end;
+	unsigned long gap = 0;
+
+	if (vma->vm_flags & VM_GROWSUP)
+		gap = stack_guard_gap;
+	else if (vma->vm_flags & VM_SHADOW_STACK)
+		gap = SHADOW_STACK_GUARD_GAP;
+
+	if (gap != 0) {
+		vm_end += gap;
+		if (vm_end < vma->vm_end)
+			vm_end = -PAGE_SIZE;
+	}
+	return vm_end;
+}
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 6ac9b3e9a865..3e9c84f21ef6 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2660,6 +2660,7 @@ static inline struct vm_area_struct * find_vma_intersection(struct mm_struct * m
 	return vma;
 }
 
+#ifndef vm_start_gap
 static inline unsigned long vm_start_gap(struct vm_area_struct *vma)
 {
 	unsigned long vm_start = vma->vm_start;
@@ -2671,7 +2672,9 @@ static inline unsigned long vm_start_gap(struct vm_area_struct *vma)
 	}
 	return vm_start;
 }
+#endif
 
+#ifndef vm_end_gap
 static inline unsigned long vm_end_gap(struct vm_area_struct *vma)
 {
 	unsigned long vm_end = vma->vm_end;
@@ -2683,6 +2686,7 @@ static inline unsigned long vm_end_gap(struct vm_area_struct *vma)
 	}
 	return vm_end;
 }
+#endif
 
 static inline unsigned long vma_pages(struct vm_area_struct *vma)
 {
-- 
2.21.0

