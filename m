Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7A7238D119
	for <lists+linux-doc@lfdr.de>; Sat, 22 May 2021 00:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230109AbhEUWRx (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 21 May 2021 18:17:53 -0400
Received: from mga09.intel.com ([134.134.136.24]:55681 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230288AbhEUWRJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 21 May 2021 18:17:09 -0400
IronPort-SDR: T72EJC5lNf2H/28KB8qqHkLqt07mfoxHEPjR7EilKRCdIXufuEbLU4mOXfR7lL7pDTC9fW8CVu
 HIHgupUeTh3A==
X-IronPort-AV: E=McAfee;i="6200,9189,9991"; a="201618790"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="scan'208";a="201618790"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2021 15:13:25 -0700
IronPort-SDR: FObgDZN/LpD4pd1sH8VWu+LsQCAm/rIANoiDhtWtt4gCHRGbq6UcN7ZxcE2+p1biUWyIxIaGbM
 EM8UG4URCvig==
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="scan'208";a="441116260"
Received: from yyu32-desk.sc.intel.com ([143.183.136.146])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2021 15:13:24 -0700
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
Subject: [PATCH v27 31/31] mm: Introduce PROT_SHADOW_STACK for shadow stack
Date:   Fri, 21 May 2021 15:12:11 -0700
Message-Id: <20210521221211.29077-32-yu-cheng.yu@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210521221211.29077-1-yu-cheng.yu@intel.com>
References: <20210521221211.29077-1-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There are three possible options to create a shadow stack allocation API:
an arch_prctl, a new syscall, or adding PROT_SHADOW_STACK to mmap() and
mprotect().  Each has its advantages and compromises.

An arch_prctl() is the least intrusive.  However, the existing x86
arch_prctl() takes only two parameters.  Multiple parameters must be
passed in a memory buffer.  There is a proposal to pass more parameters in
registers [1], but no active discussion on that.

A new syscall minimizes compatibility issues and offers an extensible frame
work to other architectures, but this will likely result in some overlap of
mmap()/mprotect().

The introduction of PROT_SHADOW_STACK to mmap()/mprotect() takes advantage
of existing APIs.  The x86-specific PROT_SHADOW_STACK is translated to
VM_SHADOW_STACK and a shadow stack mapping is created without reinventing
the wheel.  There are potential pitfalls though.  The most obvious one
would be using this as a bypass to shadow stack protection.  However, the
attacker would have to get to the syscall first.

[1] https://lore.kernel.org/lkml/20200828121624.108243-1-hjl.tools@gmail.com/

Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Cc: Kees Cook <keescook@chromium.org>
---
 arch/x86/include/asm/mman.h      | 60 +++++++++++++++++++++++++++++++-
 arch/x86/include/uapi/asm/mman.h |  2 ++
 include/linux/mm.h               |  1 +
 3 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/mman.h b/arch/x86/include/asm/mman.h
index 629f6c81263a..b77933923b9a 100644
--- a/arch/x86/include/asm/mman.h
+++ b/arch/x86/include/asm/mman.h
@@ -20,11 +20,69 @@
 		((vm_flags) & VM_PKEY_BIT2 ? _PAGE_PKEY_BIT2 : 0) |	\
 		((vm_flags) & VM_PKEY_BIT3 ? _PAGE_PKEY_BIT3 : 0))
 
-#define arch_calc_vm_prot_bits(prot, key) (		\
+#define pkey_vm_prot_bits(prot, key) (			\
 		((key) & 0x1 ? VM_PKEY_BIT0 : 0) |      \
 		((key) & 0x2 ? VM_PKEY_BIT1 : 0) |      \
 		((key) & 0x4 ? VM_PKEY_BIT2 : 0) |      \
 		((key) & 0x8 ? VM_PKEY_BIT3 : 0))
+#else
+#define pkey_vm_prot_bits(prot, key) (0)
 #endif
 
+static inline unsigned long arch_calc_vm_prot_bits(unsigned long prot,
+						   unsigned long pkey)
+{
+	unsigned long vm_prot_bits = pkey_vm_prot_bits(prot, pkey);
+
+	if (prot & PROT_SHADOW_STACK)
+		vm_prot_bits |= VM_SHADOW_STACK;
+
+	return vm_prot_bits;
+}
+
+#define arch_calc_vm_prot_bits(prot, pkey) arch_calc_vm_prot_bits(prot, pkey)
+
+#ifdef CONFIG_X86_SHADOW_STACK
+static inline bool arch_validate_prot(unsigned long prot, unsigned long addr)
+{
+	unsigned long valid = PROT_READ | PROT_WRITE | PROT_EXEC | PROT_SEM |
+			      PROT_SHADOW_STACK;
+
+	if (prot & ~valid)
+		return false;
+
+	if (prot & PROT_SHADOW_STACK) {
+		if (!current->thread.shstk.size)
+			return false;
+
+		/*
+		 * A shadow stack mapping is indirectly writable by only
+		 * the CALL and WRUSS instructions, but not other write
+		 * instructions).  PROT_SHADOW_STACK and PROT_WRITE are
+		 * mutually exclusive.
+		 */
+		if (prot & PROT_WRITE)
+			return false;
+	}
+
+	return true;
+}
+
+#define arch_validate_prot arch_validate_prot
+
+static inline bool arch_validate_flags(struct vm_area_struct *vma, unsigned long vm_flags)
+{
+	/*
+	 * Shadow stack must be anonymous and not shared.
+	 */
+	if ((vm_flags & VM_SHADOW_STACK) && !vma_is_anonymous(vma))
+		return false;
+
+	return true;
+}
+
+#define arch_validate_flags(vma, vm_flags) arch_validate_flags(vma, vm_flags)
+
+#endif /* CONFIG_X86_SHADOW_STACK */
+
 #endif /* _ASM_X86_MMAN_H */
diff --git a/arch/x86/include/uapi/asm/mman.h b/arch/x86/include/uapi/asm/mman.h
index f28fa4acaeaf..4c36b263cf0a 100644
--- a/arch/x86/include/uapi/asm/mman.h
+++ b/arch/x86/include/uapi/asm/mman.h
@@ -4,6 +4,8 @@
 
 #define MAP_32BIT	0x40		/* only give out 32bit addresses */
 
+#define PROT_SHADOW_STACK	0x10	/* shadow stack pages */
+
 #include <asm-generic/mman.h>
 
 #endif /* _UAPI_ASM_X86_MMAN_H */
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 68ac438f0498..e26b29a96e9e 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -352,6 +352,7 @@ extern unsigned int kobjsize(const void *objp);
 
 #if defined(CONFIG_X86)
 # define VM_PAT		VM_ARCH_1	/* PAT reserves whole VMA at once (x86) */
+# define VM_ARCH_CLEAR	VM_SHADOW_STACK
 #elif defined(CONFIG_PPC)
 # define VM_SAO		VM_ARCH_1	/* Strong Access Ordering (powerpc) */
 #elif defined(CONFIG_PARISC)
-- 
2.21.0

