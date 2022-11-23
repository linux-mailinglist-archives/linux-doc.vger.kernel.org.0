Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48D6D636691
	for <lists+linux-doc@lfdr.de>; Wed, 23 Nov 2022 18:07:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236917AbiKWRH1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 23 Nov 2022 12:07:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239020AbiKWRGp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Nov 2022 12:06:45 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A66EAC4B69;
        Wed, 23 Nov 2022 09:06:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 456EB61DF7;
        Wed, 23 Nov 2022 17:06:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2C2EC433D6;
        Wed, 23 Nov 2022 17:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669223201;
        bh=572LKrFlwGTVNo7fZjQcd1sMaO3bjlC22vJvxTRspSc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Cy9qvLxY59+KxQyUyH+9sCX6HVEFqQVPPLH787k/5aUI4w1y1iVKXLv7gJ8lV/FjH
         JIKLuGm+rugW5eK2RiWgfAzaVnleYP75YhnvLYK4Wym80AmihlZsAyQbgA6dtIYXcl
         JAHvAmWGY9Iq+DHgsG5n3AQa1CIWCxbzDZbgvxwRyYp5uhtPxNSTY69EKgGEOQFwkB
         VtTM+spQyjkNlT6lhHs1lW/EGcpYIMt7mpRFiKRBG3niH0UdlQFjglDtcUUD7r5ROG
         1dlZQwBRVpqHMsq/XWzc9g3LjLmBf2nnavqQp+Vj74LmaKa0UpKHtvpRdL9STbz6P2
         Q9bM3V3r2BdAA==
From:   Daniel Bristot de Oliveira <bristot@kernel.org>
To:     Daniel Bristot de Oliveira <bristot@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     Masami Hiramatsu <mhiramat@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Juri Lelli <juri.lelli@redhat.com>,
        Clark Williams <williams@redhat.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 5/6] tracing/osnoise: Add preempt and/or irq disabled options
Date:   Wed, 23 Nov 2022 18:06:23 +0100
Message-Id: <78ab591cbda81b833578ee69e34c90f16438102a.1669115208.git.bristot@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1669115208.git.bristot@kernel.org>
References: <cover.1669115208.git.bristot@kernel.org>
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

The osnoise workload runs with preemption and IRQs enabled in such
a way as to allow all sorts of noise to disturb osnoise's execution.
hwlat tracer has a similar workload but works with irq disabled,
allowing only NMIs and the hardware to generate noise.

While thinking about adding an options file to hwlat tracer to
allow the system to panic, and other features I was thinking
to add, like having a tracepoint at each noise detection, it
came to my mind that is easier to make osnoise and also do
hardware latency detection than making hwlat "feature compatible"
with osnoise.

Other points are:
 - osnoise already has an independent cpu file.
 - osnoise has a more intuitive interface, e.g., runtime/period vs.
   window/width (and people often need help remembering what it is).
 - osnoise: tracepoints
 - osnoise stop options
 - osnoise options file itself

Moreover, the user-space side (in rtla) is simplified by reusing the
existing osnoise code.

Finally, people have been asking me about using osnoise for hw latency
detection, and I have to explain that it was sufficient but not
necessary. These options make it sufficient and necessary.

Adding a Suggested-by Clark, as he often asked me about this
possibility.

Cc: Suggested-by: Clark Williams <williams@redhat.com>
Cc: Daniel Bristot de Oliveira <bristot@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Daniel Bristot de Oliveira <bristot@kernel.org>
---
 kernel/trace/trace_osnoise.c | 40 +++++++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 5 deletions(-)

diff --git a/kernel/trace/trace_osnoise.c b/kernel/trace/trace_osnoise.c
index 801eba0b5cf8..14b7f4092982 100644
--- a/kernel/trace/trace_osnoise.c
+++ b/kernel/trace/trace_osnoise.c
@@ -55,10 +55,17 @@ enum osnoise_options_index {
 	OSN_DEFAULTS = 0,
 	OSN_WORKLOAD,
 	OSN_PANIC_ON_STOP,
+	OSN_PREEMPT_DISABLE,
+	OSN_IRQ_DISABLE,
 	OSN_MAX
 };
 
-static const char * const osnoise_options_str[OSN_MAX] = { "DEFAULTS", "OSNOISE_WORKLOAD", "PANIC_ON_STOP" };
+static const char * const osnoise_options_str[OSN_MAX] = {
+							"DEFAULTS",
+							"OSNOISE_WORKLOAD",
+							"PANIC_ON_STOP",
+							"OSNOISE_PREEMPT_DISABLE",
+							"OSNOISE_IRQ_DISABLE" };
 
 #define OSN_DEFAULT_OPTIONS	0x2
 unsigned long osnoise_options	= OSN_DEFAULT_OPTIONS;
@@ -1308,6 +1315,8 @@ static void notify_new_max_latency(u64 latency)
  */
 static int run_osnoise(void)
 {
+	bool preempt_disable = test_bit(OSN_PREEMPT_DISABLE, &osnoise_options);
+	bool irq_disable = test_bit(OSN_IRQ_DISABLE, &osnoise_options);
 	struct osnoise_variables *osn_var = this_cpu_osn_var();
 	u64 start, sample, last_sample;
 	u64 last_int_count, int_count;
@@ -1335,6 +1344,14 @@ static int run_osnoise(void)
 	 */
 	threshold = tracing_thresh ? : 5000;
 
+	/*
+	 * IRQ disable also implies in preempt disable.
+	 */
+	if (irq_disable)
+		local_irq_disable();
+	else if (preempt_disable)
+		preempt_disable();
+
 	/*
 	 * Make sure NMIs see sampling first
 	 */
@@ -1422,16 +1439,21 @@ static int run_osnoise(void)
 		 * cond_resched()
 		 */
 		if (IS_ENABLED(CONFIG_PREEMPT_RCU)) {
-			local_irq_disable();
+			if (!irq_disable)
+				local_irq_disable();
+
 			rcu_momentary_dyntick_idle();
-			local_irq_enable();
+
+			if (!irq_disable)
+				local_irq_enable();
 		}
 
 		/*
 		 * For the non-preemptive kernel config: let threads runs, if
-		 * they so wish.
+		 * they so wish, unless set not do to so.
 		 */
-		cond_resched();
+		if (!irq_disable && !preempt_disable)
+			cond_resched();
 
 		last_sample = sample;
 		last_int_count = int_count;
@@ -1450,6 +1472,14 @@ static int run_osnoise(void)
 	 */
 	barrier();
 
+	/*
+	 * Return to the preemptive state.
+	 */
+	if (irq_disable)
+		local_irq_enable();
+	else if (preempt_disable)
+		preempt_enable();
+
 	/*
 	 * Save noise info.
 	 */
-- 
2.32.0

