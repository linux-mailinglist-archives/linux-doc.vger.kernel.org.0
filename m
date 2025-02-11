Return-Path: <linux-doc+bounces-37753-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C0DA304C8
	for <lists+linux-doc@lfdr.de>; Tue, 11 Feb 2025 08:48:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03DF67A192E
	for <lists+linux-doc@lfdr.de>; Tue, 11 Feb 2025 07:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CBCB1EE039;
	Tue, 11 Feb 2025 07:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i/W/RrC9"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1251EEA3E
	for <linux-doc@vger.kernel.org>; Tue, 11 Feb 2025 07:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739260042; cv=none; b=ZJltATBqKZ92xd47RB4yEMyWXqTmYz99DvHaEBMWfBx8bLjFCAOuTqcAEVIgIKUyFYlQkgie0VrsuVyshiw0eNqJS7E9VhEUt90e2HcNYTE68zHmUasPZWBCsCGREHEDvn59PR9IvOqk8aj1BiGuk+OFS6PUMKcDtUXeD1athK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739260042; c=relaxed/simple;
	bh=IY7DU1BhjQRR5Coi7wNZ7++4LSEJz4/d+wLFVatOJNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ulTxhvkIE37YmN6/3d6OWew7cenwXsT1xp0xfYfiTqgCurW2kmByL/ILy3WT3Kqdhv5xv4POAnWi+bh7qkHzNsZ1L0SYloSIo2Zz3ihRhoh8w/EyxgHooBNJxXLDbf/Ww7DuZNMptvlE1i5VPydHbKEZxraocBCsi+46cjVnSg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i/W/RrC9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739260039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rPPwrQnu9UKt/4NbsUXxMh/AuN498RxwAC9aj1izwuk=;
	b=i/W/RrC9tWvN/a4EhIwdlngJmpXYVt7WwkLYGhKUtFpqggXi8jKsDoKfwooJc6DK03wnd7
	cdLwjnqp3K3rUCt3WepNlP0pZQn8Hl35rgrc3zreVCrVUK23fKt40lvCgGoEiIJjuRmLr0
	JBkfKG0R4ReW6R4RauVuLqGOK3Ru0+0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-301-n9-Ml6MoNoi4Q4pLYucY9w-1; Tue,
 11 Feb 2025 02:47:17 -0500
X-MC-Unique: n9-Ml6MoNoi4Q4pLYucY9w-1
X-Mimecast-MFC-AGG-ID: n9-Ml6MoNoi4Q4pLYucY9w
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5846B195608C;
	Tue, 11 Feb 2025 07:47:16 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.rmtit.com (unknown [10.45.224.45])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4E779195608D;
	Tue, 11 Feb 2025 07:47:12 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-doc@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: Gabriele Monaco <gmonaco@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	John Kacur <jkacur@redhat.com>,
	Clark Williams <williams@redhat.com>
Subject: [PATCH v1 10/11] Documentation/rv: Add docs for the sched monitors
Date: Tue, 11 Feb 2025 08:46:17 +0100
Message-ID: <20250211074622.58590-11-gmonaco@redhat.com>
In-Reply-To: <20250211074622.58590-1-gmonaco@redhat.com>
References: <20250211074622.58590-1-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Add man page and kernel documentation for the sched monitors, as sched
is a container of other monitors, document all in the same page.
sched is the first nested monitor, also explain what is a nested monitor
and how enabling containers or children monitors work.

To: Ingo Molnar <mingo@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: John Kacur <jkacur@redhat.com>
Cc: Clark Williams <williams@redhat.com>
Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 Documentation/tools/rv/rv-mon-sched.rst  |  69 +++++++++
 Documentation/trace/rv/monitor_sched.rst | 171 +++++++++++++++++++++++
 2 files changed, 240 insertions(+)
 create mode 100644 Documentation/tools/rv/rv-mon-sched.rst
 create mode 100644 Documentation/trace/rv/monitor_sched.rst

