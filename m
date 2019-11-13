Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A35D6FA785
	for <lists+linux-doc@lfdr.de>; Wed, 13 Nov 2019 04:46:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727724AbfKMDqH (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 12 Nov 2019 22:46:07 -0500
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131]:52648 "EHLO
        out30-131.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727275AbfKMDqH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Nov 2019 22:46:07 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R741e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01422;MF=yun.wang@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0ThxeNHV_1573616759;
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com fp:SMTPD_---0ThxeNHV_1573616759)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 13 Nov 2019 11:46:00 +0800
Subject: [PATCH 3/3] sched/numa: documentation for per-cgroup numa stat
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
Message-ID: <896a7da3-f139-32e7-8a64-b3562df1a091@linux.alibaba.com>
Date:   Wed, 13 Nov 2019 11:45:59 +0800
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

Add the description for 'cg_numa_stat', also a new doc to explain
the details on how to deal with the per-cgroup numa statistics.

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Michal Koutný <mkoutny@suse.com>
Cc: Mel Gorman <mgorman@suse.de>
Signed-off-by: Michael Wang <yun.wang@linux.alibaba.com>
---
 Documentation/admin-guide/cg-numa-stat.rst      | 161 ++++++++++++++++++++++++
 Documentation/admin-guide/kernel-parameters.txt |   4 +
 Documentation/admin-guide/sysctl/kernel.rst     |   9 ++
 3 files changed, 174 insertions(+)
 create mode 100644 Documentation/admin-guide/cg-numa-stat.rst

