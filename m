Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 613402A6DA3
	for <lists+linux-doc@lfdr.de>; Wed,  4 Nov 2020 20:13:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731260AbgKDTNf convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-doc@lfdr.de>); Wed, 4 Nov 2020 14:13:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:39990 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730666AbgKDTNf (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 4 Nov 2020 14:13:35 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1CDB4206DB;
        Wed,  4 Nov 2020 19:13:29 +0000 (UTC)
Date:   Wed, 4 Nov 2020 14:13:26 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Petr Mladek <pmladek@suse.com>
Cc:     linux-kernel@vger.kernel.org,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Miroslav Benes <mbenes@suse.cz>,
        Jonathan Corbet <corbet@lwn.net>, Guo Ren <guoren@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Joe Lawrence <joe.lawrence@redhat.com>,
        Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        linux-doc@vger.kernel.org, linux-csky@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, live-patching@vger.kernel.org
Subject: Re: [PATCH 11/11 v2.2] ftrace: Add recording of functions that
 caused recursion
Message-ID: <20201104141326.71866510@gandalf.local.home>
In-Reply-To: <20201103141043.GO20201@alley>
References: <20201030213142.096102821@goodmis.org>
        <20201030214014.801706340@goodmis.org>
        <20201102164147.GJ20201@alley>
        <20201102123721.4fcce2cb@gandalf.local.home>
        <20201102124606.72bd89c5@gandalf.local.home>
        <20201102142254.7e148f8a@gandalf.local.home>
        <20201103141043.GO20201@alley>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 3 Nov 2020 15:10:43 +0100
Petr Mladek <pmladek@suse.com> wrote:

> BTW: What is actually the purpose of paranoid_test, please?
> 
> It prevents nested ftrace_record_recursion() calls on the same CPU
> (recursion, nesting from IRQ, NMI context).
> 
> Parallel calls from different CPUs are still possible:
> 
> CPU0					CPU1
> if (!atomic_read(&paranoid_test))	if (!atomic_read(&paranoid_test))
>    // passes				  // passes
>    atomic_inc(&paranoid_test);            atomic_inc(&paranoid_test);
> 
> 
> I do not see how a nested call could cause crash while a parallel
> one would be OK.

The problem was that I don't want something in the recording to get traced,
and that detect the recursion, which would then call the recording, which
would also be traced and detect the recursion and that would call the
recording, which would also be traced and detect the recursion and that
would call the recording, which .... (BOOM!)

Anyway, I decided to simply use another bit to protect against that.

New patch:

From a1f2aae996506169f2561986656f898d067d398b Mon Sep 17 00:00:00 2001
From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Date: Thu, 29 Oct 2020 15:27:06 -0400
Subject: [PATCH] ftrace: Add recording of functions that caused recursion

This adds CONFIG_FTRACE_RECORD_RECURSION that will record to a file
"recursed_functions" all the functions that caused recursion while a
callback to the function tracer was running.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Guo Ren <guoren@kernel.org>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Anton Vorontsov <anton@enomsg.org>
Cc: Colin Cross <ccross@android.com>
Cc: Tony Luck <tony.luck@intel.com>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Miroslav Benes <mbenes@suse.cz>
Cc: Petr Mladek <pmladek@suse.com>
Cc: Joe Lawrence <joe.lawrence@redhat.com>
Cc: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-csky@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-s390@vger.kernel.org
Cc: live-patching@vger.kernel.org
Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
---
 Documentation/trace/ftrace-uses.rst   |   6 +-
 arch/csky/kernel/probes/ftrace.c      |   2 +-
 arch/parisc/kernel/ftrace.c           |   2 +-
 arch/powerpc/kernel/kprobes-ftrace.c  |   2 +-
 arch/s390/kernel/ftrace.c             |   2 +-
 arch/x86/kernel/kprobes/ftrace.c      |   2 +-
 fs/pstore/ftrace.c                    |   2 +-
 include/linux/trace_recursion.h       |  29 +++-
 kernel/livepatch/patch.c              |   2 +-
 kernel/trace/Kconfig                  |  25 +++
 kernel/trace/Makefile                 |   1 +
 kernel/trace/ftrace.c                 |   4 +-
 kernel/trace/trace_event_perf.c       |   2 +-
 kernel/trace/trace_functions.c        |   2 +-
 kernel/trace/trace_output.c           |   6 +-
 kernel/trace/trace_output.h           |   1 +
 kernel/trace/trace_recursion_record.c | 236 ++++++++++++++++++++++++++
 17 files changed, 306 insertions(+), 20 deletions(-)
 create mode 100644 kernel/trace/trace_recursion_record.c

diff --git a/Documentation/trace/ftrace-uses.rst b/Documentation/trace/ftrace-uses.rst
index 86cd14b8e126..5981d5691745 100644
--- a/Documentation/trace/ftrace-uses.rst
+++ b/Documentation/trace/ftrace-uses.rst
@@ -118,7 +118,7 @@ can help in this regard. If you start your code with:
 
 	int bit;
 
-	bit = ftrace_test_recursion_trylock();
+	bit = ftrace_test_recursion_trylock(ip, parent_ip);
 	if (bit < 0)
 		return;
 
@@ -130,7 +130,9 @@ The code in between will be safe to use, even if it ends up calling a
 function that the callback is tracing. Note, on success,
 ftrace_test_recursion_trylock() will disable preemption, and the
 ftrace_test_recursion_unlock() will enable it again (if it was previously
-enabled).
+enabled). The instruction pointer (ip) and its parent (parent_ip) is passed to
+ftrace_test_recursion_trylock() to record where the recursion happened
+(if CONFIG_FTRACE_RECORD_RECURSION is set).
 
 Alternatively, if the FTRACE_OPS_FL_RECURSION flag is set on the ftrace_ops
 (as explained below), then a helper trampoline will be used to test
