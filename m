Return-Path: <linux-doc+bounces-42200-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCF3A7B92F
	for <lists+linux-doc@lfdr.de>; Fri,  4 Apr 2025 10:47:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B68E174FC4
	for <lists+linux-doc@lfdr.de>; Fri,  4 Apr 2025 08:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47CAF1A2557;
	Fri,  4 Apr 2025 08:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vm99kKUk"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF76A1A08B8
	for <linux-doc@vger.kernel.org>; Fri,  4 Apr 2025 08:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743756400; cv=none; b=TZwv93yexi7NKijvA53qhsCdjCV59cegukxco4roopv/9KZL3VQjuxzujU4XUWLb3FrbW5Y6yVj0z2B/Fw8ZMqtNDTc8AYe0/BxdcTQJNGBYTz/SAryWtjBlIbAc+Shv8AiHZ1ybJ176btDSo2AnIY7Eh9En4FW7xNMZO+qXCnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743756400; c=relaxed/simple;
	bh=EC2qLD3yAqT9hmPSQkMhT0qXr1pMBO6vYWsBJYi/6Kk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VjZDDyN1SdLxu6KhavZUVWlA2EVnGPjnBiZ9+FY15a23JKomRQffcgVOS4HicUrFVl9yUXx4RHCxF8MiYBxJ17XghfsLGdd/KO8Z7BFSjL5ONH/mI3SZEYTvR+f/deJTZcQZXaGXjB9oXwJ5C80Kx1RXzzv7fgZm14Hd6g/beN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vm99kKUk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743756395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7VgUHqvVbcZ3hwyo97/1UdgAimaq/eLN4hqPXuIKJcs=;
	b=Vm99kKUkvyc4Ry2o/eIbUW4RuPypQXHt0XmCwuWMts0J6fbNKR0CFRwBLBLUJ0Yew+Z6ko
	CAmKapXBkM1yHjlYEYfEGSPr9CorzIUoRxWT8WbRNz/Ry4EpAXTaRqfCWsI8qIbxezuucL
	1wkYovO/jzMogi9IYdRBrBaTKf5PJso=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-653-A223c62CM-CR7PhUmAmBUw-1; Fri,
 04 Apr 2025 04:46:32 -0400
X-MC-Unique: A223c62CM-CR7PhUmAmBUw-1
X-Mimecast-MFC-AGG-ID: A223c62CM-CR7PhUmAmBUw_1743756391
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DE83B195608B;
	Fri,  4 Apr 2025 08:46:30 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.rmtit.com (unknown [10.44.32.143])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D43D0180B487;
	Fri,  4 Apr 2025 08:46:25 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Gabriele Monaco <gmonaco@redhat.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Tomas Glozar <tglozar@redhat.com>,
	Juri Lelli <jlelli@redhat.com>
Subject: [RFC PATCH 8/9] rv: Replace tss monitor with more complete sts
Date: Fri,  4 Apr 2025 10:45:21 +0200
Message-ID: <20250404084512.98552-19-gmonaco@redhat.com>
In-Reply-To: <20250404084512.98552-11-gmonaco@redhat.com>
References: <20250404084512.98552-11-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

The tss monitor currently guarantees context switches can happen only
while scheduling, but it doesn't enforce that each scheduling call
implies a task switch. This can be implied only if we rely on the newly
introduced sched_switch_vain tracepoint, which represents a
scheduler call where the previously running task is the same that is
picked to run next, in fact no context is switched.

Replace the monitor with a more comprehensive specification which
implies tss but also ensures that:
* each scheduler call switches context (or has a vain switch)
* each context switch happens with interrupts disabled

