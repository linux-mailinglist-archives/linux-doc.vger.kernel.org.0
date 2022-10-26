Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40EB160DEFD
	for <lists+linux-doc@lfdr.de>; Wed, 26 Oct 2022 12:45:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233478AbiJZKpU (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 26 Oct 2022 06:45:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233448AbiJZKpH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 Oct 2022 06:45:07 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BAADA6C1F;
        Wed, 26 Oct 2022 03:45:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id CFDF2CE21BF;
        Wed, 26 Oct 2022 10:44:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59CB4C43143;
        Wed, 26 Oct 2022 10:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666781098;
        bh=y5TEdMymXm/UVLc2bAmAkzbTI224huvlnK4DVHlRtEk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZiHD26YUl6HKfCZPROyl09BnYr89ET9OMmMqC3ILtnNlyiZWlCzs+egaLAUdVq7E1
         8YIKjlfFoUttSKAJ3D25eMCasmm2NROGsZMPOZ4gwWiXgUnRNYgk2SXIFIAi8t4daH
         eRruHfw2BM/2+YYqz4G05+Kz8gkpWG37NXcWuLYi3hsIuA/EKQ4MU4BEJiQLe0LFyx
         meu6/Amuw5iE7iLXDJNYbkpSf8JlRrFMFsc2AGstZp6eiXMp3+KpF9Wd0DD3BnCjv7
         lRDa4A2s8b/+yz/TfL6fu2tNPQ/BJ7uMdTrXU9OJzRw0Z61hnRFd5FSxeBix/WcSHh
         E1CJsmKwx0CyQ==
From:   Daniel Bristot de Oliveira <bristot@kernel.org>
To:     Steven Rostedt <rostedt@goodmis.org>,
        linux-trace-devel@vger.kernel.org
Cc:     Daniel Bristot de Oliveira <bristot@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] tools/rv: Add in-kernel monitor interface
Date:   Wed, 26 Oct 2022 12:44:40 +0200
Message-Id: <d52a15b93acb15142551b8e84ff4bcd934de22ce.1666776642.git.bristot@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1666776642.git.bristot@kernel.org>
References: <cover.1666776642.git.bristot@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add the ability to control and trace in-kernel monitors. This is
a generic interface, it will check for existing monitors and enable
standard setup, like enabling reactors.

For example:

wip                      wakeup in preemptive per-cpu testing monitor. [OFF]
wwnr                     wakeup while not running per-task testing model. [OFF]

  usage: rv mon wip [-h] [-q] [-r reactor] [-s] [-v]  help:

	-h/--help: print this menu and the reactor list
	-r/--reactor 'reactor': enables the 'reactor'
	-s/--self: when tracing (-t), also trace rv command
	-t/--trace: trace monitor's event
	-v/--verbose: print debug messages

  available reactors: nop printk panic

  help:

  usage: rv mon wwnr [-h] [-q] [-r reactor] [-s] [-v]
	-h/--help: print this menu and the reactor list
	-r/--reactor 'reactor': enables the 'reactor'
	-s/--self: when tracing (-t), also trace rv command
	-t/--trace: trace monitor's event
	-v/--verbose: print debug messages

  available reactors: nop printk panic

          <TASK>-PID      [CPU]  TYPE       ID                    STATE x EVENT                    -> NEXT_STATE               FINAL
              |   |          |     |        |                        |     |                           |                       |
              rv-3613     [001] event     3613                  running x switch_out               -> not_running              Y
            sshd-1248     [005] event     1248                  running x switch_out               -> not_running              Y
          <idle>-0        [005] event       71              not_running x wakeup                   -> not_running              Y
          <idle>-0        [005] event       71              not_running x switch_in                -> running                  N
      kcompactd0-71       [005] event       71                  running x switch_out               -> not_running              Y
          <idle>-0        [000] event      860              not_running x wakeup                   -> not_running              Y
          <idle>-0        [000] event      860              not_running x switch_in                -> running                  N
    systemd-oomd-860      [000] event      860                  running x switch_out               -> not_running              Y
          <idle>-0        [000] event      860              not_running x wakeup                   -> not_running              Y
          <idle>-0        [000] event      860              not_running x switch_in                -> running                  N
    systemd-oomd-860      [000] event      860                  running x switch_out               -> not_running              Y
          <idle>-0        [005] event       71              not_running x wakeup                   -> not_running              Y
          <idle>-0        [005] event       71              not_running x switch_in                -> running                  N
      kcompactd0-71       [005] event       71                  running x switch_out               -> not_running              Y
          <idle>-0        [000] event      860              not_running x wakeup                   -> not_running              Y
          <idle>-0        [000] event      860              not_running x switch_in                -> running                  N
    systemd-oomd-860      [000] event      860                  running x switch_out               -> not_running              Y
          <idle>-0        [001] event     3613              not_running x wakeup                   -> not_running              Y

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Daniel Bristot de Oliveira <bristot@kernel.org>
---
 tools/verification/rv/include/in_kernel.h |   3 +
 tools/verification/rv/src/in_kernel.c     | 698 ++++++++++++++++++++++
 tools/verification/rv/src/rv.c            |   3 +
 3 files changed, 704 insertions(+)
 create mode 100644 tools/verification/rv/include/in_kernel.h
 create mode 100644 tools/verification/rv/src/in_kernel.c

