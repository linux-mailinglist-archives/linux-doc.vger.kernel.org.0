Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87C5167A17
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jul 2019 14:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727638AbfGMMKu (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 13 Jul 2019 08:10:50 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37657 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727504AbfGMMKu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 13 Jul 2019 08:10:50 -0400
Received: by mail-pl1-f195.google.com with SMTP id b3so6066004plr.4;
        Sat, 13 Jul 2019 05:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uMsMB9alWJXn21cyiS2KbYfXMY5ISHzxyZ3o/iN70ko=;
        b=HOZpjuqFsmudWdWtSGDqPraT309548UOECdgNfidt3JfUfMGyZ9/OtEYjlAx3R41Mv
         eIZqqFVCwdVoX+C3siHhUFeJhQyQUc/AlnI/eatPiUL4h2ZAwh7c55uyHt4DcCNPJs5T
         Fd9Zn4BPobbCEOV3HrQmF5yj4aFdulSShSwo2cEm5EB8VHnCgt6E7wt++8hwBB5QhMO9
         SPcfiQJnZCK8jYRt+Sy2u5iJ7ZkCIi0opBv3RV7PqJS4o1sQMZ2PjvgPQFIKopiFmRvI
         bbXz86yHWSsJ3IcjjTgZlth+dHEH0d2s9LSCKCeaXpcrRHF4q+AUGYFhzx6A4icyl5U/
         dknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uMsMB9alWJXn21cyiS2KbYfXMY5ISHzxyZ3o/iN70ko=;
        b=Jyo29/0fb0GDYUQV+bR0VJxhCnIoRnfmXdxPh0jWZs4D8IkZZIbQSSp66vk0F7wdn2
         YWQm07STi72hpNt2vYNsGvphFCfbjFF+UC1Acl/lWCiMtS/8BtFnelgOrPmJY/fNJGvE
         Ew/5DK1mg7AD8qHixtTxeG8HUO1XzAaAcWuvlzKOK3+WowILoi49x84qwCv0hP9sOg2E
         iv7SqKrD33Tq9zJgOa3Vh7+6zfurnPGkU/0oikJ2cEcsU7eLZzrjlJ76Vp+AyF0eO5Au
         uvQyo9dduRaA7cSmiZyYMieP4YpWDrGHumNCCqLZ8hStlgP0UHs+9n+gFwrHy8P65RlL
         4Lfg==
X-Gm-Message-State: APjAAAWAPMGncemi7FqSdOsL0Rr3YkJEoyokjex8MfPoWIz6R4g9Q6el
        fHFydWCJHuXZTRbjN+mVgA0=
X-Google-Smtp-Source: APXvYqxb95m6jlsNrNbGNEwgTILxd0GBnRRN4epn7fe10bsKDuv+6q4EgQHKrnF4StSU/ISZkBAenQ==
X-Received: by 2002:a17:902:6a85:: with SMTP id n5mr16278963plk.73.1563019849440;
        Sat, 13 Jul 2019 05:10:49 -0700 (PDT)
Received: from localhost.localdomain ([149.28.153.17])
        by smtp.gmail.com with ESMTPSA id h129sm10998372pfb.110.2019.07.13.05.10.38
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 13 Jul 2019 05:10:48 -0700 (PDT)
From:   Changbin Du <changbin.du@gmail.com>
To:     rostedt@goodmis.org
Cc:     mingo@redhat.com, corbet@lwn.net, linux@armlinux.org.uk,
        catalin.marinas@arm.com, will@kernel.org, tglx@linutronix.de,
        bp@alien8.de, hpa@zytor.com, x86@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Changbin Du <changbin.du@gmail.com>
Subject: [PATCH] tracing/fgraph: support recording function return values
Date:   Sat, 13 Jul 2019 20:10:26 +0800
Message-Id: <20190713121026.11030-1-changbin.du@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch adds a new trace option 'funcgraph-retval' and is disabled by
default. When this option is enabled, fgraph tracer will show the return
value of each function. This is useful to find/analyze a original error
source in a call graph.

One limitation is that the kernel doesn't know the prototype of functions.
So fgraph assumes all functions have a retvalue of type int. You must ignore
the value of *void* function. And if the retvalue looks like an error code
then both hexadecimal and decimal number are displayed.

In this patch, only x86 and ARM platforms are supported.

Here is example showing the error is caused by vmx_create_vcpu() and the
error code is -5 (-EIO).

Here is an example:
with echo 1 > /sys/kernel/debug/tracing/options/funcgraph-retval

 3)               |  kvm_vm_ioctl() {
 3)               |    mutex_lock() {
 3)               |      _cond_resched() {
 3)   0.234 us    |        rcu_all_qs(); /* ret=0x80000000 */
 3)   0.704 us    |      } /* ret=0x0 */
 3)   1.226 us    |    } /* ret=0x0 */
 3)   0.247 us    |    mutex_unlock(); /* ret=0xffff8880738ed040 */
 3)               |    kvm_arch_vcpu_create() {
 3)               |      vmx_create_vcpu() {
 3) + 17.969 us   |        kmem_cache_alloc(); /* ret=0xffff88813a980040 */
 3) + 15.948 us   |        kmem_cache_alloc(); /* ret=0xffff88813aa99200 */
 3)   0.653 us    |        allocate_vpid.part.88(); /* ret=0x1 */
 3)   6.964 us    |        kvm_vcpu_init(); /* ret=0xfffffffb */
 3)   0.323 us    |        free_vpid.part.89(); /* ret=0x1 */
 3)   9.985 us    |        kmem_cache_free(); /* ret=0x80000000 */
 3)   9.491 us    |        kmem_cache_free(); /* ret=0x80000000 */
 3) + 69.858 us   |      } /* ret=0xfffffffffffffffb/-5 */
 3) + 70.631 us   |    } /* ret=0xfffffffffffffffb/-5 */
 3)               |    mutex_lock() {
 3)               |      _cond_resched() {
 3)   0.199 us    |        rcu_all_qs(); /* ret=0x80000000 */
 3)   0.594 us    |      } /* ret=0x0 */
 3)   1.067 us    |    } /* ret=0x0 */
 3)   0.337 us    |    mutex_unlock(); /* ret=0xffff8880738ed040 */
 3) + 92.730 us   |  } /* ret=0xfffffffffffffffb/-5 */

