Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8717B316E2B
	for <lists+linux-doc@lfdr.de>; Wed, 10 Feb 2021 19:12:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233877AbhBJSLs (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 10 Feb 2021 13:11:48 -0500
Received: from mga17.intel.com ([192.55.52.151]:29603 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230107AbhBJSKK (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 10 Feb 2021 13:10:10 -0500
IronPort-SDR: SHVXhX2/zh+BuOyTF5l+ZJPsyJ8V+mootA0nf9AjIImMw0MB06+1Na1UmGQc8KLgUTP4rkAVS6
 rQ98gxi3eUcA==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="161872869"
X-IronPort-AV: E=Sophos;i="5.81,168,1610438400"; 
   d="scan'208";a="161872869"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2021 09:58:04 -0800
IronPort-SDR: 0wuvlKrVK6ed2bcxPhwyk/yxycIEbH/1Avx6uA6WVrU/VrVr3HoVN+qe0r9ypUmsL5rP1tK0Nr
 PuIbFSuPXFVg==
X-IronPort-AV: E=Sophos;i="5.81,168,1610438400"; 
   d="scan'208";a="421140798"
Received: from yyu32-desk.sc.intel.com ([143.183.136.146])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2021 09:58:04 -0800
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
        Pengfei Xu <pengfei.xu@intel.com>, <haitao.huang@intel.com>
Cc:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Subject: [PATCH v20 21/25] x86/cet/shstk: Handle signals for shadow stack
Date:   Wed, 10 Feb 2021 09:56:59 -0800
Message-Id: <20210210175703.12492-22-yu-cheng.yu@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210210175703.12492-1-yu-cheng.yu@intel.com>
References: <20210210175703.12492-1-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

To deliver a signal, create a shadow stack restore token and put the token
and the signal restorer address on the shadow stack.  For sigreturn, verify
the token and restore from it the shadow stack pointer.

A shadow stack restore token marks a restore point of the shadow stack.
The token is distinctively different from any shadow stack address.
In sigreturn, restoring from a token ensures the target address is the
location pointed by the token.

Introduce WRUSS, which is a kernel-mode instruction but writes directly to
user shadow stack.  It is used to construct the user signal stack as
described above.

Currently there is no systematic facility for extending a signal context.
Introduce a signal context extension 'struct sc_ext', which is used to save
shadow stack restore token address and WAIT_ENDBR status.  WAIT_ENDBR will
be introduced later in the Indirect Branch Tracking (IBT) series, but add
that into sc_ext now to keep the struct stable in case the IBT series is
applied later.

Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
---
 arch/x86/ia32/ia32_signal.c            |  17 +++
 arch/x86/include/asm/cet.h             |   8 ++
 arch/x86/include/asm/fpu/internal.h    |  10 ++
 arch/x86/include/asm/special_insns.h   |  32 ++++++
 arch/x86/include/uapi/asm/sigcontext.h |   9 ++
 arch/x86/kernel/cet.c                  | 152 +++++++++++++++++++++++++
 arch/x86/kernel/fpu/signal.c           | 100 ++++++++++++++++
 arch/x86/kernel/signal.c               |  10 ++
 8 files changed, 338 insertions(+)

diff --git a/arch/x86/ia32/ia32_signal.c b/arch/x86/ia32/ia32_signal.c
index 5e3d9b7fd5fb..aee3e367e184 100644
--- a/arch/x86/ia32/ia32_signal.c
+++ b/arch/x86/ia32/ia32_signal.c
@@ -35,6 +35,7 @@
 #include <asm/sigframe.h>
 #include <asm/sighandling.h>
 #include <asm/smap.h>
+#include <asm/cet.h>
 
 static inline void reload_segments(struct sigcontext_32 *sc)
 {
@@ -205,6 +206,7 @@ static void __user *get_sigframe(struct ksignal *ksig, struct pt_regs *regs,
 				 void __user **fpstate)
 {
 	unsigned long sp, fx_aligned, math_size;
+	void __user *restorer = NULL;
 
 	/* Default to using normal stack */
 	sp = regs->sp;
@@ -218,8 +220,23 @@ static void __user *get_sigframe(struct ksignal *ksig, struct pt_regs *regs,
 		 ksig->ka.sa.sa_restorer)
 		sp = (unsigned long) ksig->ka.sa.sa_restorer;
 
+	if (ksig->ka.sa.sa_flags & SA_RESTORER) {
+		restorer = ksig->ka.sa.sa_restorer;
+	} else if (current->mm->context.vdso) {
+		if (ksig->ka.sa.sa_flags & SA_SIGINFO)
+			restorer = current->mm->context.vdso +
+				vdso_image_32.sym___kernel_rt_sigreturn;
+		else
+			restorer = current->mm->context.vdso +
+				vdso_image_32.sym___kernel_sigreturn;
+	}
+
 	sp = fpu__alloc_mathframe(sp, 1, &fx_aligned, &math_size);
 	*fpstate = (struct _fpstate_32 __user *) sp;
+
+	if (save_cet_to_sigframe(1, *fpstate, (unsigned long)restorer))
+		return (void __user *)-1L;
+
 	if (copy_fpstate_to_sigframe(*fpstate, (void __user *)fx_aligned,
 				     math_size) < 0)
 		return (void __user *) -1L;
diff --git a/arch/x86/include/asm/cet.h b/arch/x86/include/asm/cet.h
index 5750fbcbb952..73435856ce54 100644
--- a/arch/x86/include/asm/cet.h
+++ b/arch/x86/include/asm/cet.h
@@ -6,6 +6,8 @@
 #include <linux/types.h>
 
 struct task_struct;
+struct sc_ext;
+
 /*
  * Per-thread CET status
  */
@@ -18,9 +20,15 @@ struct cet_status {
 int cet_setup_shstk(void);
 void cet_disable_shstk(void);
 void cet_free_shstk(struct task_struct *p);
+int cet_verify_rstor_token(bool ia32, unsigned long ssp, unsigned long *new_ssp);
+void cet_restore_signal(struct sc_ext *sc);
+int cet_setup_signal(bool ia32, unsigned long rstor, struct sc_ext *sc);
 #else
 static inline void cet_disable_shstk(void) {}
 static inline void cet_free_shstk(struct task_struct *p) {}
+static inline void cet_restore_signal(struct sc_ext *sc) { return; }
+static inline int cet_setup_signal(bool ia32, unsigned long rstor,
+				   struct sc_ext *sc) { return -EINVAL; }
 #endif
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/x86/include/asm/fpu/internal.h b/arch/x86/include/asm/fpu/internal.h
index 8d33ad80704f..2c1f59ebe9d8 100644
--- a/arch/x86/include/asm/fpu/internal.h
+++ b/arch/x86/include/asm/fpu/internal.h
@@ -443,6 +443,16 @@ static inline void copy_kernel_to_fpregs(union fpregs_state *fpstate)
 	__copy_kernel_to_fpregs(fpstate, -1);
 }
 
+#ifdef CONFIG_X86_CET
+extern int save_cet_to_sigframe(int ia32, void __user *fp,
+				unsigned long restorer);
+#else
+static inline int save_cet_to_sigframe(int ia32, void __user *fp,
+				       unsigned long restorer)
+{
+	return 0;
+}
+#endif
 extern int copy_fpstate_to_sigframe(void __user *buf, void __user *fp, int size);
 
 /*
diff --git a/arch/x86/include/asm/special_insns.h b/arch/x86/include/asm/special_insns.h
index cc177b4431ae..d979d0deb3ae 100644
--- a/arch/x86/include/asm/special_insns.h
+++ b/arch/x86/include/asm/special_insns.h
@@ -234,6 +234,38 @@ static inline void clwb(volatile void *__p)
 		: [pax] "a" (p));
 }
 
+#ifdef CONFIG_X86_CET
+#if defined(CONFIG_IA32_EMULATION) || defined(CONFIG_X86_X32)
+static inline int write_user_shstk_32(unsigned long addr, unsigned int val)
+{
+	asm_volatile_goto("1: wrussd %1, (%0)\n"
+			  _ASM_EXTABLE(1b, %l[fail])
+			  :: "r" (addr), "r" (val)
+			  :: fail);
+	return 0;
+fail:
+	return -EPERM;
+}
+#else
+static inline int write_user_shstk_32(unsigned long addr, unsigned int val)
+{
+	WARN_ONCE(1, "%s used but not supported.\n", __func__);
+	return -EFAULT;
+}
+#endif
+
+static inline int write_user_shstk_64(unsigned long addr, unsigned long val)
+{
+	asm_volatile_goto("1: wrussq %1, (%0)\n"
+			  _ASM_EXTABLE(1b, %l[fail])
+			  :: "r" (addr), "r" (val)
+			  :: fail);
+	return 0;
+fail:
+	return -EPERM;
+}
+#endif /* CONFIG_X86_CET */
+
 #define nop() asm volatile ("nop")
 
 static inline void serialize(void)
diff --git a/arch/x86/include/uapi/asm/sigcontext.h b/arch/x86/include/uapi/asm/sigcontext.h
index 844d60eb1882..cf2d55db3be4 100644
--- a/arch/x86/include/uapi/asm/sigcontext.h
+++ b/arch/x86/include/uapi/asm/sigcontext.h
@@ -196,6 +196,15 @@ struct _xstate {
 	/* New processor state extensions go here: */
 };
 
+/*
+ * Located at the end of sigcontext->fpstate, aligned to 8.
+ */
+struct sc_ext {
+	unsigned long total_size;
+	unsigned long ssp;
+	unsigned long wait_endbr;
+};
+
 /*
  * The 32-bit signal frame:
  */
diff --git a/arch/x86/kernel/cet.c b/arch/x86/kernel/cet.c
index d25a03215984..08e43d9b5176 100644
--- a/arch/x86/kernel/cet.c
+++ b/arch/x86/kernel/cet.c
@@ -19,6 +19,8 @@
 #include <asm/fpu/xstate.h>
 #include <asm/fpu/types.h>
 #include <asm/cet.h>
+#include <asm/special_insns.h>
+#include <uapi/asm/sigcontext.h>
 
 static void start_update_msrs(void)
 {
@@ -72,6 +74,80 @@ static unsigned long alloc_shstk(unsigned long size, int flags)
 	return addr;
 }
 
+#define TOKEN_MODE_MASK	3UL
+#define TOKEN_MODE_64	1UL
+#define IS_TOKEN_64(token) (((token) & TOKEN_MODE_MASK) == TOKEN_MODE_64)
+#define IS_TOKEN_32(token) (((token) & TOKEN_MODE_MASK) == 0)
+
+/*
+ * Verify the restore token at the address of 'ssp' is
+ * valid and then set shadow stack pointer according to the
+ * token.
+ */
+int cet_verify_rstor_token(bool ia32, unsigned long ssp,
+			   unsigned long *new_ssp)
+{
+	unsigned long token;
+
+	*new_ssp = 0;
+
+	if (!IS_ALIGNED(ssp, 8))
+		return -EINVAL;
+
+	if (get_user(token, (unsigned long __user *)ssp))
+		return -EFAULT;
+
+	/* Is 64-bit mode flag correct? */
+	if (!ia32 && !IS_TOKEN_64(token))
+		return -EINVAL;
+	else if (ia32 && !IS_TOKEN_32(token))
+		return -EINVAL;
+
+	token &= ~TOKEN_MODE_MASK;
+
+	/*
+	 * Restore address properly aligned?
+	 */
+	if ((!ia32 && !IS_ALIGNED(token, 8)) || !IS_ALIGNED(token, 4))
+		return -EINVAL;
+
+	/*
+	 * Token was placed properly?
+	 */
+	if (((ALIGN_DOWN(token, 8) - 8) != ssp) || token >= TASK_SIZE_MAX)
+		return -EINVAL;
+
+	*new_ssp = token;
+	return 0;
+}
+
+/*
+ * Create a restore token on the shadow stack.
+ * A token is always 8-byte and aligned to 8.
+ */
+static int create_rstor_token(bool ia32, unsigned long ssp,
+			      unsigned long *new_ssp)
+{
+	unsigned long addr;
+
+	*new_ssp = 0;
+
+	if ((!ia32 && !IS_ALIGNED(ssp, 8)) || !IS_ALIGNED(ssp, 4))
+		return -EINVAL;
+
+	addr = ALIGN_DOWN(ssp, 8) - 8;
+
+	/* Is the token for 64-bit? */
+	if (!ia32)
+		ssp |= TOKEN_MODE_64;
+
+	if (write_user_shstk_64(addr, ssp))
+		return -EFAULT;
+
+	*new_ssp = addr;
+	return 0;
+}
+
 int cet_setup_shstk(void)
 {
 	unsigned long addr, size;
@@ -145,3 +221,79 @@ void cet_free_shstk(struct task_struct *tsk)
 	cet->shstk_base = 0;
 	cet->shstk_size = 0;
 }
+
+/*
+ * Called from __fpu__restore_sig() and XSAVES buffer is protected by
+ * set_thread_flag(TIF_NEED_FPU_LOAD) in the slow path.
+ */
+void cet_restore_signal(struct sc_ext *sc_ext)
+{
+	struct cet_user_state *cet_user_state;
+	struct cet_status *cet = &current->thread.cet;
+	u64 msr_val = 0;
+
+	if (!static_cpu_has(X86_FEATURE_SHSTK))
+		return;
+
+	cet_user_state = get_xsave_addr(&current->thread.fpu.state.xsave,
+					XFEATURE_CET_USER);
+	if (!cet_user_state)
+		return;
+
+	if (cet->shstk_size) {
+		if (test_thread_flag(TIF_NEED_FPU_LOAD))
+			cet_user_state->user_ssp = sc_ext->ssp;
+		else
+			wrmsrl(MSR_IA32_PL3_SSP, sc_ext->ssp);
+
+		msr_val |= CET_SHSTK_EN;
+	}
+
+	if (test_thread_flag(TIF_NEED_FPU_LOAD))
+		cet_user_state->user_cet = msr_val;
+	else
+		wrmsrl(MSR_IA32_U_CET, msr_val);
+}
+
+/*
+ * Setup the shadow stack for the signal handler: first,
+ * create a restore token to keep track of the current ssp,
+ * and then the return address of the signal handler.
+ */
+int cet_setup_signal(bool ia32, unsigned long rstor_addr, struct sc_ext *sc_ext)
+{
+	struct cet_status *cet = &current->thread.cet;
+	unsigned long ssp = 0, new_ssp = 0;
+	int err;
+
+	if (cet->shstk_size) {
+		if (!rstor_addr)
+			return -EINVAL;
+
+		ssp = cet_get_shstk_addr();
+		err = create_rstor_token(ia32, ssp, &new_ssp);
+		if (err)
+			return err;
+
+		if (ia32) {
+			ssp = new_ssp - sizeof(u32);
+			err = write_user_shstk_32(ssp, (unsigned int)rstor_addr);
+		} else {
+			ssp = new_ssp - sizeof(u64);
+			err = write_user_shstk_64(ssp, rstor_addr);
+		}
+
+		if (err)
+			return err;
+
+		sc_ext->ssp = new_ssp;
+	}
+
+	if (ssp) {
+		start_update_msrs();
+		wrmsrl(MSR_IA32_PL3_SSP, ssp);
+		end_update_msrs();
+	}
+
+	return 0;
+}
diff --git a/arch/x86/kernel/fpu/signal.c b/arch/x86/kernel/fpu/signal.c
index a4ec65317a7f..270e4649f435 100644
--- a/arch/x86/kernel/fpu/signal.c
+++ b/arch/x86/kernel/fpu/signal.c
@@ -52,6 +52,74 @@ static inline int check_for_xstate(struct fxregs_state __user *buf,
 	return 0;
 }
 
+#ifdef CONFIG_X86_CET
+int save_cet_to_sigframe(int ia32, void __user *fp, unsigned long restorer)
+{
+	int err = 0;
+
+	if (!current->thread.cet.shstk_size)
+		return 0;
+
+	if (fp) {
+		struct sc_ext ext = {};
+
+		err = cet_setup_signal(ia32, restorer, &ext);
+		if (!err) {
+			void __user *p = fp;
+
+			ext.total_size = sizeof(ext);
+
+			if (ia32)
+				p += sizeof(struct fregs_state);
+
+			p += fpu_user_xstate_size + FP_XSTATE_MAGIC2_SIZE;
+			p = (void __user *)ALIGN((unsigned long)p, 8);
+
+			if (copy_to_user(p, &ext, sizeof(ext)))
+				return -EFAULT;
+		}
+	}
+
+	return err;
+}
+
+static int get_cet_from_sigframe(int ia32, void __user *fp, struct sc_ext *ext)
+{
+	int err = 0;
+
+	memset(ext, 0, sizeof(*ext));
+
+	if (!current->thread.cet.shstk_size)
+		return 0;
+
+	if (fp) {
+		void __user *p = fp;
+
+		if (ia32)
+			p += sizeof(struct fregs_state);
+
+		p += fpu_user_xstate_size + FP_XSTATE_MAGIC2_SIZE;
+		p = (void __user *)ALIGN((unsigned long)p, 8);
+
+		if (copy_from_user(ext, p, sizeof(*ext)))
+			return -EFAULT;
+
+		if (ext->total_size != sizeof(*ext))
+			return -EFAULT;
+
+		if (current->thread.cet.shstk_size)
+			err = cet_verify_rstor_token(ia32, ext->ssp, &ext->ssp);
+	}
+
+	return err;
+}
+#else
+static int get_cet_from_sigframe(int ia32, void __user *fp, struct sc_ext *ext)
+{
+	return 0;
+}
+#endif
+
 /*
  * Signal frame handlers.
  */
@@ -295,6 +363,7 @@ static int __fpu__restore_sig(void __user *buf, void __user *buf_fx, int size)
 	struct task_struct *tsk = current;
 	struct fpu *fpu = &tsk->thread.fpu;
 	struct user_i387_ia32_struct env;
+	struct sc_ext sc_ext;
 	u64 user_xfeatures = 0;
 	int fx_only = 0;
 	int ret = 0;
@@ -335,6 +404,10 @@ static int __fpu__restore_sig(void __user *buf, void __user *buf_fx, int size)
 	if ((unsigned long)buf_fx % 64)
 		fx_only = 1;
 
+	ret = get_cet_from_sigframe(ia32_fxstate, buf, &sc_ext);
+	if (ret)
+		return ret;
+
 	if (!ia32_fxstate) {
 		/*
 		 * Attempt to restore the FPU registers directly from user
@@ -349,6 +422,8 @@ static int __fpu__restore_sig(void __user *buf, void __user *buf_fx, int size)
 		pagefault_enable();
 		if (!ret) {
 
+			cet_restore_signal(&sc_ext);
+
 			/*
 			 * Restore supervisor states: previous context switch
 			 * etc has done XSAVES and saved the supervisor states
@@ -423,6 +498,8 @@ static int __fpu__restore_sig(void __user *buf, void __user *buf_fx, int size)
 		if (unlikely(init_bv))
 			copy_kernel_to_xregs(&init_fpstate.xsave, init_bv);
 
+		cet_restore_signal(&sc_ext);
+
 		/*
 		 * Restore previously saved supervisor xstates along with
 		 * copied-in user xstates.
@@ -491,12 +568,35 @@ int fpu__restore_sig(void __user *buf, int ia32_frame)
 	return __fpu__restore_sig(buf, buf_fx, size);
 }
 
+#ifdef CONFIG_X86_CET
+static unsigned long fpu__alloc_sigcontext_ext(unsigned long sp)
+{
+	struct cet_status *cet = &current->thread.cet;
+
+	/*
+	 * sigcontext_ext is at: fpu + fpu_user_xstate_size +
+	 * FP_XSTATE_MAGIC2_SIZE, then aligned to 8.
+	 */
+	if (cet->shstk_size)
+		sp -= (sizeof(struct sc_ext) + 8);
+
+	return sp;
+}
+#else
+static unsigned long fpu__alloc_sigcontext_ext(unsigned long sp)
+{
+	return sp;
+}
+#endif
+
 unsigned long
 fpu__alloc_mathframe(unsigned long sp, int ia32_frame,
 		     unsigned long *buf_fx, unsigned long *size)
 {
 	unsigned long frame_size = xstate_sigframe_size();
 
+	sp = fpu__alloc_sigcontext_ext(sp);
+
 	*buf_fx = sp = round_down(sp - frame_size, 64);
 	if (ia32_frame && use_fxsr()) {
 		frame_size += sizeof(struct fregs_state);
diff --git a/arch/x86/kernel/signal.c b/arch/x86/kernel/signal.c
index ea794a083c44..1807379f1d86 100644
--- a/arch/x86/kernel/signal.c
+++ b/arch/x86/kernel/signal.c
@@ -46,6 +46,7 @@
 #include <asm/syscall.h>
 #include <asm/sigframe.h>
 #include <asm/signal.h>
+#include <asm/cet.h>
 
 #ifdef CONFIG_X86_64
 /*
@@ -239,6 +240,9 @@ get_sigframe(struct k_sigaction *ka, struct pt_regs *regs, size_t frame_size,
 	unsigned long buf_fx = 0;
 	int onsigstack = on_sig_stack(sp);
 	int ret;
+#ifdef CONFIG_X86_64
+	void __user *restorer = NULL;
+#endif
 
 	/* redzone */
 	if (IS_ENABLED(CONFIG_X86_64))
@@ -270,6 +274,12 @@ get_sigframe(struct k_sigaction *ka, struct pt_regs *regs, size_t frame_size,
 	if (onsigstack && !likely(on_sig_stack(sp)))
 		return (void __user *)-1L;
 
+#ifdef CONFIG_X86_64
+	if (ka->sa.sa_flags & SA_RESTORER)
+		restorer = ka->sa.sa_restorer;
+	ret = save_cet_to_sigframe(0, *fpstate, (unsigned long)restorer);
+#endif
+
 	/* save i387 and extended state */
 	ret = copy_fpstate_to_sigframe(*fpstate, (void __user *)buf_fx, math_size);
 	if (ret < 0)
-- 
2.21.0