Cc: Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 Documentation/trace/rv/monitor_sched.rst      |  68 +++++++---
 kernel/trace/rv/Kconfig                       |   2 +-
 kernel/trace/rv/Makefile                      |   2 +-
 kernel/trace/rv/monitors/sts/Kconfig          |  18 +++
 kernel/trace/rv/monitors/sts/sts.c            | 118 ++++++++++++++++++
 kernel/trace/rv/monitors/sts/sts.h            |  62 +++++++++
 .../{tss/tss_trace.h => sts/sts_trace.h}      |   8 +-
 kernel/trace/rv/monitors/tss/Kconfig          |  14 ---
 kernel/trace/rv/monitors/tss/tss.c            |  91 --------------
 kernel/trace/rv/monitors/tss/tss.h            |  47 -------
 kernel/trace/rv/rv_trace.h                    |   2 +-
 tools/verification/models/sched/sts.dot       |  29 +++++
 tools/verification/models/sched/tss.dot       |  18 ---
 13 files changed, 282 insertions(+), 197 deletions(-)
 create mode 100644 kernel/trace/rv/monitors/sts/Kconfig
 create mode 100644 kernel/trace/rv/monitors/sts/sts.c
 create mode 100644 kernel/trace/rv/monitors/sts/sts.h
 rename kernel/trace/rv/monitors/{tss/tss_trace.h => sts/sts_trace.h} (67%)
 delete mode 100644 kernel/trace/rv/monitors/tss/Kconfig
 delete mode 100644 kernel/trace/rv/monitors/tss/tss.c
 delete mode 100644 kernel/trace/rv/monitors/tss/tss.h
 create mode 100644 tools/verification/models/sched/sts.dot
 delete mode 100644 tools/verification/models/sched/tss.dot

diff --git a/Documentation/trace/rv/monitor_sched.rst b/Documentation/trace/rv/monitor_sched.rst
index 24b2c62a3bc26..641e70e359aaa 100644
--- a/Documentation/trace/rv/monitor_sched.rst
+++ b/Documentation/trace/rv/monitor_sched.rst
@@ -40,26 +40,6 @@ defined in by Daniel Bristot in [1].
 
 Currently we included the following:
 
-Monitor tss
-~~~~~~~~~~~
-
-The task switch while scheduling (tss) monitor ensures a task switch happens
-only in scheduling context, that is inside a call to `__schedule`::
-
-                     |
-                     |
-                     v
-                   +-----------------+
-                   |     thread      | <+
-                   +-----------------+  |
-                     |                  |
-                     | schedule_entry   | schedule_exit
-                     v                  |
-    sched_switch                        |
-  +---------------                      |
-  |                       sched         |
-  +-------------->                     -+
-
 Monitor sco
 ~~~~~~~~~~~
 
@@ -165,6 +145,54 @@ schedule is not called with interrupt disabled::
                                        |
                         cant_sched    -+
 
+Monitor sts
+~~~~~~~~~~~
+
+The schedule implies task switch (sts) monitor ensures a task switch happens in
+every scheduling context, that is inside a call to ``__schedule``, as well as no
+task switch can happen without scheduling and before interrupts are disabled.
+This require the special type of switch called vain, which occurs when the next
+task picked for execution is the same as the previously running one, in fact no
+real task switch occurs::
+
+                    |
+                    |
+                    v
+                  #====================#   irq_disable
+                  H                    H   irq_enable
+                  H       thread       H --------------+
+                  H                    H               |
+  +-------------> H                    H <-------------+
+  |               #====================#
+  |                 |
+  |                 | schedule_entry
+  |                 v
+  |               +--------------------+
+  |               |     scheduling     | <+
+  |               +--------------------+  |
+  |                 |                     |
+  |                 | irq_disable         | irq_enable
+  |                 v                     |
+  |               +--------------------+  |
+  |               | disable_to_switch  | -+
+  | schedule_exit +--------------------+
+  |                 |
+  |                 | sched_switch
+  |                 | sched_switch_vain
+  |                 v
+  |               +--------------------+
+  |               |     switching      |
+  |               +--------------------+
+  |                 |
+  |                 | irq_enable
+  |                 v
+  |               +--------------------+   irq_disable
+  |               |                    |   irq_enable
+  |               |   enable_to_exit   | --------------+
+  |               |                    |               |
+  +-------------- |                    | <-------------+
+                  +--------------------+
+
 References
 ----------
 