Checking above fgraph output, we can easily know the original error is
raised from function vmx_create_vcpu().

Signed-off-by: Changbin Du <changbin.du@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
---
 Documentation/trace/ftrace.rst       |  5 ++++
 arch/arm/kernel/entry-ftrace.S       |  1 +
 arch/arm64/kernel/entry-ftrace.S     |  1 +
 arch/x86/kernel/ftrace_32.S          |  1 +
 arch/x86/kernel/ftrace_64.S          |  1 +
 include/linux/ftrace.h               |  1 +
 kernel/trace/Kconfig                 |  4 +++
 kernel/trace/fgraph.c                | 17 +++++++++++-
 kernel/trace/trace.h                 |  1 +
 kernel/trace/trace_entries.h         |  1 +
 kernel/trace/trace_functions_graph.c | 39 ++++++++++++++++++++++++----
 11 files changed, 66 insertions(+), 6 deletions(-)

diff --git a/Documentation/trace/ftrace.rst b/Documentation/trace/ftrace.rst
index f60079259669..50dfb0378213 100644
--- a/Documentation/trace/ftrace.rst
+++ b/Documentation/trace/ftrace.rst
@@ -1264,6 +1264,11 @@ Options for function_graph tracer:
 	only a closing curly bracket "}" is displayed for
 	the return of a function.
 
+  funcgraph-retval - At the end of each function (the return) the
+    return value the function  (though the function may not
+    really have it) is displayed in hex and negative number
+    if it looks like a error code.
+
   sleep-time
 	When running function graph tracer, to include
 	the time a task schedules out in its function.
diff --git a/arch/arm/kernel/entry-ftrace.S b/arch/arm/kernel/entry-ftrace.S
index a74289ebc803..94e8209f1a6b 100644
--- a/arch/arm/kernel/entry-ftrace.S
+++ b/arch/arm/kernel/entry-ftrace.S
@@ -259,6 +259,7 @@ ENDPROC(ftrace_graph_regs_caller)
 	.globl return_to_handler
 return_to_handler:
 	stmdb	sp!, {r0-r3}
+	mov	r1, r0			@ return value
 	mov	r0, fp			@ frame pointer
 	bl	ftrace_return_to_handler
 	mov	lr, r0			@ r0 has real ret addr
