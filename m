Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E25DC1B2DC9
	for <lists+linux-doc@lfdr.de>; Tue, 21 Apr 2020 19:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbgDURFC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 21 Apr 2020 13:05:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:33642 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728955AbgDUREP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 21 Apr 2020 13:04:15 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 112842072D;
        Tue, 21 Apr 2020 17:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587488654;
        bh=rCwvywM9NdgtX+BiEtrMRfDJkENBWyzLWJSvTejcs4Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ohq/MsQtGmhWRQclCfQ/yPBFHmiPm7/JdbrgcjSii+c+B8Psv61N2mxR8bAL/Hwhi
         EF2W+gOlEAODVf9CsX7qDeQThfCr0TZ7r/3qW2R0scmwIZzjqqz3HDk/+0G6R9fOIn
         3GhbIQ5owxyriUslMTR4IMI8XYY3i9V/oyagOm3k=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jQwJg-00CmM5-9M; Tue, 21 Apr 2020 19:04:12 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Josh Triplett <josh@joshtriplett.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Joel Fernandes <joel@joelfernandes.org>, rcu@vger.kernel.org
Subject: [PATCH 09/10] docs: RCU: stallwarn.txt: convert it to ReST
Date:   Tue, 21 Apr 2020 19:04:10 +0200
Message-Id: <df8af9bee4ce2c22b2ea413cd5903e741d1e396f.1587488137.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1587488137.git.mchehab+huawei@kernel.org>
References: <cover.1587488137.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

- Add a SPDX header;
- Adjust document and section titles;
- Fix list markups;
- Some whitespace fixes and new line breaks;
- Mark literal blocks as such;
- Add it to RCU/index.rst.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/RCU/index.rst                   |  1 +
 .../RCU/{stallwarn.txt => stallwarn.rst}      | 55 ++++++++++++-------
 kernel/rcu/tree_stall.h                       |  4 +-
 3 files changed, 37 insertions(+), 23 deletions(-)
 rename Documentation/RCU/{stallwarn.txt => stallwarn.rst} (90%)

diff --git a/Documentation/RCU/index.rst b/Documentation/RCU/index.rst
index 9a99db701e5d..7b8a8b6bc94b 100644
--- a/Documentation/RCU/index.rst
+++ b/Documentation/RCU/index.rst
@@ -20,6 +20,7 @@ RCU concepts
    rculist_nulls
    rcuref
    torture
+   stallwarn
    listRCU
    NMI-RCU
    UP
diff --git a/Documentation/RCU/stallwarn.txt b/Documentation/RCU/stallwarn.rst
similarity index 90%
rename from Documentation/RCU/stallwarn.txt
rename to Documentation/RCU/stallwarn.rst
index a360a8796710..08bc9aec4606 100644
--- a/Documentation/RCU/stallwarn.txt
+++ b/Documentation/RCU/stallwarn.rst
@@ -1,4 +1,8 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==============================
 Using RCU's CPU Stall Detector
+==============================
 
 This document first discusses what sorts of issues RCU's CPU stall
 detector can locate, and then discusses kernel parameters and Kconfig
@@ -7,39 +11,40 @@ this document explains the stall detector's "splat" format.
 
 
 What Causes RCU CPU Stall Warnings?
+===================================
 
 So your kernel printed an RCU CPU stall warning.  The next question is
 "What caused it?"  The following problems can result in RCU CPU stall
 warnings:
 
-o	A CPU looping in an RCU read-side critical section.
+-	A CPU looping in an RCU read-side critical section.
 
-o	A CPU looping with interrupts disabled.
+-	A CPU looping with interrupts disabled.
 
-o	A CPU looping with preemption disabled.
+-	A CPU looping with preemption disabled.
 
-o	A CPU looping with bottom halves disabled.
+-	A CPU looping with bottom halves disabled.
 
-o	For !CONFIG_PREEMPT kernels, a CPU looping anywhere in the kernel
+-	For !CONFIG_PREEMPT kernels, a CPU looping anywhere in the kernel
 	without invoking schedule().  If the looping in the kernel is
 	really expected and desirable behavior, you might need to add
 	some calls to cond_resched().
 
-o	Booting Linux using a console connection that is too slow to
+-	Booting Linux using a console connection that is too slow to
 	keep up with the boot-time console-message rate.  For example,
 	a 115Kbaud serial console can be -way- too slow to keep up
 	with boot-time message rates, and will frequently result in
 	RCU CPU stall warning messages.  Especially if you have added
 	debug printk()s.
 