diff --git a/Documentation/tools/rv/rv-mon-sched.rst b/Documentation/tools/rv/rv-mon-sched.rst
new file mode 100644
index 0000000000000..da0fe4c79ae52
--- /dev/null
+++ b/Documentation/tools/rv/rv-mon-sched.rst
@@ -0,0 +1,69 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+============
+rv-mon-sched
+============
+-----------------------------
+Scheduler monitors collection
+-----------------------------
+
+:Manual section: 1
+
+SYNOPSIS
+========
+
+**rv mon sched** [*OPTIONS*]
+
+**rv mon <NESTED_MONITOR>** [*OPTIONS*]
+
+**rv mon sched:<NESTED_MONITOR>** [*OPTIONS*]
+
+DESCRIPTION
+===========
+
+The scheduler monitor collection is a container for several monitors to model
+the behaviour of the scheduler. Each monitor describes a specification that
+the scheduler should follow.
+
+As a monitor container, it will enable all nested monitors and set them
+according to OPTIONS.
+Nevertheless nested monitors can also be activated independently both by name
+and by specifying sched: , e.g. to enable only monitor tss you can do any of:
+
+    # rv mon sched:tss
+
+    # rv mon tss
+
+See kernel documentation for further information about this monitor:
+<https://docs.kernel.org/trace/rv/monitor_sched.html>
+
+OPTIONS
+=======
+
+.. include:: common_ikm.rst
+
+NESTED MONITOR
+==============
+
+The available nested monitors are:
+  * scpd: schedule called with preemption disabled
+  * snep: schedule does not enable preempt
+  * sncid: schedule not called with interrupt disabled
+  * snroc: set non runnable on its own context
+  * sco: scheduling context operations
+  * tss: task switch while scheduling
+
+SEE ALSO
+========
+
+**rv**\(1), **rv-mon**\(1)
+
+Linux kernel *RV* documentation:
+<https://www.kernel.org/doc/html/latest/trace/rv/index.html>
+
+AUTHOR
+======
+
+Written by Gabriele Monaco <gmonaco@redhat.com>
+
+.. include:: common_appendix.rst
diff --git a/Documentation/trace/rv/monitor_sched.rst b/Documentation/trace/rv/monitor_sched.rst
new file mode 100644
index 0000000000000..24b2c62a3bc26
--- /dev/null
+++ b/Documentation/trace/rv/monitor_sched.rst
@@ -0,0 +1,171 @@
+Scheduler monitors
+==================
+
+- Name: sched
+- Type: container for multiple monitors
+- Author: Gabriele Monaco <gmonaco@redhat.com>, Daniel Bristot de Oliveira <bristot@kernel.org>
+
+Description
+-----------
+
+Monitors describing complex systems, such as the scheduler, can easily grow to
+the point where they are just hard to understand because of the many possible
+state transitions.
+Often it is possible to break such descriptions into smaller monitors,
+sharing some or all events. Enabling those smaller monitors concurrently is,
+in fact, testing the system as if we had one single larger monitor.
+Splitting models into multiple specification is not only easier to
+understand, but gives some more clues when we see errors.
+
+The sched monitor is a set of specifications to describe the scheduler behaviour.
+It includes several per-cpu and per-task monitors that work independently to verify
+different specifications the scheduler should follow.
+
+To make this system as straightforward as possible, sched specifications are *nested*
+monitors, whereas sched itself is a *container*.
+From the interface perspective, sched includes other monitors as sub-directories,
+enabling/disabling or setting reactors to sched, propagates the change to all monitors,
+however single monitors can be used independently as well.
+
+It is important that future modules are built after their container (sched, in
+this case), otherwise the linker would not respect the order and the nesting
+wouldn't work as expected.
+To do so, simply add them after sched in the Makefile.
+
+Specifications
+--------------
+
+The specifications included in sched are currently a work in progress, adapting the ones
+defined in by Daniel Bristot in [1].
+
+Currently we included the following:
+
+Monitor tss
+~~~~~~~~~~~
+
+The task switch while scheduling (tss) monitor ensures a task switch happens
+only in scheduling context, that is inside a call to `__schedule`::
+
+                     |
+                     |
+                     v
+                   +-----------------+
+                   |     thread      | <+
+                   +-----------------+  |
+                     |                  |
+                     | schedule_entry   | schedule_exit
+                     v                  |
+    sched_switch                        |
+  +---------------                      |
+  |                       sched         |
+  +-------------->                     -+
+
+Monitor sco
+~~~~~~~~~~~
+
+The scheduling context operations (sco) monitor ensures changes in a task state
+happen only in thread context::
+
+
+                        |
+                        |
+                        v
+    sched_set_state   +------------------+
+  +------------------ |                  |
+  |                   |  thread_context  |
+  +-----------------> |                  | <+
+                      +------------------+  |
+                        |                   |
+                        | schedule_entry    | schedule_exit
+                        v                   |
+                                            |
+                       scheduling_context  -+
+
+Monitor snroc
+~~~~~~~~~~~~~
+
+The set non runnable on its own context (snroc) monitor ensures changes in a
+task state happens only in the respective task's context. This is a per-task
+monitor::
+
+                        |
+                        |
+                        v
+                      +------------------+
+                      |  other_context   | <+
+                      +------------------+  |
+                        |                   |
+                        | sched_switch_in   | sched_switch_out
+                        v                   |
+    sched_set_state                         |
+  +------------------                       |
+  |                       own_context       |
+  +----------------->                      -+
+
+Monitor scpd
+~~~~~~~~~~~~
+
+The schedule called with preemption disabled (scpd) monitor ensures schedule is
+called with preemption disabled::
+
+                       |
+                       |
+                       v
+                     +------------------+
+                     |    cant_sched    | <+
+                     +------------------+  |
+                       |                   |
+                       | preempt_disable   | preempt_enable
+                       v                   |
+    schedule_entry                         |
+    schedule_exit                          |
+  +-----------------      can_sched        |
+  |                                        |
+  +---------------->                      -+
+
+Monitor snep
+~~~~~~~~~~~~
+
+The schedule does not enable preempt (snep) monitor ensures a schedule call
+does not enable preemption::
+
+                        |
+                        |
+                        v
+    preempt_disable   +------------------------+
+    preempt_enable    |                        |
+  +------------------ | non_scheduling_context |
+  |                   |                        |
+  +-----------------> |                        | <+
+                      +------------------------+  |
+                        |                         |
+                        | schedule_entry          | schedule_exit
+                        v                         |
+                                                  |
+                          scheduling_contex      -+
+
+Monitor sncid
+~~~~~~~~~~~~~
+
+The schedule not called with interrupt disabled (sncid) monitor ensures
+schedule is not called with interrupt disabled::
+
+                       |
+                       |
+                       v
+    schedule_entry   +--------------+
+    schedule_exit    |              |
+  +----------------- |  can_sched   |
+  |                  |              |
+  +----------------> |              | <+
+                     +--------------+  |
+                       |               |
+                       | irq_disable   | irq_enable
+                       v               |
+                                       |
+                        cant_sched    -+
+
+References
+----------
+
+[1] - https://bristot.me/linux-task-model
-- 
2.48.1


