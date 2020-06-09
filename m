Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81FEE1F3487
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2020 08:57:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726941AbgFIG5V (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 9 Jun 2020 02:57:21 -0400
Received: from smtp-fw-9102.amazon.com ([207.171.184.29]:18961 "EHLO
        smtp-fw-9102.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbgFIG5U (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Jun 2020 02:57:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1591685839; x=1623221839;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=fnPPU8ZH6f5dbqstT5rByT9KestQPAM92Bb7SvZMRLs=;
  b=v3bF8HJ9mY64JGjAKs3U+YvyhCbgzGiKXVoLFHrLQZ2HpSjh1t74tUG/
   3+bW8K7QyfiP3a1Ykn5HkcW8oSd5Vc34ytk5poCfGR5hAPcGlT3ipDUWs
   vKAzxnVAQi+Ua09JZpkSN4NB4A+D+Zfyk9LHsYI2BNuFpcvjMZdFUKk0H
   4=;
IronPort-SDR: p6MB8EL6xev+geyDfX7WtxK/oIMW3FZ4sxGzdZX9gqDH78Z9wx6ra4QJJH1yZCB2HcmNIHHTM/
 dfeDSkZKgj6A==
X-IronPort-AV: E=Sophos;i="5.73,490,1583193600"; 
   d="scan'208";a="50834252"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com) ([10.47.23.38])
  by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP; 09 Jun 2020 06:57:16 +0000
Received: from EX13MTAUEA002.ant.amazon.com (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
        by email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com (Postfix) with ESMTPS id C28C3A1F38;
        Tue,  9 Jun 2020 06:57:04 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 9 Jun 2020 06:57:03 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.162.53) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 9 Jun 2020 06:56:47 +0000
From:   SeongJae Park <sjpark@amazon.com>
To:     <akpm@linux-foundation.org>
CC:     SeongJae Park <sjpark@amazon.de>, <Jonathan.Cameron@Huawei.com>,
        <aarcange@redhat.com>, <acme@kernel.org>,
        <alexander.shishkin@linux.intel.com>, <amit@kernel.org>,
        <benh@kernel.crashing.org>, <brendan.d.gregg@gmail.com>,
        <brendanhiggins@google.com>, <cai@lca.pw>,
        <colin.king@canonical.com>, <corbet@lwn.net>, <dwmw@amazon.com>,
        <foersleo@amazon.de>, <irogers@google.com>, <jolsa@redhat.com>,
        <kirill@shutemov.name>, <mark.rutland@arm.com>, <mgorman@suse.de>,
        <minchan@kernel.org>, <mingo@redhat.com>, <namhyung@kernel.org>,
        <peterz@infradead.org>, <rdunlap@infradead.org>,
        <riel@surriel.com>, <rientjes@google.com>, <rostedt@goodmis.org>,
        <sblbir@amazon.com>, <shakeelb@google.com>, <shuah@kernel.org>,
        <sj38.park@gmail.com>, <snu@amazon.de>, <vbabka@suse.cz>,
        <vdavydov.dev@gmail.com>, <yang.shi@linux.alibaba.com>,
        <ying.huang@intel.com>, <david@redhat.com>,
        <linux-damon@amazon.com>, <linux-mm@kvack.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC v11 8/8] Documentation/admin-guide/mm: Document DAMON-based operation schemes
Date:   Tue, 9 Jun 2020 08:53:20 +0200
Message-ID: <20200609065320.12941-9-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200609065320.12941-1-sjpark@amazon.com>
References: <20200609065320.12941-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.162.53]
X-ClientProxiedBy: EX13D31UWA004.ant.amazon.com (10.43.160.217) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

This commit documents DAMON-based operation schemes in the DAMON
document.

Signed-off-by: SeongJae Park <sjpark@amazon.de>
---
 Documentation/admin-guide/mm/damon/guide.rst |  35 +++++
 Documentation/admin-guide/mm/damon/plans.rst |  26 +---
 Documentation/admin-guide/mm/damon/usage.rst | 127 +++++++++++++++++--
 3 files changed, 155 insertions(+), 33 deletions(-)

