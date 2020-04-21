Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3C21B2DCA
	for <lists+linux-doc@lfdr.de>; Tue, 21 Apr 2020 19:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729417AbgDURFM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 21 Apr 2020 13:05:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:33552 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726245AbgDUREO (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 21 Apr 2020 13:04:14 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D7982206F4;
        Tue, 21 Apr 2020 17:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587488654;
        bh=1As9f+rTORK6WncX9ih6bCgWTLp08ODthYTGLly3wzk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZhAuPtRy4LLDBuHvp5pC8/g4HVJSwKMEFBNEgYArsEdB46Wtj63qrI6Pg6kcGRLCc
         47M34bGAYRJbVXjZo5yvyQzvma61cBdX5LafrZi97gKP2eUBCUnVzamyxpIblzA/1G
         K+yorZztYuTC3apB3WHeXcb140SyF35/5vcbsLt0=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jQwJg-00CmLa-3F; Tue, 21 Apr 2020 19:04:12 +0200
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
Subject: [PATCH 02/10] docs: RCU: convert lockdep-splat.txt to ReST
Date:   Tue, 21 Apr 2020 19:04:03 +0200
Message-Id: <902213c34af14105930e6bc1caae8f34f2df0ef5.1587488137.git.mchehab+huawei@kernel.org>
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
- Add a document title;
- Some whitespace fixes and new line breaks;
- Mark literal blocks as such;
- Add it to RCU/index.rst.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/RCU/index.rst                   |  1 +
 .../{lockdep-splat.txt => lockdep-splat.rst}  | 99 ++++++++++---------
 2 files changed, 53 insertions(+), 47 deletions(-)
 rename Documentation/RCU/{lockdep-splat.txt => lockdep-splat.rst} (54%)

diff --git a/Documentation/RCU/index.rst b/Documentation/RCU/index.rst
index c1ba4d130bb0..430a37132b2c 100644
--- a/Documentation/RCU/index.rst
+++ b/Documentation/RCU/index.rst
@@ -11,6 +11,7 @@ RCU concepts
 
    arrayRCU
    checklist
+   lockdep-splat
    rcubarrier
    rcu_dereference
    whatisRCU
diff --git a/Documentation/RCU/lockdep-splat.txt b/Documentation/RCU/lockdep-splat.rst
similarity index 54%
rename from Documentation/RCU/lockdep-splat.txt
rename to Documentation/RCU/lockdep-splat.rst
index b8096316fd11..2a5c79db57dc 100644
--- a/Documentation/RCU/lockdep-splat.txt
+++ b/Documentation/RCU/lockdep-splat.rst
@@ -1,3 +1,9 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=================
+Lockdep-RCU Splat
+=================
+
 Lockdep-RCU was added to the Linux kernel in early 2010
 (http://lwn.net/Articles/371986/).  This facility checks for some common
 misuses of the RCU API, most notably using one of the rcu_dereference()
@@ -12,55 +18,54 @@ overwriting or worse.  There can of course be false positives, this
 being the real world and all that.
 
 So let's look at an example RCU lockdep splat from 3.0-rc5, one that
-has long since been fixed:
+has long since been fixed::
 
-=============================
-WARNING: suspicious RCU usage
------------------------------
-block/cfq-iosched.c:2776 suspicious rcu_dereference_protected() usage!
+    =============================
+    WARNING: suspicious RCU usage
+    -----------------------------
+    block/cfq-iosched.c:2776 suspicious rcu_dereference_protected() usage!
 
-other info that might help us debug this:
+other info that might help us debug this::
 
+    rcu_scheduler_active = 1, debug_locks = 0
+    3 locks held by scsi_scan_6/1552:
+    #0:  (&shost->scan_mutex){+.+.}, at: [<ffffffff8145efca>]
+    scsi_scan_host_selected+0x5a/0x150
+    #1:  (&eq->sysfs_lock){+.+.}, at: [<ffffffff812a5032>]
+    elevator_exit+0x22/0x60
+    #2:  (&(&q->__queue_lock)->rlock){-.-.}, at: [<ffffffff812b6233>]
+    cfq_exit_queue+0x43/0x190
 
-rcu_scheduler_active = 1, debug_locks = 0
-3 locks held by scsi_scan_6/1552:
- #0:  (&shost->scan_mutex){+.+.}, at: [<ffffffff8145efca>]
-scsi_scan_host_selected+0x5a/0x150
- #1:  (&eq->sysfs_lock){+.+.}, at: [<ffffffff812a5032>]
-elevator_exit+0x22/0x60
- #2:  (&(&q->__queue_lock)->rlock){-.-.}, at: [<ffffffff812b6233>]
-cfq_exit_queue+0x43/0x190
+    stack backtrace:
+    Pid: 1552, comm: scsi_scan_6 Not tainted 3.0.0-rc5 #17
+    Call Trace:
+    [<ffffffff810abb9b>] lockdep_rcu_dereference+0xbb/0xc0
+    [<ffffffff812b6139>] __cfq_exit_single_io_context+0xe9/0x120
+    [<ffffffff812b626c>] cfq_exit_queue+0x7c/0x190
+    [<ffffffff812a5046>] elevator_exit+0x36/0x60
+    [<ffffffff812a802a>] blk_cleanup_queue+0x4a/0x60
+    [<ffffffff8145cc09>] scsi_free_queue+0x9/0x10
+    [<ffffffff81460944>] __scsi_remove_device+0x84/0xd0
+    [<ffffffff8145dca3>] scsi_probe_and_add_lun+0x353/0xb10
+    [<ffffffff817da069>] ? error_exit+0x29/0xb0
+    [<ffffffff817d98ed>] ? _raw_spin_unlock_irqrestore+0x3d/0x80
+    [<ffffffff8145e722>] __scsi_scan_target+0x112/0x680
+    [<ffffffff812c690d>] ? trace_hardirqs_off_thunk+0x3a/0x3c
+    [<ffffffff817da069>] ? error_exit+0x29/0xb0
+    [<ffffffff812bcc60>] ? kobject_del+0x40/0x40
+    [<ffffffff8145ed16>] scsi_scan_channel+0x86/0xb0
+    [<ffffffff8145f0b0>] scsi_scan_host_selected+0x140/0x150
+    [<ffffffff8145f149>] do_scsi_scan_host+0x89/0x90
+    [<ffffffff8145f170>] do_scan_async+0x20/0x160
+    [<ffffffff8145f150>] ? do_scsi_scan_host+0x90/0x90
+    [<ffffffff810975b6>] kthread+0xa6/0xb0
+    [<ffffffff817db154>] kernel_thread_helper+0x4/0x10
+    [<ffffffff81066430>] ? finish_task_switch+0x80/0x110
+    [<ffffffff817d9c04>] ? retint_restore_args+0xe/0xe
+    [<ffffffff81097510>] ? __kthread_init_worker+0x70/0x70
+    [<ffffffff817db150>] ? gs_change+0xb/0xb
 
-stack backtrace:
-Pid: 1552, comm: scsi_scan_6 Not tainted 3.0.0-rc5 #17
-Call Trace:
- [<ffffffff810abb9b>] lockdep_rcu_dereference+0xbb/0xc0
- [<ffffffff812b6139>] __cfq_exit_single_io_context+0xe9/0x120
- [<ffffffff812b626c>] cfq_exit_queue+0x7c/0x190
- [<ffffffff812a5046>] elevator_exit+0x36/0x60
- [<ffffffff812a802a>] blk_cleanup_queue+0x4a/0x60
- [<ffffffff8145cc09>] scsi_free_queue+0x9/0x10
- [<ffffffff81460944>] __scsi_remove_device+0x84/0xd0
- [<ffffffff8145dca3>] scsi_probe_and_add_lun+0x353/0xb10
- [<ffffffff817da069>] ? error_exit+0x29/0xb0
- [<ffffffff817d98ed>] ? _raw_spin_unlock_irqrestore+0x3d/0x80
- [<ffffffff8145e722>] __scsi_scan_target+0x112/0x680
- [<ffffffff812c690d>] ? trace_hardirqs_off_thunk+0x3a/0x3c
- [<ffffffff817da069>] ? error_exit+0x29/0xb0
- [<ffffffff812bcc60>] ? kobject_del+0x40/0x40
- [<ffffffff8145ed16>] scsi_scan_channel+0x86/0xb0
- [<ffffffff8145f0b0>] scsi_scan_host_selected+0x140/0x150
- [<ffffffff8145f149>] do_scsi_scan_host+0x89/0x90
- [<ffffffff8145f170>] do_scan_async+0x20/0x160
- [<ffffffff8145f150>] ? do_scsi_scan_host+0x90/0x90
- [<ffffffff810975b6>] kthread+0xa6/0xb0
- [<ffffffff817db154>] kernel_thread_helper+0x4/0x10
- [<ffffffff81066430>] ? finish_task_switch+0x80/0x110
- [<ffffffff817d9c04>] ? retint_restore_args+0xe/0xe
- [<ffffffff81097510>] ? __kthread_init_worker+0x70/0x70
- [<ffffffff817db150>] ? gs_change+0xb/0xb
-
-Line 2776 of block/cfq-iosched.c in v3.0-rc5 is as follows:
+Line 2776 of block/cfq-iosched.c in v3.0-rc5 is as follows::
 
 	if (rcu_dereference(ioc->ioc_data) == cic) {
 
@@ -70,7 +75,7 @@ case.  Instead, we hold three locks, one of which might be RCU related.
 And maybe that lock really does protect this reference.  If so, the fix
 is to inform RCU, perhaps by changing __cfq_exit_single_io_context() to
 take the struct request_queue "q" from cfq_exit_queue() as an argument,
-which would permit us to invoke rcu_dereference_protected as follows:
+which would permit us to invoke rcu_dereference_protected as follows::
 
 	if (rcu_dereference_protected(ioc->ioc_data,
 				      lockdep_is_held(&q->queue_lock)) == cic) {
@@ -85,7 +90,7 @@ On the other hand, perhaps we really do need an RCU read-side critical
 section.  In this case, the critical section must span the use of the
 return value from rcu_dereference(), or at least until there is some
 reference count incremented or some such.  One way to handle this is to
-add rcu_read_lock() and rcu_read_unlock() as follows:
+add rcu_read_lock() and rcu_read_unlock() as follows::
 
 	rcu_read_lock();
 	if (rcu_dereference(ioc->ioc_data) == cic) {
@@ -102,7 +107,7 @@ above lockdep-RCU splat.
 But in this particular case, we don't actually dereference the pointer
 returned from rcu_dereference().  Instead, that pointer is just compared
 to the cic pointer, which means that the rcu_dereference() can be replaced
-by rcu_access_pointer() as follows:
+by rcu_access_pointer() as follows::
 
 	if (rcu_access_pointer(ioc->ioc_data) == cic) {
 
-- 
2.25.2