diff --git a/kernel/trace/rv/Kconfig b/kernel/trace/rv/Kconfig
index b39f36013ef23..a53a3eca9616d 100644
--- a/kernel/trace/rv/Kconfig
+++ b/kernel/trace/rv/Kconfig
@@ -28,12 +28,12 @@ menuconfig RV
 source "kernel/trace/rv/monitors/wip/Kconfig"
 source "kernel/trace/rv/monitors/wwnr/Kconfig"
 source "kernel/trace/rv/monitors/sched/Kconfig"
-source "kernel/trace/rv/monitors/tss/Kconfig"
 source "kernel/trace/rv/monitors/sco/Kconfig"
 source "kernel/trace/rv/monitors/snroc/Kconfig"
 source "kernel/trace/rv/monitors/scpd/Kconfig"
 source "kernel/trace/rv/monitors/snep/Kconfig"
 source "kernel/trace/rv/monitors/sncid/Kconfig"
+source "kernel/trace/rv/monitors/sts/Kconfig"
 # Add new monitors here
 
 config RV_REACTORS
diff --git a/kernel/trace/rv/Makefile b/kernel/trace/rv/Makefile
index f9b2cd0483c3c..c609b72275cb8 100644
--- a/kernel/trace/rv/Makefile
+++ b/kernel/trace/rv/Makefile
@@ -6,12 +6,12 @@ obj-$(CONFIG_RV) += rv.o
 obj-$(CONFIG_RV_MON_WIP) += monitors/wip/wip.o
 obj-$(CONFIG_RV_MON_WWNR) += monitors/wwnr/wwnr.o
 obj-$(CONFIG_RV_MON_SCHED) += monitors/sched/sched.o
-obj-$(CONFIG_RV_MON_TSS) += monitors/tss/tss.o
 obj-$(CONFIG_RV_MON_SCO) += monitors/sco/sco.o
 obj-$(CONFIG_RV_MON_SNROC) += monitors/snroc/snroc.o
 obj-$(CONFIG_RV_MON_SCPD) += monitors/scpd/scpd.o
 obj-$(CONFIG_RV_MON_SNEP) += monitors/snep/snep.o
 obj-$(CONFIG_RV_MON_SNCID) += monitors/sncid/sncid.o
+obj-$(CONFIG_RV_MON_STS) += monitors/sts/sts.o
 # Add new monitors here
 obj-$(CONFIG_RV_REACTORS) += rv_reactors.o
 obj-$(CONFIG_RV_REACT_PRINTK) += reactor_printk.o
