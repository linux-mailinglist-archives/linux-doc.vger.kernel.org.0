Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F315F6FF955
	for <lists+linux-doc@lfdr.de>; Thu, 11 May 2023 20:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239183AbjEKSG0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 11 May 2023 14:06:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239199AbjEKSGC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 May 2023 14:06:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CB1DA248;
        Thu, 11 May 2023 11:05:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3BBEB64EDD;
        Thu, 11 May 2023 18:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D385C4339E;
        Thu, 11 May 2023 18:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683828291;
        bh=INz28Rr3sqUANU3vzKh8b5o/HqILbnjMP6BijaKVDQ4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qqtqa3U8kJ5pYAK47VU3uCr5s1Ff6LS52cljuY347V6rKtNJjEsQRD5VeyaISLH0Q
         1JoW4nb8fDg1FIWDgX6qVZvHigfCgAbDKzfsNAQkoM693gI0FmwhKDxqdfsKMX9/n5
         yYIBL60U81gdKKzpaNlC817UcqLQKkLSeiYyXov3noYvSQ9OpQouqEo1QAuddpMfhb
         N/A1NfW80C6KF2rYzrUzQB9hrN/NE93anUcVKqunONIg7T1abjWkYPqFK9yHRb173/
         0ynE+OAampK9e3C3Vpa+kZCve3zRPDco+7Q335WbYfaEJNK24XGXb3pA/USwA2GT6h
         Y9cbsPSGMdUzg==
From:   Daniel Bristot de Oliveira <bristot@kernel.org>
To:     linux-trace-devel@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Juri Lelli <juri.lelli@redhat.com>,
        William White <chwhite@redhat.com>,
        Daniel Bristot de Oliveira <bristot@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 6/8] rtla/timerlat_hist: Add auto-analysis support
Date:   Thu, 11 May 2023 20:04:24 +0200
Message-Id: <09d6bbc8642fa930cdfc9fa003a0546f9106261d.1683827510.git.bristot@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1683827510.git.bristot@kernel.org>
References: <cover.1683827510.git.bristot@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add auto-analysis to timerlat hist, including the --no-aa option to
reduce overhead and --dump-task. --aa-only was not added as it is
already on timerlat top.

Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Daniel Bristot de Oliveira <bristot@kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Daniel Bristot de Oliveira <bristot@kernel.org>
---
 .../tools/rtla/common_timerlat_aa.rst         |  7 ---
 .../tools/rtla/rtla-timerlat-hist.rst         |  7 ++-
 .../tools/rtla/rtla-timerlat-top.rst          |  7 +++
 tools/tracing/rtla/src/timerlat_hist.c        | 51 ++++++++++++++++++-
 4 files changed, 61 insertions(+), 11 deletions(-)

diff --git a/Documentation/tools/rtla/common_timerlat_aa.rst b/Documentation/tools/rtla/common_timerlat_aa.rst
index 795b9fbcbc6d..077029e6b289 100644
--- a/Documentation/tools/rtla/common_timerlat_aa.rst
+++ b/Documentation/tools/rtla/common_timerlat_aa.rst
@@ -5,10 +5,3 @@
 **--no-aa**
 
         disable auto-analysis, reducing rtla timerlat cpu usage
-
-**--aa-only** *us*
-
-        Set stop tracing conditions and run without collecting and displaying statistics.
-        Print the auto-analysis if the system hits the stop tracing condition. This option
-        is useful to reduce rtla timerlat CPU, enabling the debug without the overhead of
-        collecting the statistics.
diff --git a/Documentation/tools/rtla/rtla-timerlat-hist.rst b/Documentation/tools/rtla/rtla-timerlat-hist.rst
index 6bf7f0ca4556..7046c428f2e1 100644
--- a/Documentation/tools/rtla/rtla-timerlat-hist.rst
+++ b/Documentation/tools/rtla/rtla-timerlat-hist.rst
@@ -29,15 +29,18 @@ OPTIONS
 
 .. include:: common_options.rst
 
+.. include:: common_timerlat_aa.rst
+
 EXAMPLE
 =======
 In the example below, **rtla timerlat hist** is set to run for *10* minutes,
 in the cpus *0-4*, *skipping zero* only lines. Moreover, **rtla timerlat
 hist** will change the priority of the *timerlat* threads to run under
 *SCHED_DEADLINE* priority, with a *10us* runtime every *1ms* period. The