diff --git a/Documentation/admin-guide/cg-numa-stat.rst b/Documentation/admin-guide/cg-numa-stat.rst
new file mode 100644
index 000000000000..87b716c51e16
--- /dev/null
+++ b/Documentation/admin-guide/cg-numa-stat.rst
@@ -0,0 +1,161 @@
+===============================
+Per-cgroup NUMA statistics
+===============================
+
+Background
+----------
+
+On NUMA platforms, remote memory accessing always has a performance penalty,
+although we have NUMA balancing working hard to maximum the local accessing
+proportion, there are still situations it can't helps.
+
+This could happen in modern production environment, using bunch of cgroups
+to classify and control resources which introduced complex configuration on
+memory policy, CPUs and NUMA node, NUMA balancing could facing the wrong
+memory policy or exhausted local NUMA node, lead into the low local page
+accessing proportion.
+
+We need to perceive such cases, figure out which workloads from which cgroup
+has introduced the issues, then we got chance to do adjustment to avoid
+performance damages.
+
+However, there are no hardware counter for per-task local/remote accessing
+info, we don't know how many remote page accessing has been done for a
+particular task.
+
+Statistics
+----------
+
+Fortunately, we have NUMA Balancing which scan task's mapping and trigger PF
+periodically, give us the opportunity to record per-task page accessing info.
+
+By "echo 1 > /proc/sys/kernel/cg_numa_stat" on runtime or add boot parameter
+'cg_numa_stat', we will enable the accounting of per-cgroup numa statistics,
+the 'cpu.numa_stat' entry of CPU cgroup will show statistics:
+
+  locality -- execution time sectioned by task NUMA locality (in ms)
+  exectime -- execution time sectioned by NUMA node (in ms)
+
+We define 'task NUMA locality' as:
+
+  nr_local_page_access * 100 / (nr_local_page_access + nr_remote_page_access)
+
+this per-task percentage value will be updated on the ticks for current task,
+and the access counter will be updated on task's NUMA balancing PF, so only
+the pages which NUMA Balancing paid attention to will be accounted.
+
+On each tick, we acquire the locality of current task on that CPU, accumulating
+the ticks into the counter of corresponding locality region, tasks from the
+same group sharing the counters, becoming the group locality.
+
+Similarly, we acquire the NUMA node of current CPU where the current task is
+executing on, accumulating the ticks into the counter of corresponding node,
+becoming the per-cgroup node execution time.
+
+To be noticed, the accounting is in a hierarchy way, which means the numa
+statistics representing not only the workload of this group, but also the
+workloads of all it's descendants.
+
+For example the 'cpu.numa_stat' show:
+  locality 39541 60962 36842 72519 118605 721778 946553
+  exectime 1220127 1458684
+
+The locality is sectioned into 7 regions, closely as:
+  0-13% 14-27% 28-42% 43-56% 57-71% 72-85% 86-100%
+
+And exectime is sectioned into 2 nodes, 0 and 1 in this case.
+
+Thus we know the workload of this group and it's descendants have totally
+executed 1220127ms on node_0 and 1458684ms on node_1, tasks with locality
+around 0~13% executed for 39541 ms, and tasks with locality around 87~100%
+executed for 946553 ms, which imply most of the memory access are local.
+
+Monitoring
+-----------------
+
+By monitoring the increments of these statistics, we can easily know whether
+NUMA balancing is working well for a particular workload.
+
+For example we take a 5 secs sample period, and consider locality under 27%
+is bad, then on each sampling we have:
+
+  region_bad = region_1 + region_2
+  region_all = region_1 + region_2 + ... + region_7
+
+and we have the increments as:
+
+  region_bad_diff = region_bad - last_region_bad
+  region_all_diff = region_all - last_region_all
+
+which finally become:
+
+  region_bad_percent = region_bad_diff * 100 / region_all_diff
+
+we can draw a line for region_bad_percent, when the line close to 0 things
+are good, when getting close to 100% something is wrong, we can pick a proper
+watermark to trigger warning message.
+
+You may want to drop the data if the region_all is too small, which imply
+there are not much available pages for NUMA Balancing, just ignore would be
+fine since most likely the workload is insensitive to NUMA.
+
+Monitoring root group help you control the overall situation, while you may
+also want to monitoring all the leaf groups which contain the workloads, this
+help to catch the mouse.
+
+The exectime could be useful when NUMA Balancing is disabled, or when locality
+become too small, for NUMA node X we have:
+
+  exectime_X_diff = exectime_X - last_exectime_X
+  exectime_all_diff = exectime_all - last_exectime_all
+
+try put your workload into a memory cgroup which providing per-node memory
+consumption by 'memory.numa_stat' entry, then we could get:
+
+  memory_percent_X = memory_X * 100 / memory_all
+  exectime_percent_X = exectime_X_diff * 100 / exectime_all_diff
+
+These two percentage are usually matched on each node, workload should execute
+mostly on the node contain most of it's memory, but it's not guaranteed.
+
+Depends on which part of the memory accessed mostly by the workload, locality
+could still be good with just a little piece of memory locally.
+
+Thus to tell if things are find or not depends on the understanding of system
+resource deployment, however, if you find node X got 100% memory percent but 0%
+exectime percent, definitely something is wrong.
+
+Troubleshooting
+---------------
+
+After locate which workloads introduced the bad locality, check:
+
+1). Is the workloads bind into a particular NUMA node?
+2). Is there any NUMA node run out of resources?
+
+There are several ways to bind task's memory with a NUMA node, the strict way
+like the MPOL_BIND memory policy or 'cpuset.mems' will limiting the memory
+node where to allocate pages, in this situation, admin should make sure the
+task is allowed to run on the CPUs of that NUMA node, and make sure there are
+available CPU resource there.
+
+There are also ways to bind task's CPU with a NUMA node, like 'cpuset.cpus' or
+sched_setaffinity() syscall, in this situation, NUMA Balancing help to migrate
+pages into that node, admin should make sure there are available memory there.
+
+Admin could try rebind or unbind the NUMA node to erase the damage, make a
+change then observe the statistics see if things get better until the situation
+is acceptable.
+
+Highlights
+----------
+
+For some tasks, NUMA Balancing may found no necessary to scan pages, and
+locality could always be 0 or small number, don't pay attention to them
+since they most likely insensitive to NUMA.
+
+There are no accounting until the option turned on, so enable it in advance
+if you want to have the whole history.
+
+We have per-task migfailed counter to tell how many page migration has been
+failed for a particular task, you will find it in /proc/PID/sched entry.
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 5e27d74e2b74..220df1f0beb8 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3191,6 +3191,10 @@
 	numa_balancing=	[KNL,X86] Enable or disable automatic NUMA balancing.
 			Allowed values are enable and disable

+	cg_numa_atat	[KNL] Enable advanced per-cgroup numa statistics.
+			Useful to debug NUMA efficiency problems when there are
+			lot's of per-cgroup workloads.
+
 	numa_zonelist_order= [KNL, BOOT] Select zonelist order for NUMA.
 			'node', 'default' can be specified
 			This can be set from sysctl after boot.
diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index 614179dc79a9..719593e8be20 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -572,6 +572,15 @@ rate for each task.
 numa_balancing_scan_size_mb is how many megabytes worth of pages are
 scanned for a given scan.

+cg_numa_stat:
+=============
+
+Enables/disables advanced per-cgroup NUMA statistic.
+
+0: disabled (default).
+1: enabled.
+
+Check Documentation/admin-guide/cg-numa-stat.rst for details.

 osrelease, ostype & version:
 ============================
-- 
2.14.4.44.g2045bb6