diff --git a/tools/verification/rv/include/in_kernel.h b/tools/verification/rv/include/in_kernel.h
new file mode 100644
index 000000000000..3090638c8d71
--- /dev/null
+++ b/tools/verification/rv/include/in_kernel.h
@@ -0,0 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0
+int ikm_list_monitors(void);
+int ikm_run_monitor(char *monitor, int argc, char **argv);
diff --git a/tools/verification/rv/src/in_kernel.c b/tools/verification/rv/src/in_kernel.c
new file mode 100644
index 000000000000..fd9e43fcffaf
--- /dev/null
+++ b/tools/verification/rv/src/in_kernel.c
@@ -0,0 +1,698 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * in kernel monitor support: allows rv to control in-kernel monitors.
+ *
+ * Copyright (C) 2022 Red Hat Inc, Daniel Bristot de Oliveira <bristot@kernel.org>
+ */
+#include <getopt.h>
+#include <stdlib.h>
+#include <string.h>
+#include <errno.h>
+#include <unistd.h>
+
+#include <trace.h>
+#include <utils.h>
+#include <rv.h>
+
+static int config_has_id;
+static int config_my_pid;
+static int config_trace;
+
+static char *config_initial_reactor;
+static char *config_reactor;
+
+/*
+ * __ikm_read_enable - reads monitor's enable status
+ *
+ * __does not log errors.
+ *
+ * Returns the current status, or -1 if the monitor does not exist,
+ * __hence not logging errors.
+ */
+static int __ikm_read_enable(char *monitor_name)
+{
+	char path[MAX_PATH];
+	long long enabled;
+	int retval;
+
+	snprintf(path, MAX_PATH, "rv/monitors/%s/enable", monitor_name);
+
+	retval = tracefs_instance_file_read_number(NULL, path, &enabled);
+	if (retval < 0)
+		return -1;
+
+	return enabled;
+}
+
+/*
+ * ikm_read_enable - reads monitor's enable status
+ *
+ * Returns the current status, or -1 on error.
+ */
+static int ikm_read_enable(char *monitor_name)
+{
+	int enabled;
+
+	enabled = __ikm_read_enable(monitor_name);
+	if (enabled) {
+		err_msg("ikm: fail read enabled: %d\n", enabled);
+		return -1;
+	}
+
+	debug_msg("ikm: read enabled: %d\n", enabled);
+
+	return enabled;
+}
+
+/*
+ * ikm_write_enable - write to the monitor's enable file
+ *
+ * Return the number of bytes written, -1 on error.
+ */
+static int ikm_write_enable(char *monitor_name, char *enable_disable)
+{
+	char path[MAX_PATH];
+	int retval;
+
+	debug_msg("ikm: writing enabled: %s\n", enable_disable);
+
+	snprintf(path, MAX_PATH, "rv/monitors/%s/enable", monitor_name);
+	retval = tracefs_instance_file_write(NULL, path, enable_disable);
+	if (retval < strlen(enable_disable)) {
+		err_msg("ikm: writing enabled: %s\n", enable_disable);
+		return -1;
+	}
+
+	return retval;
+}
+
+/*
+ * ikm_enable - enable a monitor
+ *
+ * Returns -1 on failure. Success otherwise.
+ */
+static int ikm_enable(char *monitor_name)
+{
+	return ikm_write_enable(monitor_name, "1");
+}
+
+/*
+ * ikm_disable - disable a monitor
+ *
+ * Returns -1 on failure. Success otherwise.
+ */
+static int ikm_disable(char *monitor_name)
+{
+	return ikm_write_enable(monitor_name, "0");
+}
+
+/*
+ * ikm_read_desc - read monitors' description
+ *
+ * Return a dynamically allocated string with the monitor's
+ * description, NULL otherwise.
+ */
+static char *ikm_read_desc(char *monitor_name)
+{
+	char path[MAX_PATH];
+	char *desc;
+
+	snprintf(path, MAX_PATH, "rv/monitors/%s/desc", monitor_name);
+	desc = tracefs_instance_file_read(NULL, path, NULL);
+	if (!desc) {
+		err_msg("ikm: error reading monitor %s desc\n", monitor_name);
+		return NULL;
+	}
+
+	*strstr(desc, "\n") = '\0';
+
+	return desc;
+}
+
+/*
+ * ikm_fill_monitor_definition - fill monitor's definition
+ *
+ * Returns -1 on error, 0 otherwise.
+ */
+static int ikm_fill_monitor_definition(char *name, struct monitor *ikm)
+{
+	int enabled;
+	char *desc;
+
+	enabled = ikm_read_enable(name);
+	if (enabled < 0) {
+		err_msg("ikm: monitor %s does not have enable file, bug?\n", name);
+		return -1;
+	}
+
+	desc = ikm_read_desc(name);
+	if (!desc) {
+		err_msg("ikm: monitor %s does not have desc file, bug?\n", name);
+		return -1;
+	}
+
+	strncpy(ikm->name, name, MAX_DA_NAME_LEN);
+	ikm->enabled = enabled;
+	strncpy(ikm->desc, desc, MAX_DESCRIPTION);
+
+	free(desc);
+
+	return 0;
+}
+
+/*
+ * ikm_write_reactor - switch the reactor to *reactor
+ *
+ * Return the number or characters written, -1 on error.
+ */
+static int ikm_write_reactor(char *monitor_name, char *reactor)
+{
+	char path[MAX_PATH];
+	int retval;
+
+	snprintf(path, MAX_PATH, "rv/monitors/%s/reactors", monitor_name);
+	retval = tracefs_instance_file_write(NULL, path, reactor);
+	debug_msg("ikm: write \"%s\" reactors: %d\n", reactor, retval);
+
+	return retval;
+}
+
+/*
+ * ikm_read_reactor - read the reactors file
+ *
+ * Returns a dynamically allocated string with monitor's
+ * available reactors, or NULL on error.
+ */
+static char *ikm_read_reactor(char *monitor_name)
+{
+	char path[MAX_PATH];
+	char *reactors;
+
+	snprintf(path, MAX_PATH, "rv/monitors/%s/reactors", monitor_name);
+	reactors = tracefs_instance_file_read(NULL, path, NULL);
+	if (!reactors) {
+		err_msg("ikm: fail reading monitor's %s reactors file\n", monitor_name);
+		return NULL;
+	}
+
+	return reactors;
+}
+
+/*
+ * ikm_get_current_reactor - get the current enabled reactor
+ *
+ * Reads the reactors file and find the currently enabled
+ * [reactor].
+ *
+ * Returns a dynamically allocated memory with the current
+ * reactor. NULL otherwise.
+ */
+static char *ikm_get_current_reactor(char *monitor_name)
+{
+	char *reactors = ikm_read_reactor(monitor_name);
+	char *start;
+	char *end;
+	char *curr_reactor;
+
+	if (!reactors)
+		return NULL;
+
+	start = strstr(reactors, "[");
+	if (!start)
+		goto out_free;
+
+	start++;
+
+	end = strstr(start, "]");
+	if (!end)
+		goto out_free;
+
+	*end = '\0';
+
+	curr_reactor = calloc(strlen(start) + 1, sizeof(char));
+	if (!curr_reactor)
+		goto out_free;
+
+	strncpy(curr_reactor, start, strlen(start));
+	debug_msg("ikm: read current reactor %s\n", curr_reactor);
+
+out_free:
+	free(reactors);
+
+	return curr_reactor;
+}
+
+static int ikm_has_id(char *monitor_name)
+{
+	char path[MAX_PATH];
+	char *format;
+	int has_id;
+
+	snprintf(path, MAX_PATH, "events/rv/event_%s/format", monitor_name);
+	format = tracefs_instance_file_read(NULL, path, NULL);
+	if (!format) {
+		err_msg("ikm: fail reading monitor's %s format event file\n", monitor_name);
+		return -1;
+	}
+
+	/* print fmt: "%d: %s x %s -> %s %s", REC->id, ... */
+	has_id = !!strstr(format, "REC->id");
+
+	debug_msg("ikm: monitor %s has id: %s\n", monitor_name, has_id ? "yes" : "no");
+
+	free(format);
+
+	return has_id;
+}
+
+/**
+ * ikm_list_monitors - list all available monitors
+ *
+ * Returns 0 on success, -1 otherwise.
+ */
+int ikm_list_monitors(void)
+{
+	char *available_monitors;
+	struct monitor ikm;
+	char *curr, *next;
+	int retval;
+
+	available_monitors = tracefs_instance_file_read(NULL, "rv/available_monitors", NULL);
+
+	if (!available_monitors) {
+		err_msg("ikm: available monitors is not available, is CONFIG_RV enabled?\n");
+		return -1;
+	}
+
+	curr = available_monitors;
+	do {
+		next = strstr(curr, "\n");
+		*next = '\0';
+
+		retval = ikm_fill_monitor_definition(curr, &ikm);
+		if (retval)
+			err_msg("ikm: error reading %d in kernel monitor, skipping\n", curr);
+
+		printf("%-24s %s [%3s]\n", ikm.name, ikm.desc, ikm.enabled ? "ON" : "OFF");
+		curr = ++next;
+
+	} while (strlen(curr));
+
+	free(available_monitors);
+
+	return 0;
+}
+
+static void ikm_print_header(struct trace_seq *s)
+{
+	trace_seq_printf(s, "%16s-%-8s %5s %5s ", "<TASK>", "PID", "[CPU]", "TYPE");
+	if (config_has_id)
+		trace_seq_printf(s, "%8s ", "ID");
+
+	trace_seq_printf(s, "%24s x %-24s -> %-24s %s\n",
+			 "STATE",
+			 "EVENT",
+			 "NEXT_STATE",
+			 "FINAL");
+
+	trace_seq_printf(s, "%16s %-8s %5s %5s ", " | ", " | ", " | ", " | ");
+
+	if (config_has_id)
+		trace_seq_printf(s, "%8s ", " | ");
+
+	trace_seq_printf(s, "%24s   %-24s    %-24s %s\n",
+			 " | ",
+			 " | ",
+			 " | ",
+			 "|");
+
+}
+
+/*
+ * ikm_event_handler - callback to handle event events
+ *
+ * Called any time a rv:"monitor"_event events is generated.
+ * It parses and print event.
+ */
+static int
+ikm_event_handler(struct trace_seq *s, struct tep_record *record,
+		  struct tep_event *trace_event, void *context)
+{
+	/* if needed: struct trace_instance *inst = context; */
+	char *state, *event, *next_state;
+	unsigned long long final_state;
+	unsigned long long pid;
+	unsigned long long id;
+	int cpu = record->cpu;
+	int val;
+
+	if (config_has_id)
+		tep_get_field_val(s, trace_event, "id", record, &id, 1);
+
+	tep_get_common_field_val(s, trace_event, "common_pid", record, &pid, 1);
+
+	if (config_has_id && (config_my_pid == id))
+		return 0;
+	else if (config_my_pid && (config_my_pid == pid))
+		return 0;
+
+	tep_print_event(trace_event->tep, s, record, "%16s-%-8d ", TEP_PRINT_COMM, TEP_PRINT_PID);
+
+	trace_seq_printf(s, "[%.3d] event ", cpu);
+
+	if (config_has_id)
+		trace_seq_printf(s, "%8llu ", id);
+
+	state = tep_get_field_raw(s, trace_event, "state", record, &val, 0);
+	event = tep_get_field_raw(s, trace_event, "event", record, &val, 0);
+	next_state = tep_get_field_raw(s, trace_event, "next_state", record, &val, 0);
+	tep_get_field_val(s, trace_event, "final_state", record, &final_state, 1);
+
+	trace_seq_printf(s, "%24s x %-24s -> %-24s %s\n",
+			 state,
+			 event,
+			 next_state,
+			 final_state ? "Y" : "N");
+
+	trace_seq_do_printf(s);
+	trace_seq_reset(s);
+
+	return 0;
+}
+
+/*
+ * ikm_error_handler - callback to handle error events
+ *
+ * Called any time a rv:"monitor"_errors events is generated.
+ * It parses and print event.
+ */
+static int
+ikm_error_handler(struct trace_seq *s, struct tep_record *record,
+		  struct tep_event *trace_event, void *context)
+{
+	unsigned long long pid, id;
+	int cpu = record->cpu;
+	char *state, *event;
+	int val;
+
+	if (config_has_id)
+		tep_get_field_val(s, trace_event, "id", record, &id, 1);
+
+	tep_get_common_field_val(s, trace_event, "common_pid", record, &pid, 1);
+
+	if (config_has_id && config_my_pid == id)
+		return 0;
+	else if (config_my_pid == pid)
+		return 0;
+
+	trace_seq_printf(s, "%8lld [%03d] error ", pid, cpu);
+
+	if (config_has_id)
+		trace_seq_printf(s, "%8llu ", id);
+
+	state = tep_get_field_raw(s, trace_event, "state", record, &val, 0);
+	event = tep_get_field_raw(s, trace_event, "event", record, &val, 0);
+
+	trace_seq_printf(s, "%24s x %s\n", state, event);
+
+	trace_seq_do_printf(s);
+	trace_seq_reset(s);
+
+	return 0;
+}
+
+/*
+ * ikm_setup_trace_instance - set up a tracing instance to collect data
+ *
+ * Create a trace instance, enable rv: events and enable the trace.
+ *
+ * Returns the trace_instance * with all set, NULL otherwise.
+ */
+static struct trace_instance *ikm_setup_trace_instance(char *monitor_name)
+{
+	char event[MAX_DA_NAME_LEN + 7]; /* max(error_,event_) + '0' = 7 */
+	struct trace_instance *inst;
+	int retval;
+
+	if (!config_trace)
+		return NULL;
+
+	config_has_id = ikm_has_id(monitor_name);
+	if (config_has_id < 0) {
+		err_msg("ikm: failed to read monitor %s event format\n", monitor_name);
+		goto out_err;
+	}
+
+	/* alloc data */
+	inst = calloc(1, sizeof(*inst));
+	if (!inst) {
+		err_msg("ikm: failed to allocate trace instance");
+		goto out_err;
+	}
+
+	retval = trace_instance_init(inst, monitor_name);
+	if (retval)
+		goto out_free;
+
+	/* enable events */
+	snprintf(event, sizeof(event), "event_%s", monitor_name);
+	retval = tracefs_event_enable(inst->inst, "rv",  event);
+	if (retval)
+		goto out_inst;
+
+	tep_register_event_handler(inst->tep, -1, "rv", event,
+				   ikm_event_handler, NULL);
+
+	snprintf(event, sizeof(event), "error_%s", monitor_name);
+	retval = tracefs_event_enable(inst->inst, "rv", event);
+	if (retval)
+		goto out_inst;
+
+	tep_register_event_handler(inst->tep, -1, "rv", event,
+				   ikm_error_handler, NULL);
+
+	/* ready to enable */
+	tracefs_trace_on(inst->inst);
+
+	return inst;
+
+out_inst:
+	trace_instance_destroy(inst);
+out_free:
+	free(inst);
+out_err:
+	return NULL;
+}
+
+/**
+ * ikm_destroy_trace_instance - destroy a previously created instance
+ */
+static void ikm_destroy_trace_instance(struct trace_instance *inst)
+{
+	if (!inst)
+		return;
+
+	trace_instance_destroy(inst);
+	free(inst);
+}
+
+/*
+ * ikm_usage_print_reactors - print all available reactors, one per line.
+ */
+static void ikm_usage_print_reactors(void)
+{
+	char *reactors = tracefs_instance_file_read(NULL, "rv/available_reactors", NULL);
+	char *start, *end;
+
+	if (!reactors)
+		return;
+
+	fprintf(stderr, "  available reactors:");
+
+	start = reactors;
+	end = strstr(start, "\n");
+
+	while (end) {
+		*end = '\0';
+
+		fprintf(stderr, " %s", start);
+
+		start = ++end;
+		end = strstr(start, "\n");
+	};
+
+	fprintf(stderr, "\n");
+}
+/*
+ * ikm_usage - print usage
+ */
+static void ikm_usage(int exit_val, char *monitor_name, const char *fmt, ...)
+{
+
+	char message[1024];
+	va_list ap;
+	int i;
+
+	static const char *const usage[] = {
+		"",
+		"	-h/--help: print this menu and the reactor list",
+		"	-r/--reactor 'reactor': enables the 'reactor'",
+		"	-s/--self: when tracing (-t), also trace rv command",
+		"	-t/--trace: trace monitor's event",
+		"	-v/--verbose: print debug messages",
+		"",
+		NULL,
+	};
+
+	va_start(ap, fmt);
+	vsnprintf(message, sizeof(message), fmt, ap);
+	va_end(ap);
+
+	fprintf(stderr, "  %s\n", message);
+
+	fprintf(stderr, "\n  usage: rv mon %s [-h] [-q] [-r reactor] [-s] [-v]", monitor_name);
+
+	for (i = 0; usage[i]; i++)
+		fprintf(stderr, "%s\n", usage[i]);
+
+	ikm_usage_print_reactors();
+	exit(exit_val);
+}
+
+/*
+ * parse_arguments - parse arguments and set config
+ */
+static int parse_arguments(char *monitor_name, int argc, char **argv)
+{
+	int c, retval;
+
+	config_my_pid = getpid();
+
+	while (1) {
+		static struct option long_options[] = {
+			{"help",		no_argument,		0, 'h'},
+			{"reactor",		required_argument,	0, 'r'},
+			{"self",		no_argument,		0, 's'},
+			{"trace",		no_argument,		0, 't'},
+			{"verbose",		no_argument,		0, 'v'},
+			{0, 0, 0, 0}
+		};
+
+		/* getopt_long stores the option index here. */
+		int option_index = 0;
+
+		c = getopt_long(argc, argv, "hr:stv", long_options, &option_index);
+
+		/* detect the end of the options. */
+		if (c == -1)
+			break;
+
+		switch (c) {
+		case 'h':
+			ikm_usage(0, monitor_name, "help:");
+			break;
+		case 'r':
+			config_reactor = optarg;
+			break;
+		case 's':
+			config_my_pid = 0;
+			break;
+		case 't':
+			config_trace = 1;
+			break;
+		case 'v':
+			config_debug = 1;
+			break;
+		}
+	}
+
+	if (config_reactor) {
+		config_initial_reactor = ikm_get_current_reactor(monitor_name);
+		if (!config_initial_reactor)
+			ikm_usage(1, monitor_name,
+				  "ikm: failed to read current reactor, are reactors enabled?");
+
+		retval = ikm_write_reactor(monitor_name, config_reactor);
+		if (retval <= 0)
+			ikm_usage(1, monitor_name,
+				  "ikm: failed to set %s reactor, is it available?",
+				  config_reactor);
+	}
+
+	debug_msg("ikm: my pid is %d\n", config_my_pid);
+
+	return 0;
+}
+
+/**
+ * ikm_run_monitor - apply configs and run the monitor
+ *
+ * Returns 1 if a monitor was found an executed, 0 if no
+ * monitors were found, or -1 on error.
+ */
+int ikm_run_monitor(char *monitor_name, int argc, char **argv)
+{
+	struct trace_instance *inst = NULL;
+	int retval;
+
+	/*
+	 * Check if monitor exists by seeing it is enabled.
+	 */
+	retval = __ikm_read_enable(monitor_name);
+	if (retval < 0)
+		return 0;
+
+	if (retval) {
+		err_msg("ikm: monitor %s (in-kernel) is already enabled\n", monitor_name);
+		return -1;
+	}
+
+	/* we should be good to go */
+	retval = parse_arguments(monitor_name, argc, argv);
+	if (retval)
+		ikm_usage(1, monitor_name, "ikm: failed parsing arguments");
+
+	if (config_trace) {
+		inst = ikm_setup_trace_instance(monitor_name);
+		if (!inst)
+			return -1;
+	}
+
+	retval = ikm_enable(monitor_name);
+	if (retval < 0)
+		goto out_free_instance;
+
+	if (config_trace)
+		ikm_print_header(inst->seq);
+
+	while (!should_stop()) {
+		if (config_trace) {
+			retval = tracefs_iterate_raw_events(inst->tep,
+							    inst->inst,
+							    NULL,
+							    0,
+							    collect_registered_events,
+							    inst);
+			if (retval) {
+				err_msg("ikm: error reading trace buffer\n");
+				break;
+			}
+		}
+
+		sleep(1);
+	}
+
+	ikm_disable(monitor_name);
+	ikm_destroy_trace_instance(inst);
+
+	if (config_reactor && config_initial_reactor)
+		ikm_write_reactor(monitor_name, config_initial_reactor);
+
+	return 1;
+
+out_free_instance:
+	ikm_destroy_trace_instance(inst);
+	if (config_reactor && config_initial_reactor)
+		ikm_write_reactor(monitor_name, config_initial_reactor);
+	return -1;
+}
diff --git a/tools/verification/rv/src/rv.c b/tools/verification/rv/src/rv.c
index 91d37b682917..e6cc02c8eac4 100644
--- a/tools/verification/rv/src/rv.c
+++ b/tools/verification/rv/src/rv.c
@@ -11,6 +11,7 @@
 
 #include <trace.h>
 #include <utils.h>
+#include <in_kernel.h>
 
 static int stop_session;
 
@@ -58,6 +59,7 @@ static void rv_list(int argc, char **argv)
 			exit(1);
 	}
 
+	ikm_list_monitors();
 	exit(0);
 }
 
@@ -98,6 +100,7 @@ static void rv_mon(int argc, char **argv)
 	 * Call all possible monitor implementations, looking
 	 * for the [monitor].
 	 */
+	run += ikm_run_monitor(monitor_name, argc-1, &argv[1]);
 
 	if (!run)
 		err_msg("rv: monitor %s does not exist\n", monitor_name);
-- 
2.37.3

