Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 955C151C4C4
	for <lists+linux-doc@lfdr.de>; Thu,  5 May 2022 18:11:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381971AbiEEQMi (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 5 May 2022 12:12:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381867AbiEEQMP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 May 2022 12:12:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 296605C75A;
        Thu,  5 May 2022 09:08:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AB91961DCF;
        Thu,  5 May 2022 16:08:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AEE7C385B3;
        Thu,  5 May 2022 16:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651766912;
        bh=xp5szzRsyHzfmBZJ6GrNJ30mR5ggLppYgYmYnc1wD+A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Qxl6gUJ20C8kYghw2Ts+x91danrXXMHUblwGI4ksBBVoE8Zdc9mo113RDGU2RpQX/
         u4Y2mwwjgR9gde+8txiQ5e+/a4T3XdaCcZA8j0k5mnTGnQUIaQzWK1CX5QykFHQrq8
         aUHENc7tY0DAco0oIdwQoT0o2QVWg/JuGzo1/Hkb/ajhvMYLaRILQznhFeE3DzaSOX
         I5Pv7Emm5cBz8hIbDHpB79ZjiCjwCb5lJP24Dffb4V+g+D7AE6KHm7hdhel3+xiY12
         fwCgPWM/sw9Kx+CmbW4XvCYuS5ew3N+47ZfV5xXhDV7e8H7pN2OALwTf912D/9LiEM
         7s2e8jsm9+Zwg==
From:   Daniel Bristot de Oliveira <bristot@kernel.org>
To:     Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org
Cc:     Daniel Bristot de Oliveira <bristot@kernel.org>,
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
        linux-doc@vger.kernel.org, linux-trace-devel@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [RFC V3 17/20] watchdog/dev: Add tracepoints
Date:   Thu,  5 May 2022 18:06:57 +0200
Message-Id: <819c29aea60e266894dd25e7838c504c93e7a8bb.1651766361.git.bristot@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1651766361.git.bristot@kernel.org>
References: <cover.1651766361.git.bristot@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a set of tracepoints, enabling the observability of the watchdog
device interactions with user-space.

The events are:
	watchdog:watchdog_open
	watchdog:watchdog_close
	watchdog:watchdog_start
	watchdog:watchdog_stop
	watchdog:watchdog_set_timeout
	watchdog:watchdog_ping
	watchdog:watchdog_nowayout
	watchdog:watchdog_set_keep_alive
	watchdog:watchdog_keep_alive
	watchdog:watchdog_set_pretimeout
	watchdog:watchdog_pretimeout

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
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-trace-devel@vger.kernel.org
Signed-off-by: Daniel Bristot de Oliveira <bristot@kernel.org>
---
 drivers/watchdog/watchdog_dev.c        |  43 ++++++++++-
 drivers/watchdog/watchdog_pretimeout.c |   2 +
 include/linux/watchdog.h               |   7 +-
 include/trace/events/watchdog.h        | 101 +++++++++++++++++++++++++
 4 files changed, 143 insertions(+), 10 deletions(-)
 create mode 100644 include/trace/events/watchdog.h

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 54903f3c851e..2f28dc5ab763 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -44,6 +44,9 @@
 #include <linux/watchdog.h>	/* For watchdog specific items */
 #include <linux/uaccess.h>	/* For copy_to_user/put_user/... */
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/watchdog.h>
+
 #include "watchdog_core.h"
 #include "watchdog_pretimeout.h"
 
@@ -130,9 +133,11 @@ static inline void watchdog_update_worker(struct watchdog_device *wdd)
 	if (watchdog_need_worker(wdd)) {
 		ktime_t t = watchdog_next_keepalive(wdd);
 
-		if (t > 0)
+		if (t > 0) {
 			hrtimer_start(&wd_data->timer, t,
 				      HRTIMER_MODE_REL_HARD);
+			trace_watchdog_set_keep_alive(wdd, ktime_to_ms(t));
+		}
 	} else {
 		hrtimer_cancel(&wd_data->timer);
 	}
@@ -141,7 +146,7 @@ static inline void watchdog_update_worker(struct watchdog_device *wdd)
 static int __watchdog_ping(struct watchdog_device *wdd)
 {
 	struct watchdog_core_data *wd_data = wdd->wd_data;
-	ktime_t earliest_keepalive, now;
+	ktime_t earliest_keepalive, now, next_keepalive;
 	int err;
 
 	earliest_keepalive = ktime_add(wd_data->last_hw_keepalive,
@@ -149,14 +154,16 @@ static int __watchdog_ping(struct watchdog_device *wdd)
 	now = ktime_get();
 
 	if (ktime_after(earliest_keepalive, now)) {
-		hrtimer_start(&wd_data->timer,
-			      ktime_sub(earliest_keepalive, now),
+		next_keepalive = ktime_sub(earliest_keepalive, now);
+		hrtimer_start(&wd_data->timer, next_keepalive,
 			      HRTIMER_MODE_REL_HARD);
+		trace_watchdog_set_keep_alive(wdd, ktime_to_ms(next_keepalive));
 		return 0;
 	}
 
 	wd_data->last_hw_keepalive = now;
 
+	trace_watchdog_ping(wdd);
 	if (wdd->ops->ping)
 		err = wdd->ops->ping(wdd);  /* ping the watchdog */
 	else
@@ -215,6 +222,7 @@ static void watchdog_ping_work(struct kthread_work *work)
 	wd_data = container_of(work, struct watchdog_core_data, work);
 
 	mutex_lock(&wd_data->lock);
+	trace_watchdog_keep_alive(wd_data->wdd);
 	if (watchdog_worker_should_ping(wd_data))
 		__watchdog_ping(wd_data->wdd);
 	mutex_unlock(&wd_data->lock);
@@ -250,6 +258,8 @@ static int watchdog_start(struct watchdog_device *wdd)
 
 	set_bit(_WDOG_KEEPALIVE, &wd_data->status);
 
+	trace_watchdog_start(wdd);
+
 	started_at = ktime_get();
 	if (watchdog_hw_running(wdd) && wdd->ops->ping) {
 		err = __watchdog_ping(wdd);
@@ -294,6 +304,7 @@ static int watchdog_stop(struct watchdog_device *wdd)
 		return -EBUSY;
 	}
 
+	trace_watchdog_stop(wdd);
 	if (wdd->ops->stop) {
 		clear_bit(WDOG_HW_RUNNING, &wdd->status);
 		err = wdd->ops->stop(wdd);
@@ -367,6 +378,7 @@ static int watchdog_set_timeout(struct watchdog_device *wdd,
 	if (watchdog_timeout_invalid(wdd, timeout))
 		return -EINVAL;
 
+	trace_watchdog_set_timeout(wdd, timeout);
 	if (wdd->ops->set_timeout) {
 		err = wdd->ops->set_timeout(wdd, timeout);
 	} else {
@@ -399,6 +411,8 @@ static int watchdog_set_pretimeout(struct watchdog_device *wdd,
 	if (watchdog_pretimeout_invalid(wdd, timeout))
 		return -EINVAL;
 
+	trace_watchdog_set_pretimeout(wdd, timeout);
+
 	if (wdd->ops->set_pretimeout && (wdd->info->options & WDIOF_PRETIMEOUT))
 		err = wdd->ops->set_pretimeout(wdd, timeout);
 	else
@@ -430,6 +444,23 @@ static int watchdog_get_timeleft(struct watchdog_device *wdd,
 	return 0;
 }
 
+/**
+ * watchdog_set_nowayout - set nowaout bit
+ * @wdd:	The watchdog device to set nowayoutbit
+ * @nowayout	A boolean on/off switcher
+ *
+ * If nowayout boolean is true, the nowayout option is set. No action is
+ * taken if nowayout is false.
+ */
+void watchdog_set_nowayout(struct watchdog_device *wdd, bool nowayout)
+{
+	if (nowayout) {
+		set_bit(WDOG_NO_WAY_OUT, &wdd->status);
+		trace_watchdog_nowayout(wdd);
+	}
+}
+EXPORT_SYMBOL(watchdog_set_nowayout);
+
 #ifdef CONFIG_WATCHDOG_SYSFS
 static ssize_t nowayout_show(struct device *dev, struct device_attribute *attr,
 				char *buf)
@@ -861,6 +892,8 @@ static int watchdog_open(struct inode *inode, struct file *file)
 		goto out_clear;
 	}
 
+	trace_watchdog_open(wdd);
+
 	err = watchdog_start(wdd);
 	if (err < 0)
 		goto out_mod;
@@ -883,6 +916,7 @@ static int watchdog_open(struct inode *inode, struct file *file)
 	return stream_open(inode, file);
 
 out_mod:
+	trace_watchdog_close(wdd);
 	module_put(wd_data->wdd->ops->owner);
 out_clear:
 	clear_bit(_WDOG_DEV_OPEN, &wd_data->status);
@@ -944,6 +978,7 @@ static int watchdog_release(struct inode *inode, struct file *file)
 	/* make sure that /dev/watchdog can be re-opened */
 	clear_bit(_WDOG_DEV_OPEN, &wd_data->status);
 
+	trace_watchdog_close(wdd);
 done:
 	running = wdd && watchdog_hw_running(wdd);
 	mutex_unlock(&wd_data->lock);
diff --git a/drivers/watchdog/watchdog_pretimeout.c b/drivers/watchdog/watchdog_pretimeout.c
index 376a495ab80c..58c391ed2205 100644
--- a/drivers/watchdog/watchdog_pretimeout.c
+++ b/drivers/watchdog/watchdog_pretimeout.c
@@ -8,6 +8,7 @@
 #include <linux/spinlock.h>
 #include <linux/string.h>
 #include <linux/watchdog.h>
+#include <trace/events/watchdog.h>
 
 #include "watchdog_core.h"
 #include "watchdog_pretimeout.h"
@@ -107,6 +108,7 @@ void watchdog_notify_pretimeout(struct watchdog_device *wdd)
 		return;
 	}
 
+	trace_watchdog_pretimeout(wdd);
 	wdd->gov->pretimeout(wdd);
 	spin_unlock_irqrestore(&pretimeout_lock, flags);
 }
diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
index 99660197a36c..11d93407e492 100644
--- a/include/linux/watchdog.h
+++ b/include/linux/watchdog.h
@@ -139,12 +139,7 @@ static inline bool watchdog_hw_running(struct watchdog_device *wdd)
 	return test_bit(WDOG_HW_RUNNING, &wdd->status);
 }
 
-/* Use the following function to set the nowayout feature */
-static inline void watchdog_set_nowayout(struct watchdog_device *wdd, bool nowayout)
-{
-	if (nowayout)
-		set_bit(WDOG_NO_WAY_OUT, &wdd->status);
-}
+void watchdog_set_nowayout(struct watchdog_device *wdd, bool nowayout);
 
 /* Use the following function to stop the watchdog on reboot */
 static inline void watchdog_stop_on_reboot(struct watchdog_device *wdd)
diff --git a/include/trace/events/watchdog.h b/include/trace/events/watchdog.h
new file mode 100644
index 000000000000..145cd6cfaa02
--- /dev/null
+++ b/include/trace/events/watchdog.h
@@ -0,0 +1,101 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM watchdog
+
+#if !defined(_TRACE_WATCHDOG_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_WATCHDOG_H
+
+#include <linux/tracepoint.h>
+
+/*
+ * These are all events whose sole argument is the watchdog id.
+ */
+DECLARE_EVENT_CLASS(dev_operations_template,
+
+	TP_PROTO(struct watchdog_device *wdd),
+
+	TP_ARGS(wdd),
+
+	TP_STRUCT__entry(
+		__field(__u32, id)
+	),
+
+	TP_fast_assign(
+		__entry->id = wdd->id;
+	),
+
+	TP_printk("id=%d",
+		  __entry->id)
+);
+
+DEFINE_EVENT(dev_operations_template, watchdog_open,
+	     TP_PROTO(struct watchdog_device *wdd),
+	     TP_ARGS(wdd));
+
+DEFINE_EVENT(dev_operations_template, watchdog_close,
+	     TP_PROTO(struct watchdog_device *wdd),
+	     TP_ARGS(wdd));
+
+DEFINE_EVENT(dev_operations_template, watchdog_start,
+	     TP_PROTO(struct watchdog_device *wdd),
+	     TP_ARGS(wdd));
+
+DEFINE_EVENT(dev_operations_template, watchdog_stop,
+	     TP_PROTO(struct watchdog_device *wdd),
+	     TP_ARGS(wdd));
+
+DEFINE_EVENT(dev_operations_template, watchdog_ping,
+	     TP_PROTO(struct watchdog_device *wdd),
+	     TP_ARGS(wdd));
+
+DEFINE_EVENT(dev_operations_template, watchdog_nowayout,
+	     TP_PROTO(struct watchdog_device *wdd),
+	     TP_ARGS(wdd));
+
+DEFINE_EVENT(dev_operations_template, watchdog_keep_alive,
+	     TP_PROTO(struct watchdog_device *wdd),
+	     TP_ARGS(wdd));
+
+DEFINE_EVENT(dev_operations_template, watchdog_pretimeout,
+	     TP_PROTO(struct watchdog_device *wdd),
+	     TP_ARGS(wdd));
+
+/*
+ * These are all events with a device ID and a given timeout.
+ */
+DECLARE_EVENT_CLASS(watchdog_timeout_template,
+
+	TP_PROTO(struct watchdog_device *wdd, u64 timeout),
+
+	TP_ARGS(wdd, timeout),
+
+	TP_STRUCT__entry(
+		__field(__u32, id)
+		__field(__u64, timeout)
+	),
+
+	TP_fast_assign(
+		__entry->id		= wdd->id;
+		__entry->timeout	= timeout;
+	),
+
+	TP_printk("id=%d timeout=%llus",
+		  __entry->id, __entry->timeout)
+);
+
+DEFINE_EVENT(watchdog_timeout_template, watchdog_set_timeout,
+	     TP_PROTO(struct watchdog_device *wdd, u64 timeout),
+	     TP_ARGS(wdd, timeout));
+
+DEFINE_EVENT(watchdog_timeout_template, watchdog_set_pretimeout,
+	     TP_PROTO(struct watchdog_device *wdd, u64 timeout),
+	     TP_ARGS(wdd, timeout));
+
+DEFINE_EVENT(watchdog_timeout_template, watchdog_set_keep_alive,
+	     TP_PROTO(struct watchdog_device *wdd, u64 timeout),
+	     TP_ARGS(wdd, timeout));
+
+#endif /* _TRACE_WATCHDOG_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
-- 
2.35.1

