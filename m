Return-Path: <linux-doc+bounces-33443-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 141E29F8F03
	for <lists+linux-doc@lfdr.de>; Fri, 20 Dec 2024 10:32:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4FDE18971FA
	for <lists+linux-doc@lfdr.de>; Fri, 20 Dec 2024 09:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80AE81A726B;
	Fri, 20 Dec 2024 09:31:59 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F741BBBE5;
	Fri, 20 Dec 2024 09:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=58.251.27.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734687119; cv=none; b=RIsp8/vhjSOoIm1VdGE+TefP41/o7pSMikVqbRWCjf7S2GUEoDFg0X86AzOzcoVTJ1iTIfp7wSg2iRib7DVAsA/CC98B9xdSp6pPhQaOcKn+8sDhGpLSsOhiu1aqoNWiXvPJRiMY+4AF8VuwNsNkM4io/857dxEdqri0aaxcWaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734687119; c=relaxed/simple;
	bh=hSXa+57MoY/hj0RxqjRa1r+1Bqp2Qx0V1pE3FJG51LQ=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=Ry8OeYYATHGbrdn80PSxwfiS21kii3ul/HbMv6jMkPyQOhUHcl4m1hnhCHlHA1+IpQNMWFslZPb/9GvxYlUfW6VrdFmal+GCQulWtonh+QV3WTjzGo6afZDlpaaiOrjZy7M8cEPs6n1qvFzLt/Oiyd/NE6Rk269YADpv6OeFzaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=58.251.27.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mxde.zte.com.cn (unknown [10.35.20.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4YF2HM6ZX3zKhc;
	Fri, 20 Dec 2024 17:31:43 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.137])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxde.zte.com.cn (FangMail) with ESMTPS id 4YF2HG2KgNz4xD27;
	Fri, 20 Dec 2024 17:31:38 +0800 (CST)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4YF2H13rNSz8R048;
	Fri, 20 Dec 2024 17:31:25 +0800 (CST)
Received: from njb2app06.zte.com.cn ([10.55.23.119])
	by mse-fl1.zte.com.cn with SMTP id 4BK9V2Nh029976;
	Fri, 20 Dec 2024 17:31:02 +0800 (+08)
	(envelope-from jiang.kun2@zte.com.cn)
Received: from mapi (njy2app01[null])
	by mapi (Zmail) with MAPI id mid204;
	Fri, 20 Dec 2024 17:31:05 +0800 (CST)
Date: Fri, 20 Dec 2024 17:31:05 +0800 (CST)
X-Zmail-TransId: 2af967653959181-65e78
X-Mailer: Zmail v1.0
Message-ID: <20241220173105906EOdsPhzjMLYNJJBqgz1ga@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <jiang.kun2@zte.com.cn>
To: <bsingharora@gmail.com>, <akpm@linux-foundation.org>, <david@redhat.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
        <linux-doc@vger.kernel.org>, <wang.yong12@zte.com.cn>,
        <wang.yaxin@zte.com.cn>, <fan.yu9@zte.com.cn>, <he.peilin@zte.com.cn>,
        <tu.qiang35@zte.com.cn>, <qiu.yutan@zte.com.cn>,
        <zhang.yunkai@zte.com.cn>, <ye.xingchen@zte.com.cn>,
        <xu.xin16@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4IG5leHRdIGRlbGF5YWNjdDogYWRkIGRlbGF5IG1pbiB0byByZWNvcmQgZGVsYXkgcGVhaw==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 4BK9V2Nh029976
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6765397E.000/4YF2HM6ZX3zKhc

From: Wang Yaxin <wang.yaxin@zte.com.cn>

Delay accounting can now calculate the average delay of processes,
detect the overall system load, and also record the 'delay max' to
identify potential abnormal delays. However, 'delay min' can help
us identify another useful delay peak. By comparing the difference
between 'delay max' and 'delay min', we can understand the optimization
space for latency, providing a reference for the optimization of
latency performance.

Use case
=========
bash-4.4# ./getdelays -d -t 242
print delayacct stats ON
TGID    242
CPU         count     real total  virtual total    delay total  delay average      delay max      delay min
               39      156000000      156576579        2111069          0.054ms     0.212296ms     0.031307ms
IO          count    delay total  delay average      delay max      delay min
                0              0          0.000ms     0.000000ms     0.000000ms
SWAP        count    delay total  delay average      delay max      delay min
                0              0          0.000ms     0.000000ms     0.000000ms
