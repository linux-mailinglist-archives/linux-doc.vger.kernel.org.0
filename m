Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BCDF5831A1
	for <lists+linux-doc@lfdr.de>; Wed, 27 Jul 2022 20:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243347AbiG0SLt (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 27 Jul 2022 14:11:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232553AbiG0SLQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Jul 2022 14:11:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E514F753A0;
        Wed, 27 Jul 2022 10:13:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7C07C619A5;
        Wed, 27 Jul 2022 17:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DAF5C433C1;
        Wed, 27 Jul 2022 17:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658941993;
        bh=GB41tQKICNtDkQFxA/QWse4BCeG2/JC8OIwADKGp+BU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZnZQ8KFouL/5moGfns7bN3RXFq+RyPqxtalTD4RGSFF7yKOxPxi/Z97WJEKHAKq0l
         GVBOzLcfNs/cfe5u8VUZsX2Ovxk+wwD6Ano5f2v1I+Cvn8suN6F83rHFfvMUZZmkNj
         PcpT7rRxTvUvTNUYWx2rzX7ys7hdY1hd0FyIw0EQ8u+ghSFM+3Yqk/qFr4XAiE/T9p
         7eQ4AAWOIj+Tda6YicRqcvhuB9W/bof+jyRqgXqL6XqlMeV7aXgL36oZGHjTd0D7d5
         RlBNDghDYXdAXmwDsahjQq3wiZCT8mqJK1Dr918Jb/CawnLrIMCM+uBmoqxXOYWkAP
         /BF37GRDFv9uA==
From:   Daniel Bristot de Oliveira <bristot@kernel.org>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Daniel Bristot de Oliveira <bristot@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Marco Elver <elver@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Gabriele Paoloni <gpaoloni@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Clark Williams <williams@redhat.com>,
        Tao Zhou <tao.zhou@linux.dev>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-trace-devel@vger.kernel.org
Subject: [PATCH V8 12/16] rv/monitor: Add the wip monitor skeleton created by dot2k
Date:   Wed, 27 Jul 2022 19:11:40 +0200
Message-Id: <d3adefae0138d027111821613cc79fa809c66df4.1658940828.git.bristot@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1658940828.git.bristot@kernel.org>
References: <cover.1658940828.git.bristot@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

THIS CODE IS NOT LINKED TO THE MAKEFILE.

This model does not compile because it lacks the instrumentation
part, which will be added next. In the typical case, there will be
only one patch, but it was split into two patches for educational
purposes.

This is the direct output this command line:
  $ dot2k -d tools/verification/models/wip.dot -t per_cpu

Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marco Elver <elver@google.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Gabriele Paoloni <gpaoloni@redhat.com>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Clark Williams <williams@redhat.com>
Cc: Tao Zhou <tao.zhou@linux.dev>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-trace-devel@vger.kernel.org
Signed-off-by: Daniel Bristot de Oliveira <bristot@kernel.org>
---
 kernel/trace/rv/monitors/wip/wip.c | 109 +++++++++++++++++++++++++++++
 kernel/trace/rv/monitors/wip/wip.h |  46 ++++++++++++
 2 files changed, 155 insertions(+)
 create mode 100644 kernel/trace/rv/monitors/wip/wip.c
 create mode 100644 kernel/trace/rv/monitors/wip/wip.h

diff --git a/kernel/trace/rv/monitors/wip/wip.c b/kernel/trace/rv/monitors/wip/wip.c
new file mode 100644
index 000000000000..79a054ca0cde
--- /dev/null
+++ b/kernel/trace/rv/monitors/wip/wip.c
@@ -0,0 +1,109 @@
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
+#define MODULE_NAME "wip"
+
+/*
+ * XXX: include required tracepoint headers, e.g.,
+ * #include <linux/trace/events/sched.h>
+ */
+#include <trace/events/rv.h>
+
+/*
+ * This is the self-generated part of the monitor. Generally, there is no need
+ * to touch this section.
+ */
+#include "wip.h"
+
+/*
+ * Declare the deterministic automata monitor.
+ *
+ * The rv monitor reference is needed for the monitor declaration.
+ */
+struct rv_monitor rv_wip;
+DECLARE_DA_MON_PER_CPU(wip, unsigned char);
+
+/*
+ * This is the instrumentation part of the monitor.
+ *
+ * This is the section where manual work is required. Here the kernel events
+ * are translated into model's event.
+ *
+ */
+static void handle_preempt_disable(void *data, /* XXX: fill header */)
+{
+	da_handle_event_wip(preempt_disable_wip);
+}
+
+static void handle_preempt_enable(void *data, /* XXX: fill header */)
+{
+	da_handle_event_wip(preempt_enable_wip);
+}
+
+static void handle_sched_waking(void *data, /* XXX: fill header */)
+{
+	da_handle_event_wip(sched_waking_wip);
+}
+
+static int enable_wip(void)
+{
+	int retval;
+
+	retval = da_monitor_init_wip();
+	if (retval)
+		return retval;
+
+	rv_attach_trace_probe("wip", /* XXX: tracepoint */, handle_preempt_disable);
+	rv_attach_trace_probe("wip", /* XXX: tracepoint */, handle_preempt_enable);
+	rv_attach_trace_probe("wip", /* XXX: tracepoint */, handle_sched_waking);
+
+	return 0;
+}
+
+static void disable_wip(void)
+{
+	rv_wip.enabled = 0;
+
+	rv_detach_trace_probe("wip", /* XXX: tracepoint */, handle_preempt_disable);
+	rv_detach_trace_probe("wip", /* XXX: tracepoint */, handle_preempt_enable);
+	rv_detach_trace_probe("wip", /* XXX: tracepoint */, handle_sched_waking);
+
+	da_monitor_destroy_wip();
+}
+
+/*
+ * This is the monitor register section.
+ */
+struct rv_monitor rv_wip = {
+	.name = "wip",
+	.description = "auto-generated wip",
+	.enable = enable_wip,
+	.disable = disable_wip,
+	.reset = da_monitor_reset_all_wip,
+	.enabled = 0,
+};
+
+static int register_wip(void)
+{
+	rv_register_monitor(&rv_wip);
+	return 0;
+}
+
+static void unregister_wip(void)
+{
+	rv_unregister_monitor(&rv_wip);
+}
+
+module_init(register_wip);
+module_exit(unregister_wip);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("dot2k: auto-generated");
+MODULE_DESCRIPTION("wip");
diff --git a/kernel/trace/rv/monitors/wip/wip.h b/kernel/trace/rv/monitors/wip/wip.h
new file mode 100644
index 000000000000..c1c47e2305ef
--- /dev/null
+++ b/kernel/trace/rv/monitors/wip/wip.h
@@ -0,0 +1,46 @@
+/*
+ * Automatically generated C representation of wip automaton
+ * For further information about this format, see kernel documentation:
+ *   Documentation/trace/rv/deterministic_automata.rst
+ */
+
+enum states_wip {
+	preemptive_wip = 0,
+	non_preemptive_wip,
+	state_max_wip
+};
+
+#define INVALID_STATE state_max_wip
+
+enum events_wip {
+	preempt_disable_wip = 0,
+	preempt_enable_wip,
+	sched_waking_wip,
+	event_max_wip
+};
+
+struct automaton_wip {
+	char *state_names[state_max_wip];
+	char *event_names[event_max_wip];
+	unsigned char function[state_max_wip][event_max_wip];
+	unsigned char initial_state;
+	bool final_states[state_max_wip];
+};
+
+struct automaton_wip automaton_wip = {
+	.state_names = {
+		"preemptive",
+		"non_preemptive"
+	},
+	.event_names = {
+		"preempt_disable",
+		"preempt_enable",
+		"sched_waking"
+	},
+	.function = {
+		{ non_preemptive_wip,      INVALID_STATE,      INVALID_STATE },
+		{      INVALID_STATE,     preemptive_wip, non_preemptive_wip },
+	},
+	.initial_state = preemptive_wip,
+	.final_states = { 1, 0 },
+};
-- 
2.35.1