-*1ms* period is also passed to the *timerlat* tracer::
+*1ms* period is also passed to the *timerlat* tracer. Auto-analysis is disabled
+to reduce overhead ::
 
-  [root@alien ~]# timerlat hist -d 10m -c 0-4 -P d:100us:1ms -p 1ms
+  [root@alien ~]# timerlat hist -d 10m -c 0-4 -P d:100us:1ms -p 1ms --no-aa
   # RTLA timerlat histogram
   # Time unit is microseconds (us)
   # Duration:   0 00:10:00
diff --git a/Documentation/tools/rtla/rtla-timerlat-top.rst b/Documentation/tools/rtla/rtla-timerlat-top.rst
index 73799c1150ad..1b7cf4e3eafe 100644
--- a/Documentation/tools/rtla/rtla-timerlat-top.rst
+++ b/Documentation/tools/rtla/rtla-timerlat-top.rst
@@ -32,6 +32,13 @@ OPTIONS
 
 .. include:: common_timerlat_aa.rst
 
+**--aa-only** *us*
+
+        Set stop tracing conditions and run without collecting and displaying statistics.
+        Print the auto-analysis if the system hits the stop tracing condition. This option
+        is useful to reduce rtla timerlat CPU, enabling the debug without the overhead of
+        collecting the statistics.
+
 EXAMPLE
 =======
 
diff --git a/tools/tracing/rtla/src/timerlat_hist.c b/tools/tracing/rtla/src/timerlat_hist.c
index 1675d54cae81..e720c8908906 100644
--- a/tools/tracing/rtla/src/timerlat_hist.c
+++ b/tools/tracing/rtla/src/timerlat_hist.c
@@ -16,6 +16,7 @@
 #include "utils.h"
 #include "osnoise.h"
 #include "timerlat.h"
+#include "timerlat_aa.h"
 
 struct timerlat_hist_params {
 	char			*cpus;
@@ -34,6 +35,8 @@ struct timerlat_hist_params {
 	int			dma_latency;
 	int			cgroup;
 	int			hk_cpus;
+	int			no_aa;
+	int			dump_tasks;
 	cpu_set_t		hk_cpu_set;
 	struct sched_attr	sched_param;
 	struct trace_events	*events;
@@ -438,7 +441,7 @@ static void timerlat_hist_usage(char *usage)
 		"  usage: [rtla] timerlat hist [-h] [-q] [-d s] [-D] [-n] [-a us] [-p us] [-i us] [-T us] [-s us] \\",
 		"         [-t[=file]] [-e sys[:event]] [--filter <filter>] [--trigger <trigger>] [-c cpu-list] [-H cpu-list]\\",
 		"	  [-P priority] [-E N] [-b N] [--no-irq] [--no-thread] [--no-header] [--no-summary] \\",
-		"	  [--no-index] [--with-zeros] [--dma-latency us] [-C[=cgroup_name]]",
+		"	  [--no-index] [--with-zeros] [--dma-latency us] [-C[=cgroup_name]] [--no-aa] [--dump-task]",
 		"",
 		"	  -h/--help: print this menu",
 		"	  -a/--auto: set automatic trace mode, stopping the session if argument in us latency is hit",
@@ -450,12 +453,14 @@ static void timerlat_hist_usage(char *usage)
 		"	  -H/--house-keeping cpus: run rtla control threads only on the given cpus",
 		"	  -C/--cgroup[=cgroup_name]: set cgroup, if no cgroup_name is passed, the rtla's cgroup will be inherited",
 		"	  -d/--duration time[m|h|d]: duration of the session in seconds",
+		"	     --dump-tasks: prints the task running on all CPUs if stop conditions are met (depends on !--no-aa)",
 		"	  -D/--debug: print debug info",
 		"	  -t/--trace[=file]: save the stopped trace to [file|timerlat_trace.txt]",
 		"	  -e/--event <sys:event>: enable the <sys:event> in the trace instance, multiple -e are allowed",
 		"	     --filter <filter>: enable a trace event filter to the previous -e event",
 		"	     --trigger <trigger>: enable a trace event trigger to the previous -e event",
 		"	  -n/--nano: display data in nanoseconds",
+		"	     --no-aa: disable auto-analysis, reducing rtla timerlat cpu usage",
 		"	  -b/--bucket-size N: set the histogram bucket size (default 1)",
 		"	  -E/--entries N: set the number of entries of the histogram (default 256)",
 		"	     --no-irq: ignore IRQ latencies",
@@ -537,13 +542,15 @@ static struct timerlat_hist_params
 			{"trigger",		required_argument,	0, '6'},
 			{"filter",		required_argument,	0, '7'},
 			{"dma-latency",		required_argument,	0, '8'},
+			{"no-aa",		no_argument,		0, '9'},
+			{"dump-task",		no_argument,		0, '\1'},
 			{0, 0, 0, 0}
 		};
 
 		/* getopt_long stores the option index here. */
 		int option_index = 0;
 
-		c = getopt_long(argc, argv, "a:c:C::b:d:e:E:DhH:i:np:P:s:t::T:0123456:7:8:",
+		c = getopt_long(argc, argv, "a:c:C::b:d:e:E:DhH:i:np:P:s:t::T:0123456:7:8:9\1",
 				 long_options, &option_index);
 
 		/* detect the end of the options. */
@@ -556,6 +563,7 @@ static struct timerlat_hist_params
 
 			/* set thread stop to auto_thresh */
 			params->stop_total_us = auto_thresh;
+			params->stop_us = auto_thresh;
 
 			/* get stack trace */
 			params->print_stack = auto_thresh;
@@ -699,6 +707,12 @@ static struct timerlat_hist_params
 				exit(EXIT_FAILURE);
 			}
 			break;
+		case '9':
+			params->no_aa = 1;
+			break;
+		case '\1':
+			params->dump_tasks = 1;
+			break;
 		default:
 			timerlat_hist_usage("Invalid option");
 		}