RECLAIM     count    delay total  delay average      delay max      delay min
                0              0          0.000ms     0.000000ms     0.000000ms
THRASHING   count    delay total  delay average      delay max      delay min
                0              0          0.000ms     0.000000ms     0.000000ms
COMPACT     count    delay total  delay average      delay max      delay min
                0              0          0.000ms     0.000000ms     0.000000ms
WPCOPY      count    delay total  delay average      delay max      delay min
              156       11215873          0.072ms     0.207403ms     0.033913ms
IRQ         count    delay total  delay average      delay max      delay min
                0              0          0.000ms     0.000000ms     0.000000ms

Co-developed-by: Wang Yong <wang.yong12@zte.com.cn>
Signed-off-by: Wang Yong <wang.yong12@zte.com.cn>
Co-developed-by: xu xin <xu.xin16@zte.com.cn>
Signed-off-by: xu xin <xu.xin16@zte.com.cn>
Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>
Co-developed-by: Kun Jiang <jiang.kun2@zte.com.cn>
Signed-off-by: Kun Jiang <jiang.kun2@zte.com.cn>
---
 Documentation/accounting/delay-accounting.rst | 32 +++++++-------
 include/linux/delayacct.h                     |  7 ++++
 include/linux/sched.h                         |  3 ++
 include/uapi/linux/taskstats.h                |  8 ++++
 kernel/delayacct.c                            | 32 ++++++++++----
 kernel/sched/stats.h                          |  4 ++
 tools/accounting/getdelays.c                  | 42 +++++++++++--------
 7 files changed, 88 insertions(+), 40 deletions(-)

diff --git a/Documentation/accounting/delay-accounting.rst b/Documentation/accounting/delay-accounting.rst
index 8a0277428ccf..210c194d4a7b 100644
--- a/Documentation/accounting/delay-accounting.rst
+++ b/Documentation/accounting/delay-accounting.rst
@@ -107,22 +107,22 @@ Get sum and peak of delays, since system boot, for all pids with tgid 242::
 	TGID    242


-	CPU         count     real total  virtual total    delay total  delay average      delay max
-	              239      296000000      307724885        1127792          0.005ms     0.238382ms
-	IO          count    delay total  delay average      delay max
-	                0              0          0.000ms     0.000000ms
-	SWAP        count    delay total  delay average      delay max
-	                0              0          0.000ms     0.000000ms
-	RECLAIM     count    delay total  delay average      delay max
-	                0              0          0.000ms     0.000000ms
-	THRASHING   count    delay total  delay average      delay max
-	                0              0          0.000ms     0.000000ms
-	COMPACT     count    delay total  delay average      delay max
-	                0              0          0.000ms     0.000000ms
-	WPCOPY      count    delay total  delay average      delay max
-	              230       19100476          0.083ms     0.383822ms
-	IRQ         count    delay total  delay average      delay max
-	                0              0          0.000ms     0.000000ms
+	CPU         count     real total  virtual total    delay total  delay average      delay max      delay min
+	               39      156000000      156576579        2111069          0.054ms     0.212296ms     0.031307ms
+	IO          count    delay total  delay average      delay max      delay min
+	                0              0          0.000ms     0.000000ms     0.000000ms
+	SWAP        count    delay total  delay average      delay max      delay min
+	                0              0          0.000ms     0.000000ms     0.000000ms
+	RECLAIM     count    delay total  delay average      delay max      delay min
+	                0              0          0.000ms     0.000000ms     0.000000ms
+	THRASHING   count    delay total  delay average      delay max      delay min
+	                0              0          0.000ms     0.000000ms     0.000000ms
+	COMPACT     count    delay total  delay average      delay max      delay min
+	                0              0          0.000ms     0.000000ms     0.000000ms
+	WPCOPY      count    delay total  delay average      delay max      delay min
+	              156       11215873          0.072ms     0.207403ms     0.033913ms
+	IRQ         count    delay total  delay average      delay max      delay min
+	                0              0          0.000ms     0.000000ms     0.000000ms

 Get IO accounting for pid 1, it works only with -p::

