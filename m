Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13CE2FA77F
	for <lists+linux-doc@lfdr.de>; Wed, 13 Nov 2019 04:45:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727555AbfKMDpV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 12 Nov 2019 22:45:21 -0500
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:59381 "EHLO
        out30-43.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727466AbfKMDpV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Nov 2019 22:45:21 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R531e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01451;MF=yun.wang@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0ThxeNA8_1573616715;
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com fp:SMTPD_---0ThxeNA8_1573616715)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 13 Nov 2019 11:45:16 +0800
Subject: [PATCH 2/3] sched/numa: expose per-task pages-migration-failure
From:   =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
To:     Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>,
        =?UTF-8?Q?Michal_Koutn=c3=bd?= <mkoutny@suse.com>,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org,
        "Paul E. McKenney" <paulmck@linux.ibm.com>
References: <743eecad-9556-a241-546b-c8a66339840e@linux.alibaba.com>
Message-ID: <16f702e2-d844-20d5-4b4d-4a18c8ffd175@linux.alibaba.com>
Date:   Wed, 13 Nov 2019 11:45:15 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <743eecad-9556-a241-546b-c8a66339840e@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

NUMA balancing will try to migrate pages between nodes, which
could caused by memory policy or numa group aggregation, while
the page migration could failed too for eg when the target node
run out of memory.

Since this is critical to the performance, admin should know
how serious the problem is, and take actions before it causing
too much performance damage, thus this patch expose the counter
as 'migfailed' in '/proc/PID/sched'.

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Michal Koutný <mkoutny@suse.com>
Suggested-by: Mel Gorman <mgorman@suse.de>
Signed-off-by: Michael Wang <yun.wang@linux.alibaba.com>
---
 kernel/sched/debug.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index f7e4579e746c..73c4809c8f37 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -848,6 +848,7 @@ static void sched_show_numa(struct task_struct *p, struct seq_file *m)
 	P(total_numa_faults);
 	SEQ_printf(m, "current_node=%d, numa_group_id=%d\n",
 			task_node(p), task_numa_group_id(p));
+	SEQ_printf(m, "migfailed=%lu\n", p->numa_faults_locality[2]);
 	show_numa_stats(p, m);
 	mpol_put(pol);
 #endif
-- 
2.14.4.44.g2045bb6

