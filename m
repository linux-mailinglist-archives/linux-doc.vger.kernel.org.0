Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB87A442A41
	for <lists+linux-doc@lfdr.de>; Tue,  2 Nov 2021 10:20:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbhKBJWe (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 2 Nov 2021 05:22:34 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:52702 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbhKBJWe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Nov 2021 05:22:34 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id F41AD1FD75;
        Tue,  2 Nov 2021 09:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1635844799; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=6Lc7Goygk5VwSWDn5qxlt2rJEPVKdXkQNXP9nghaPrU=;
        b=btySieH8OaU+6gORF4X44B5hnvB+XnszYnE8YsP3dCXgxJTajhML2MeWp3Kfg3CRs1iedR
        jKsl9tN0xl1e6UGW81USzJlUmElu99Ddsw4ZuOq0dV8oUwTOPdHGmRQ3B4Eg7225I9BbJQ
        iUum4rbjB/BlTmt/T9kCRwMjKiiKJTM=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B316213BAA;
        Tue,  2 Nov 2021 09:19:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id IihJKr4CgWG2fgAAMHmgww
        (envelope-from <jgross@suse.com>); Tue, 02 Nov 2021 09:19:58 +0000
From:   Juergen Gross <jgross@suse.com>
To:     xen-devel@lists.xenproject.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Juergen Gross <jgross@suse.com>, Jonathan Corbet <corbet@lwn.net>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        stable@vger.kernel.org,
        =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= 
        <marmarek@invisiblethingslab.com>
Subject: [PATCH v4] xen/balloon: add late_initcall_sync() for initial ballooning done
Date:   Tue,  2 Nov 2021 10:19:44 +0100
Message-Id: <20211102091944.17487-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When running as PVH or HVM guest with actual memory < max memory the
hypervisor is using "populate on demand" in order to allow the guest
to balloon down from its maximum memory size. For this to work
correctly the guest must not touch more memory pages than its target
memory size as otherwise the PoD cache will be exhausted and the guest
is crashed as a result of that.

In extreme cases ballooning down might not be finished today before
the init process is started, which can consume lots of memory.

In order to avoid random boot crashes in such cases, add a late init
call to wait for ballooning down having finished for PVH/HVM guests.

Warn on console if initial ballooning fails, panic() after stalling
for more than 3 minutes per default. Add a module parameter for
changing this timeout.

Cc: <stable@vger.kernel.org>
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- add warning and panic() when stalling (Marek Marczykowski-Górecki)
- don't wait if credit > 0
V3:
- issue warning only after ballooning failed (Marek Marczykowski-Górecki)
- make panic() timeout configurable via parameter
V4:
- fix boot parameter (Boris Ostrovsky)
- set new state directly in update_schedule() (Boris Ostrovsky)
---
 .../admin-guide/kernel-parameters.txt         |  7 ++
 drivers/xen/balloon.c                         | 86 ++++++++++++++-----
 2 files changed, 70 insertions(+), 23 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 43dc35fe5bc0..1396fd2d9031 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6349,6 +6349,13 @@
 			improve timer resolution at the expense of processing
 			more timer interrupts.
 
+	xen.balloon_boot_timeout= [XEN]
+			The time (in seconds) to wait before giving up to boot
+			in case initial ballooning fails to free enough memory.
+			Applies only when running as HVM or PVH guest and
+			started with less memory configured than allowed at
+			max. Default is 180.
+
 	xen.event_eoi_delay=	[XEN]
 			How long to delay EOI handling in case of event
 			storms (jiffies). Default is 10.
diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 3a50f097ed3e..3a661b7697d4 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -58,6 +58,7 @@
 #include <linux/percpu-defs.h>
 #include <linux/slab.h>
 #include <linux/sysctl.h>
+#include <linux/moduleparam.h>
 
 #include <asm/page.h>
 #include <asm/tlb.h>
@@ -73,6 +74,12 @@
 #include <xen/page.h>
 #include <xen/mem-reservation.h>
 
+#undef MODULE_PARAM_PREFIX
+#define MODULE_PARAM_PREFIX "xen."
+
+static uint __read_mostly balloon_boot_timeout = 180;
+module_param(balloon_boot_timeout, uint, 0444);
+
 static int xen_hotplug_unpopulated;
 
 #ifdef CONFIG_XEN_BALLOON_MEMORY_HOTPLUG
@@ -125,12 +132,12 @@ static struct ctl_table xen_root[] = {
  * BP_ECANCELED: error, balloon operation canceled.
  */
 
-enum bp_state {
+static enum bp_state {
 	BP_DONE,
 	BP_WAIT,
 	BP_EAGAIN,
 	BP_ECANCELED
-};
+} balloon_state = BP_DONE;
 
 /* Main waiting point for xen-balloon thread. */
 static DECLARE_WAIT_QUEUE_HEAD(balloon_thread_wq);
@@ -199,18 +206,15 @@ static struct page *balloon_next_page(struct page *page)
 	return list_entry(next, struct page, lru);
 }
 
-static enum bp_state update_schedule(enum bp_state state)
+static void update_schedule(void)
 {
-	if (state == BP_WAIT)
-		return BP_WAIT;
-
-	if (state == BP_ECANCELED)
-		return BP_ECANCELED;
+	if (balloon_state == BP_WAIT || balloon_state == BP_ECANCELED)
+		return;
 
-	if (state == BP_DONE) {
+	if (balloon_state == BP_DONE) {
 		balloon_stats.schedule_delay = 1;
 		balloon_stats.retry_count = 1;
-		return BP_DONE;
+		return;
 	}
 
 	++balloon_stats.retry_count;
@@ -219,7 +223,8 @@ static enum bp_state update_schedule(enum bp_state state)
 			balloon_stats.retry_count > balloon_stats.max_retry_count) {
 		balloon_stats.schedule_delay = 1;
 		balloon_stats.retry_count = 1;
-		return BP_ECANCELED;
+		balloon_state = BP_ECANCELED;
+		return;
 	}
 
 	balloon_stats.schedule_delay <<= 1;
@@ -227,7 +232,7 @@ static enum bp_state update_schedule(enum bp_state state)
 	if (balloon_stats.schedule_delay > balloon_stats.max_schedule_delay)
 		balloon_stats.schedule_delay = balloon_stats.max_schedule_delay;
 
-	return BP_EAGAIN;
+	balloon_state = BP_EAGAIN;
 }
 
 #ifdef CONFIG_XEN_BALLOON_MEMORY_HOTPLUG
@@ -494,9 +499,9 @@ static enum bp_state decrease_reservation(unsigned long nr_pages, gfp_t gfp)
  * Stop waiting if either state is BP_DONE and ballooning action is
  * needed, or if the credit has changed while state is not BP_DONE.
  */
-static bool balloon_thread_cond(enum bp_state state, long credit)
+static bool balloon_thread_cond(long credit)
 {
-	if (state == BP_DONE)
+	if (balloon_state == BP_DONE)
 		credit = 0;
 
 	return current_credit() != credit || kthread_should_stop();
@@ -510,13 +515,12 @@ static bool balloon_thread_cond(enum bp_state state, long credit)
  */
 static int balloon_thread(void *unused)
 {
-	enum bp_state state = BP_DONE;
 	long credit;
 	unsigned long timeout;
 
 	set_freezable();
 	for (;;) {
-		switch (state) {
+		switch (balloon_state) {
 		case BP_DONE:
 		case BP_ECANCELED:
 			timeout = 3600 * HZ;
@@ -532,7 +536,7 @@ static int balloon_thread(void *unused)
 		credit = current_credit();
 
 		wait_event_freezable_timeout(balloon_thread_wq,
-			balloon_thread_cond(state, credit), timeout);
+			balloon_thread_cond(credit), timeout);
 
 		if (kthread_should_stop())
 			return 0;
@@ -543,22 +547,23 @@ static int balloon_thread(void *unused)
 
 		if (credit > 0) {
 			if (balloon_is_inflated())
-				state = increase_reservation(credit);
+				balloon_state = increase_reservation(credit);
 			else
-				state = reserve_additional_memory();
+				balloon_state = reserve_additional_memory();
 		}
 
 		if (credit < 0) {
 			long n_pages;
 
 			n_pages = min(-credit, si_mem_available());
-			state = decrease_reservation(n_pages, GFP_BALLOON);
-			if (state == BP_DONE && n_pages != -credit &&
+			balloon_state = decrease_reservation(n_pages,
+							     GFP_BALLOON);
+			if (balloon_state == BP_DONE && n_pages != -credit &&
 			    n_pages < totalreserve_pages)
-				state = BP_EAGAIN;
+				balloon_state = BP_EAGAIN;
 		}
 
-		state = update_schedule(state);
+		update_schedule();
 
 		mutex_unlock(&balloon_mutex);
 
@@ -765,3 +770,38 @@ static int __init balloon_init(void)
 	return 0;
 }
 subsys_initcall(balloon_init);
+
+static int __init balloon_wait_finish(void)
+{
+	long credit, last_credit = 0;
+	unsigned long last_changed = 0;
+
+	if (!xen_domain())
+		return -ENODEV;
+
+	/* PV guests don't need to wait. */
+	if (xen_pv_domain() || !current_credit())
+		return 0;
+
+	pr_info("Waiting for initial ballooning down having finished.\n");
+
+	while ((credit = current_credit()) < 0) {
+		if (credit != last_credit) {
+			last_changed = jiffies;
+			last_credit = credit;
+		}
+		if (balloon_state == BP_ECANCELED) {
+			pr_warn_once("Initial ballooning failed, %ld pages need to be freed.\n",
+				     -credit);
+			if (jiffies - last_changed >= HZ * balloon_boot_timeout)
+				panic("Initial ballooning failed!\n");
+		}
+
+		schedule_timeout_interruptible(HZ / 10);
+	}
+
+	pr_info("Initial ballooning down finished.\n");
+
+	return 0;
+}
+late_initcall_sync(balloon_wait_finish);
-- 
2.26.2