diff --git a/include/linux/delayacct.h b/include/linux/delayacct.h
index 56fbfa2c2ac5..800dcc360db2 100644
--- a/include/linux/delayacct.h
+++ b/include/linux/delayacct.h
@@ -30,9 +30,11 @@ struct task_delay_info {
 	 */
 	u64 blkio_start;
 	u64 blkio_delay_max;
+	u64 blkio_delay_min;
 	u64 blkio_delay;	/* wait for sync block io completion */
 	u64 swapin_start;
 	u64 swapin_delay_max;
+	u64 swapin_delay_min;
 	u64 swapin_delay;	/* wait for swapin */
 	u32 blkio_count;	/* total count of the number of sync block */
 				/* io operations performed */
@@ -40,21 +42,26 @@ struct task_delay_info {

 	u64 freepages_start;
 	u64 freepages_delay_max;
+	u64 freepages_delay_min;
 	u64 freepages_delay;	/* wait for memory reclaim */

 	u64 thrashing_start;
 	u64 thrashing_delay_max;
+	u64 thrashing_delay_min;
 	u64 thrashing_delay;	/* wait for thrashing page */

 	u64 compact_start;
 	u64 compact_delay_max;
+	u64 compact_delay_min;
 	u64 compact_delay;	/* wait for memory compact */

 	u64 wpcopy_start;
 	u64 wpcopy_delay_max;
+	u64 wpcopy_delay_min;
 	u64 wpcopy_delay;	/* wait for write-protect copy */

 	u64 irq_delay_max;
+	u64 irq_delay_min;
 	u64 irq_delay;	/* wait for IRQ/SOFTIRQ */

 	u32 freepages_count;	/* total count of memory reclaim */
diff --git a/include/linux/sched.h b/include/linux/sched.h
index c70cbdc72950..2f1edc6623ca 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -401,6 +401,9 @@ struct sched_info {
 	/* Max time spent waiting on a runqueue: */
 	unsigned long long		max_run_delay;

+	/* Min time spent waiting on a runqueue: */
+	unsigned long long		min_run_delay;
+
 	/* Timestamps: */

 	/* When did we last run on a CPU? */
diff --git a/include/uapi/linux/taskstats.h b/include/uapi/linux/taskstats.h
index e0d1c6fc9f3b..934e20ef7f79 100644
--- a/include/uapi/linux/taskstats.h
+++ b/include/uapi/linux/taskstats.h
@@ -73,6 +73,7 @@ struct taskstats {
 	__u64	cpu_count __attribute__((aligned(8)));
 	__u64	cpu_delay_total;
 	__u64	cpu_delay_max;
+	__u64	cpu_delay_min;

 	/* Following four fields atomically updated using task->delays->lock */

@@ -82,11 +83,13 @@ struct taskstats {
 	__u64	blkio_count;
 	__u64	blkio_delay_total;
 	__u64	blkio_delay_max;
+	__u64	blkio_delay_min;

 	/* Delay waiting for page fault I/O (swap in only) */
 	__u64	swapin_count;
 	__u64	swapin_delay_total;
 	__u64	swapin_delay_max;
+	__u64	swapin_delay_min;

 	/* cpu "wall-clock" running time
 	 * On some architectures, value will adjust for cpu time stolen
@@ -170,11 +173,13 @@ struct taskstats {
 	__u64	freepages_count;
 	__u64	freepages_delay_total;
 	__u64	freepages_delay_max;
+	__u64	freepages_delay_min;

 	/* Delay waiting for thrashing page */
 	__u64	thrashing_count;
 	__u64	thrashing_delay_total;
 	__u64	thrashing_delay_max;
+	__u64	thrashing_delay_min;

 	/* v10: 64-bit btime to avoid overflow */
 	__u64	ac_btime64;		/* 64-bit begin time */
@@ -183,6 +188,7 @@ struct taskstats {
 	__u64	compact_count;
 	__u64	compact_delay_total;
 	__u64	compact_delay_max;
+	__u64	compact_delay_min;

 	/* v12 begin */
 	__u32   ac_tgid;	/* thread group ID */
@@ -205,11 +211,13 @@ struct taskstats {
 	__u64    wpcopy_count;
 	__u64    wpcopy_delay_total;
 	__u64    wpcopy_delay_max;
+	__u64    wpcopy_delay_min;

 	/* v14: Delay waiting for IRQ/SOFTIRQ */
 	__u64    irq_count;
 	__u64    irq_delay_total;
 	__u64    irq_delay_max;
+	__u64    irq_delay_min;
 	/* v15: add Delay max */
 };

diff --git a/kernel/delayacct.c b/kernel/delayacct.c
index 23212a0c88e4..b238eb8c6573 100644
--- a/kernel/delayacct.c
+++ b/kernel/delayacct.c
@@ -95,7 +95,7 @@ void __delayacct_tsk_init(struct task_struct *tsk)
  * Finish delay accounting for a statistic using its timestamps (@start),
  * accumulator (@total) and @count
  */
-static void delayacct_end(raw_spinlock_t *lock, u64 *start, u64 *total, u32 *count, u64 *max)
+static void delayacct_end(raw_spinlock_t *lock, u64 *start, u64 *total, u32 *count, u64 *max, u64 *min)
 {
 	s64 ns = local_clock() - *start;
 	unsigned long flags;
@@ -106,6 +106,8 @@ static void delayacct_end(raw_spinlock_t *lock, u64 *start, u64 *total, u32 *cou
 		(*count)++;
 		if (ns > *max)
 			*max = ns;
+		if (*min == 0 || ns < *min)
+			*min = ns;
 		raw_spin_unlock_irqrestore(lock, flags);
 	}
 }
@@ -125,7 +127,8 @@ void __delayacct_blkio_end(struct task_struct *p)
 		      &p->delays->blkio_start,
 		      &p->delays->blkio_delay,
 		      &p->delays->blkio_count,
-		      &p->delays->blkio_delay_max);
+		      &p->delays->blkio_delay_max,
+		      &p->delays->blkio_delay_min);
 }

 int delayacct_add_tsk(struct taskstats *d, struct task_struct *tsk)
@@ -157,6 +160,7 @@ int delayacct_add_tsk(struct taskstats *d, struct task_struct *tsk)
 	d->cpu_count += t1;

 	d->cpu_delay_max = tsk->sched_info.max_run_delay;
+	d->cpu_delay_min = tsk->sched_info.min_run_delay;
 	tmp = (s64)d->cpu_delay_total + t2;
 	d->cpu_delay_total = (tmp < (s64)d->cpu_delay_total) ? 0 : tmp;
 	tmp = (s64)d->cpu_run_virtual_total + t3;
@@ -170,24 +174,31 @@ int delayacct_add_tsk(struct taskstats *d, struct task_struct *tsk)
 	/* zero XXX_total, non-zero XXX_count implies XXX stat overflowed */
 	raw_spin_lock_irqsave(&tsk->delays->lock, flags);
 	d->blkio_delay_max = tsk->delays->blkio_delay_max;
+	d->blkio_delay_min = tsk->delays->blkio_delay_min;
 	tmp = d->blkio_delay_total + tsk->delays->blkio_delay;
 	d->blkio_delay_total = (tmp < d->blkio_delay_total) ? 0 : tmp;
 	d->swapin_delay_max = tsk->delays->swapin_delay_max;
+	d->swapin_delay_min = tsk->delays->swapin_delay_min;
 	tmp = d->swapin_delay_total + tsk->delays->swapin_delay;
 	d->swapin_delay_total = (tmp < d->swapin_delay_total) ? 0 : tmp;
 	d->freepages_delay_max = tsk->delays->freepages_delay_max;
+	d->freepages_delay_min = tsk->delays->freepages_delay_min;
 	tmp = d->freepages_delay_total + tsk->delays->freepages_delay;
 	d->freepages_delay_total = (tmp < d->freepages_delay_total) ? 0 : tmp;
 	d->thrashing_delay_max = tsk->delays->thrashing_delay_max;
+	d->thrashing_delay_min = tsk->delays->thrashing_delay_min;
 	tmp = d->thrashing_delay_total + tsk->delays->thrashing_delay;
 	d->thrashing_delay_total = (tmp < d->thrashing_delay_total) ? 0 : tmp;
 	d->compact_delay_max = tsk->delays->compact_delay_max;
+	d->compact_delay_min = tsk->delays->compact_delay_min;
 	tmp = d->compact_delay_total + tsk->delays->compact_delay;
 	d->compact_delay_total = (tmp < d->compact_delay_total) ? 0 : tmp;
 	d->wpcopy_delay_max = tsk->delays->wpcopy_delay_max;
+	d->wpcopy_delay_min = tsk->delays->wpcopy_delay_min;
 	tmp = d->wpcopy_delay_total + tsk->delays->wpcopy_delay;
 	d->wpcopy_delay_total = (tmp < d->wpcopy_delay_total) ? 0 : tmp;
 	d->irq_delay_max = tsk->delays->irq_delay_max;
+	d->irq_delay_min = tsk->delays->irq_delay_min;
 	tmp = d->irq_delay_total + tsk->delays->irq_delay;
 	d->irq_delay_total = (tmp < d->irq_delay_total) ? 0 : tmp;
 	d->blkio_count += tsk->delays->blkio_count;
@@ -224,7 +235,8 @@ void __delayacct_freepages_end(void)
 		      &current->delays->freepages_start,
 		      &current->delays->freepages_delay,
 		      &current->delays->freepages_count,
-		      &current->delays->freepages_delay_max);
+		      &current->delays->freepages_delay_max,
+		      &current->delays->freepages_delay_min);
 }

 void __delayacct_thrashing_start(bool *in_thrashing)