diff --git a/arch/csky/kernel/probes/ftrace.c b/arch/csky/kernel/probes/ftrace.c
index 5eb2604fdf71..f30b179924ef 100644
--- a/arch/csky/kernel/probes/ftrace.c
+++ b/arch/csky/kernel/probes/ftrace.c
@@ -18,7 +18,7 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 	struct kprobe *p;
 	struct kprobe_ctlblk *kcb;
 
-	bit = ftrace_test_recursion_trylock();
+	bit = ftrace_test_recursion_trylock(ip, parent_ip);
 	if (bit < 0)
 		return;
 
diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
index 13d85042810a..1c5d3732bda2 100644
--- a/arch/parisc/kernel/ftrace.c
+++ b/arch/parisc/kernel/ftrace.c
@@ -210,7 +210,7 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 	struct kprobe *p;
 	int bit;
 
-	bit = ftrace_test_recursion_trylock();
+	bit = ftrace_test_recursion_trylock(ip, parent_ip);
 	if (bit < 0)
 		return;
 
diff --git a/arch/powerpc/kernel/kprobes-ftrace.c b/arch/powerpc/kernel/kprobes-ftrace.c
index 5df8d50c65ae..fdfee39938ea 100644
--- a/arch/powerpc/kernel/kprobes-ftrace.c
+++ b/arch/powerpc/kernel/kprobes-ftrace.c
@@ -20,7 +20,7 @@ void kprobe_ftrace_handler(unsigned long nip, unsigned long parent_nip,
 	struct kprobe_ctlblk *kcb;
 	int bit;
 
-	bit = ftrace_test_recursion_trylock();
+	bit = ftrace_test_recursion_trylock(nip, parent_nip);
 	if (bit < 0)
 		return;
 
diff --git a/arch/s390/kernel/ftrace.c b/arch/s390/kernel/ftrace.c
index 8f31c726537a..657c1ab45408 100644
--- a/arch/s390/kernel/ftrace.c
+++ b/arch/s390/kernel/ftrace.c
@@ -204,7 +204,7 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 	struct kprobe *p;
 	int bit;
 
-	bit = ftrace_test_recursion_trylock();
+	bit = ftrace_test_recursion_trylock(ip, parent_ip);
 	if (bit < 0)
 		return;
 
diff --git a/arch/x86/kernel/kprobes/ftrace.c b/arch/x86/kernel/kprobes/ftrace.c
index a40a6cdfcca3..954d930a7127 100644
--- a/arch/x86/kernel/kprobes/ftrace.c
+++ b/arch/x86/kernel/kprobes/ftrace.c
@@ -20,7 +20,7 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 	struct kprobe_ctlblk *kcb;
 	int bit;
 
-	bit = ftrace_test_recursion_trylock();
+	bit = ftrace_test_recursion_trylock(ip, parent_ip);
 	if (bit < 0)
 		return;
 
diff --git a/fs/pstore/ftrace.c b/fs/pstore/ftrace.c
index 816210fc5d3a..adb0935eb062 100644
--- a/fs/pstore/ftrace.c
+++ b/fs/pstore/ftrace.c
@@ -41,7 +41,7 @@ static void notrace pstore_ftrace_call(unsigned long ip,
 	if (unlikely(oops_in_progress))
 		return;
 
-	bit = ftrace_test_recursion_trylock();
+	bit = ftrace_test_recursion_trylock(ip, parent_ip);
 	if (bit < 0)
 		return;
 
diff --git a/include/linux/trace_recursion.h b/include/linux/trace_recursion.h
index ac3d73484cb2..228cc56ed66e 100644
--- a/include/linux/trace_recursion.h
+++ b/include/linux/trace_recursion.h
@@ -91,6 +91,9 @@ enum {
 	 * not be correct. Allow for a single recursion to cover this case.
 	 */
 	TRACE_TRANSITION_BIT,
+
+	/* Used to prevent recursion recording from recursing. */
+	TRACE_RECORD_RECURSION_BIT,
 };
 
 #define trace_recursion_set(bit)	do { (current)->trace_recursion |= (1<<(bit)); } while (0)
@@ -142,7 +145,22 @@ static __always_inline int trace_get_context_bit(void)
 			pc & HARDIRQ_MASK ? TRACE_CTX_IRQ : TRACE_CTX_SOFTIRQ;
 }
 
-static __always_inline int trace_test_and_set_recursion(int start, int max)
+#ifdef CONFIG_FTRACE_RECORD_RECURSION
+extern void ftrace_record_recursion(unsigned long ip, unsigned long parent_ip);
+# define do_ftrace_record_recursion(ip, pip)				\
+	do {								\
+		if (!trace_recursion_test(TRACE_RECORD_RECURSION_BIT)) { \
+			trace_recursion_set(TRACE_RECORD_RECURSION_BIT); \
+			ftrace_record_recursion(ip, pip);		\
+			trace_recursion_clear(TRACE_RECORD_RECURSION_BIT); \
+		}							\
+	} while (0)
+#else
+# define do_ftrace_record_recursion(ip, pip)	do { } while (0)
+#endif
+
+static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsigned long pip,
+							int start, int max)
 {
 	unsigned int val = current->trace_recursion;
 	int bit;
@@ -158,8 +176,10 @@ static __always_inline int trace_test_and_set_recursion(int start, int max)
 		 * a switch between contexts. Allow for a single recursion.
 		 */
 		bit = TRACE_TRANSITION_BIT;
-		if (trace_recursion_test(bit))
+		if (trace_recursion_test(bit)) {
+			do_ftrace_record_recursion(ip, pip);
 			return -1;
+		}
 		trace_recursion_set(bit);
 		barrier();
 		return bit + 1;
@@ -199,9 +219,10 @@ static __always_inline void trace_clear_recursion(int bit)
  * Returns: -1 if a recursion happened.
  *           >= 0 if no recursion
  */
-static __always_inline int ftrace_test_recursion_trylock(void)
+static __always_inline int ftrace_test_recursion_trylock(unsigned long ip,
+							 unsigned long parent_ip)
 {
-	return trace_test_and_set_recursion(TRACE_FTRACE_START, TRACE_FTRACE_MAX);
+	return trace_test_and_set_recursion(ip, parent_ip, TRACE_FTRACE_START, TRACE_FTRACE_MAX);
 }
 
 /**
diff --git a/kernel/livepatch/patch.c b/kernel/livepatch/patch.c
index 15480bf3ce88..875c5dbbdd33 100644
--- a/kernel/livepatch/patch.c
+++ b/kernel/livepatch/patch.c
@@ -49,7 +49,7 @@ static void notrace klp_ftrace_handler(unsigned long ip,
 
 	ops = container_of(fops, struct klp_ops, fops);
 
-	bit = ftrace_test_recursion_trylock();
+	bit = ftrace_test_recursion_trylock(ip, parent_ip);
 	if (WARN_ON_ONCE(bit < 0))
 		return;
 	/*
diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index a4020c0b4508..9b11c096d139 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -727,6 +727,31 @@ config TRACE_EVAL_MAP_FILE
 
 	If unsure, say N.
 
+config FTRACE_RECORD_RECURSION
+	bool "Record functions that recurse in function tracing"
+	depends on FUNCTION_TRACER
+	help
+	  All callbacks that attach to the function tracing have some sort
+	  of protection against recursion. Even though the protection exists,
+	  it adds overhead. This option will create a file in the tracefs
+	  file system called "recursed_functions" that will list the functions
+	  that triggered a recursion.
+
+	  This will add more overhead to cases that have recursion.
+
+	  If unsure, say N
+
+config FTRACE_RECORD_RECURSION_SIZE
+	int "Max number of recursed functions to record"
+	default	128
+	depends on FTRACE_RECORD_RECURSION
+	help
+	  This defines the limit of number of functions that can be
+	  listed in the "recursed_functions" file, that lists all
+	  the functions that caused a recursion to happen.
+	  This file can be reset, but the limit can not change in
+	  size at runtime.
+
 config GCOV_PROFILE_FTRACE
 	bool "Enable GCOV profiling on ftrace subsystem"
 	depends on GCOV_KERNEL
diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
index e153be351548..7e44cea89fdc 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -92,6 +92,7 @@ obj-$(CONFIG_DYNAMIC_EVENTS) += trace_dynevent.o
 obj-$(CONFIG_PROBE_EVENTS) += trace_probe.o
 obj-$(CONFIG_UPROBE_EVENTS) += trace_uprobe.o
 obj-$(CONFIG_BOOTTIME_TRACING) += trace_boot.o
+obj-$(CONFIG_FTRACE_RECORD_RECURSION) += trace_recursion_record.o
 
 obj-$(CONFIG_TRACEPOINT_BENCHMARK) += trace_benchmark.o
 
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 39f2bba89b76..03aad2b5cd5e 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -6918,7 +6918,7 @@ __ftrace_ops_list_func(unsigned long ip, unsigned long parent_ip,
 	struct ftrace_ops *op;
 	int bit;
 
-	bit = trace_test_and_set_recursion(TRACE_LIST_START, TRACE_LIST_MAX);
+	bit = trace_test_and_set_recursion(ip, parent_ip, TRACE_LIST_START, TRACE_LIST_MAX);
 	if (bit < 0)
 		return;
 
@@ -6993,7 +6993,7 @@ static void ftrace_ops_assist_func(unsigned long ip, unsigned long parent_ip,
 {
 	int bit;
 
-	bit = trace_test_and_set_recursion(TRACE_LIST_START, TRACE_LIST_MAX);
+	bit = trace_test_and_set_recursion(ip, parent_ip, TRACE_LIST_START, TRACE_LIST_MAX);
 	if (bit < 0)
 		return;
 
diff --git a/kernel/trace/trace_event_perf.c b/kernel/trace/trace_event_perf.c
index a2b9fddb8148..1b202e28dfaa 100644
--- a/kernel/trace/trace_event_perf.c
+++ b/kernel/trace/trace_event_perf.c
@@ -447,7 +447,7 @@ perf_ftrace_function_call(unsigned long ip, unsigned long parent_ip,
 	if ((unsigned long)ops->private != smp_processor_id())
 		return;
 
-	bit = ftrace_test_recursion_trylock();
+	bit = ftrace_test_recursion_trylock(ip, parent_ip);
 	if (bit < 0)
 		return;
 
diff --git a/kernel/trace/trace_functions.c b/kernel/trace/trace_functions.c
index 89c414ce1388..646eda6c44a5 100644
--- a/kernel/trace/trace_functions.c
+++ b/kernel/trace/trace_functions.c
@@ -141,7 +141,7 @@ function_trace_call(unsigned long ip, unsigned long parent_ip,
 	if (unlikely(!tr->function_enabled))
 		return;
 
-	bit = ftrace_test_recursion_trylock();
+	bit = ftrace_test_recursion_trylock(ip, parent_ip);
 	if (bit < 0)
 		return;
 
diff --git a/kernel/trace/trace_output.c b/kernel/trace/trace_output.c
index 000e9dc224c6..92b1575ae0ca 100644
--- a/kernel/trace/trace_output.c
+++ b/kernel/trace/trace_output.c
@@ -353,8 +353,8 @@ static inline const char *kretprobed(const char *name)
 }
 #endif /* CONFIG_KRETPROBES */
 
-static void
-seq_print_sym(struct trace_seq *s, unsigned long address, bool offset)
+void
+trace_seq_print_sym(struct trace_seq *s, unsigned long address, bool offset)
 {
 #ifdef CONFIG_KALLSYMS
 	char str[KSYM_SYMBOL_LEN];
@@ -420,7 +420,7 @@ seq_print_ip_sym(struct trace_seq *s, unsigned long ip, unsigned long sym_flags)
 		goto out;
 	}
 
-	seq_print_sym(s, ip, sym_flags & TRACE_ITER_SYM_OFFSET);
+	trace_seq_print_sym(s, ip, sym_flags & TRACE_ITER_SYM_OFFSET);
 
 	if (sym_flags & TRACE_ITER_SYM_ADDR)
 		trace_seq_printf(s, " <" IP_FMT ">", ip);
diff --git a/kernel/trace/trace_output.h b/kernel/trace/trace_output.h
index 2f742b74e7e6..4c954636caf0 100644
--- a/kernel/trace/trace_output.h
+++ b/kernel/trace/trace_output.h
@@ -16,6 +16,7 @@ extern int
 seq_print_ip_sym(struct trace_seq *s, unsigned long ip,
 		unsigned long sym_flags);
 
+extern void trace_seq_print_sym(struct trace_seq *s, unsigned long address, bool offset);
 extern int trace_print_context(struct trace_iterator *iter);
 extern int trace_print_lat_context(struct trace_iterator *iter);
 
diff --git a/kernel/trace/trace_recursion_record.c b/kernel/trace/trace_recursion_record.c
new file mode 100644
index 000000000000..b2edac1fe156
--- /dev/null
+++ b/kernel/trace/trace_recursion_record.c
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/seq_file.h>
+#include <linux/kallsyms.h>
+#include <linux/module.h>
+#include <linux/ftrace.h>
+#include <linux/fs.h>
+
+#include "trace_output.h"
+
+struct recursed_functions {
+	unsigned long		ip;
+	unsigned long		parent_ip;
+};
+
+static struct recursed_functions recursed_functions[CONFIG_FTRACE_RECORD_RECURSION_SIZE];
+static atomic_t nr_records;
+
+/*
+ * Cache the last found function. Yes, updates to this is racey, but
+ * so is memory cache ;-)
+ */
+static unsigned long cached_function;
+
+void ftrace_record_recursion(unsigned long ip, unsigned long parent_ip)
+{
+	int index = 0;
+	int i;
+	unsigned long old;
+
+ again:
+	/* First check the last one recorded */
+	if (ip == cached_function)
+		return;
+
+	i = atomic_read(&nr_records);
+	/* nr_records is -1 when clearing records */
+	smp_mb__after_atomic();
+	if (i < 0)
+		return;
+
+	/*
+	 * If there's two writers and this writer comes in second,
+	 * the cmpxchg() below to update the ip will fail. Then this
+	 * writer will try again. It is possible that index will now
+	 * be greater than nr_records. This is because the writer
+	 * that succeeded has not updated the nr_records yet.
+	 * This writer could keep trying again until the other writer
+	 * updates nr_records. But if the other writer takes an
+	 * interrupt, and that interrupt locks up that CPU, we do
+	 * not want this CPU to lock up due to the recursion protection,
+	 * and have a bug report showing this CPU as the cause of
+	 * locking up the computer. To not lose this record, this
+	 * writer will simply use the next position to update the
+	 * recursed_functions, and it will update the nr_records
+	 * accordingly.
+	 */
+	if (index < i)
+		index = i;
+	if (index >= CONFIG_FTRACE_RECORD_RECURSION_SIZE)
+		return;
+
+	for (i = index - 1; i >= 0; i--) {
+		if (recursed_functions[i].ip == ip) {
+			cached_function = ip;
+			return;
+		}
+	}
+
+	cached_function = ip;
+
+	/*
+	 * We only want to add a function if it hasn't been added before.
+	 * Add to the current location before incrementing the count.
+	 * If it fails to add, then increment the index (save in i)
+	 * and try again.
+	 */
+	old = cmpxchg(&recursed_functions[index].ip, 0, ip);
+	if (old != 0) {
+		/* Did something else already added this for us? */
+		if (old == ip)
+			return;
+		/* Try the next location (use i for the next index) */
+		index++;
+		goto again;
+	}
+
+	recursed_functions[index].parent_ip = parent_ip;
+
+	/*
+	 * It's still possible that we could race with the clearing
+	 *    CPU0                                    CPU1
+	 *    ----                                    ----
+	 *                                       ip = func
+	 *  nr_records = -1;
+	 *  recursed_functions[0] = 0;
+	 *                                       i = -1
+	 *                                       if (i < 0)
+	 *  nr_records = 0;
+	 *  (new recursion detected)
+	 *      recursed_functions[0] = func
+	 *                                            cmpxchg(recursed_functions[0],
+	 *                                                    func, 0)
+	 *
+	 * But the worse that could happen is that we get a zero in
+	 * the recursed_functions array, and it's likely that "func" will
+	 * be recorded again.
+	 */
+	i = atomic_read(&nr_records);
+	smp_mb__after_atomic();
+	if (i < 0)
+		cmpxchg(&recursed_functions[index].ip, ip, 0);
+	else if (i <= index)
+		atomic_cmpxchg(&nr_records, i, index + 1);
+}
+EXPORT_SYMBOL_GPL(ftrace_record_recursion);
+
+static DEFINE_MUTEX(recursed_function_lock);
+static struct trace_seq *tseq;
+
+static void *recursed_function_seq_start(struct seq_file *m, loff_t *pos)
+{
+	void *ret = NULL;
+	int index;
+
+	mutex_lock(&recursed_function_lock);
+	index = atomic_read(&nr_records);
+	if (*pos < index) {
+		ret = &recursed_functions[*pos];
+	}
+
+	tseq = kzalloc(sizeof(*tseq), GFP_KERNEL);
+	if (!tseq)
+		return ERR_PTR(-ENOMEM);
+
+	trace_seq_init(tseq);
+
+	return ret;
+}
+
+static void *recursed_function_seq_next(struct seq_file *m, void *v, loff_t *pos)
+{
+	int index;
+	int p;
+
+	index = atomic_read(&nr_records);
+	p = ++(*pos);
+
+	return p < index ? &recursed_functions[p] : NULL;
+}
+
+static void recursed_function_seq_stop(struct seq_file *m, void *v)
+{
+	kfree(tseq);
+	mutex_unlock(&recursed_function_lock);
+}
+
+static int recursed_function_seq_show(struct seq_file *m, void *v)
+{
+	struct recursed_functions *record = v;
+	int ret = 0;
+
+	if (record) {
+		trace_seq_print_sym(tseq, record->parent_ip, true);
+		trace_seq_puts(tseq, ":\t");
+		trace_seq_print_sym(tseq, record->ip, true);
+		trace_seq_putc(tseq, '\n');
+		ret = trace_print_seq(m, tseq);
+	}
+
+	return ret;
+}
+
+static const struct seq_operations recursed_function_seq_ops = {
+	.start  = recursed_function_seq_start,
+	.next   = recursed_function_seq_next,
+	.stop   = recursed_function_seq_stop,
+	.show   = recursed_function_seq_show
+};
+
+static int recursed_function_open(struct inode *inode, struct file *file)
+{
+	int ret = 0;
+
+	mutex_lock(&recursed_function_lock);
+	/* If this file was opened for write, then erase contents */
+	if ((file->f_mode & FMODE_WRITE) && (file->f_flags & O_TRUNC)) {
+		/* disable updating records */
+		atomic_set(&nr_records, -1);
+		smp_mb__after_atomic();
+		memset(recursed_functions, 0, sizeof(recursed_functions));
+		smp_wmb();
+		/* enable them again */
+		atomic_set(&nr_records, 0);
+	}
+	if (file->f_mode & FMODE_READ)
+		ret = seq_open(file, &recursed_function_seq_ops);
+	mutex_unlock(&recursed_function_lock);
+
+	return ret;
+}
+
+static ssize_t recursed_function_write(struct file *file,
+				       const char __user *buffer,
+				       size_t count, loff_t *ppos)
+{
+	return count;
+}
+
+static int recursed_function_release(struct inode *inode, struct file *file)
+{
+	if (file->f_mode & FMODE_READ)
+		seq_release(inode, file);
+	return 0;
+}
+
+static const struct file_operations recursed_functions_fops = {
+	.open           = recursed_function_open,
+	.write		= recursed_function_write,
+	.read           = seq_read,
+	.llseek         = seq_lseek,
+	.release        = recursed_function_release,
+};
+
+__init static int create_recursed_functions(void)
+{
+	struct dentry *dentry;
+
+	dentry = trace_create_file("recursed_functions", 0644, NULL, NULL,
+				   &recursed_functions_fops);
+	if (!dentry)
+		pr_warn("WARNING: Failed to create recursed_functions\n");
+	return 0;
+}
+
+fs_initcall(create_recursed_functions);
-- 
2.25.4

