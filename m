Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A38751C4E3
	for <lists+linux-doc@lfdr.de>; Thu,  5 May 2022 18:11:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381915AbiEEQNL (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 5 May 2022 12:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381918AbiEEQM3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 May 2022 12:12:29 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F5A15C85F;
        Thu,  5 May 2022 09:08:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E0861B82DF4;
        Thu,  5 May 2022 16:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F77FC385A4;
        Thu,  5 May 2022 16:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651766916;
        bh=J7PI8rMc8tKSAL3G/De6FWtxp3TOwErMl6UwrIiMoME=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Dy2KVMtEMTgoybkZudIi/SuMsm+oTUY6OSpvSEN6HMryZ0PWHvoJRBxExLiFk0aBX
         oIlUWEG/Jg27zo5qV235/vpSGy+l8gzEzA9uhs0lhLrO/k/bFc2oU+Z2qIcR2SaWer
         7YHu6pdaCwWp01K6fOPnC38RXtKaQ8SWgflzrEqeNaEdkPwo/Ug0JcYe6Uy7EmStkL
         N+xS7M+vOG4fj5X7ZU8uiPAppInksR0Le5fs/FH4A+XSL+S0VDOe+gzGz0gNfa3tzF
         rs3O1y+mdxWbStquAsYXKNRbuwXKhcexBd3wRmRlVn+a78MG7TkL1cJBWKEki8bXcC
         P3RlB5aWYkG5g==
From:   Daniel Bristot de Oliveira <bristot@kernel.org>
To:     Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org
Cc:     Daniel Bristot de Oliveira <bristot@kernel.org>,
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
        linux-doc@vger.kernel.org, linux-trace-devel@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [RFC V3 18/20] rv/monitor: Add safe watchdog monitor
Date:   Thu,  5 May 2022 18:06:58 +0200
Message-Id: <0950d268b68bb962a39e1836418cea12939b8bf4.1651766361.git.bristot@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1651766361.git.bristot@kernel.org>
References: <cover.1651766361.git.bristot@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The watchdog is an essential building block for the usage of Linux in
safety-critical systems because it allows the system to be monitored from
an external element - the watchdog hardware, acting as a safety-monitor.

A user-space application controls the watchdog device via the watchdog
interface. This application, hereafter safety_app, enables the watchdog
and periodically pets the watchdog upon correct completion of the safety
related processing.

If the safety_app, for any reason, stops pinging the watchdog,
the watchdog hardware can set the system in a fail-safe state. For
example, shutting the system down.

Given the importance of the safety_app / watchdog hardware couple,
the interaction between these software pieces also needs some
sort of monitoring. In other words, "who monitors the monitor?"

The safe watchdog (safe_wtd) RV monitor monitors the interaction between
the safety_app and the watchdog device, enforcing the correct sequence of
events that leads the system to a safe state.

Furthermore, the safety_app can monitor the RV monitor by collecting the
events generated by the RV monitor itself via tracing interface. In this way,
closing the monitoring loop with the safety_app.

To reach a safe state, the safe_wtd RV monitor requires the
safety_app to:

	- Open the watchdog device
	- Start the watchdog
	- Set a timeout
	- ping at least once

The RV monitor also avoids some undesired actions. For example, to have
other threads to touch the watchdog.

The monitor also has a set of options, enabled via kernel command
line/module options. They are:

	- watchdog_id: the device id to monitor (default 0).
	- dont_stop: once enabled, do not allow the RV monitor to be stopped
		(default off);
	- safe_timeout: define a maximum safe value that an user-space
		application can set as the watchdog timeout
		(default unlimited).
	- check_timeout: After every ping, check if the time left in the
		watchdog is less than or equal to the last timeout set
		for the watchdog. It only works for watchdog devices that
		provide the get_timeleft() function (default off).

For further information, please refer to:
	Documentation/trace/rv/watchdog-monitor.rst

The monitor specification was developed together with Gabriele Paoloni,
in the context of the Linux Foundation Elisa Project.

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
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-trace-devel@vger.kernel.org
Signed-off-by: Daniel Bristot de Oliveira <bristot@kernel.org>
---
 kernel/trace/rv/Kconfig                     |   9 +
 kernel/trace/rv/Makefile                    |   1 +
 kernel/trace/rv/monitor_safe_wtd/model.h    |  84 ++++++
 kernel/trace/rv/monitor_safe_wtd/safe_wtd.c | 302 ++++++++++++++++++++
 kernel/trace/rv/monitor_safe_wtd/safe_wtd.h |  64 +++++
 5 files changed, 460 insertions(+)
 create mode 100644 kernel/trace/rv/monitor_safe_wtd/model.h
 create mode 100644 kernel/trace/rv/monitor_safe_wtd/safe_wtd.c
 create mode 100644 kernel/trace/rv/monitor_safe_wtd/safe_wtd.h

diff --git a/kernel/trace/rv/Kconfig b/kernel/trace/rv/Kconfig
index 931f09bcd2dc..b0a1d3ec64d3 100644
--- a/kernel/trace/rv/Kconfig
+++ b/kernel/trace/rv/Kconfig
@@ -30,6 +30,15 @@ config RV_MON_WWNR
 	  illustrates the usage of per-task monitor. The model is
 	  broken on purpose: it serves to test reactors.
 
+config RV_MON_SAFE_WTD
+	bool "Safety watchdog"
+	help
+	  Enable safe_wtd, this monitor observes the interaction
+	  between a user-space safety monitor and a watchdog device.
+
+	  For futher information see:
+	    Documentation/trace/rv/safety-monitor.rst
+
 config RV_REACTORS
 	bool "Runtime verification reactors"
 	default y if RV
diff --git a/kernel/trace/rv/Makefile b/kernel/trace/rv/Makefile
index 1f5747f065ce..854d0f6e453b 100644
--- a/kernel/trace/rv/Makefile
+++ b/kernel/trace/rv/Makefile
@@ -3,6 +3,7 @@
 obj-$(CONFIG_RV) += rv.o
 obj-$(CONFIG_RV_MON_WIP) += monitor_wip/wip.o
 obj-$(CONFIG_RV_MON_WWNR) += monitor_wwnr/wwnr.o
+obj-$(CONFIG_RV_MON_SAFE_WTD) += monitor_safe_wtd/safe_wtd.o
 obj-$(CONFIG_RV_REACTORS) += rv_reactors.o
 obj-$(CONFIG_RV_REACT_PRINTK) += reactor_printk.o
 obj-$(CONFIG_RV_REACT_PANIC) += reactor_panic.o
diff --git a/kernel/trace/rv/monitor_safe_wtd/model.h b/kernel/trace/rv/monitor_safe_wtd/model.h
new file mode 100644
index 000000000000..04377b165c96
--- /dev/null
+++ b/kernel/trace/rv/monitor_safe_wtd/model.h
@@ -0,0 +1,84 @@
+enum states_safe_wtd {
+	init = 0,
+	closed_running,
+	closed_running_nwo,
+	nwo,
+	opened,
+	opened_nwo,
+	reopened,
+	safe,
+	safe_nwo,
+	set,
+	set_nwo,
+	started,
+	started_nwo,
+	stopped,
+	state_max
+};
+
+enum events_safe_wtd {
+	close = 0,
+	nowayout,
+	open,
+	other_threads,
+	ping,
+	set_safe_timeout,
+	start,
+	stop,
+	event_max
+};
+
+struct automaton_safe_wtd {
+	char *state_names[state_max];
+	char *event_names[event_max];
+	char function[state_max][event_max];
+	char initial_state;
+	char final_states[state_max];
+};
+
+struct automaton_safe_wtd automaton_safe_wtd = {
+	.state_names = {
+		"init",
+		"closed_running",
+		"closed_running_nwo",
+		"nwo",
+		"opened",
+		"opened_nwo",
+		"reopened",
+		"safe",
+		"safe_nwo",
+		"set",
+		"set_nwo",
+		"started",
+		"started_nwo",
+		"stopped"
+	},
+	.event_names = {
+		"close",
+		"nowayout",
+		"open",
+		"other_threads",
+		"ping",
+		"set_safe_timeout",
+		"start",
+		"stop"
+	},
+	.function = {
+		{                 -1,                nwo,             opened,               init,                 -1,                 -1,                 -1,                 -1 },
+		{                 -1, closed_running_nwo,           reopened,     closed_running,                 -1,                 -1,                 -1,                 -1 },
+		{                 -1, closed_running_nwo,        started_nwo, closed_running_nwo,                 -1,                 -1,                 -1,                 -1 },
+		{                 -1,                nwo,         opened_nwo,                nwo,                 -1,                 -1,                 -1,                 -1 },
+		{               init,                 -1,                 -1,                 -1,                 -1,                 -1,            started,                 -1 },
+		{                nwo,                 -1,                 -1,                 -1,                 -1,                 -1,        started_nwo,                 -1 },
+		{     closed_running,                 -1,                 -1,                 -1,                 -1,                set,                 -1,             opened },
+		{     closed_running,                 -1,                 -1,                 -1,               safe,                 -1,                 -1,             stopped },
+		{ closed_running_nwo,                 -1,                 -1,                 -1,           safe_nwo,                 -1,                 -1,                 -1 },
+		{                 -1,                 -1,                 -1,                 -1,               safe,                 -1,                 -1,                 -1 },
+		{                 -1,                 -1,                 -1,                 -1,           safe_nwo,                 -1,                 -1,                 -1 },
+		{     closed_running,                 -1,                 -1,                 -1,                 -1,                set,                 -1,             stopped },
+		{ closed_running_nwo,                 -1,                 -1,                 -1,                 -1,            set_nwo,                 -1,                 -1 },
+		{               init,                 -1,                 -1,                 -1,                 -1,                 -1,                 -1,                 -1 },
+	},
+	.initial_state = init,
+	.final_states = { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
+};
\ No newline at end of file
diff --git a/kernel/trace/rv/monitor_safe_wtd/safe_wtd.c b/kernel/trace/rv/monitor_safe_wtd/safe_wtd.c
new file mode 100644
index 000000000000..e0f9a3ce25f2
--- /dev/null
+++ b/kernel/trace/rv/monitor_safe_wtd/safe_wtd.c
@@ -0,0 +1,302 @@
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
+#include <linux/watchdog.h>
+#include <linux/moduleparam.h>
+
+#include <trace/events/watchdog.h>
+
+#define MODULE_NAME "safe_wtd"
+
+/*
+ * This is the self-generated part of the monitor. Generally, there is no need
+ * to touch this section.
+ */
+#include "model.h"
+
+/*
+ * Declare the deterministic automata monitor.
+ *
+ * The rv monitor reference is needed for the monitor declaration.
+ */
+struct rv_monitor rv_safe_wtd;
+DECLARE_DA_MON_GLOBAL(safe_wtd, char);
+
+#define CREATE_TRACE_POINTS
+#include "safe_wtd.h"
+
+/*
+ * custom: safe_timeout is the maximum value a watchdog monitor
+ * can set. This value is registered here to duplicate the information.
+ * In this way, a miss-behaving monitor can be detected.
+ */
+static int safe_timeout = ~0;
+module_param(safe_timeout, int, 0444);
+
+/*
+ * custom: if check_timeout is set, the monitor will check if the time left
+ * in the watchdog is less than or equals to the last safe timeout set by
+ * user-space. This check is done after each ping. In this way, if any
+ * code by-passed the watchdog dev interface setting a higher (so unsafe)
+ * timeout, this monitor will catch the side effect and react.
+ */
+static int last_timeout_set = 0;
+static int check_timeout = 0;
+module_param(check_timeout, int, 0444);
+
+/*
+ * custom: if dont_stop is set the monitor will react if stopped.
+ */
+static int dont_stop = 0;
+module_param(dont_stop, int, 0444);
+
+/*
+ * custom: there are some states that are kept after the watchdog is closed.
+ * For example, the nowayout state.
+ *
+ * Thus, the RV monitor needs to keep track of these states after a start/stop
+ * of the RV monitor itself, and should not reset after each restart - keeping the
+ * know state until the system shutdown.
+ *
+ * If for an unknown reason an RV monitor would like to reset the RV monitor at each
+ * RV monitor start, set it to one.
+ */
+static int reset_on_restart = 0;
+module_param(reset_on_restart, int, 0444);
+
+/*
+ * open_pid takes note of the first thread that opened the watchdog.
+ *
+ * Any other thread that generates an event will cause an "other_threads"
+ * event in the monitor.
+ */
+static int open_pid = 0;
+
+/*
+ * watchdog_id: the watchdog to monitor
+ */
+static int watchdog_id = 0;
+module_param(watchdog_id, int, 0444);
+
+static void handle_nowayout(void *data, struct watchdog_device *wdd)
+{
+	if (wdd->id != watchdog_id)
+		return;
+
+	da_handle_init_run_event_safe_wtd(nowayout);
+}
+
+static void handle_close(void *data, struct watchdog_device *wdd)
+{
+	if (wdd->id != watchdog_id)
+		return;
+
+	if (open_pid && current->pid != open_pid) {
+		da_handle_init_run_event_safe_wtd(other_threads);
+	} else {
+		da_handle_event_safe_wtd(close);
+		open_pid = 0;
+	}
+}
+
+static void handle_open(void *data, struct watchdog_device *wdd)
+{
+	if (wdd->id != watchdog_id)
+		return;
+
+	if (open_pid && current->pid != open_pid) {
+		da_handle_init_run_event_safe_wtd(other_threads);
+	} else {
+		da_handle_init_run_event_safe_wtd(open);
+		open_pid = current->pid;
+	}
+}
+
+static void blocked_events(void *data, struct watchdog_device *wdd)
+{
+	if (wdd->id != watchdog_id)
+		return;
+
+	if (open_pid && current->pid != open_pid) {
+		da_handle_init_run_event_safe_wtd(other_threads);
+		return;
+	}
+	da_handle_event_safe_wtd(other_threads);
+}
+
+static void blocked_events_timeout(void *data, struct watchdog_device *wdd, u64 timeout)
+{
+	blocked_events(data, wdd);
+}
+
+static void handle_ping(void *data, struct watchdog_device *wdd)
+{
+	char msg[128];
+	unsigned int timeout;
+
+	if (wdd->id != watchdog_id)
+		return;
+
+	if (open_pid && current->pid != open_pid) {
+		da_handle_init_run_event_safe_wtd(other_threads);
+		return;
+	}
+
+	da_handle_event_safe_wtd(ping);
+
+	if (!check_timeout)
+		return;
+
+	if (wdd->ops->get_timeleft) {
+		timeout = wdd->ops->get_timeleft(wdd);
+		if (timeout > last_timeout_set) {
+			snprintf(msg, 128,
+				 "watchdog timeout is %u > than previously set (%d)\n",
+				 timeout, last_timeout_set);
+			cond_react(msg);
+		}
+	} else {
+		snprintf(msg, 128, "error getting timeout: option not supported\n");
+		cond_react(msg);
+	}
+}
+
+static void handle_set_safe_timeout(void *data, struct watchdog_device *wdd, u64 timeout)
+{
+	char msg[128];
+
+	if (wdd->id != watchdog_id)
+		return;
+
+	if (open_pid && current->pid != open_pid) {
+		da_handle_init_run_event_safe_wtd(other_threads);
+		return;
+	}
+
+	da_handle_event_safe_wtd(set_safe_timeout);
+
+	if (timeout > safe_timeout) {
+		snprintf(msg, 128, "set safety timeout is too high: %d", (int) timeout);
+		cond_react(msg);
+	}
+
+	if (check_timeout)
+		last_timeout_set = timeout;
+}
+
+static void handle_start(void *data, struct watchdog_device *wdd)
+{
+	if (wdd->id != watchdog_id)
+		return;
+
+	if (open_pid && current->pid != open_pid) {
+		da_handle_init_run_event_safe_wtd(other_threads);
+		return;
+	}
+
+	da_handle_event_safe_wtd(start);
+}
+
+static void handle_stop(void *data, struct watchdog_device *wdd)
+{
+	if (wdd->id != watchdog_id)
+		return;
+
+	if (open_pid && current->pid != open_pid) {
+		da_handle_init_run_event_safe_wtd(other_threads);
+		return;
+	}
+
+	da_handle_event_safe_wtd(stop);
+}
+
+static int mon_started = 0;
+
+static int start_safe_wtd(void)
+{
+	int retval;
+
+	if (!mon_started || reset_on_restart) {
+		retval = da_monitor_init_safe_wtd();
+		if (retval)
+			return retval;
+
+		mon_started = 1;
+	}
+
+	rv_attach_trace_probe("safe_wtd", watchdog_close, handle_close);
+	rv_attach_trace_probe("safe_wtd", watchdog_nowayout, handle_nowayout);
+	rv_attach_trace_probe("safe_wtd", watchdog_open, handle_open);
+	rv_attach_trace_probe("safe_wtd", watchdog_ping, handle_ping);
+	rv_attach_trace_probe("safe_wtd", watchdog_set_timeout, handle_set_safe_timeout);
+	rv_attach_trace_probe("safe_wtd", watchdog_start, handle_start);
+	rv_attach_trace_probe("safe_wtd", watchdog_stop, handle_stop);
+	rv_attach_trace_probe("safe_wtd", watchdog_set_keep_alive, blocked_events_timeout);
+	rv_attach_trace_probe("safe_wtd", watchdog_keep_alive, blocked_events);
+	rv_attach_trace_probe("safe_wtd", watchdog_set_pretimeout, blocked_events_timeout);
+	rv_attach_trace_probe("safe_wtd", watchdog_pretimeout, blocked_events);
+
+	return 0;
+}
+
+static void stop_safe_wtd(void)
+{
+	if (dont_stop)
+		cond_react("dont_stop safe_wtd is set.");
+
+	rv_safe_wtd.enabled = 0;
+
+	rv_detach_trace_probe("safe_wtd", watchdog_close, handle_close);
+	rv_detach_trace_probe("safe_wtd", watchdog_nowayout, handle_nowayout);
+	rv_detach_trace_probe("safe_wtd", watchdog_open, handle_open);
+	rv_detach_trace_probe("safe_wtd", watchdog_ping, handle_ping);
+	rv_detach_trace_probe("safe_wtd", watchdog_set_timeout, handle_set_safe_timeout);
+	rv_detach_trace_probe("safe_wtd", watchdog_start, handle_start);
+	rv_detach_trace_probe("safe_wtd", watchdog_stop, handle_stop);
+	rv_detach_trace_probe("safe_wtd", watchdog_set_keep_alive, blocked_events_timeout);
+	rv_detach_trace_probe("safe_wtd", watchdog_keep_alive, blocked_events);
+	rv_detach_trace_probe("safe_wtd", watchdog_set_pretimeout, blocked_events_timeout);
+	rv_detach_trace_probe("safe_wtd", watchdog_pretimeout, blocked_events);
+
+	da_monitor_destroy_safe_wtd();
+}
+
+/*
+ * This is the monitor register section.
+ */
+struct rv_monitor rv_safe_wtd = {
+	.name = "safe_wtd",
+	.description = "A watchdog monitor guarding a safety monitor actions",
+	.start = start_safe_wtd,
+	.stop = stop_safe_wtd,
+	.reset = da_monitor_reset_all_safe_wtd,
+	.enabled = 0,
+};
+
+int register_safe_wtd(void)
+{
+	rv_register_monitor(&rv_safe_wtd);
+	return 0;
+}
+
+void unregister_safe_wtd(void)
+{
+	if (rv_safe_wtd.enabled)
+		stop_safe_wtd();
+
+	rv_unregister_monitor(&rv_safe_wtd);
+}
+
+module_init(register_safe_wtd);
+module_exit(unregister_safe_wtd);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Daniel Bristot de Oliveira <bristot@kernel.org>");
+MODULE_DESCRIPTION("Safe watchdog RV monitor");
diff --git a/kernel/trace/rv/monitor_safe_wtd/safe_wtd.h b/kernel/trace/rv/monitor_safe_wtd/safe_wtd.h
new file mode 100644
index 000000000000..8d758b9ab445
--- /dev/null
+++ b/kernel/trace/rv/monitor_safe_wtd/safe_wtd.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM rv
+
+#if !defined(_SAFETY_MONITOR_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _SAFETY_MONITOR_TRACE_H
+
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(event_safe_wtd,
+
+	TP_PROTO(char state, char event, char next_state, bool safe),
+
+	TP_ARGS(state, event, next_state, safe),
+
+	TP_STRUCT__entry(
+		__field(	char,		state		)
+		__field(	char,		event		)
+		__field(	char,		next_state	)
+		__field(	bool,		safe		)
+	),
+
+	TP_fast_assign(
+		__entry->state = state;
+		__entry->event = event;
+		__entry->next_state = next_state;
+		__entry->safe = safe;
+	),
+
+	TP_printk("%s x %s -> %s %s",
+		model_get_state_name_safe_wtd(__entry->state),
+		model_get_event_name_safe_wtd(__entry->event),
+		model_get_state_name_safe_wtd(__entry->next_state),
+		__entry->safe ? "(safe)" : "")
+);
+
+TRACE_EVENT(error_safe_wtd,
+
+	TP_PROTO(char state, char event),
+
+	TP_ARGS(state, event),
+
+	TP_STRUCT__entry(
+		__field(	char,		state		)
+		__field(	char,		event		)
+	),
+
+	TP_fast_assign(
+		__entry->state = state;
+		__entry->event = event;
+	),
+
+	TP_printk("event %s not expected in the state %s",
+		model_get_event_name_safe_wtd(__entry->event),
+		model_get_state_name_safe_wtd(__entry->state))
+);
+
+#endif /* _SAFETY_MONITOR_H */
+
+/* This part ust be outside protection */
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH ../kernel/trace/rv/monitor_safe_wtd/
+#define TRACE_INCLUDE_FILE safe_wtd
+#include <trace/define_trace.h>
-- 
2.35.1

