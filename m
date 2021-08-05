Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5391B3E1F5E
	for <lists+linux-doc@lfdr.de>; Fri,  6 Aug 2021 01:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235809AbhHEXbY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 5 Aug 2021 19:31:24 -0400
Received: from mga02.intel.com ([134.134.136.20]:6542 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242379AbhHEXbX (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 5 Aug 2021 19:31:23 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10067"; a="201448372"
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; 
   d="scan'208";a="201448372"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2021 16:31:08 -0700
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; 
   d="scan'208";a="481043896"
Received: from rmgular-mobl2.amr.corp.intel.com (HELO skuppusw-desk1.amr.corp.intel.com) ([10.251.138.25])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2021 16:31:07 -0700
From:   Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Andy Lutomirski <luto@kernel.org>
Cc:     "H . Peter Anvin" <hpa@zytor.com>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Andi Kleen <ak@linux.intel.com>,
        Tony Luck <tony.luck@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>
Subject: [PATCH v3 2/5] x86/tdx: Add TDCALL tracepoint
Date:   Thu,  5 Aug 2021 16:30:33 -0700
Message-Id: <20210805233036.2949674-3-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210805233036.2949674-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20210805233036.2949674-1-sathyanarayanan.kuppuswamy@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add TDCALL tracepoint in __tdx_module_call() and
__tdx_hypercall() helper functions. These two helper functions
are core calls for triggering the "TDCALL" instruction. Having
a trace point for each TDCALL is useful for debugging and
performance analysis, as well as testing.

For __tdx_module_call(), it will dump info about TDCALL leaf
ID (RAX) and input parameters (RCX, RDX, R8, R9) in entry path
and TDCALL return status (RAX) and output parameters (RCX, RDX,
R8, R9, R10, R11) in exit path.

For __tdx_hypercall(), it will dump info about TDG.VP.VMCALL sub
ID (R11), and input parameters (R12-R15) in entry path and
TDG.VP.VMCALL return status (R10) and output parameters (R11-R15)
in exit path.

Also, make trace points RCU idle safe to avoid warnings when RCU
debugging is enabled.

Reviewed-by: Tony Luck <tony.luck@intel.com>
Reviewed-by: Andi Kleen <ak@linux.intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---

Changes since v2:
 * Added dummy out pointer for callers of _trace_tdx_hypercall() and
   _trace_tdx_modulecall() which does not pass explicit output pointers.

 arch/x86/include/asm/trace/tdx.h | 99 ++++++++++++++++++++++++++++++++
 arch/x86/kernel/tdx.c            | 66 ++++++++++++++++-----
 2 files changed, 152 insertions(+), 13 deletions(-)

diff --git a/arch/x86/include/asm/trace/tdx.h b/arch/x86/include/asm/trace/tdx.h
index 46bae44e12e5..e71b48e61fb1 100644
--- a/arch/x86/include/asm/trace/tdx.h
+++ b/arch/x86/include/asm/trace/tdx.h
@@ -47,6 +47,105 @@ TRACE_EVENT(tdg_virtualization_exception,
 		      )
 	    );
 
+TRACE_EVENT(tdx_module_call_enter,
+	    TP_PROTO(u64 id, u64 rcx, u64 rdx, u64 r8, u64 r9),
+	    TP_ARGS(id, rcx, rdx, r8, r9),
+	    TP_STRUCT__entry(
+		__field(u64, id)
+		__field(u64, rcx)
+		__field(u64, rdx)
+		__field(u64, r8)
+		__field(u64, r9)
+		),
+	    TP_fast_assign(
+		__entry->id  = id;
+		__entry->rcx = rcx;
+		__entry->rdx = rdx;
+		__entry->r8  = r8;
+		__entry->r9  = r9;
+		),
+	    TP_printk("id %lld rcx 0x%016llx rdx 0x%016llx r8 0x%016llx r9 0x%016llx",
+		      __entry->id, __entry->rcx, __entry->rdx,
+		      __entry->r8, __entry->r9
+		      )
+	    );
+
+TRACE_EVENT(tdx_module_call_exit,
+	    TP_PROTO(u64 rax, u64 rcx, u64 rdx, u64 r8, u64 r9,
+		     u64 r10, u64 r11),
+	    TP_ARGS(rax, rcx, rdx, r8, r9, r10, r11),
+	    TP_STRUCT__entry(
+		__field(u64, rax)
+		__field(u64, rcx)
+		__field(u64, rdx)
+		__field(u64, r8)
+		__field(u64, r9)
+		__field(u64, r10)
+		__field(u64, r11)
+		),
+	    TP_fast_assign(
+		__entry->rax = rax;
+		__entry->rcx = rcx;
+		__entry->rdx = rdx;
+		__entry->r8  = r8;
+		__entry->r9  = r9;
+		__entry->r10 = r10;
+		__entry->r11 = r11;
+		),
+	    TP_printk("ret %lld rcx 0x%016llx rdx 0x%016llx r8 0x%016llx r9 0x%016llx r10 0x%016llx r11 0x%016llx",
+		      __entry->rax, __entry->rcx, __entry->rdx,
+		      __entry->r8, __entry->r9, __entry->r10, __entry->r11
+		      )
+	    );
+
+TRACE_EVENT(tdx_hypercall_enter,
+	    TP_PROTO(u64 id, u64 r12, u64 r13, u64 r14, u64 r15),
+	    TP_ARGS(id, r12, r13, r14, r15),
+	    TP_STRUCT__entry(
+		__field(u64, id)
+		__field(u64, r12)
+		__field(u64, r13)
+		__field(u64, r14)
+		__field(u64, r15)
+		),
+	    TP_fast_assign(
+		__entry->id  = id;
+		__entry->r12 = r12;
+		__entry->r13 = r13;
+		__entry->r14 = r14;
+		__entry->r15 = r15;
+		),
+	    TP_printk("subfn %lld r12 0x%016llx r13 0x%016llx r14 0x%016llx r15 0x%016llx",
+		      __entry->id, __entry->r12, __entry->r13,
+		      __entry->r14, __entry->r15
+		      )
+	    );
+
+TRACE_EVENT(tdx_hypercall_exit,
+	    TP_PROTO(u64 r10, u64 r11, u64 r12, u64 r13, u64 r14, u64 r15),
+	    TP_ARGS(r10, r11, r12, r13, r14, r15),
+	    TP_STRUCT__entry(
+		__field(u64, r10)
+		__field(u64, r11)
+		__field(u64, r12)
+		__field(u64, r13)
+		__field(u64, r14)
+		__field(u64, r15)
+		),
+	    TP_fast_assign(
+		__entry->r10 = r10;
+		__entry->r11 = r11;
+		__entry->r12 = r12;
+		__entry->r13 = r13;
+		__entry->r14 = r14;
+		__entry->r15 = r15;
+		),
+	    TP_printk("ret %lld r11 0x%016llx r12 0x%016llx r13 0x%016llx r14 0x%016llx r15 0x%016llx",
+		      __entry->r10, __entry->r11, __entry->r12,
+		      __entry->r13, __entry->r14, __entry->r15
+		      )
+	    );
+
 #endif // CONFIG_INTEL_TDX_GUEST
 
 #undef TRACE_INCLUDE_PATH
diff --git a/arch/x86/kernel/tdx.c b/arch/x86/kernel/tdx.c
index 4b41baa56958..644e90dfa587 100644
--- a/arch/x86/kernel/tdx.c
+++ b/arch/x86/kernel/tdx.c
@@ -64,6 +64,39 @@ static inline u64 _tdx_hypercall(u64 fn, u64 r12, u64 r13, u64 r14,
 	return out->r10;
 }
 
+/* Traced version of _tdx_hypercall() */
+static u64 _trace_tdx_hypercall(u64 fn, u64 r12, u64 r13, u64 r14, u64 r15,
+				struct tdx_hypercall_output *out)
+{
+	u64 err;
+	struct tdx_hypercall_output dummy_out = {};
+
+	trace_tdx_hypercall_enter_rcuidle(fn, r12, r13, r14, r15);
+	err = _tdx_hypercall(fn, r12, r13, r14, r15, out);
+	if (!out)
+		out = &dummy_out;
+	trace_tdx_hypercall_exit_rcuidle(err, out->r11, out->r12, out->r13,
+					 out->r14, out->r15);
+
+	return err;
+}
+
+static u64 __trace_tdx_module_call(u64 fn, u64 rcx, u64 rdx, u64 r8, u64 r9,
+				   struct tdx_module_output *out)
+{
+	u64 err;
+	struct tdx_module_output dummy_out = {};
+
+	trace_tdx_module_call_enter_rcuidle(fn, rcx, rdx, r8, r9);
+	err = __tdx_module_call(fn, rcx, rdx, r8, r9, out);
+	if (!out)
+		out = &dummy_out;
+	trace_tdx_module_call_exit_rcuidle(err, out->rcx, out->rdx, out->r8,
+					   out->r9, out->r10, out->r11);
+
+	return err;
+}
+
 static inline bool cpuid_has_tdx_guest(void)
 {
 	u32 eax, sig[3];
@@ -101,7 +134,7 @@ static void tdg_get_info(void)
 	u64 ret;
 	struct tdx_module_output out = {0};
 
-	ret = __tdx_module_call(TDINFO, 0, 0, 0, 0, &out);
+	ret = __trace_tdx_module_call(TDINFO, 0, 0, 0, 0, &out);
 
 	BUG_ON(ret);
 
@@ -116,7 +149,7 @@ static void tdg_accept_page(phys_addr_t gpa)
 {
 	u64 ret;
 
-	ret = __tdx_module_call(TDACCEPTPAGE, gpa, 0, 0, 0, NULL);
+	ret = __trace_tdx_module_call(TDACCEPTPAGE, gpa, 0, 0, 0, NULL);
 
 	BUG_ON(ret && TDCALL_RETURN_CODE(ret) != TDX_PAGE_ALREADY_ACCEPTED);
 }
@@ -157,7 +190,8 @@ static __cpuidle void tdg_halt(void)
 {
 	u64 ret;
 
-	ret = _tdx_hypercall(EXIT_REASON_HLT, irqs_disabled(), 0, 0, 0, NULL);
+	ret = _trace_tdx_hypercall(EXIT_REASON_HLT, irqs_disabled(),
+				   0, 0, 0, NULL);
 
 	/* It should never fail */
 	BUG_ON(ret);
@@ -174,7 +208,7 @@ static __cpuidle void tdg_safe_halt(void)
 	local_irq_enable();
 
 	/* IRQ is enabled, So set R12 as 0 */
-	ret = _tdx_hypercall(EXIT_REASON_HLT, 0, 0, 0, 1, NULL);
+	ret = _trace_tdx_hypercall(EXIT_REASON_HLT, 0, 0, 0, 1, NULL);
 
 	/* It should never fail */
 	BUG_ON(ret);
@@ -209,7 +243,7 @@ static u64 tdg_read_msr_safe(unsigned int msr, int *err)
 
 	WARN_ON_ONCE(tdg_is_context_switched_msr(msr));
 
-	ret = _tdx_hypercall(EXIT_REASON_MSR_READ, msr, 0, 0, 0, &out);
+	ret = _trace_tdx_hypercall(EXIT_REASON_MSR_READ, msr, 0, 0, 0, &out);
 
 	*err = ret ? -EIO : 0;
 
@@ -223,8 +257,8 @@ static int tdg_write_msr_safe(unsigned int msr, unsigned int low,
 
 	WARN_ON_ONCE(tdg_is_context_switched_msr(msr));
 
-	ret = _tdx_hypercall(EXIT_REASON_MSR_WRITE, msr, (u64)high << 32 | low,
-			     0, 0, NULL);
+	ret = _trace_tdx_hypercall(EXIT_REASON_MSR_WRITE, msr,
+				   (u64)high << 32 | low, 0, 0, NULL);
 
 	return ret ? -EIO : 0;
 }
@@ -234,7 +268,8 @@ static void tdg_handle_cpuid(struct pt_regs *regs)
 	u64 ret;
 	struct tdx_hypercall_output out = {0};
 
-	ret = _tdx_hypercall(EXIT_REASON_CPUID, regs->ax, regs->cx, 0, 0, &out);
+	ret = _trace_tdx_hypercall(EXIT_REASON_CPUID, regs->ax,
+				   regs->cx, 0, 0, &out);
 
 	WARN_ON(ret);
 
@@ -264,11 +299,16 @@ static void tdg_handle_io(struct pt_regs *regs, u32 exit_qual)
 	/* I/O strings ops are unrolled at build time. */
 	BUG_ON(string);
 
-	ret = _tdx_hypercall(EXIT_REASON_IO_INSTRUCTION, size, out, port,
-			     regs->ax, &outh);
 	if (!out) {
+		ret = _trace_tdx_hypercall(EXIT_REASON_IO_INSTRUCTION,
+					   size, out, port, regs->ax,
+					   &outh);
 		regs->ax &= ~mask;
 		regs->ax |= (ret ? UINT_MAX : outh.r11) & mask;
+	} else {
+		ret = _tdx_hypercall(EXIT_REASON_IO_INSTRUCTION,
+				     size, out, port, regs->ax,
+				     &outh);
 	}
 }
 
@@ -278,8 +318,8 @@ static unsigned long tdg_mmio(int size, bool write, unsigned long addr,
 	struct tdx_hypercall_output out = {0};
 	u64 err;
 
-	err = _tdx_hypercall(EXIT_REASON_EPT_VIOLATION, size, write,
-			     addr, *val, &out);
+	err = _trace_tdx_hypercall(EXIT_REASON_EPT_VIOLATION, size, write,
+				   addr, *val, &out);
 	*val = out.r11;
 	return err;
 }
@@ -392,7 +432,7 @@ unsigned long tdg_get_ve_info(struct ve_info *ve)
 	 * additional #VEs are permitted (but we don't expect them to
 	 * happen unless you panic).
 	 */
-	ret = __tdx_module_call(TDGETVEINFO, 0, 0, 0, 0, &out);
+	ret = __trace_tdx_module_call(TDGETVEINFO, 0, 0, 0, 0, &out);
 
 	ve->exit_reason = out.rcx;
 	ve->exit_qual   = out.rdx;
-- 
2.25.1