@@ -715,6 +729,12 @@ static struct timerlat_hist_params
 	if (params->no_index && !params->with_zeros)
 		timerlat_hist_usage("no-index set with with-zeros is not set - it does not make sense");
 
+	/*
+	 * Auto analysis only happens if stop tracing, thus:
+	 */
+	if (!params->stop_us && !params->stop_total_us)
+		params->no_aa = 1;
+
 	return params;
 }
 
@@ -848,6 +868,7 @@ int timerlat_hist_main(int argc, char *argv[])
 	struct timerlat_hist_params *params;
 	struct osnoise_tool *record = NULL;
 	struct osnoise_tool *tool = NULL;
+	struct osnoise_tool *aa = NULL;
 	struct trace_instance *trace;
 	int dma_latency_fd = -1;
 	int return_value = 1;
@@ -919,6 +940,26 @@ int timerlat_hist_main(int argc, char *argv[])
 		trace_instance_start(&record->trace);
 	}
 
+	if (!params->no_aa) {
+		aa = osnoise_init_tool("timerlat_aa");
+		if (!aa)
+			goto out_hist;
+
+		retval = timerlat_aa_init(aa, params->dump_tasks);
+		if (retval) {
+			err_msg("Failed to enable the auto analysis instance\n");
+			goto out_hist;
+		}
+
+		retval = enable_timerlat(&aa->trace);
+		if (retval) {
+			err_msg("Failed to enable timerlat tracer\n");
+			goto out_hist;
+		}
+
+		trace_instance_start(&aa->trace);
+	}
+
 	tool->start_time = time(NULL);
 	timerlat_hist_set_signals(params);
 
@@ -946,6 +987,10 @@ int timerlat_hist_main(int argc, char *argv[])
 
 	if (trace_is_off(&tool->trace, &record->trace)) {
 		printf("rtla timerlat hit stop tracing\n");
+
+		if (!params->no_aa)
+			timerlat_auto_analysis(params->stop_us, params->stop_total_us);
+
 		if (params->trace_output) {
 			printf("  Saving trace to %s\n", params->trace_output);
 			save_trace_to_file(record->trace.inst, params->trace_output);
@@ -953,12 +998,14 @@ int timerlat_hist_main(int argc, char *argv[])
 	}
 
 out_hist:
+	timerlat_aa_destroy();
 	if (dma_latency_fd >= 0)
 		close(dma_latency_fd);
 	trace_events_destroy(&record->trace, params->events);
 	params->events = NULL;
 out_free:
 	timerlat_free_histogram(tool->data);
+	osnoise_destroy_tool(aa);
 	osnoise_destroy_tool(record);
 	osnoise_destroy_tool(tool);
 	free(params);
-- 
2.38.1