diff --git a/kernel/trace/rv/monitors/sts/Kconfig b/kernel/trace/rv/monitors/sts/Kconfig
new file mode 100644
index 0000000000000..5b486dac3f10f
--- /dev/null
+++ b/kernel/trace/rv/monitors/sts/Kconfig
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+config RV_MON_STS
+	depends on RV
+	depends on IRQSOFF_TRACER
+	depends on RV_MON_SCHED
+	default y
+	select DA_MON_EVENTS_IMPLICIT
+	bool "sts monitor"
+	help
+	  Monitor to ensure relationships between scheduler and switches
+	   * each call to the scheduler implies a switch
+	   * switches only happen inside the scheduler
+	   * switches happen with interrupt disabled
+	  This monitor is part of the sched monitors collection.
+
+	  For further information, see:
+	    Documentation/trace/rv/monitor_sched.rst
diff --git a/kernel/trace/rv/monitors/sts/sts.c b/kernel/trace/rv/monitors/sts/sts.c
new file mode 100644
index 0000000000000..0a3ed35bfe894
--- /dev/null
+++ b/kernel/trace/rv/monitors/sts/sts.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/ftrace.h>
+#include <linux/tracepoint.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/rv.h>
+#include <rv/instrumentation.h>
+#include <rv/da_monitor.h>
+
+#define MODULE_NAME "sts"
+
+#include <trace/events/sched.h>
+#include <trace/events/preemptirq.h>
+#include <rv_trace.h>
+#include <monitors/sched/sched.h>
+
+#include "sts.h"
+
+static struct rv_monitor rv_sts;
+DECLARE_DA_MON_PER_CPU(sts, unsigned char);
+
+static void handle_irq_disable(void *data, unsigned long ip, unsigned long parent_ip)
+{
+	da_handle_event_sts(irq_disable_sts);
+}
+
+static void handle_irq_enable(void *data, unsigned long ip, unsigned long parent_ip)
+{
+	da_handle_event_sts(irq_enable_sts);
+}
+
+static void handle_sched_switch(void *data, bool preempt,
+				struct task_struct *prev,
+				struct task_struct *next,
+				unsigned int prev_state)
+{
+	da_handle_event_sts(sched_switch_sts);
+}
+
+static void handle_sched_switch_vain(void *data, bool preempt,
+				     struct task_struct *tsk,
+				     unsigned int tsk_state)
+{
+	da_handle_event_sts(sched_switch_vain_sts);
+}
+
+static void handle_schedule_entry(void *data, bool preempt, unsigned long ip)
+{
+	da_handle_event_sts(schedule_entry_sts);
+}
+
+static void handle_schedule_exit(void *data, bool is_switch, unsigned long ip)
+{
+	da_handle_start_event_sts(schedule_exit_sts);
+}
+
+static int enable_sts(void)
+{
+	int retval;
+
+	retval = da_monitor_init_sts();
+	if (retval)
+		return retval;
+
+	rv_attach_trace_probe("sts", irq_disable, handle_irq_disable);
+	rv_attach_trace_probe("sts", irq_enable, handle_irq_enable);
+	rv_attach_trace_probe("sts", sched_switch, handle_sched_switch);
+	rv_attach_trace_probe("sts", sched_switch_vain_tp, handle_sched_switch_vain);
+	rv_attach_trace_probe("sts", sched_entry_tp, handle_schedule_entry);
+	rv_attach_trace_probe("sts", sched_exit_tp, handle_schedule_exit);
+
+	return 0;
+}
+
+static void disable_sts(void)
+{
+	rv_sts.enabled = 0;
+
+	rv_detach_trace_probe("sts", irq_disable, handle_irq_disable);
+	rv_detach_trace_probe("sts", irq_enable, handle_irq_enable);
+	rv_detach_trace_probe("sts", sched_switch, handle_sched_switch);
+	rv_detach_trace_probe("sts", sched_switch_vain_tp, handle_sched_switch_vain);
+	rv_detach_trace_probe("sts", sched_entry_tp, handle_schedule_entry);
+	rv_detach_trace_probe("sts", sched_exit_tp, handle_schedule_exit);
+
+	da_monitor_destroy_sts();
+}
+
+/*
+ * This is the monitor register section.
+ */
+static struct rv_monitor rv_sts = {
+	.name = "sts",
+	.description = "schedule implies task switch.",
+	.enable = enable_sts,
+	.disable = disable_sts,
+	.reset = da_monitor_reset_all_sts,
+	.enabled = 0,
+};
+
+static int __init register_sts(void)
+{
+	rv_register_monitor(&rv_sts, &rv_sched);
+	return 0;
+}
+
+static void __exit unregister_sts(void)
+{
+	rv_unregister_monitor(&rv_sts);
+}
+
+module_init(register_sts);
+module_exit(unregister_sts);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Gabriele Monaco <gmonaco@redhat.com>");
+MODULE_DESCRIPTION("sts: schedule implies task switch.");
diff --git a/kernel/trace/rv/monitors/sts/sts.h b/kernel/trace/rv/monitors/sts/sts.h
new file mode 100644
index 0000000000000..6921c00422930
--- /dev/null
+++ b/kernel/trace/rv/monitors/sts/sts.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Automatically generated C representation of sts automaton
+ * For further information about this format, see kernel documentation:
+ *   Documentation/trace/rv/deterministic_automata.rst
+ */
+
+enum states_sts {
+	thread_sts = 0,
+	disable_to_switch_sts,
+	enable_to_exit_sts,
+	scheduling_sts,
+	switching_sts,
+	state_max_sts
+};
+
+#define INVALID_STATE state_max_sts
+
+enum events_sts {
+	irq_disable_sts = 0,
+	irq_enable_sts,
+	sched_switch_sts,
+	sched_switch_vain_sts,
+	schedule_entry_sts,
+	schedule_exit_sts,
+	event_max_sts
+};
+
+struct automaton_sts {
+	char *state_names[state_max_sts];
+	char *event_names[event_max_sts];
+	unsigned char function[state_max_sts][event_max_sts];
+	unsigned char initial_state;
+	bool final_states[state_max_sts];
+};
+
+static const struct automaton_sts automaton_sts = {
+	.state_names = {
+		"thread",
+		"disable_to_switch",
+		"enable_to_exit",
+		"scheduling",
+		"switching"
+	},
+	.event_names = {
+		"irq_disable",
+		"irq_enable",
+		"sched_switch",
+		"sched_switch_vain",
+		"schedule_entry",
+		"schedule_exit"
+	},
+	.function = {
+		{            thread_sts,            thread_sts,         INVALID_STATE,         INVALID_STATE,        scheduling_sts,         INVALID_STATE },
+		{         INVALID_STATE,        scheduling_sts,         switching_sts,         switching_sts,         INVALID_STATE,         INVALID_STATE },
+		{    enable_to_exit_sts,    enable_to_exit_sts,         INVALID_STATE,         INVALID_STATE,         INVALID_STATE,            thread_sts },
+		{ disable_to_switch_sts,         INVALID_STATE,         INVALID_STATE,         INVALID_STATE,         INVALID_STATE,         INVALID_STATE },
+		{         INVALID_STATE,    enable_to_exit_sts,         INVALID_STATE,         INVALID_STATE,         INVALID_STATE,         INVALID_STATE },
+	},
+	.initial_state = thread_sts,
+	.final_states = { 1, 0, 0, 0, 0 },
+};
diff --git a/kernel/trace/rv/monitors/tss/tss_trace.h b/kernel/trace/rv/monitors/sts/sts_trace.h
similarity index 67%
rename from kernel/trace/rv/monitors/tss/tss_trace.h
rename to kernel/trace/rv/monitors/sts/sts_trace.h
index 4619dbb50cc06..d78beb58d5b3d 100644
--- a/kernel/trace/rv/monitors/tss/tss_trace.h
+++ b/kernel/trace/rv/monitors/sts/sts_trace.h
@@ -4,12 +4,12 @@
  * Snippet to be included in rv_trace.h
  */
 
