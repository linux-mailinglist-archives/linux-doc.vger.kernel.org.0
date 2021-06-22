Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04C8D3B07B0
	for <lists+linux-doc@lfdr.de>; Tue, 22 Jun 2021 16:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231967AbhFVOpu (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 22 Jun 2021 10:45:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30869 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231228AbhFVOpr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Jun 2021 10:45:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624373009;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ixkqrIKMQSntHkRSmfPmSF6qX7bW09wmkdMsRAwdhZk=;
        b=DLEXOJuGXRpnrfeVlOnut29icCq/YcdbrJhmKb95xirwXYWILcia0RObdqYySA1fQslQpj
        Nj0Kmh46llrI21GfxyWc7f4KtdF47oXDRHAN71VXNnYGJbUQO9Sv6THiWUl/lAlkNYz+HN
        dJXHvM38sKtCmqfVSNe4lDDeytZ/ec0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-jBW1m9tePtqOTYwzSfRhkw-1; Tue, 22 Jun 2021 10:43:23 -0400
X-MC-Unique: jBW1m9tePtqOTYwzSfRhkw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35018804144;
        Tue, 22 Jun 2021 14:43:22 +0000 (UTC)
Received: from x1.bristot.me.homenet.telecomitalia.it (unknown [10.10.115.243])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F2B2D5D9CA;
        Tue, 22 Jun 2021 14:43:17 +0000 (UTC)
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Phil Auld <pauld@redhat.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Kate Carcia <kcarcia@redhat.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alexandre Chartre <alexandre.chartre@oracle.com>,
        Clark Willaims <williams@redhat.com>,
        John Kacur <jkacur@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V5 03/14] trace/hwlat: Switch disable_migrate to mode none
Date:   Tue, 22 Jun 2021 16:42:21 +0200
Message-Id: <a679af672458d6b1f62252605905c5214030f247.1624372313.git.bristot@redhat.com>
In-Reply-To: <cover.1624372313.git.bristot@redhat.com>
References: <cover.1624372313.git.bristot@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When in the round-robin mode, if the tracer detects a change in the
hwlatd thread affinity by an external tool, e.g., taskset, the
round-robin logic is disabled. The disable_migrate variable currently
tracks this.

With the addition of the "mode" config and the mode "none," the
disable_migrate logic is equivalent to switch to the "none" mode.

Hence, instead of using a hidden variable to track this behavior,
switch the mode to none, informing the user about this change.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Alexandre Chartre <alexandre.chartre@oracle.com>
Cc: Clark Willaims <williams@redhat.com>
Cc: John Kacur <jkacur@redhat.com>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: x86@kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Daniel Bristot de Oliveira <bristot@redhat.com>
---
 kernel/trace/trace_hwlat.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/kernel/trace/trace_hwlat.c b/kernel/trace/trace_hwlat.c
index 43a436d85a01..bae74b95cf55 100644
--- a/kernel/trace/trace_hwlat.c
+++ b/kernel/trace/trace_hwlat.c
@@ -286,7 +286,6 @@ static int get_sample(void)
 }
 
 static struct cpumask save_cpumask;
-static bool disable_migrate;
 
 static void move_to_next_cpu(void)
 {
@@ -294,15 +293,13 @@ static void move_to_next_cpu(void)
 	struct trace_array *tr = hwlat_trace;
 	int next_cpu;
 
-	if (disable_migrate)
-		return;
 	/*
 	 * If for some reason the user modifies the CPU affinity
 	 * of this thread, then stop migrating for the duration
 	 * of the current test.
 	 */
 	if (!cpumask_equal(current_mask, current->cpus_ptr))
-		goto disable;
+		goto change_mode;
 
 	get_online_cpus();
 	cpumask_and(current_mask, cpu_online_mask, tr->tracing_cpumask);
@@ -313,7 +310,7 @@ static void move_to_next_cpu(void)
 		next_cpu = cpumask_first(current_mask);
 
 	if (next_cpu >= nr_cpu_ids) /* Shouldn't happen! */
-		goto disable;
+		goto change_mode;
 
 	cpumask_clear(current_mask);
 	cpumask_set_cpu(next_cpu, current_mask);
@@ -321,8 +318,9 @@ static void move_to_next_cpu(void)
 	sched_setaffinity(0, current_mask);
 	return;
 
- disable:
-	disable_migrate = true;
+ change_mode:
+	hwlat_data.thread_mode = MODE_NONE;
+	pr_info(BANNER "cpumask changed while in round-robin mode, switching to mode none\n");
 }
 
 /*
@@ -744,7 +742,6 @@ static int hwlat_tracer_init(struct trace_array *tr)
 
 	hwlat_trace = tr;
 
-	disable_migrate = false;
 	hwlat_data.count = 0;
 	tr->max_latency = 0;
 	save_tracing_thresh = tracing_thresh;
-- 
2.31.1