diff --git a/arch/arm64/kernel/entry-ftrace.S b/arch/arm64/kernel/entry-ftrace.S
index 33d003d80121..b7ce416969d0 100644
--- a/arch/arm64/kernel/entry-ftrace.S
+++ b/arch/arm64/kernel/entry-ftrace.S
@@ -199,6 +199,7 @@ ENTRY(return_to_handler)
 	stp x4, x5, [sp, #32]
 	stp x6, x7, [sp, #48]
 
+	mov	x1, x0			// return value
 	mov	x0, x29			//     parent's fp
 	bl	ftrace_return_to_handler// addr = ftrace_return_to_hander(fp);
 	mov	x30, x0			// restore the original return address
diff --git a/arch/x86/kernel/ftrace_32.S b/arch/x86/kernel/ftrace_32.S
index 073aab525d80..539e80577a83 100644
--- a/arch/x86/kernel/ftrace_32.S
+++ b/arch/x86/kernel/ftrace_32.S
@@ -185,6 +185,7 @@ END(ftrace_graph_caller)
 return_to_handler:
 	pushl	%eax
 	pushl	%edx
+	movl	%eax, %edx
 	movl	$0, %eax
 	call	ftrace_return_to_handler
 	movl	%eax, %ecx
diff --git a/arch/x86/kernel/ftrace_64.S b/arch/x86/kernel/ftrace_64.S
index 809d54397dba..3b31a1959025 100644
--- a/arch/x86/kernel/ftrace_64.S
+++ b/arch/x86/kernel/ftrace_64.S
@@ -304,6 +304,7 @@ ENTRY(return_to_handler)
 	movq %rax, (%rsp)
 	movq %rdx, 8(%rsp)
 	movq %rbp, %rdi
+	movq %rax, %rsi
 
 	call ftrace_return_to_handler
 
diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index 25e2995d4a4c..83881bc47b50 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -734,6 +734,7 @@ struct ftrace_graph_ret {
 	unsigned long overrun;
 	unsigned long long calltime;
 	unsigned long long rettime;
+	unsigned long retval;
 	int depth;
 } __packed;
 
diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index 564e5fdb025f..7d189ea461e8 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -25,6 +25,9 @@ config HAVE_FUNCTION_GRAPH_TRACER
 	help
 	  See Documentation/trace/ftrace-design.rst
 
+config HAVE_FTRACE_RETVAL
+	bool
+
 config HAVE_DYNAMIC_FTRACE
 	bool
 	help
@@ -161,6 +164,7 @@ config FUNCTION_GRAPH_TRACER
 	depends on HAVE_FUNCTION_GRAPH_TRACER
 	depends on FUNCTION_TRACER
 	depends on !X86_32 || !CC_OPTIMIZE_FOR_SIZE
+	select HAVE_FTRACE_RETVAL if (X86 || ARM)
 	default y
 	help
 	  Enable the kernel to trace a function at both its return
diff --git a/kernel/trace/fgraph.c b/kernel/trace/fgraph.c
index 8dfd5021b933..df27fe3a35f9 100644
--- a/kernel/trace/fgraph.c
+++ b/kernel/trace/fgraph.c
@@ -206,13 +206,15 @@ static struct notifier_block ftrace_suspend_notifier = {
  * Send the trace to the ring-buffer.
  * @return the original return address.
  */
-unsigned long ftrace_return_to_handler(unsigned long frame_pointer)
+static unsigned long _ftrace_return_to_handler(unsigned long frame_pointer,
+					       unsigned long retval)
 {
 	struct ftrace_graph_ret trace;
 	unsigned long ret;
 
 	ftrace_pop_return_trace(&trace, &ret, frame_pointer);
 	trace.rettime = trace_clock_local();
+	trace.retval = retval;
 	ftrace_graph_return(&trace);
 	/*
 	 * The ftrace_graph_return() may still access the current
@@ -232,6 +234,19 @@ unsigned long ftrace_return_to_handler(unsigned long frame_pointer)
 	return ret;
 }
 
+#if defined(CONFIG_HAVE_FTRACE_RETVAL)
+unsigned long ftrace_return_to_handler(unsigned long frame_pointer,
+				       unsigned long retval)
+{
+	return _ftrace_return_to_handler(frame_pointer, retval);
+}
+#else
+unsigned long ftrace_return_to_handler(unsigned long frame_pointer)
+{
+	return _ftrace_return_to_handler(frame_pointer, 0);
+}
+#endif
+
 /**
  * ftrace_graph_get_ret_stack - return the entry of the shadow stack
  * @task: The task to read the shadow stack from
diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index 005f08629b8b..483eecf0e9c3 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -905,6 +905,7 @@ static __always_inline bool ftrace_hash_empty(struct ftrace_hash *hash)
 #define TRACE_GRAPH_PRINT_TAIL          0x100
 #define TRACE_GRAPH_SLEEP_TIME          0x200
 #define TRACE_GRAPH_GRAPH_TIME          0x400
+#define TRACE_GRAPH_PRINT_RETVAL	0x800
 #define TRACE_GRAPH_PRINT_FILL_SHIFT	28
 #define TRACE_GRAPH_PRINT_FILL_MASK	(0x3 << TRACE_GRAPH_PRINT_FILL_SHIFT)
 
diff --git a/kernel/trace/trace_entries.h b/kernel/trace/trace_entries.h
index fc8e97328e54..4b5312cfed66 100644
--- a/kernel/trace/trace_entries.h
+++ b/kernel/trace/trace_entries.h
@@ -99,6 +99,7 @@ FTRACE_ENTRY_PACKED(funcgraph_exit, ftrace_graph_ret_entry,
 		__field_desc(	unsigned long,	ret,		func	)
 		__field_desc(	unsigned long long, ret,	calltime)
 		__field_desc(	unsigned long long, ret,	rettime	)
+		__field_desc(	unsigned long,	ret,		retval	)
 		__field_desc(	unsigned long,	ret,		overrun	)
 		__field_desc(	int,		ret,		depth	)
 	),
diff --git a/kernel/trace/trace_functions_graph.c b/kernel/trace/trace_functions_graph.c
index 69ebf3c2f1b5..399382cf175b 100644
--- a/kernel/trace/trace_functions_graph.c
+++ b/kernel/trace/trace_functions_graph.c
@@ -66,6 +66,11 @@ static struct tracer_opt trace_opts[] = {
 	{ TRACER_OPT(graph-time, TRACE_GRAPH_GRAPH_TIME) },
 #endif
 
+#ifdef CONFIG_HAVE_FTRACE_RETVAL
+	/* Display return value of function */
+	{ TRACER_OPT(funcgraph-retval, TRACE_GRAPH_PRINT_RETVAL) },
+#endif
+
 	{ } /* Empty entry */
 };
 
@@ -624,6 +629,18 @@ print_graph_duration(struct trace_array *tr, unsigned long long duration,
 	trace_seq_puts(s, "|  ");
 }
 
+static void print_graph_retval(struct trace_seq *s, unsigned long val, bool comment)
+{
+	if (comment)
+		trace_seq_printf(s, " /* ");
+	if (IS_ERR_VALUE(val))
+		trace_seq_printf(s, "ret=0x%lx/%ld", val, val);
+	else
+		trace_seq_printf(s, "ret=0x%lx", val);
+	if (comment)
+		trace_seq_printf(s, " */");
+}
+
 /* Case of a leaf function on its call entry */
 static enum print_line_t
 print_graph_entry_leaf(struct trace_iterator *iter,
@@ -668,7 +685,10 @@ print_graph_entry_leaf(struct trace_iterator *iter,
 	for (i = 0; i < call->depth * TRACE_GRAPH_INDENT; i++)
 		trace_seq_putc(s, ' ');
 
-	trace_seq_printf(s, "%ps();\n", (void *)call->func);
+	trace_seq_printf(s, "%ps();", (void *)call->func);
+	if (flags & TRACE_GRAPH_PRINT_RETVAL)
+		print_graph_retval(s, graph_ret->retval, true);
+	trace_seq_puts(s, "\n");
 
 	print_graph_irq(iter, graph_ret->func, TRACE_GRAPH_RET,
 			cpu, iter->ent->pid, flags);
@@ -953,10 +973,19 @@ print_graph_return(struct ftrace_graph_ret *trace, struct trace_seq *s,
 	 * belongs to, write out the function name. Always do
 	 * that if the funcgraph-tail option is enabled.
 	 */
-	if (func_match && !(flags & TRACE_GRAPH_PRINT_TAIL))
-		trace_seq_puts(s, "}\n");
-	else
-		trace_seq_printf(s, "} /* %ps */\n", (void *)trace->func);
+	if (func_match && !(flags & TRACE_GRAPH_PRINT_TAIL)) {
+		trace_seq_puts(s, "}");
+		if (flags & TRACE_GRAPH_PRINT_RETVAL)
+			print_graph_retval(s, trace->retval, true);
+		trace_seq_puts(s, "\n");
+	} else {
+		trace_seq_printf(s, "} /* %ps", (void *)trace->func);
+		if (flags & TRACE_GRAPH_PRINT_RETVAL) {
+			trace_seq_puts(s, ", ");
+			print_graph_retval(s, trace->retval, false);
+		}
+		trace_seq_puts(s, " */\n");
+	}
 
 	/* Overrun */
 	if (flags & TRACE_GRAPH_PRINT_OVERRUN)
-- 
2.20.1

