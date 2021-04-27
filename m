Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7E9236CCE9
	for <lists+linux-doc@lfdr.de>; Tue, 27 Apr 2021 22:45:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239361AbhD0Uq2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 27 Apr 2021 16:46:28 -0400
Received: from mga05.intel.com ([192.55.52.43]:31780 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239183AbhD0UqT (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 27 Apr 2021 16:46:19 -0400
IronPort-SDR: NBeY9gqQIDRS6JTJsY0HSbmj1qprTpdgXPao9j6tJ1DJ6WP3Z87Khmz6X5iF3NGUE9AjTDcqHY
 ITH6SDt1J+DA==
X-IronPort-AV: E=McAfee;i="6200,9189,9967"; a="281922493"
X-IronPort-AV: E=Sophos;i="5.82,255,1613462400"; 
   d="scan'208";a="281922493"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2021 13:44:22 -0700
IronPort-SDR: 75VLjNgq4HBl3JHUeKIoj71GJcm5Gbcd3TtQYTMTQH/p9nAv02K9RPUsZm2A3RWacsigMkHh5P
 jeDPO8y3iV0g==
X-IronPort-AV: E=Sophos;i="5.82,255,1613462400"; 
   d="scan'208";a="465623548"
Received: from yyu32-desk.sc.intel.com ([143.183.136.146])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2021 13:44:21 -0700
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
Cc:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Subject: [PATCH v26 23/30] x86/cet/shstk: Handle thread shadow stack
Date:   Tue, 27 Apr 2021 13:43:08 -0700
Message-Id: <20210427204315.24153-24-yu-cheng.yu@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210427204315.24153-1-yu-cheng.yu@intel.com>
References: <20210427204315.24153-1-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

For clone() with CLONE_VM specified, the child and the parent must have
separate shadow stacks.  Thus, the kernel allocates, and frees on thread
exit a new shadow stack for the child.

Use stack_size passed from clone3() syscall for thread shadow stack size,
but cap it to min(RLIMIT_STACK, 4 GB).  A compat-mode thread shadow stack
size is further reduced to 1/4.  This allows more threads to run in a 32-
bit address space.

Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
---
 arch/x86/include/asm/cet.h         |  5 +++
 arch/x86/include/asm/mmu_context.h |  3 ++
 arch/x86/kernel/process.c          | 15 ++++++--
 arch/x86/kernel/shstk.c            | 57 +++++++++++++++++++++++++++++-
 4 files changed, 76 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/cet.h b/arch/x86/include/asm/cet.h
index aa85d599b184..8b83ded577cc 100644
--- a/arch/x86/include/asm/cet.h
+++ b/arch/x86/include/asm/cet.h
@@ -16,10 +16,15 @@ struct cet_status {
 
 #ifdef CONFIG_X86_SHADOW_STACK
 int shstk_setup(void);
+int shstk_setup_thread(struct task_struct *p, unsigned long clone_flags,
+		       unsigned long stack_size);
 void shstk_free(struct task_struct *p);
 void shstk_disable(void);
 #else
 static inline int shstk_setup(void) { return 0; }
+static inline int shstk_setup_thread(struct task_struct *p,
+				     unsigned long clone_flags,
+				     unsigned long stack_size) { return 0; }
 static inline void shstk_free(struct task_struct *p) {}
 static inline void shstk_disable(void) {}
 #endif
diff --git a/arch/x86/include/asm/mmu_context.h b/arch/x86/include/asm/mmu_context.h
index 27516046117a..53569114aa01 100644
--- a/arch/x86/include/asm/mmu_context.h
+++ b/arch/x86/include/asm/mmu_context.h
@@ -11,6 +11,7 @@
 
 #include <asm/tlbflush.h>
 #include <asm/paravirt.h>
+#include <asm/cet.h>
 #include <asm/debugreg.h>
 
 extern atomic64_t last_mm_ctx_id;
@@ -146,6 +147,8 @@ do {						\
 #else
 #define deactivate_mm(tsk, mm)			\
 do {						\
+	if (!tsk->vfork_done)			\
+		shstk_free(tsk);		\
 	load_gs_index(0);			\
 	loadsegment(fs, 0);			\
 } while (0)
diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index 9c214d7085a4..fa01e8679d01 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -43,6 +43,7 @@
 #include <asm/io_bitmap.h>
 #include <asm/proto.h>
 #include <asm/frame.h>
+#include <asm/cet.h>
 
 #include "process.h"
 
@@ -109,6 +110,7 @@ void exit_thread(struct task_struct *tsk)
 
 	free_vm86(t);
 
+	shstk_free(tsk);
 	fpu__drop(fpu);
 }
 
@@ -122,8 +124,9 @@ static int set_new_tls(struct task_struct *p, unsigned long tls)
 		return do_set_thread_area_64(p, ARCH_SET_FS, tls);
 }
 
-int copy_thread(unsigned long clone_flags, unsigned long sp, unsigned long arg,
-		struct task_struct *p, unsigned long tls)
+int copy_thread(unsigned long clone_flags, unsigned long sp,
+		unsigned long stack_size, struct task_struct *p,
+		unsigned long tls)
 {
 	struct inactive_task_frame *frame;
 	struct fork_frame *fork_frame;
@@ -163,7 +166,7 @@ int copy_thread(unsigned long clone_flags, unsigned long sp, unsigned long arg,
 	/* Kernel thread ? */
 	if (unlikely(p->flags & (PF_KTHREAD | PF_IO_WORKER))) {
 		memset(childregs, 0, sizeof(struct pt_regs));
-		kthread_frame_init(frame, sp, arg);
+		kthread_frame_init(frame, sp, stack_size);
 		return 0;
 	}
 
@@ -181,6 +184,12 @@ int copy_thread(unsigned long clone_flags, unsigned long sp, unsigned long arg,
 	if (clone_flags & CLONE_SETTLS)
 		ret = set_new_tls(p, tls);
 
+#ifdef CONFIG_X86_64
+	/* Allocate a new shadow stack for pthread */
+	if (!ret)
+		ret = shstk_setup_thread(p, clone_flags, stack_size);
+#endif
+
 	if (!ret && unlikely(test_tsk_thread_flag(current, TIF_IO_BITMAP)))
 		io_bitmap_share(p);
 
diff --git a/arch/x86/kernel/shstk.c b/arch/x86/kernel/shstk.c
index c815c7507830..d387df84b7f1 100644
--- a/arch/x86/kernel/shstk.c
+++ b/arch/x86/kernel/shstk.c
@@ -70,6 +70,55 @@ int shstk_setup(void)
 	return 0;
 }
 
+int shstk_setup_thread(struct task_struct *tsk, unsigned long clone_flags,
+		       unsigned long stack_size)
+{
+	unsigned long addr, size;
+	struct cet_user_state *state;
+	struct cet_status *cet = &tsk->thread.cet;
+
+	if (!cet->shstk_size)
+		return 0;
+
+	if ((clone_flags & (CLONE_VFORK | CLONE_VM)) != CLONE_VM)
+		return 0;
+
+	state = get_xsave_addr(&tsk->thread.fpu.state.xsave,
+			       XFEATURE_CET_USER);
+
+	if (!state)
+		return -EINVAL;
+
+	if (stack_size == 0)
+		return -EINVAL;
+
+	/* Cap shadow stack size to 4 GB */
+	size = min_t(unsigned long long, rlimit(RLIMIT_STACK), SZ_4G);
+	size = min(size, stack_size);
+
+	/*
+	 * Compat-mode pthreads share a limited address space.
+	 * If each function call takes an average of four slots
+	 * stack space, allocate 1/4 of stack size for shadow stack.
+	 */
+	if (in_compat_syscall())
+		size /= 4;
+	size = round_up(size, PAGE_SIZE);
+	addr = alloc_shstk(size);
+
+	if (IS_ERR_VALUE(addr)) {
+		cet->shstk_base = 0;
+		cet->shstk_size = 0;
+		return PTR_ERR((void *)addr);
+	}
+
+	fpu__prepare_write(&tsk->thread.fpu);
+	state->user_ssp = (u64)(addr + size);
+	cet->shstk_base = addr;
+	cet->shstk_size = size;
+	return 0;
+}
+
 void shstk_free(struct task_struct *tsk)
 {
 	struct cet_status *cet = &tsk->thread.cet;
@@ -79,7 +128,13 @@ void shstk_free(struct task_struct *tsk)
 	    !cet->shstk_base)
 		return;
 
-	if (!tsk->mm)
+	/*
+	 * When fork() with CLONE_VM fails, the child (tsk) already has a
+	 * shadow stack allocated, and exit_thread() calls this function to
+	 * free it.  In this case the parent (current) and the child is
+	 * sharing the same mm struct.
+	 */
+	if (!tsk->mm || tsk->mm != current->mm)
 		return;
 
 	while (1) {
-- 
2.21.0