@@ -247,7 +259,8 @@ void __delayacct_thrashing_end(bool *in_thrashing)
 		      &current->delays->thrashing_start,
 		      &current->delays->thrashing_delay,
 		      &current->delays->thrashing_count,
-		      &current->delays->thrashing_delay_max);
+		      &current->delays->thrashing_delay_max,
+		      &current->delays->thrashing_delay_min);
 }

 void __delayacct_swapin_start(void)
@@ -261,7 +274,8 @@ void __delayacct_swapin_end(void)
 		      &current->delays->swapin_start,
 		      &current->delays->swapin_delay,
 		      &current->delays->swapin_count,
-		      &current->delays->swapin_delay_max);
+		      &current->delays->swapin_delay_max,
+		      &current->delays->swapin_delay_min);
 }

 void __delayacct_compact_start(void)
@@ -275,7 +289,8 @@ void __delayacct_compact_end(void)
 		      &current->delays->compact_start,
 		      &current->delays->compact_delay,
 		      &current->delays->compact_count,
-		      &current->delays->compact_delay_max);
+		      &current->delays->compact_delay_max,
+		      &current->delays->compact_delay_min);
 }

 void __delayacct_wpcopy_start(void)
@@ -289,7 +304,8 @@ void __delayacct_wpcopy_end(void)
 		      &current->delays->wpcopy_start,
 		      &current->delays->wpcopy_delay,
 		      &current->delays->wpcopy_count,
