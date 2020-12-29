Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E1962E7491
	for <lists+linux-doc@lfdr.de>; Tue, 29 Dec 2020 22:38:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726960AbgL2VeD (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 29 Dec 2020 16:34:03 -0500
Received: from mga03.intel.com ([134.134.136.65]:11891 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726942AbgL2VeC (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 29 Dec 2020 16:34:02 -0500
IronPort-SDR: EQNI3DPup5CJCLW4FLiToJQeNzBfdWOXvzQ5B9ToPkfcYI93Jq4w5XeXh7kRKEYHwcZDeKgSCV
 d2X6soxg7YXQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9849"; a="176640547"
X-IronPort-AV: E=Sophos;i="5.78,459,1599548400"; 
   d="scan'208";a="176640547"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2020 13:32:28 -0800
IronPort-SDR: d2CTemfNLlvB4zDNZiCE4b/O99eZ1VckBcupIlR2nCg9DpBH6njnKO/jPPaduGqaR0htFMN6yo
 Cs75xue9Rcvg==
X-IronPort-AV: E=Sophos;i="5.78,459,1599548400"; 
   d="scan'208";a="376189646"
Received: from yyu32-desk.sc.intel.com ([143.183.136.146])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2020 13:32:28 -0800
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
Subject: [PATCH v17 20/26] x86/cet/shstk: User-mode shadow stack support
Date:   Tue, 29 Dec 2020 13:30:47 -0800
Message-Id: <20201229213053.16395-21-yu-cheng.yu@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201229213053.16395-1-yu-cheng.yu@intel.com>
References: <20201229213053.16395-1-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Introduce basic shadow stack enabling/disabling/allocation routines.
A task's shadow stack is allocated from memory with VM_SHSTK flag and has
a fixed size of min(RLIMIT_STACK, 4GB).

Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
---
 arch/x86/include/asm/cet.h       |  28 ++++++
 arch/x86/include/asm/processor.h |   5 ++
 arch/x86/kernel/Makefile         |   2 +
 arch/x86/kernel/cet.c            | 147 +++++++++++++++++++++++++++++++
 4 files changed, 182 insertions(+)
 create mode 100644 arch/x86/include/asm/cet.h
 create mode 100644 arch/x86/kernel/cet.c

diff --git a/arch/x86/include/asm/cet.h b/arch/x86/include/asm/cet.h
new file mode 100644
index 000000000000..6d0df5c26c22
--- /dev/null
+++ b/arch/x86/include/asm/cet.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_X86_CET_H
+#define _ASM_X86_CET_H
+
+#ifndef __ASSEMBLY__
+#include <linux/types.h>
+
+struct task_struct;
+/*
+ * Per-thread CET status
+ */
+struct cet_status {
+	unsigned long	shstk_base;
+	unsigned long	shstk_size;
+};
+
+#ifdef CONFIG_X86_CET_USER
+int cet_setup_shstk(void);
+void cet_disable_shstk(void);
+void cet_free_shstk(struct task_struct *p);
+#else
+static inline void cet_disable_shstk(void) {}
+static inline void cet_free_shstk(struct task_struct *p) {}
+#endif
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* _ASM_X86_CET_H */
diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index c20a52b5534b..2b8202f35fde 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -27,6 +27,7 @@ struct vm86;
 #include <asm/unwind_hints.h>
 #include <asm/vmxfeatures.h>
 #include <asm/vdso/processor.h>
+#include <asm/cet.h>
 
 #include <linux/personality.h>
 #include <linux/cache.h>
@@ -536,6 +537,10 @@ struct thread_struct {
 
 	unsigned int		sig_on_uaccess_err:1;
 
+#ifdef CONFIG_X86_CET_USER
+	struct cet_status	cet;
+#endif
+
 	/* Floating point and extended processor state */
 	struct fpu		fpu;
 	/*
diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index 5eeb808eb024..07cee6125a3c 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -151,6 +151,8 @@ obj-$(CONFIG_UNWINDER_FRAME_POINTER)	+= unwind_frame.o
 obj-$(CONFIG_UNWINDER_GUESS)		+= unwind_guess.o
 
 obj-$(CONFIG_AMD_MEM_ENCRYPT)		+= sev-es.o
+obj-$(CONFIG_X86_CET_USER)		+= cet.o
+
 ###
 # 64 bit specific files
 ifeq ($(CONFIG_X86_64),y)
diff --git a/arch/x86/kernel/cet.c b/arch/x86/kernel/cet.c
new file mode 100644
index 000000000000..f8b0a077594f
--- /dev/null
+++ b/arch/x86/kernel/cet.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * cet.c - Control-flow Enforcement (CET)
+ *
+ * Copyright (c) 2019, Intel Corporation.
+ * Yu-cheng Yu <yu-cheng.yu@intel.com>
+ */
+
+#include <linux/types.h>
+#include <linux/mm.h>
+#include <linux/mman.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+#include <linux/sched/signal.h>
+#include <linux/compat.h>
+#include <asm/msr.h>
+#include <asm/user.h>
+#include <asm/fpu/internal.h>
+#include <asm/fpu/xstate.h>
+#include <asm/fpu/types.h>
+#include <asm/cet.h>
+
+static void start_update_msrs(void)
+{
+	fpregs_lock();
+	if (test_thread_flag(TIF_NEED_FPU_LOAD))
+		__fpregs_load_activate();
+}
+
+static void end_update_msrs(void)
+{
+	fpregs_unlock();
+}
+
+static unsigned long cet_get_shstk_addr(void)
+{
+	struct fpu *fpu = &current->thread.fpu;
+	unsigned long ssp = 0;
+
+	fpregs_lock();
+
+	if (fpregs_state_valid(fpu, smp_processor_id())) {
+		rdmsrl(MSR_IA32_PL3_SSP, ssp);
+	} else {
+		struct cet_user_state *p;
+
+		p = get_xsave_addr(&fpu->state.xsave, XFEATURE_CET_USER);
+		if (p)
+			ssp = p->user_ssp;
+	}
+
+	fpregs_unlock();
+	return ssp;
+}
+
+static unsigned long alloc_shstk(unsigned long size, int flags)
+{
+	struct mm_struct *mm = current->mm;
+	unsigned long addr, populate;
+
+	/* VM_SHSTK requires MAP_ANONYMOUS, MAP_PRIVATE */
+	flags |= MAP_ANONYMOUS | MAP_PRIVATE;
+
+	mmap_write_lock(mm);
+	addr = do_mmap(NULL, 0, size, PROT_READ, flags, VM_SHSTK, 0,
+		       &populate, NULL);
+	mmap_write_unlock(mm);
+
+	if (populate)
+		mm_populate(addr, populate);
+
+	return addr;
+}
+
+int cet_setup_shstk(void)
+{
+	unsigned long addr, size;
+	struct cet_status *cet = &current->thread.cet;
+
+	if (!static_cpu_has(X86_FEATURE_SHSTK))
+		return -EOPNOTSUPP;
+
+	size = round_up(min(rlimit(RLIMIT_STACK), 1UL << 32), PAGE_SIZE);
+	addr = alloc_shstk(size, 0);
+
+	if (IS_ERR_VALUE(addr))
+		return PTR_ERR((void *)addr);
+
+	cet->shstk_base = addr;
+	cet->shstk_size = size;
+
+	start_update_msrs();
+	wrmsrl(MSR_IA32_PL3_SSP, addr + size);
+	wrmsrl(MSR_IA32_U_CET, CET_SHSTK_EN);
+	end_update_msrs();
+	return 0;
+}
+
+void cet_disable_shstk(void)
+{
+	struct cet_status *cet = &current->thread.cet;
+	u64 msr_val;
+
+	if (!static_cpu_has(X86_FEATURE_SHSTK) ||
+	    !cet->shstk_size || !cet->shstk_base)
+		return;
+
+	start_update_msrs();
+	rdmsrl(MSR_IA32_U_CET, msr_val);
+	wrmsrl(MSR_IA32_U_CET, msr_val & ~CET_SHSTK_EN);
+	wrmsrl(MSR_IA32_PL3_SSP, 0);
+	end_update_msrs();
+
+	cet_free_shstk(current);
+}
+
+void cet_free_shstk(struct task_struct *tsk)
+{
+	struct cet_status *cet = &tsk->thread.cet;
+
+	if (!static_cpu_has(X86_FEATURE_SHSTK) ||
+	    !cet->shstk_size || !cet->shstk_base)
+		return;
+
+	if (!tsk->mm || (tsk->mm != current->mm))
+		return;
+
+	while (1) {
+		int r;
+
+		r = vm_munmap(cet->shstk_base, cet->shstk_size);
+
+		/*
+		 * Retry if mmap_lock is not available.
+		 */
+		if (r == -EINTR) {
+			cond_resched();
+			continue;
+		}
+
+		WARN_ON_ONCE(r);
+		break;
+	}
+
+	cet->shstk_base = 0;
+	cet->shstk_size = 0;
+}
-- 
2.21.0

