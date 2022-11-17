Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10F3962DD13
	for <lists+linux-doc@lfdr.de>; Thu, 17 Nov 2022 14:46:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234665AbiKQNqj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 17 Nov 2022 08:46:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239943AbiKQNqf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Nov 2022 08:46:35 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD87072987;
        Thu, 17 Nov 2022 05:46:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5115F61E2F;
        Thu, 17 Nov 2022 13:46:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BEDEC433B5;
        Thu, 17 Nov 2022 13:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668692789;
        bh=2SkjqSKVQ6qupwFbU4DX2AULIc20UVK/ayfERI6vvN8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MjxbN2r62JOC3vvWX64M34leINP/StHHOvP30x+266NH/i4nmEHmYYwvINtFMvfSm
         Zm2RhUnOhFjME/IMpdnm0PkMGO5MFJqXmK0+kw739vtWlMEz+4vfwSZbQHotgSK3up
         jEPcIB85I6I3/G9hk8AMXqcwSppMQTk1vTgOTjyB2DHCy0S42379WloG60omqxIRJ5
         icBptwWVyOcWAmrWqrGUm/c0r+ym+374EPJgPcg4OFNR5jwdTEhQsFnDFItr1RWEuw
         3qDimcBcwWQEEMpPhJlX7dBrod9teSbLgJZuuAtMRJw+fPcWomOTcHgHdop23aDNbH
         ZUOJWTYqi15RA==
From:   Daniel Bristot de Oliveira <bristot@kernel.org>
To:     Daniel Bristot de Oliveira <bristot@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     Masami Hiramatsu <mhiramat@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] tracing/osnoise: Add osnoise/options file
Date:   Thu, 17 Nov 2022 14:46:18 +0100
Message-Id: <f8d34aefdb225d2603fcb4c02a120832a0cd3339.1668692096.git.bristot@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1668692096.git.bristot@kernel.org>
References: <cover.1668692096.git.bristot@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add the tracing/osnoise/options file to control
osnoise/timerlat tracer features. It is a single
file to contain multiple features, similar to
the sched/features file.

Reading the file displays a list of options. Writing
the OPTION_NAME enables it, writing NO_OPTION_NAME disables
it.

The DEAFULTS is a particular option that resets the options
to the default ones.

It uses a bitmask to keep track of the status of the option. When
needed, we can add a list of static keys, but for now
it does not justify the memory increase.

Cc: Daniel Bristot de Oliveira <bristot@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Daniel Bristot de Oliveira <bristot@kernel.org>
---
 kernel/trace/trace_osnoise.c | 170 +++++++++++++++++++++++++++++++++++
 1 file changed, 170 insertions(+)

diff --git a/kernel/trace/trace_osnoise.c b/kernel/trace/trace_osnoise.c
index 4300c5dc4e5d..17b77fe3950b 100644
--- a/kernel/trace/trace_osnoise.c
+++ b/kernel/trace/trace_osnoise.c
@@ -48,6 +48,19 @@
 #define DEFAULT_TIMERLAT_PERIOD	1000			/* 1ms */
 #define DEFAULT_TIMERLAT_PRIO	95			/* FIFO 95 */
 
+/*
+ * osnoise/options entries.
+ */
+enum osnoise_options_index {
+	OSN_DEFAULTS = 0,
+	OSN_MAX
+};
+
+static const char * const osnoise_options_str[OSN_MAX] = { "DEFAULTS" };
+
+#define OSN_DEFAULT_OPTIONS	0
+unsigned long osnoise_options	= OSN_DEFAULT_OPTIONS;
+
 /*
  * trace_array of the enabled osnoise/timerlat instances.
  */
@@ -1860,6 +1873,150 @@ static void osnoise_init_hotplug_support(void)
 }
 #endif /* CONFIG_HOTPLUG_CPU */
 