-#ifdef CONFIG_RV_MON_TSS
-DEFINE_EVENT(event_da_monitor, event_tss,
+#ifdef CONFIG_RV_MON_STS
+DEFINE_EVENT(event_da_monitor, event_sts,
 	     TP_PROTO(char *state, char *event, char *next_state, bool final_state),
 	     TP_ARGS(state, event, next_state, final_state));
 
-DEFINE_EVENT(error_da_monitor, error_tss,
+DEFINE_EVENT(error_da_monitor, error_sts,
 	     TP_PROTO(char *state, char *event),
 	     TP_ARGS(state, event));
-#endif /* CONFIG_RV_MON_TSS */
+#endif /* CONFIG_RV_MON_STS */
diff --git a/kernel/trace/rv/monitors/tss/Kconfig b/kernel/trace/rv/monitors/tss/Kconfig
deleted file mode 100644
index 479f86f52e60d..0000000000000
--- a/kernel/trace/rv/monitors/tss/Kconfig
+++ /dev/null
@@ -1,14 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-#
-config RV_MON_TSS
-	depends on RV
-	depends on RV_MON_SCHED
-	default y
-	select DA_MON_EVENTS_IMPLICIT
-	bool "tss monitor"
-	help
-	  Monitor to ensure sched_switch happens only in scheduling context.
-	  This monitor is part of the sched monitors collection.
-
-	  For further information, see:
-	    Documentation/trace/rv/monitor_sched.rst
diff --git a/kernel/trace/rv/monitors/tss/tss.c b/kernel/trace/rv/monitors/tss/tss.c
deleted file mode 100644
index 542787e6524fc..0000000000000
--- a/kernel/trace/rv/monitors/tss/tss.c
+++ /dev/null
@@ -1,91 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <linux/ftrace.h>
-#include <linux/tracepoint.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/rv.h>
-#include <rv/instrumentation.h>
-#include <rv/da_monitor.h>
-
-#define MODULE_NAME "tss"
-
-#include <trace/events/sched.h>
-#include <rv_trace.h>
-#include <monitors/sched/sched.h>
-
-#include "tss.h"
-
-static struct rv_monitor rv_tss;
-DECLARE_DA_MON_PER_CPU(tss, unsigned char);
-
-static void handle_sched_switch(void *data, bool preempt,
-				struct task_struct *prev,
-				struct task_struct *next,
-				unsigned int prev_state)
-{
-	da_handle_event_tss(sched_switch_tss);
-}
-
-static void handle_schedule_entry(void *data, bool preempt, unsigned long ip)
-{
-	da_handle_event_tss(schedule_entry_tss);
-}
-
-static void handle_schedule_exit(void *data, bool is_switch, unsigned long ip)
-{
-	da_handle_start_event_tss(schedule_exit_tss);
-}
-
-static int enable_tss(void)
-{
-	int retval;
-
-	retval = da_monitor_init_tss();
-	if (retval)
-		return retval;
-
-	rv_attach_trace_probe("tss", sched_switch, handle_sched_switch);
-	rv_attach_trace_probe("tss", sched_entry_tp, handle_schedule_entry);
-	rv_attach_trace_probe("tss", sched_exit_tp, handle_schedule_exit);
-
-	return 0;
-}
-
-static void disable_tss(void)
-{
-	rv_tss.enabled = 0;
-
-	rv_detach_trace_probe("tss", sched_switch, handle_sched_switch);
-	rv_detach_trace_probe("tss", sched_entry_tp, handle_schedule_entry);
-	rv_detach_trace_probe("tss", sched_exit_tp, handle_schedule_exit);
-
-	da_monitor_destroy_tss();
-}
-
-static struct rv_monitor rv_tss = {
-	.name = "tss",
-	.description = "task switch while scheduling.",
-	.enable = enable_tss,
-	.disable = disable_tss,
-	.reset = da_monitor_reset_all_tss,
-	.enabled = 0,
-};
-
-static int __init register_tss(void)
-{
-	rv_register_monitor(&rv_tss, &rv_sched);
-	return 0;
-}
-
-static void __exit unregister_tss(void)
-{
-	rv_unregister_monitor(&rv_tss);
-}
-
-module_init(register_tss);
-module_exit(unregister_tss);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Gabriele Monaco <gmonaco@redhat.com>");
-MODULE_DESCRIPTION("tss: task switch while scheduling.");
diff --git a/kernel/trace/rv/monitors/tss/tss.h b/kernel/trace/rv/monitors/tss/tss.h
deleted file mode 100644
index f0a36fda1b873..0000000000000
--- a/kernel/trace/rv/monitors/tss/tss.h
+++ /dev/null
@@ -1,47 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Automatically generated C representation of tss automaton
- * For further information about this format, see kernel documentation:
- *   Documentation/trace/rv/deterministic_automata.rst
- */
-
-enum states_tss {
-	thread_tss = 0,
-	sched_tss,
-	state_max_tss
-};
-
-#define INVALID_STATE state_max_tss
-
-enum events_tss {
-	sched_switch_tss = 0,
-	schedule_entry_tss,
-	schedule_exit_tss,
-	event_max_tss
-};
-
-struct automaton_tss {
-	char *state_names[state_max_tss];
-	char *event_names[event_max_tss];
-	unsigned char function[state_max_tss][event_max_tss];
-	unsigned char initial_state;
-	bool final_states[state_max_tss];
-};
-
-static const struct automaton_tss automaton_tss = {
-	.state_names = {
-		"thread",
-		"sched"
-	},
-	.event_names = {
-		"sched_switch",
-		"schedule_entry",
-		"schedule_exit"
-	},
-	.function = {
-		{     INVALID_STATE,         sched_tss,     INVALID_STATE },
-		{         sched_tss,     INVALID_STATE,        thread_tss },
-	},
-	.initial_state = thread_tss,
-	.final_states = { 1, 0 },
-};
diff --git a/kernel/trace/rv/rv_trace.h b/kernel/trace/rv/rv_trace.h
index 18fa0e358a30e..a5e1c52e29926 100644
--- a/kernel/trace/rv/rv_trace.h
+++ b/kernel/trace/rv/rv_trace.h
@@ -58,11 +58,11 @@ DECLARE_EVENT_CLASS(error_da_monitor,
 );
 
 #include <monitors/wip/wip_trace.h>
-#include <monitors/tss/tss_trace.h>
 #include <monitors/sco/sco_trace.h>
 #include <monitors/scpd/scpd_trace.h>
 #include <monitors/snep/snep_trace.h>
 #include <monitors/sncid/sncid_trace.h>
+#include <monitors/sts/sts_trace.h>
 // Add new monitors based on CONFIG_DA_MON_EVENTS_IMPLICIT here
 
 #endif /* CONFIG_DA_MON_EVENTS_IMPLICIT */
diff --git a/tools/verification/models/sched/sts.dot b/tools/verification/models/sched/sts.dot
new file mode 100644
index 0000000000000..8152675b4f528
--- /dev/null
+++ b/tools/verification/models/sched/sts.dot
@@ -0,0 +1,29 @@
+digraph state_automaton {
+	center = true;
+	size = "7,11";
+	{node [shape = circle] "disable_to_switch"};
+	{node [shape = circle] "enable_to_exit"};
+	{node [shape = circle] "scheduling"};
+	{node [shape = circle] "switching"};
+	{node [shape = plaintext, style=invis, label=""] "__init_thread"};
+	{node [shape = doublecircle] "thread"};
+	{node [shape = circle] "thread"};
+	"__init_thread" -> "thread";
+	"disable_to_switch" [label = "disable_to_switch"];
+	"disable_to_switch" -> "scheduling" [ label = "irq_enable" ];
+	"disable_to_switch" -> "switching" [ label = "sched_switch\nsched_switch_vain" ];
+	"enable_to_exit" [label = "enable_to_exit"];
+	"enable_to_exit" -> "enable_to_exit" [ label = "irq_disable\nirq_enable" ];
+	"enable_to_exit" -> "thread" [ label = "schedule_exit" ];
+	"scheduling" [label = "scheduling"];
+	"scheduling" -> "disable_to_switch" [ label = "irq_disable" ];
+	"switching" [label = "switching"];
+	"switching" -> "enable_to_exit" [ label = "irq_enable" ];
+	"thread" [label = "thread", color = green3];
+	"thread" -> "scheduling" [ label = "schedule_entry" ];
+	"thread" -> "thread" [ label = "irq_disable\nirq_enable" ];
+	{ rank = min ;
+		"__init_thread";
+		"thread";
+	}
+}
diff --git a/tools/verification/models/sched/tss.dot b/tools/verification/models/sched/tss.dot
deleted file mode 100644
index 7dfa1d9121bbd..0000000000000
--- a/tools/verification/models/sched/tss.dot
+++ /dev/null
@@ -1,18 +0,0 @@
-digraph state_automaton {
-	center = true;
-	size = "7,11";
-	{node [shape = plaintext] "sched"};
-	{node [shape = plaintext, style=invis, label=""] "__init_thread"};
-	{node [shape = ellipse] "thread"};
-	{node [shape = plaintext] "thread"};
-	"__init_thread" -> "thread";
-	"sched" [label = "sched"];
-	"sched" -> "sched" [ label = "sched_switch" ];
-	"sched" -> "thread" [ label = "schedule_exit" ];
-	"thread" [label = "thread", color = green3];
-	"thread" -> "sched" [ label = "schedule_entry" ];
-	{ rank = min ;
-		"__init_thread";
-		"thread";
-	}
-}
-- 
2.49.0