diff --git a/Documentation/admin-guide/mm/damon/guide.rst b/Documentation/admin-guide/mm/damon/guide.rst
index 4a840d1b02d4..c10f65ce721c 100644
--- a/Documentation/admin-guide/mm/damon/guide.rst
+++ b/Documentation/admin-guide/mm/damon/guide.rst
@@ -55,6 +55,11 @@ heats``.  If it shows a simple pattern consists of a small number of memory
 regions having high contrast of access temperature, you could consider `Manual
 Program Optimization`_.
 
+If the access pattern is very frequently changing so that you cannot figure out
+what is the performance important region using your human eye, `Automated
+DAMON-based Memory Operations`_ might help the case owing to its machine-level
+microscope view.
+
 You don't need to take only one approach among the above plans, but you could
 use multiple of the above approaches to maximize the benefit.  If you still
 want to absorb more benefits, you should develop `Personalized DAMON
@@ -158,6 +163,36 @@ object is the hot object.
           The chronological changes of working set size.
 
 
+Automated DAMON-based Memory Operations
+---------------------------------------
+
+Though `Manual Program Optimization` works well in many cases and DAMON can
+help it, modifying the source code is not a good option in many cases.  First
+of all, the source code could be too old or unavailable.  And, many workloads
+will have complex data access patterns that even hard to distinguish hot memory
+objects and cold memory objects with the human eye.  Finding the mapping from
+the visualized access pattern to the source code and injecting the hinting
+system calls inside the code will also be quite challenging.
+
+By using DAMON-based operation schemes (DAMOS) via ``damo schemes``, you will
+be able to easily optimize your workload in such a case.  Our example schemes
+called 'efficient THP' and 'proactive reclamation' achieved significant speedup
+and memory space saves against 25 realistic workloads [2]_, [3]_.
+
+That said, note that you need careful tune of the schemes (e.g., target region
+size and age) and monitoring attributes for the successful use of this
+approach.  Because the optimal values of the parameters will be dependent on
+each system and workload, misconfiguring the parameters could result in worse
+memory management.
+
+For the tuning, you could measure the performance metrics such as IPC, TLB
+misses, and swap in/out events and adjusts the parameters based on their
+changes.  The total number and the total size of the regions that each scheme
+is applied, which are provided via the debugfs interface and the programming
+interface can also be useful.  Writing a program automating this optimal
+parameter could be an option.
+
+
 Personalized DAMON Application
 ------------------------------
 
diff --git a/Documentation/admin-guide/mm/damon/plans.rst b/Documentation/admin-guide/mm/damon/plans.rst
index 96251752b3f0..8eba8a1dcb98 100644
--- a/Documentation/admin-guide/mm/damon/plans.rst
+++ b/Documentation/admin-guide/mm/damon/plans.rst
@@ -4,25 +4,7 @@
 Future Plans
 ============
 
-DAMON is still on its first stage.  Below plans are still under development.
-
-
-Automate Data Access Monitoring-based Memory Operation Schemes Execution
-========================================================================
-
-The ultimate goal of DAMON is being used as a building block of the data access
-pattern aware kernel memory management subsystem optimization.  However, as
-always, some users having very special workloads will want to do their
-optimization.  DAMON will automate most of the tasks for such manual
-optimizations soon.  Users will be required to only describe what kind of data
-access pattern-based operation schemes they want in a simple form.
-
-By applying a very simple scheme for THP promotion/demotion with a prototype
-implementation, DAMON reduced 60% of THP memory footprint overhead while
-preserving 50% of the THP performance benefit.  The detailed results can be
-seen on an external web page [1]_.
-
-Several RFC patchsets for this plan are available [2]_.
+DAMON is still on its early stage.  Below plans are still under development.
 
 
 Support Various Address Spaces
@@ -42,8 +24,6 @@ primitives by themselves for their special use cases.  Monitoring of
 clean/dirty/entire page cache, NUMA nodes, specific files, or block devices
 would be examples of such use cases.
 
-An RFC patchset for this plan is available [3]_.
+An RFC patchset for this plan is available [1]_.
 
-.. [1] https://damonitor.github.io/test/result/perf/latest/html/
-.. [2] https://lore.kernel.org/linux-mm/20200429124540.32232-1-sjpark@amazon.com/
-.. [3] https://lore.kernel.org/linux-mm/20200409094232.29680-1-sjpark@amazon.com/
+.. [1] https://lore.kernel.org/linux-mm/20200409094232.29680-1-sjpark@amazon.com/
diff --git a/Documentation/admin-guide/mm/damon/usage.rst b/Documentation/admin-guide/mm/damon/usage.rst
index 1aa4f66e4320..18a19c35b4f3 100644
--- a/Documentation/admin-guide/mm/damon/usage.rst
+++ b/Documentation/admin-guide/mm/damon/usage.rst
@@ -228,11 +228,71 @@ Similar to that of ``heats --heatmap``, it also supports 'gnuplot' based simple
 visualization of the distribution via ``--plot`` option.
 
 
+DAMON-based Operation Schemes
+-----------------------------
+
+The ``schemes`` subcommand allows users to do DAMON-based memory management
+optimizations in a few seconds.  Similar to ``record``, it receives monitoring
+attributes and target.  However, in addition to those, ``schemes`` receives
+data access pattern-based memory operation schemes, which describes what memory
+operation action should be applied to memory regions showing specific data
+access pattern.  Then, it starts the data access monitoring and automatically
+applies the schemes to the targets.
+
+The operation schemes should be saved in a text file in below format and passed
+to ``schemes`` subcommand via ``--schemes`` option. ::
+
+    min-size max-size min-acc max-acc min-age max-age action
+
+The format also supports comments, several units for size and age of regions,
+and human readable action names.  Currently supported operation actions are
+``willneed``, ``cold``, ``pageout``, ``hugepage`` and ``nohugepage``.  Each of
+the actions works same to the madvise() system call hints having the name.
+Please also note that the range is inclusive (closed interval), and ``0`` for
+max values means infinite. Below example schemes are possible. ::
+
+    # format is:
+    # <min/max size> <min/max frequency (0-99)> <min/max age> <action>
+    #
+    # B/K/M/G/T for Bytes/KiB/MiB/GiB/TiB
+    # us/ms/s/m/h/d for micro-seconds/milli-seconds/seconds/minutes/hours/days
+    # 'null' means zero for size and age.
+
+    # if a region keeps a high access frequency for >=100ms, put the region on
+    # the head of the LRU list (call madvise() with MADV_WILLNEED).
+    null    null    80      null    100ms   0s      willneed
+
+    # if a region keeps a low access frequency at least 200ms and at most one
+    # hour, put the region on the tail of the LRU list (call madvise() with
+    # MADV_COLD).
+    0B      0B      10      20      200ms   1h cold
+
+    # if a region keeps a very low access frequency for >=1 minute, swap
+    # out the region immediately (call madvise() with MADV_PAGEOUT).
+    0B      null    0       10      60s     0s pageout
+
+    # if a region of a size >=2MiB keeps a very high access frequency for
+    # >=100ms, let the region to use huge pages (call madvise() with
+    # MADV_HUGEPAGE).
+    2M      null    90      99      100ms   0s hugepage
+
+    # If a region of a size >=2MiB keeps small access frequency for >=100ms,
+    # avoid the region using huge pages (call madvise() with MADV_NOHUGEPAGE).
+    2M      null    0       25      100ms   0s nohugepage
+
+For example, you can make a running process named 'foo' to use huge pages for
+memory regions keeping 2MB or larger size and having very high access frequency
+for at least 100 milliseconds using below commands::
+
+    $ echo "2M null 90 99 100ms 0s hugepage" > my_thp_scheme
+    $ ./damo schemes --schemes my_thp_scheme `pidof foo`
+
+
 debugfs Interface
 =================
 
-DAMON exports four files, ``attrs``, ``pids``, ``record``, and ``monitor_on``
-under its debugfs directory, ``<debugfs>/damon/``.
+DAMON exports five files, ``attrs``, ``pids``, ``record``, ``schemes`` and
+``monitor_on`` under its debugfs directory, ``<debugfs>/damon/``.
 
 
 Attributes
@@ -282,17 +342,64 @@ saved in ``/damon.data``. ::
     4096 /damon.data
 
 
+Schemes
+-------
+
+For usual DAMON-based data access aware memory management optimizations, users
+would simply want the system to apply a memory management action to a memory
+region of a specific size having a specific access frequency for a specific
+time.  DAMON receives such formalized operation schemes from the user and
+applies those to the target processes.  It also counts the total number and
+size of regions that each scheme is applied.  This statistics can be used for
+online analysis or tuning of the schemes.
+
+Users can get and set the schemes by reading from and writing to ``schemes``
+debugfs file.  Reading the file also shows the statistics of each scheme.  To
+the file, each of the schemes should be represented in each line in below form:
+
+    min-size max-size min-acc max-acc min-age max-age action
+
+Note that the ranges are closed interval.  Bytes for the size of regions
+(``min-size`` and ``max-size``), number of monitored accesses per aggregate
+interval for access frequency (``min-acc`` and ``max-acc``), number of
+aggregate intervals for the age of regions (``min-age`` and ``max-age``), and a
+predefined integer for memory management actions should be used.  The supported
+numbers and their
+meanings are as below.
+
+ - 0: Call ``madvise()`` for the region with ``MADV_WILLNEED``
+ - 1: Call ``madvise()`` for the region with ``MADV_COLD``
+ - 2: Call ``madvise()`` for the region with ``MADV_PAGEOUT``
+ - 3: Call ``madvise()`` for the region with ``MADV_HUGEPAGE``
+ - 4: Call ``madvise()`` for the region with ``MADV_NOHUGEPAGE``
+ - 5: Do nothing but count the statistics
+
+You can disable schemes by simply writing an empty string to the file.  For
+example, below commands applies a scheme saying "If a memory region >=4KiB is
+showing <=5 accesses per aggregate interval (0 5) for >=5 aggregate interval (5
+0), page out the region (2)", check the entered scheme again, and finally
+remove the scheme. ::
+
+    # cd <debugfs>/damon
+    # echo "4096 0 0 5 5 0 2" > schemes
+    # cat schemes
+    4096 0 0 5 5 0 2 0 0
+    # echo > schemes
+
+The last two integers in the 4th line of above example is the total number and
+the total size of the regions that the scheme is applied.
+
 Turning On/Off
 --------------
 
-Setting the attributes as described above doesn't incur effect unless you
-explicitly start the monitoring.  You can start, stop, and check the current
-status of the monitoring by writing to and reading from the ``monitor_on``
-file.  Writing ``on`` to the file make DAMON start monitoring of the target
-processes with the attributes.  Recording will also start if requested before.
-Writing ``off`` to the file stops those.  DAMON also stops if every target
-process is terminated.  Below example commands turn on, off, and check the
-status of DAMON::
+Setting the attributes and schemes as described above doesn't incur effect
+unless you explicitly start the monitoring.  You can start, stop, and check
+the current status of the monitoring by writing to and reading from the
+``monitor_on`` file.  Writing ``on`` to the file make DAMON start monitoring
+of the target processes with the attributes.  Recording and schemes applying
+will also start if requested before.  Writing ``off`` to the file stops those.
+DAMON also stops if every target process is terminated.  Below example
+commands turn on, off, and check the status of DAMON::
 
     # cd <debugfs>/damon
     # echo on > monitor_on
-- 
2.17.1