+/*
+ * seq file functions for the osnoise/options file.
+ */
+static void *s_options_start(struct seq_file *s, loff_t *pos)
+{
+	int option = *pos;
+
+	mutex_lock(&interface_lock);
+
+	if (option >= OSN_MAX)
+		return NULL;
+
+	return pos;
+}
+
+static void *s_options_next(struct seq_file *s, void *v, loff_t *pos)
+{
+	int option = ++(*pos);
+
+	if (option >= OSN_MAX)
+		return NULL;
+
+	return pos;
+}
+
+static int s_options_show(struct seq_file *s, void *v)
+{
+	loff_t *pos = v;
+	int option = *pos;
+
+	if (option == OSN_DEFAULTS) {
+		if (osnoise_options == OSN_DEFAULT_OPTIONS)
+			seq_printf(s, "%s", osnoise_options_str[option]);
+		else
+			seq_printf(s, "NO_%s", osnoise_options_str[option]);
+		goto out;
+	}
+
+	if (test_bit(option, &osnoise_options))
+		seq_printf(s, "%s", osnoise_options_str[option]);
+	else
+		seq_printf(s, "NO_%s", osnoise_options_str[option]);
+
+out:
+	if (option != OSN_MAX)
+		seq_puts(s, " ");
+
+	return 0;
+}
+
+static void s_options_stop(struct seq_file *s, void *v)
+{
+	seq_puts(s, "\n");
+	mutex_unlock(&interface_lock);
+}
+
+static const struct seq_operations osnoise_options_seq_ops = {
+	.start		= s_options_start,
+	.next		= s_options_next,
+	.show		= s_options_show,
+	.stop		= s_options_stop
+};
+
+static int osnoise_options_open(struct inode *inode, struct file *file)
+{
+	return seq_open(file, &osnoise_options_seq_ops);
+};
+
+/**
+ * osnoise_options_write - Write function for "options" entry
+ * @filp: The active open file structure
+ * @ubuf: The user buffer that contains the value to write
+ * @cnt: The maximum number of bytes to write to "file"
+ * @ppos: The current position in @file
+ *
+ * Writing the option name sets the option, writing the "NO_"
+ * prefix in front of the option name disables it.
+ *
+ * Writing "DEFAULTS" resets the option values to the default ones.
+ */
+static ssize_t osnoise_options_write(struct file *filp, const char __user *ubuf,
+				     size_t cnt, loff_t *ppos)
+{
+	int running, option, enable, retval;
+	char buf[256], *option_str;
+
+	if (cnt >= 256)
+		return -EINVAL;
+
+	if (copy_from_user(buf, ubuf, cnt))
+		return -EFAULT;
+
+	buf[cnt] = 0;
+
+	if (strncmp(buf, "NO_", 3)) {
+		option_str = strstrip(buf);
+		enable = true;
+	} else {
+		option_str = strstrip(&buf[3]);
+		enable = false;
+	}
+
+	option = match_string(osnoise_options_str, OSN_MAX, option_str);
+	if (option < 0)
+		return -EINVAL;
+
+	/*
+	 * trace_types_lock is taken to avoid concurrency on start/stop.
+	 */
+	mutex_lock(&trace_types_lock);
+	running = osnoise_has_registered_instances();
+	if (running)
+		stop_per_cpu_kthreads();
+
+	mutex_lock(&interface_lock);
+	/*
+	 * avoid CPU hotplug operations that might read options.
+	 */
+	cpus_read_lock();
+
+	retval = cnt;
+
+	if (enable) {
+		if (option == OSN_DEFAULTS)
+			osnoise_options = OSN_DEFAULT_OPTIONS;
+		else
+			set_bit(option, &osnoise_options);
+	} else {
+		if (option == OSN_DEFAULTS)
+			retval = -EINVAL;
+		else
+			clear_bit(option, &osnoise_options);
+	}
+
+	cpus_read_unlock();
+	mutex_unlock(&interface_lock);
+
+	if (running)
+		start_per_cpu_kthreads();
+	mutex_unlock(&trace_types_lock);
+
+	return retval;
+}
+
 /*
  * osnoise_cpus_read - Read function for reading the "cpus" file
  * @filp: The active open file structure
@@ -2042,6 +2199,14 @@ static const struct file_operations cpus_fops = {
 	.llseek		= generic_file_llseek,
 };
 
+static const struct file_operations osnoise_options_fops = {
+	.open		= osnoise_options_open,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= seq_release,
+	.write		= osnoise_options_write
+};
+
 #ifdef CONFIG_TIMERLAT_TRACER
 #ifdef CONFIG_STACKTRACE
 static int init_timerlat_stack_tracefs(struct dentry *top_dir)
@@ -2128,6 +2293,11 @@ static int init_tracefs(void)
 	if (!tmp)
 		goto err;
 
+	tmp = trace_create_file("options", TRACE_MODE_WRITE, top_dir, NULL,
+				&osnoise_options_fops);
+	if (!tmp)
+		goto err;
+
 	ret = init_timerlat_tracefs(top_dir);
 	if (ret)
 		goto err;
-- 
2.32.0

