Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D291337E18
	for <lists+linux-doc@lfdr.de>; Thu,  6 Jun 2019 22:18:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729413AbfFFUPf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 6 Jun 2019 16:15:35 -0400
Received: from mga17.intel.com ([192.55.52.151]:47825 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729403AbfFFUPe (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 6 Jun 2019 16:15:34 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Jun 2019 13:15:33 -0700
X-ExtLoop1: 1
Received: from yyu32-desk1.sc.intel.com ([143.183.136.147])
  by orsmga002.jf.intel.com with ESMTP; 06 Jun 2019 13:15:32 -0700
From:   Yu-cheng Yu <yu-cheng.yu@intel.com>
To:     x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@amacapital.net>,
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
        Dave Martin <Dave.Martin@arm.com>
Cc:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Subject: [PATCH v7 19/27] x86/cet/shstk: User-mode shadow stack support
Date:   Thu,  6 Jun 2019 13:06:38 -0700
Message-Id: <20190606200646.3951-20-yu-cheng.yu@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190606200646.3951-1-yu-cheng.yu@intel.com>
References: <20190606200646.3951-1-yu-cheng.yu@intel.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch adds basic shadow stack enabling/disabling routines.
A task's shadow stack is allocated from memory with VM_SHSTK flag set
and read-only protection.  It has a fixed size of RLIMIT_STACK.

Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
---
 arch/x86/include/asm/cet.h                    |  34 +++++
 arch/x86/include/asm/disabled-features.h      |   8 +-
 arch/x86/include/asm/msr-index.h              |  18 +++
 arch/x86/include/asm/processor.h              |   5 +
 arch/x86/kernel/Makefile                      |   2 +
 arch/x86/kernel/cet.c                         | 116 ++++++++++++++++++
 arch/x86/kernel/cpu/common.c                  |  25 ++++
 arch/x86/kernel/process.c                     |   1 +
 .../arch/x86/include/asm/disabled-features.h  |   8 +-
 9 files changed, 215 insertions(+), 2 deletions(-)
 create mode 100644 arch/x86/include/asm/cet.h
 create mode 100644 arch/x86/kernel/cet.c

diff --git a/arch/x86/include/asm/cet.h b/arch/x86/include/asm/cet.h
new file mode 100644
index 000000000000..c952a2ec65fe
--- /dev/null
+++ b/arch/x86/include/asm/cet.h
@@ -0,0 +1,34 @@
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
+	unsigned int	shstk_enabled:1;
+};
+
+#ifdef CONFIG_X86_INTEL_CET
+int cet_setup_shstk(void);
+void cet_disable_shstk(void);
+void cet_disable_free_shstk(struct task_struct *p);
+#else
+static inline int cet_setup_shstk(void) { return -EINVAL; }
+static inline void cet_disable_shstk(void) {}
+static inline void cet_disable_free_shstk(struct task_struct *p) {}
+#endif
+
+#define cpu_x86_cet_enabled() \
+	(cpu_feature_enabled(X86_FEATURE_SHSTK) || \
+	 cpu_feature_enabled(X86_FEATURE_IBT))
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* _ASM_X86_CET_H */
diff --git a/arch/x86/include/asm/disabled-features.h b/arch/x86/include/asm/disabled-features.h
index a5ea841cc6d2..06323ebed643 100644
--- a/arch/x86/include/asm/disabled-features.h
+++ b/arch/x86/include/asm/disabled-features.h
@@ -62,6 +62,12 @@
 # define DISABLE_PTI		(1 << (X86_FEATURE_PTI & 31))
 #endif
 
+#ifdef CONFIG_X86_INTEL_SHADOW_STACK_USER
+#define DISABLE_SHSTK	0
+#else
+#define DISABLE_SHSTK	(1<<(X86_FEATURE_SHSTK & 31))
+#endif
+
 /*
  * Make sure to add features to the correct mask
  */
@@ -81,7 +87,7 @@
 #define DISABLED_MASK13	0
 #define DISABLED_MASK14	0
 #define DISABLED_MASK15	0
-#define DISABLED_MASK16	(DISABLE_PKU|DISABLE_OSPKE|DISABLE_LA57|DISABLE_UMIP)
+#define DISABLED_MASK16	(DISABLE_PKU|DISABLE_OSPKE|DISABLE_LA57|DISABLE_UMIP|DISABLE_SHSTK)
 #define DISABLED_MASK17	0
 #define DISABLED_MASK18	0
 #define DISABLED_MASK_CHECK BUILD_BUG_ON_ZERO(NCAPINTS != 19)
diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index 979ef971cc78..30e9107974fa 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -839,4 +839,22 @@
 #define MSR_VM_IGNNE                    0xc0010115
 #define MSR_VM_HSAVE_PA                 0xc0010117
 
+/* Control-flow Enforcement Technology MSRs */
+#define MSR_IA32_U_CET		0x6a0 /* user mode cet setting */
+#define MSR_IA32_S_CET		0x6a2 /* kernel mode cet setting */
+#define MSR_IA32_PL0_SSP	0x6a4 /* kernel shstk pointer */
+#define MSR_IA32_PL1_SSP	0x6a5 /* ring-1 shstk pointer */
+#define MSR_IA32_PL2_SSP	0x6a6 /* ring-2 shstk pointer */
+#define MSR_IA32_PL3_SSP	0x6a7 /* user shstk pointer */
+#define MSR_IA32_INT_SSP_TAB	0x6a8 /* exception shstk table */
+
+/* MSR_IA32_U_CET and MSR_IA32_S_CET bits */
+#define MSR_IA32_CET_SHSTK_EN		0x0000000000000001ULL
+#define MSR_IA32_CET_WRSS_EN		0x0000000000000002ULL
+#define MSR_IA32_CET_ENDBR_EN		0x0000000000000004ULL
+#define MSR_IA32_CET_LEG_IW_EN		0x0000000000000008ULL
+#define MSR_IA32_CET_NO_TRACK_EN	0x0000000000000010ULL
+#define MSR_IA32_CET_WAIT_ENDBR	0x00000000000000800UL
+#define MSR_IA32_CET_BITMAP_MASK	0xfffffffffffff000ULL
+
 #endif /* _ASM_X86_MSR_INDEX_H */
diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index c34a35c78618..2ae7c1bf4e43 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -24,6 +24,7 @@ struct vm86;
 #include <asm/special_insns.h>
 #include <asm/fpu/types.h>
 #include <asm/unwind_hints.h>
+#include <asm/cet.h>
 
 #include <linux/personality.h>
 #include <linux/cache.h>
@@ -487,6 +488,10 @@ struct thread_struct {
 	unsigned int		sig_on_uaccess_err:1;
 	unsigned int		uaccess_err:1;	/* uaccess failed */
 
+#ifdef CONFIG_X86_INTEL_CET
+	struct cet_status	cet;
+#endif
+
 	/* Floating point and extended processor state */
 	struct fpu		fpu;
 	/*
diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index ce1b5cc360a2..584ed7e9a599 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -140,6 +140,8 @@ obj-$(CONFIG_UNWINDER_ORC)		+= unwind_orc.o
 obj-$(CONFIG_UNWINDER_FRAME_POINTER)	+= unwind_frame.o
 obj-$(CONFIG_UNWINDER_GUESS)		+= unwind_guess.o
 
+obj-$(CONFIG_X86_INTEL_CET)		+= cet.o
+
 ###
 # 64 bit specific files
 ifeq ($(CONFIG_X86_64),y)
diff --git a/arch/x86/kernel/cet.c b/arch/x86/kernel/cet.c
new file mode 100644
index 000000000000..2a48634aa6ce
--- /dev/null
+++ b/arch/x86/kernel/cet.c
@@ -0,0 +1,116 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * cet.c - Control-flow Enforcement (CET)
+ *
+ * Copyright (c) 2018, Intel Corporation.
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
+static int set_shstk_ptr(unsigned long addr)
+{
+	u64 r;
+
+	if (!cpu_feature_enabled(X86_FEATURE_SHSTK))
+		return -1;
+
+	if ((addr >= TASK_SIZE_MAX) || (!IS_ALIGNED(addr, 4)))
+		return -1;
+
+	modify_fpu_regs_begin();
+	rdmsrl(MSR_IA32_U_CET, r);
+	wrmsrl(MSR_IA32_PL3_SSP, addr);
+	wrmsrl(MSR_IA32_U_CET, r | MSR_IA32_CET_SHSTK_EN);
+	modify_fpu_regs_end();
+	return 0;
+}
+
+static unsigned long get_shstk_addr(void)
+{
+	unsigned long ptr;
+
+	if (!current->thread.cet.shstk_enabled)
+		return 0;
+
+	modify_fpu_regs_begin();
+	rdmsrl(MSR_IA32_PL3_SSP, ptr);
+	modify_fpu_regs_end();
+	return ptr;
+}
+
+int cet_setup_shstk(void)
+{
+	unsigned long addr, size;
+
+	if (!cpu_feature_enabled(X86_FEATURE_SHSTK))
+		return -EOPNOTSUPP;
+
+	size = rlimit(RLIMIT_STACK);
+	addr = do_mmap_locked(0, size, PROT_READ,
+			      MAP_ANONYMOUS | MAP_PRIVATE, VM_SHSTK);
+
+	/*
+	 * Return actual error from do_mmap().
+	 */
+	if (addr >= TASK_SIZE_MAX)
+		return addr;
+
+	set_shstk_ptr(addr + size - sizeof(u64));
+	current->thread.cet.shstk_base = addr;
+	current->thread.cet.shstk_size = size;
+	current->thread.cet.shstk_enabled = 1;
+	return 0;
+}
+
+void cet_disable_shstk(void)
+{
+	u64 r;
+
+	if (!cpu_feature_enabled(X86_FEATURE_SHSTK))
+		return;
+
+	modify_fpu_regs_begin();
+	rdmsrl(MSR_IA32_U_CET, r);
+	r &= ~(MSR_IA32_CET_SHSTK_EN);
+	wrmsrl(MSR_IA32_U_CET, r);
+	wrmsrl(MSR_IA32_PL3_SSP, 0);
+	modify_fpu_regs_end();
+	current->thread.cet.shstk_enabled = 0;
+}
+
+void cet_disable_free_shstk(struct task_struct *tsk)
+{
+	if (!cpu_feature_enabled(X86_FEATURE_SHSTK) ||
+	    !tsk->thread.cet.shstk_enabled)
+		return;
+
+	if (tsk->mm && (tsk == current))
+		cet_disable_shstk();
+
+	/*
+	 * Free only when tsk is current or shares mm
+	 * with current but has its own shstk.
+	 */
+	if (tsk->mm && (tsk->mm == current->mm) &&
+	    (tsk->thread.cet.shstk_base)) {
+		vm_munmap(tsk->thread.cet.shstk_base,
+			  tsk->thread.cet.shstk_size);
+		tsk->thread.cet.shstk_base = 0;
+		tsk->thread.cet.shstk_size = 0;
+	}
+
+	tsk->thread.cet.shstk_enabled = 0;
+}
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 2c57fffebf9b..b0780fe8717e 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -53,6 +53,7 @@
 #include <asm/microcode_intel.h>
 #include <asm/intel-family.h>
 #include <asm/cpu_device_id.h>
+#include <asm/cet.h>
 
 #ifdef CONFIG_X86_LOCAL_APIC
 #include <asm/uv/uv.h>
@@ -417,6 +418,29 @@ static __init int setup_disable_pku(char *arg)
 __setup("nopku", setup_disable_pku);
 #endif /* CONFIG_X86_64 */
 
+static __always_inline void setup_cet(struct cpuinfo_x86 *c)
+{
+	if (cpu_x86_cet_enabled())
+		cr4_set_bits(X86_CR4_CET);
+}
+
+#ifdef CONFIG_X86_INTEL_SHADOW_STACK_USER
+static __init int setup_disable_shstk(char *s)
+{
+	/* require an exact match without trailing characters */
+	if (s[0] != '\0')
+		return 0;
+
+	if (!boot_cpu_has(X86_FEATURE_SHSTK))
+		return 1;
+
+	setup_clear_cpu_cap(X86_FEATURE_SHSTK);
+	pr_info("x86: 'no_cet_shstk' specified, disabling Shadow Stack\n");
+	return 1;
+}
+__setup("no_cet_shstk", setup_disable_shstk);
+#endif
+
 /*
  * Some CPU features depend on higher CPUID levels, which may not always
  * be available due to CPUID level capping or broken virtualization
@@ -1393,6 +1417,7 @@ static void identify_cpu(struct cpuinfo_x86 *c)
 	x86_init_rdrand(c);
 	x86_init_cache_qos(c);
 	setup_pku(c);
+	setup_cet(c);
 
 	/*
 	 * Clear/Set all flags overridden by options, need do it
diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index d360bf4d696b..a4deb79b1089 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -42,6 +42,7 @@
 #include <asm/prctl.h>
 #include <asm/spec-ctrl.h>
 #include <asm/proto.h>
+#include <asm/cet.h>
 
 #include "process.h"
 
diff --git a/tools/arch/x86/include/asm/disabled-features.h b/tools/arch/x86/include/asm/disabled-features.h
index a5ea841cc6d2..06323ebed643 100644
--- a/tools/arch/x86/include/asm/disabled-features.h
+++ b/tools/arch/x86/include/asm/disabled-features.h
@@ -62,6 +62,12 @@
 # define DISABLE_PTI		(1 << (X86_FEATURE_PTI & 31))
 #endif
 
+#ifdef CONFIG_X86_INTEL_SHADOW_STACK_USER
+#define DISABLE_SHSTK	0
+#else
+#define DISABLE_SHSTK	(1<<(X86_FEATURE_SHSTK & 31))
+#endif
+
 /*
  * Make sure to add features to the correct mask
  */
@@ -81,7 +87,7 @@
 #define DISABLED_MASK13	0
 #define DISABLED_MASK14	0
 #define DISABLED_MASK15	0
-#define DISABLED_MASK16	(DISABLE_PKU|DISABLE_OSPKE|DISABLE_LA57|DISABLE_UMIP)
+#define DISABLED_MASK16	(DISABLE_PKU|DISABLE_OSPKE|DISABLE_LA57|DISABLE_UMIP|DISABLE_SHSTK)
 #define DISABLED_MASK17	0
 #define DISABLED_MASK18	0
 #define DISABLED_MASK_CHECK BUILD_BUG_ON_ZERO(NCAPINTS != 19)
-- 
2.17.1