-o	Anything that prevents RCU's grace-period kthreads from running.
+-	Anything that prevents RCU's grace-period kthreads from running.
 	This can result in the "All QSes seen" console-log message.
 	This message will include information on when the kthread last
 	ran and how often it should be expected to run.  It can also
-	result in the "rcu_.*kthread starved for" console-log message,
+	result in the ``rcu_.*kthread starved for`` console-log message,
 	which will include additional debugging information.
 
-o	A CPU-bound real-time task in a CONFIG_PREEMPT kernel, which might
+-	A CPU-bound real-time task in a CONFIG_PREEMPT kernel, which might
 	happen to preempt a low-priority task in the middle of an RCU
 	read-side critical section.   This is especially damaging if
 	that low-priority task is not permitted to run on any other CPU,
@@ -48,7 +53,7 @@ o	A CPU-bound real-time task in a CONFIG_PREEMPT kernel, which might
 	While the system is in the process of running itself out of
 	memory, you might see stall-warning messages.
 
-o	A CPU-bound real-time task in a CONFIG_PREEMPT_RT kernel that
+-	A CPU-bound real-time task in a CONFIG_PREEMPT_RT kernel that
 	is running at a higher priority than the RCU softirq threads.
 	This will prevent RCU callbacks from ever being invoked,
 	and in a CONFIG_PREEMPT_RCU kernel will further prevent
@@ -63,7 +68,7 @@ o	A CPU-bound real-time task in a CONFIG_PREEMPT_RT kernel that
 	can increase your system's context-switch rate and thus degrade
 	performance.
 
-o	A periodic interrupt whose handler takes longer than the time
+-	A periodic interrupt whose handler takes longer than the time
 	interval between successive pairs of interrupts.  This can
 	prevent RCU's kthreads and softirq handlers from running.
 	Note that certain high-overhead debugging options, for example
@@ -71,20 +76,20 @@ o	A periodic interrupt whose handler takes longer than the time
 	considerably longer than normal, which can in turn result in
 	RCU CPU stall warnings.
 
-o	Testing a workload on a fast system, tuning the stall-warning
+-	Testing a workload on a fast system, tuning the stall-warning
 	timeout down to just barely avoid RCU CPU stall warnings, and then
 	running the same workload with the same stall-warning timeout on a
 	slow system.  Note that thermal throttling and on-demand governors
 	can cause a single system to be sometimes fast and sometimes slow!
 
-o	A hardware or software issue shuts off the scheduler-clock
+-	A hardware or software issue shuts off the scheduler-clock
 	interrupt on a CPU that is not in dyntick-idle mode.  This
 	problem really has happened, and seems to be most likely to
 	result in RCU CPU stall warnings for CONFIG_NO_HZ_COMMON=n kernels.
 
-o	A bug in the RCU implementation.
+-	A bug in the RCU implementation.
 
-o	A hardware failure.  This is quite unlikely, but has occurred
+-	A hardware failure.  This is quite unlikely, but has occurred
 	at least once in real life.  A CPU failed in a running system,
 	becoming unresponsive, but not causing an immediate crash.
 	This resulted in a series of RCU CPU stall warnings, eventually
@@ -109,6 +114,7 @@ see include/trace/events/rcu.h.
 
 
 Fine-Tuning the RCU CPU Stall Detector
+======================================
 
 The rcuupdate.rcu_cpu_stall_suppress module parameter disables RCU's
 CPU stall detector, which detects conditions that unduly delay RCU grace
@@ -118,6 +124,7 @@ The stall detector's idea of what constitutes "unduly delayed" is
 controlled by a set of kernel configuration variables and cpp macros:
 
 CONFIG_RCU_CPU_STALL_TIMEOUT
+----------------------------
 
 	This kernel configuration parameter defines the period of time
 	that RCU will wait from the beginning of a grace period until it
@@ -137,6 +144,7 @@ CONFIG_RCU_CPU_STALL_TIMEOUT
 	/sys/module/rcupdate/parameters/rcu_cpu_stall_suppress.
 
 RCU_STALL_DELAY_DELTA
+---------------------
 
 	Although the lockdep facility is extremely useful, it does add
 	some overhead.  Therefore, under CONFIG_PROVE_RCU, the
@@ -145,6 +153,7 @@ RCU_STALL_DELAY_DELTA
 	macro, not a kernel configuration parameter.)
 
 RCU_STALL_RAT_DELAY
