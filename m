Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B432B7248A2
	for <lists+linux-doc@lfdr.de>; Tue,  6 Jun 2023 18:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238376AbjFFQNL (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 6 Jun 2023 12:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238073AbjFFQM4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Jun 2023 12:12:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4779170E;
        Tue,  6 Jun 2023 09:12:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2E08562F50;
        Tue,  6 Jun 2023 16:12:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92B65C433D2;
        Tue,  6 Jun 2023 16:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686067968;
        bh=OOdhYxQnbsbsltTtXt6nP+lnhei8a/Ph8syUL4hrzGw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=esj+GlwLXQVj9xr3EOSateM48UDkLiEMU26mxwdfoT2Ts82BAfmdbh6Yg9HnAyyuF
         Xhbt/Arv7HrPX9hdYCpAWhB3eIhUdxTCHjd0ESdecSGFanrcGgNcmqmBpStlbr2LKJ
         slXS6axXnHYGtDGGSrPtbype+M/LC64VQQuer+mXp0V91GVQnQb6KI5BFCJkZAg4g5
         kqKgbumIxpKTCzmRpO2U4qKJEubKjD+abH+ECV7sDpw/Zn/p7iWeezIsrpkDq6+/AQ
         Wbu8z7Ymro1skYJdH30jE18y5ReTHG1hHNw6G/LrLeh1bOpH5Jz5LUdPrTj0YkR+Fw
         uCQHM0lDmITXg==
From:   Daniel Bristot de Oliveira <bristot@kernel.org>
To:     linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     linux-doc@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>,
        William White <chwhite@redhat.com>,
        Daniel Bristot de Oliveira <bristot@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH V3 05/11] rtla/timerlat: Give timerlat auto analysis its own instance
Date:   Tue,  6 Jun 2023 18:12:19 +0200
Message-Id: <346b7168c1bae552a415715ec6d23c129a43bdb7.1686066600.git.bristot@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1686066600.git.bristot@kernel.org>
References: <cover.1686066600.git.bristot@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently, the auto-analysis is attached to the timerlat top instance.
The idea was to avoid creating another instance just for that, so one
instance could be reused.

The drawback is that, by doing so, the auto-analysis run for the entire
session, consuming CPU time. On my 24 box CPUs for timerlat with a 100
us period consumed 50 % with auto analysis, but only 16 % without.

By creating an instance for auto-analysis, we can keep the processing
stopped until a stop tracing condition is hit. Once it happens,
timerlat auto-analysis can use its own trace instance to parse only
the end of the trace.

By doing so, auto-analysis stop consuming cpu time when it is not
needed.

If the --aa-only is passed, the timerlat top instance is reused for
auto analysis.

Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Daniel Bristot de Oliveira <bristot@kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Daniel Bristot de Oliveira <bristot@kernel.org>
---
 tools/tracing/rtla/src/timerlat_aa.c  | 35 +++++++++++++++++--
 tools/tracing/rtla/src/timerlat_aa.h  |  5 +--
 tools/tracing/rtla/src/timerlat_top.c | 48 ++++++++++++++++++---------
 3 files changed, 67 insertions(+), 21 deletions(-)

diff --git a/tools/tracing/rtla/src/timerlat_aa.c b/tools/tracing/rtla/src/timerlat_aa.c
index 1843fff66da5..e0ffe69c271c 100644
--- a/tools/tracing/rtla/src/timerlat_aa.c
+++ b/tools/tracing/rtla/src/timerlat_aa.c
@@ -8,6 +8,7 @@
 #include "utils.h"
 #include "osnoise.h"
 #include "timerlat.h"