-		      &current->delays->wpcopy_delay_max);
+		      &current->delays->wpcopy_delay_max,
+		      &current->delays->wpcopy_delay_min);
 }

 void __delayacct_irq(struct task_struct *task, u32 delta)
@@ -301,6 +317,8 @@ void __delayacct_irq(struct task_struct *task, u32 delta)
 	task->delays->irq_count++;
 	if (delta > task->delays->irq_delay_max)
 		task->delays->irq_delay_max = delta;
+	if (delta && (!task->delays->irq_delay_min || delta < task->delays->irq_delay_min))
+		task->delays->irq_delay_min = delta;
 	raw_spin_unlock_irqrestore(&task->delays->lock, flags);
 }

diff --git a/kernel/sched/stats.h b/kernel/sched/stats.h
index ed72435aef51..693537b908a1 100644
--- a/kernel/sched/stats.h
+++ b/kernel/sched/stats.h
@@ -246,6 +246,8 @@ static inline void sched_info_dequeue(struct rq *rq, struct task_struct *t)
 	t->sched_info.run_delay += delta;
 	if (delta > t->sched_info.max_run_delay)
 		t->sched_info.max_run_delay = delta;
+	if (delta && (!t->sched_info.min_run_delay || delta < t->sched_info.min_run_delay))
+		t->sched_info.min_run_delay = delta;
 	rq_sched_info_dequeue(rq, delta);
 }

@@ -269,6 +271,8 @@ static void sched_info_arrive(struct rq *rq, struct task_struct *t)
 	t->sched_info.pcount++;
 	if (delta > t->sched_info.max_run_delay)
 		t->sched_info.max_run_delay = delta;
+	if (delta && (!t->sched_info.min_run_delay || delta < t->sched_info.min_run_delay))
+		t->sched_info.min_run_delay = delta;

 	rq_sched_info_arrive(rq, delta);
 }
diff --git a/tools/accounting/getdelays.c b/tools/accounting/getdelays.c
index e570bcad185d..100ad3dc091a 100644
--- a/tools/accounting/getdelays.c
+++ b/tools/accounting/getdelays.c
@@ -192,7 +192,7 @@ static int get_family_id(int sd)
 }

 #define average_ms(t, c) (t / 1000000ULL / (c ? c : 1))