+-------------------
 
 	The CPU stall detector tries to make the offending CPU print its
 	own warnings, as this often gives better-quality stack traces.
@@ -155,6 +164,7 @@ RCU_STALL_RAT_DELAY
 	parameter.)
 
 rcupdate.rcu_task_stall_timeout
+-------------------------------
 
 	This boot/sysfs parameter controls the RCU-tasks stall warning
 	interval.  A value of zero or less suppresses RCU-tasks stall
@@ -168,9 +178,10 @@ rcupdate.rcu_task_stall_timeout
 
 
 Interpreting RCU's CPU Stall-Detector "Splats"
+==============================================
 
 For non-RCU-tasks flavors of RCU, when a CPU detects that it is stalling,
-it will print a message similar to the following:
+it will print a message similar to the following::
 
 	INFO: rcu_sched detected stalls on CPUs/tasks:
 	2-...: (3 GPs behind) idle=06c/0/0 softirq=1453/1455 fqs=0
@@ -223,7 +234,7 @@ an estimate of the total number of RCU callbacks queued across all CPUs
 (625 in this case).
 
 In kernels with CONFIG_RCU_FAST_NO_HZ, more information is printed
-for each CPU:
+for each CPU::
 
 	0: (64628 ticks this GP) idle=dd5/3fffffffffffffff/0 softirq=82/543 last_accelerate: a345/d342 dyntick_enabled: 1
 
@@ -235,7 +246,7 @@ processing is enabled.
 
 If the grace period ends just as the stall warning starts printing,
 there will be a spurious stall-warning message, which will include
-the following:
+the following::
 
 	INFO: Stall ended before state dump start
 
@@ -248,7 +259,7 @@ which is overkill for this sort of problem.
 
 If all CPUs and tasks have passed through quiescent states, but the
 grace period has nevertheless failed to end, the stall-warning splat
-will include something like the following:
+will include something like the following::
 
 	All QSes seen, last rcu_preempt kthread activity 23807 (4297905177-4297881370), jiffies_till_next_fqs=3, root ->qsmask 0x0
 
@@ -261,7 +272,7 @@ which is way less than 23807.  Finally, the root rcu_node structure's
 
 If the relevant grace-period kthread has been unable to run prior to
 the stall warning, as was the case in the "All QSes seen" line above,
-the following additional line is printed:
+the following additional line is printed::
 
 	kthread starved for 23807 jiffies! g7075 f0x0 RCU_GP_WAIT_FQS(3) ->state=0x1 ->cpu=5
 
@@ -276,6 +287,7 @@ kthread last ran on CPU 5.
 
 
 Multiple Warnings From One Stall
+================================
 
 If a stall lasts long enough, multiple stall-warning messages will be
 printed for it.  The second and subsequent messages are printed at
@@ -285,9 +297,10 @@ of the stall and the first message.
 
 
 Stall Warnings for Expedited Grace Periods
+==========================================
 
 If an expedited grace period detects a stall, it will place a message
-like the following in dmesg:
+like the following in dmesg::
 
 	INFO: rcu_sched detected expedited stalls on CPUs/tasks: { 7-... } 21119 jiffies s: 73 root: 0x2/.
 
diff --git a/kernel/rcu/tree_stall.h b/kernel/rcu/tree_stall.h
index ae76bd329582..b899883a4247 100644
--- a/kernel/rcu/tree_stall.h
+++ b/kernel/rcu/tree_stall.h
@@ -468,7 +468,7 @@ static void print_other_cpu_stall(unsigned long gp_seq, unsigned long gps)
 
 	/*
 	 * OK, time to rat on our buddy...
-	 * See Documentation/RCU/stallwarn.txt for info on how to debug
+	 * See Documentation/RCU/stallwarn.rst for info on how to debug
 	 * RCU CPU stall warnings.
 	 */
 	pr_err("INFO: %s detected stalls on CPUs/tasks:\n", rcu_state.name);
@@ -535,7 +535,7 @@ static void print_cpu_stall(unsigned long gps)
 
 	/*
 	 * OK, time to rat on ourselves...
-	 * See Documentation/RCU/stallwarn.txt for info on how to debug
+	 * See Documentation/RCU/stallwarn.rst for info on how to debug
 	 * RCU CPU stall warnings.
 	 */
 	pr_err("INFO: %s self-detected stall on CPU\n", rcu_state.name);
-- 
2.25.2