+#include <unistd.h>
 
 enum timelat_state {
 	TIMERLAT_INIT = 0,
@@ -233,7 +234,7 @@ static int timerlat_aa_thread_latency(struct timerlat_aa_data *taa_data,
  *
  * Returns 0 on success, -1 otherwise.
  */
-int timerlat_aa_handler(struct trace_seq *s, struct tep_record *record,
+static int timerlat_aa_handler(struct trace_seq *s, struct tep_record *record,
 			struct tep_event *event, void *context)
 {
 	struct timerlat_aa_context *taa_ctx = timerlat_aa_get_ctx();
@@ -665,6 +666,25 @@ static void timerlat_thread_analysis(struct timerlat_aa_data *taa_data, int cpu,
 		ns_to_usf(total));
 }
 
+static int timerlat_auto_analysis_collect_trace(struct timerlat_aa_context *taa_ctx)
+{
+	struct trace_instance *trace = &taa_ctx->tool->trace;
+	int retval;
+
+	retval = tracefs_iterate_raw_events(trace->tep,
+					    trace->inst,
+					    NULL,
+					    0,
+					    collect_registered_events,
+					    trace);
+		if (retval < 0) {
+			err_msg("Error iterating on events\n");
+			return 0;
+		}
+
+	return 1;
+}
+
 /**
  * timerlat_auto_analysis - Analyze the collected data
  */
@@ -677,6 +697,8 @@ void timerlat_auto_analysis(int irq_thresh, int thread_thresh)
 	struct tep_handle *tep;
 	int cpu;
 
+	timerlat_auto_analysis_collect_trace(taa_ctx);
+
 	/* bring stop tracing to the ns scale */
 	irq_thresh = irq_thresh * 1000;
 	thread_thresh = thread_thresh * 1000;
@@ -838,6 +860,10 @@ static int timerlat_aa_init_seqs(struct timerlat_aa_context *taa_ctx)
  */
 static void timerlat_aa_unregister_events(struct osnoise_tool *tool, int dump_tasks)
 {
+
+	tep_unregister_event_handler(tool->trace.tep, -1, "ftrace", "timerlat",
+				     timerlat_aa_handler, tool);
+
 	tracefs_event_disable(tool->trace.inst, "osnoise", NULL);
 
 	tep_unregister_event_handler(tool->trace.tep, -1, "osnoise", "nmi_noise",
@@ -875,6 +901,10 @@ static int timerlat_aa_register_events(struct osnoise_tool *tool, int dump_tasks
 {
 	int retval;
 
+	tep_register_event_handler(tool->trace.tep, -1, "ftrace", "timerlat",
+				timerlat_aa_handler, tool);
+
+
 	/*
 	 * register auto-analysis handlers.
 	 */
@@ -955,8 +985,9 @@ void timerlat_aa_destroy(void)
  *
  * Returns 0 on success, -1 otherwise.
  */
-int timerlat_aa_init(struct osnoise_tool *tool, int nr_cpus, int dump_tasks)
+int timerlat_aa_init(struct osnoise_tool *tool, int dump_tasks)
 {
+	int nr_cpus = sysconf(_SC_NPROCESSORS_CONF);
 	struct timerlat_aa_context *taa_ctx;
 	int retval;
 
diff --git a/tools/tracing/rtla/src/timerlat_aa.h b/tools/tracing/rtla/src/timerlat_aa.h
index d4f6ca7e342a..cea4bb1531a8 100644
--- a/tools/tracing/rtla/src/timerlat_aa.h
+++ b/tools/tracing/rtla/src/timerlat_aa.h
@@ -3,10 +3,7 @@
  * Copyright (C) 2023 Red Hat Inc, Daniel Bristot de Oliveira <bristot@kernel.org>
  */
 
-int timerlat_aa_init(struct osnoise_tool *tool, int nr_cpus, int dump_task);
+int timerlat_aa_init(struct osnoise_tool *tool, int dump_task);
 void timerlat_aa_destroy(void);
 
-int timerlat_aa_handler(struct trace_seq *s, struct tep_record *record,
-			struct tep_event *event, void *context);
-
 void timerlat_auto_analysis(int irq_thresh, int thread_thresh);
diff --git a/tools/tracing/rtla/src/timerlat_top.c b/tools/tracing/rtla/src/timerlat_top.c
index f0c6d9735e2a..d6b5a382569e 100644
--- a/tools/tracing/rtla/src/timerlat_top.c
+++ b/tools/tracing/rtla/src/timerlat_top.c
@@ -156,9 +156,6 @@ timerlat_top_handler(struct trace_seq *s, struct tep_record *record,
 		timerlat_top_update(top, cpu, thread, latency);
 	}
 
-	if (!params->no_aa)
-		timerlat_aa_handler(s, record, event, context);
-
 	return 0;
 }
 
@@ -644,7 +641,6 @@ static struct osnoise_tool
 {
 	struct osnoise_tool *top;
 	int nr_cpus;
-	int retval;
 
 	nr_cpus = sysconf(_SC_NPROCESSORS_CONF);
 
@@ -661,16 +657,6 @@ static struct osnoise_tool
 	tep_register_event_handler(top->trace.tep, -1, "ftrace", "timerlat",
 				   timerlat_top_handler, top);
 
-	/*
-	 * If no auto analysis, we are ready.
-	 */
-	if (params->no_aa)
-		return top;
-
-	retval = timerlat_aa_init(top, nr_cpus, params->dump_tasks);
-	if (retval)
-		goto out_err;
-
 	return top;
 
 out_err:
@@ -702,6 +688,7 @@ int timerlat_top_main(int argc, char *argv[])
 	struct timerlat_top_params *params;
 	struct osnoise_tool *record = NULL;
 	struct osnoise_tool *top = NULL;
+	struct osnoise_tool *aa = NULL;
 	struct trace_instance *trace;
 	int dma_latency_fd = -1;
 	int return_value = 1;
@@ -774,6 +761,35 @@ int timerlat_top_main(int argc, char *argv[])
 		trace_instance_start(&record->trace);
 	}
 
+	if (!params->no_aa) {
+		if (params->aa_only) {
+			/* as top is not used for display, use it for aa */
+			aa = top;
+		} else  {
+			/* otherwise, a new instance is needed */
+			aa = osnoise_init_tool("timerlat_aa");
+			if (!aa)
+				goto out_top;
+		}
+
+		retval = timerlat_aa_init(aa, params->dump_tasks);
+		if (retval) {
+			err_msg("Failed to enable the auto analysis instance\n");
+			goto out_top;
+		}
+
+		/* if it is re-using the main instance, there is no need to start it */
+		if (aa != top) {
+			retval = enable_timerlat(&aa->trace);
+			if (retval) {
+				err_msg("Failed to enable timerlat tracer\n");
+				goto out_top;
+			}
+
+			trace_instance_start(&aa->trace);
+		}
+	}
+
 	top->start_time = time(NULL);
 	timerlat_top_set_signals(params);
 
@@ -829,13 +845,15 @@ int timerlat_top_main(int argc, char *argv[])
 	}
 
 out_top:
+	timerlat_aa_destroy();
 	if (dma_latency_fd >= 0)
 		close(dma_latency_fd);
 	trace_events_destroy(&record->trace, params->events);
 	params->events = NULL;
 out_free:
 	timerlat_free_top(top->data);
-	timerlat_aa_destroy();
+	if (aa && aa != top)
+		osnoise_destroy_tool(aa);
 	osnoise_destroy_tool(record);
 	osnoise_destroy_tool(top);
 	free(params);
-- 
2.38.1

