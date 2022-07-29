Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F329584E40
	for <lists+linux-doc@lfdr.de>; Fri, 29 Jul 2022 11:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235619AbiG2Jks (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 29 Jul 2022 05:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235902AbiG2Jk2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Jul 2022 05:40:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E508218C;
        Fri, 29 Jul 2022 02:40:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3528261D97;
        Fri, 29 Jul 2022 09:40:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F37AC4347C;
        Fri, 29 Jul 2022 09:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659087602;
        bh=CCZnCiGIC2XrY3X8NeTs1iYP+uKvFbdPaa4pIVTAjAw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fVxasy3v50AjSlKBz9atN+FLSf8+QBuP8/8AOgiPUMVxIuyYrSMinl1aQndO17lLy
         b13gTSdELcCTApA08Ddd6tx7zpXPIRhhTkTT0ZGgux2HDS2mNXkzrjKD5nRcYsGaad
         E2Bym9HozZgJRa5k3xV9m7dk0tjyTzgZoWu+NoeAn5fGuyCua1K1DebDM7POHXs3wq
         nmPPJ+ssAs8rIRDPfBygEoofew6JOexhjV8Jtk1o9dJIw3gKKxi46Yhm11gE3djoI2
         QF/5/5wRUhLh1CJ3ayj1pScvx1VkchMhNgAHuUUEyzHAchjUMi3cjA0HH97lULXQHC
         4WnQ/gOYV251A==
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
Subject: [PATCH V9 11/16] Documentation/rv: Add deterministic automata instrumentation documentation
Date:   Fri, 29 Jul 2022 11:38:50 +0200
Message-Id: <0557d5c68e2fc252f2643c2cc5295a67e2b73277.1659052063.git.bristot@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1659052063.git.bristot@kernel.org>
References: <cover.1659052063.git.bristot@kernel.org>
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

Add the da_monitor_instrumentation.rst. It describes the basics
of RV monitor instrumentation.

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
 .../trace/rv/da_monitor_instrumentation.rst   | 171 ++++++++++++++++++
 Documentation/trace/rv/index.rst              |   1 +
 2 files changed, 172 insertions(+)
 create mode 100644 Documentation/trace/rv/da_monitor_instrumentation.rst

diff --git a/Documentation/trace/rv/da_monitor_instrumentation.rst b/Documentation/trace/rv/da_monitor_instrumentation.rst
new file mode 100644
index 000000000000..6c67c7b57811
--- /dev/null
+++ b/Documentation/trace/rv/da_monitor_instrumentation.rst
@@ -0,0 +1,171 @@
+Deterministic Automata Instrumentation
+======================================
+
+The RV monitor file created by dot2k, with the name "$MODEL_NAME.c"
+includes a section dedicated to instrumentation.
+
+In the example of the wip.dot monitor created on [1], it will look like::
+
+  /*
+   * This is the instrumentation part of the monitor.
+   *
+   * This is the section where manual work is required. Here the kernel events
+   * are translated into model's event.
+   *
+   */
+  static void handle_preempt_disable(void *data, /* XXX: fill header */)
+  {
+	da_handle_event_wip(preempt_disable_wip);
+  }
+
+  static void handle_preempt_enable(void *data, /* XXX: fill header */)
+  {
+	da_handle_event_wip(preempt_enable_wip);
+  }
+
+  static void handle_sched_waking(void *data, /* XXX: fill header */)
+  {
+	da_handle_event_wip(sched_waking_wip);
+  }
+
+  static int enable_wip(void)
+  {
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
+  }
+
+The comment at the top of the section explains the general idea: the
+instrumentation section translates *kernel events* into the *model's
+event*.
+
+Tracing callback functions
+--------------------------
+
+The first three functions are the starting point of the callback *handler
+functions* for each of the three events from the wip model. The developer
+does not necessarily need to use them: they are just starting points.
+
+Using the example of::
+
+ void handle_preempt_disable(void *data, /* XXX: fill header */)
+ {
+        da_handle_event_wip(preempt_disable_wip);
+ }
+
+The preempt_disable event from the model connects directly to the
+preemptirq:preempt_disable. The preemptirq:preempt_disable event
+has the following signature, from include/trace/events/preemptirq.h::
+
+  TP_PROTO(unsigned long ip, unsigned long parent_ip)
+
+Hence, the handle_preempt_disable() function will look like::
+
+  void handle_preempt_disable(void *data, unsigned long ip, unsigned long parent_ip)
+
+In this case, the kernel event translates one to one with the automata
+event, and indeed, no other change is required for this function.
+
+The next handler function, handle_preempt_enable() has the same argument
+list from the handle_preempt_disable(). The difference is that the
+preempt_enable event will be used to synchronize the system to the model.
+
+Initially, the *model* is placed in the initial state. However, the *system*
+might or might not be in the initial state. The monitor cannot start
+processing events until it knows that the system has reached the initial state.
+Otherwise, the monitor and the system could be out-of-sync.
+
+Looking at the automata definition, it is possible to see that the system
+and the model are expected to return to the initial state after the
+preempt_enable execution. Hence, it can be used to synchronize the
+system and the model at the initialization of the monitoring section.
+
+The start is informed via a special handle function, the
+"da_handle_start_event_$(MONITOR_NAME)(event)", in this case::
+
+  da_handle_start_event_wip(preempt_enable_wip);
+
+So, the callback function will look like::
+
+  void handle_preempt_enable(void *data, unsigned long ip, unsigned long parent_ip)
+  {
+        da_handle_start_event_wip(preempt_enable_wip);
+  }
+
+Finally, the "handle_sched_waking()" will look like::
+
+  void handle_sched_waking(void *data, struct task_struct *task)
+  {
+        da_handle_event_wip(sched_waking_wip);
+  }
+
+And the explanation is left for the reader as an exercise.
+
+enable and disable functions
+----------------------------
+
+dot2k automatically creates two special functions::
+
+  enable_$(MONITOR_NAME)()
+  disable_$(MONITOR_NAME)()
+
+These functions are called when the monitor is enabled and disabled,
+respectively.
+
+They should be used to *attach* and *detach* the instrumentation to the running
+system. The developer must add to the relative function all that is needed to
+*attach* and *detach* its monitor to the system.
+
+For the wip case, these functions were named::
+
+ enable_wip()
+ disable_wip()
+
+But no change was required because: by default, these functions *attach* and
+*detach* the tracepoints_to_attach, which was enough for this case.
+
+Instrumentation helpers
+-----------------------
+
+To complete the instrumentation, the *handler functions* need to be attached to a
+kernel event, at the monitoring enable phase.
+
+The RV interface also facilitates this step. For example, the macro "rv_attach_trace_probe()"
+is used to connect the wip model events to the relative kernel event. dot2k automatically
+adds "rv_attach_trace_probe()" function call for each model event in the enable phase, as
+a suggestion.
+
+For example, from the wip sample model::
+
+  static int enable_wip(void)
+  {
+        int retval;
+
+        retval = da_monitor_init_wip();
+        if (retval)
+                return retval;
+
+        rv_attach_trace_probe("wip", /* XXX: tracepoint */, handle_preempt_enable);
+        rv_attach_trace_probe("wip", /* XXX: tracepoint */, handle_sched_waking);
+        rv_attach_trace_probe("wip", /* XXX: tracepoint */, handle_preempt_disable);
+
+        return 0;
+  }
+
+The probes then need to be detached at the disable phase.
+
+[1] The wip model is presented in::
+
+  Documentation/trace/rv/deterministic_automata.rst
+
+The wip monitor is presented in::
+
+  Documentation/trace/rv/da_monitor_synthesis.rst
diff --git a/Documentation/trace/rv/index.rst b/Documentation/trace/rv/index.rst
index 46d47f33052c..db2ae3f90b90 100644
--- a/Documentation/trace/rv/index.rst
+++ b/Documentation/trace/rv/index.rst
@@ -9,3 +9,4 @@ Runtime Verification
    runtime-verification.rst
    deterministic_automata.rst
    da_monitor_synthesis.rst
+   da_monitor_instrumentation.rst
-- 
2.35.1