-#define delay_max_ms(t) (t / 1000000ULL)
+#define delay_ms(t) (t / 1000000ULL)

 static void print_delayacct(struct taskstats *t)
 {
@@ -213,48 +213,56 @@ static void print_delayacct(struct taskstats *t)
 	       "IRQ   %15s%15s%15s%15s\n"
 	       "      %15llu%15llu%15.3fms%13.6fms\n",
 	       "count", "real total", "virtual total",
-	       "delay total", "delay average", "delay max",
+	       "delay total", "delay average", "delay max", "delay min",
 	       (unsigned long long)t->cpu_count,
 	       (unsigned long long)t->cpu_run_real_total,
 	       (unsigned long long)t->cpu_run_virtual_total,
 	       (unsigned long long)t->cpu_delay_total,
 	       average_ms((double)t->cpu_delay_total, t->cpu_count),
-		   delay_max_ms((double)t->cpu_delay_max),
-	       "count", "delay total", "delay average", "delay max",
+	       delay_ms((double)t->cpu_delay_max),
+	       delay_ms((double)t->cpu_delay_min),
+	       "count", "delay total", "delay average", "delay max", "delay min",
 	       (unsigned long long)t->blkio_count,
 	       (unsigned long long)t->blkio_delay_total,
 	       average_ms((double)t->blkio_delay_total, t->blkio_count),
-		   delay_max_ms((double)t->blkio_delay_max),
-	       "count", "delay total", "delay average", "delay max",
+	       delay_ms((double)t->blkio_delay_max),
+	       delay_ms((double)t->blkio_delay_min),
+	       "count", "delay total", "delay average", "delay max", "delay min",
 	       (unsigned long long)t->swapin_count,
 	       (unsigned long long)t->swapin_delay_total,
 	       average_ms((double)t->swapin_delay_total, t->swapin_count),
-		   delay_max_ms((double)t->swapin_delay_max),
-	       "count", "delay total", "delay average", "delay max",
+	       delay_ms((double)t->swapin_delay_max),
+	       delay_ms((double)t->swapin_delay_min),
+	       "count", "delay total", "delay average", "delay max", "delay min",
 	       (unsigned long long)t->freepages_count,
 	       (unsigned long long)t->freepages_delay_total,
 	       average_ms((double)t->freepages_delay_total, t->freepages_count),
-		   delay_max_ms((double)t->freepages_delay_max),
-	       "count", "delay total", "delay average", "delay max",
+	       delay_ms((double)t->freepages_delay_max),
+	       delay_ms((double)t->freepages_delay_min),
+	       "count", "delay total", "delay average", "delay max", "delay min",
 	       (unsigned long long)t->thrashing_count,
 	       (unsigned long long)t->thrashing_delay_total,
 	       average_ms((double)t->thrashing_delay_total, t->thrashing_count),
-		   delay_max_ms((double)t->thrashing_delay_max),
-	       "count", "delay total", "delay average", "delay max",
+	       delay_ms((double)t->thrashing_delay_max),
+	       delay_ms((double)t->thrashing_delay_min),
+	       "count", "delay total", "delay average", "delay max", "delay min",
 	       (unsigned long long)t->compact_count,
 	       (unsigned long long)t->compact_delay_total,
 	       average_ms((double)t->compact_delay_total, t->compact_count),
-		   delay_max_ms((double)t->compact_delay_max),
-	       "count", "delay total", "delay average", "delay max",
+	       delay_ms((double)t->compact_delay_max),
+	       delay_ms((double)t->compact_delay_min),
+	       "count", "delay total", "delay average", "delay max", "delay min",
 	       (unsigned long long)t->wpcopy_count,
 	       (unsigned long long)t->wpcopy_delay_total,
 	       average_ms((double)t->wpcopy_delay_total, t->wpcopy_count),
-		   delay_max_ms((double)t->wpcopy_delay_max),
-	       "count", "delay total", "delay average", "delay max",
+	       delay_ms((double)t->wpcopy_delay_max),
+	       delay_ms((double)t->wpcopy_delay_min),
+	       "count", "delay total", "delay average", "delay max", "delay min",
 	       (unsigned long long)t->irq_count,
 	       (unsigned long long)t->irq_delay_total,
 	       average_ms((double)t->irq_delay_total, t->irq_count),
-		   delay_max_ms((double)t->irq_delay_max));
+	       delay_ms((double)t->irq_delay_max),
+	       delay_ms((double)t->irq_delay_min));
 }

 static void task_context_switch_counts(struct taskstats *t)
-- 
2.25.1

