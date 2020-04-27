Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6D3C1BA34F
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2020 14:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726989AbgD0MKo (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 27 Apr 2020 08:10:44 -0400
Received: from smtp-fw-33001.amazon.com ([207.171.190.10]:10679 "EHLO
        smtp-fw-33001.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbgD0MKn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Apr 2020 08:10:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1587989441; x=1619525441;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=CTH9AA+VYEb2vGAseszqNOCqfYNxbvQjsL0K+B1y1u4=;
  b=TXh7NLtXhUwjRjplSOetwQpGxGSA4Hd2QAcUBX3DJsiGWsbC46uqTNn3
   XXMQYz9wVpK0Tr7hwZXls4To0jBkk4QC5cDBkTjAewa/5J+knIF27Jy4N
   1LTDO9COal0zuPBMaep7NzxguTDwPGI7OWiD/wqudvWCJaX7Kt3GITh4c
   4=;
IronPort-SDR: v3w2updI9N3RoNbZ8CzNHX/EK45X3JcJL1tfmMYVQqEzgpoKdOky83hoMXB5qaQ23UERZqUsyQ
 K8eG1he7cR3w==
X-IronPort-AV: E=Sophos;i="5.73,324,1583193600"; 
   d="scan'208";a="41100081"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com) ([10.47.23.38])
  by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP; 27 Apr 2020 12:10:40 +0000
Received: from EX13MTAUEA002.ant.amazon.com (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
        by email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com (Postfix) with ESMTPS id 84E43A21CF;
        Mon, 27 Apr 2020 12:10:37 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 27 Apr 2020 12:10:37 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.162.53) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 27 Apr 2020 12:10:17 +0000
From:   SeongJae Park <sjpark@amazon.com>
To:     <akpm@linux-foundation.org>
CC:     SeongJae Park <sjpark@amazon.de>, <Jonathan.Cameron@Huawei.com>,
        <aarcange@redhat.com>, <acme@kernel.org>,
        <alexander.shishkin@linux.intel.com>, <amit@kernel.org>,
        <benh@kernel.crashing.org>, <brendan.d.gregg@gmail.com>,
        <brendanhiggins@google.com>, <cai@lca.pw>,
        <colin.king@canonical.com>, <corbet@lwn.net>, <dwmw@amazon.com>,
        <irogers@google.com>, <jolsa@redhat.com>, <kirill@shutemov.name>,
        <mark.rutland@arm.com>, <mgorman@suse.de>, <minchan@kernel.org>,
        <mingo@redhat.com>, <namhyung@kernel.org>, <peterz@infradead.org>,
        <rdunlap@infradead.org>, <riel@surriel.com>, <rientjes@google.com>,
        <rostedt@goodmis.org>, <sblbir@amazon.com>, <shakeelb@google.com>,
        <shuah@kernel.org>, <sj38.park@gmail.com>, <snu@amazon.de>,
        <vbabka@suse.cz>, <vdavydov.dev@gmail.com>,
        <yang.shi@linux.alibaba.com>, <ying.huang@intel.com>,
        <linux-damon@amazon.com>, <linux-mm@kvack.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 12/15] Documentation/admin-guide/mm: Add a document for DAMON
Date:   Mon, 27 Apr 2020 14:04:39 +0200
Message-ID: <20200427120442.24179-13-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200427120442.24179-1-sjpark@amazon.com>
References: <20200427120442.24179-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.162.53]
X-ClientProxiedBy: EX13D34UWC004.ant.amazon.com (10.43.162.155) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

This commit adds a simple document for DAMON under
`Documentation/admin-guide/mm`.

Signed-off-by: SeongJae Park <sjpark@amazon.de>
---
 .../admin-guide/mm/data_access_monitor.rst    | 428 ++++++++++++++++++
 Documentation/admin-guide/mm/index.rst        |   1 +
 2 files changed, 429 insertions(+)
 create mode 100644 Documentation/admin-guide/mm/data_access_monitor.rst

diff --git a/Documentation/admin-guide/mm/data_access_monitor.rst b/Documentation/admin-guide/mm/data_access_monitor.rst
new file mode 100644
index 000000000000..1d5e18d6ab9e
--- /dev/null
+++ b/Documentation/admin-guide/mm/data_access_monitor.rst
@@ -0,0 +1,428 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==========================
+DAMON: Data Access MONitor
+==========================
+
+Introduction
+============
+
+Memory management decisions can be improved if finer data access information is
+available.  However, because such finer information usually comes with higher
+overhead, most systems including Linux forgives the potential benefit and rely
+on only coarse information or some light-weight heuristics.
+
+A number of data access pattern awared memory management optimizations
+consistently say the potential benefit is not small (2.55x speedup).  However,
+none of those has successfully adopted into into the Linux kernel mainly due to
+the absence of a scalable and efficient data access monitoring mechanism.
+
+DAMON is a data access monitoring subsystem for the problem.  It is 1) accurate
+enough to be used for the DRAM level memory management, 2) light-weight enough
+to be applied online, and 3) keeps predefined upper-bound overhead
+regardless of the size of target workloads (thus scalable).
+
+DAMON is implemented as a standalone kernel module and provides several simple
+interfaces.  Owing to that, though it has mainly designed for the kernel's
+memory management mechanisms, it can be also used for a wide range of user
+space programs and people.
+
+
+Frequently Asked Questions
+==========================
+
+Q: Why not integrated with perf?
+A: From the perspective of perf like profilers, DAMON can be thought of as a
+data source in kernel, like tracepoints, pressure stall information (psi), or
+idle page tracking.  Thus, it can be easily integrated with those.  However,
+this patchset doesn't provide a fancy perf integration because current step of
+DAMON development is focused on its core logic only.  That said, DAMON already
+provides two interfaces for user space programs, which based on debugfs and
+tracepoint, respectively.  Using the tracepoint interface, you can use DAMON
+with perf.  This patchset also provides the debugfs interface based user space
+tool for DAMON.  It can be used to record, visualize, and analyze data access
+pattern of target processes in a convenient way.
+
+Q: Why a new module, instead of extending perf or other tools?
+A: First, DAMON aims to be used by other programs including the kernel.
+Therefore, having dependency to specific tools like perf is not desirable.
+Second, because it need to be lightweight as much as possible so that it can be
+used online, any unnecessary overhead such as kernel - user space context
+switching cost should be avoided.  These are the two most biggest reasons why
+DAMON is implemented in the kernel space.  The idle page tracking subsystem
+would be the kernel module that most seems similar to DAMON.  However, it's own
+interface is not compatible with DAMON.  Also, the internal implementation of
+it has no common part to be reused by DAMON.
+
+Q: Can 'perf mem' provide the data required for DAMON?
+A: On the systems supporting 'perf mem', yes.  DAMON is using the PTE Accessed
+bits in low level.  Other H/W or S/W features that can be used for the purpose
+could be used.  However, as explained with above question, DAMON need to be
+implemented in the kernel space.
+
+
+Expected Use-cases
+==================
+
+A straightforward usecase of DAMON would be the program behavior analysis.
+With the DAMON output, users can confirm whether the program is running as
+intended or not.  This will be useful for debuggings and tests of design
+points.
+
+The monitored results can also be useful for counting the dynamic working set
+size of workloads.  For the administration of memory overcommitted systems or
+selection of the environments (e.g., containers providing different amount of
+memory) for your workloads, this will be useful.
+
+If you are a programmer, you can optimize your program by managing the memory
+based on the actual data access pattern.  For example, you can identify the
+dynamic hotness of your data using DAMON and call ``mlock()`` to keep your hot
+data in DRAM, or call ``madvise()`` with ``MADV_PAGEOUT`` to proactively
+reclaim cold data.  Even though your program is guaranteed to not encounter
+memory pressure, you can still improve the performance by applying the DAMON
+outputs for call of ``MADV_HUGEPAGE`` and ``MADV_NOHUGEPAGE``.  More creative
+optimizations would be possible.  Our evaluations of DAMON includes a
+straightforward optimization using the ``mlock()``.  Please refer to the below
+Evaluation section for more detail.
+
+As DAMON incurs very low overhead, such optimizations can be applied not only
+offline, but also online.  Also, there is no reason to limit such optimizations
+to the user space.  Several parts of the kernel's memory management mechanisms
+could be also optimized using DAMON. The reclamation, the THP (de)promotion
+decisions, and the compaction would be such a candidates.
+
+
+Mechanisms of DAMON
+===================
+
+
+Basic Access Check
+------------------
+
+DAMON basically reports what pages are how frequently accessed.  The report is
+passed to users in binary format via a ``result file`` which users can set it's
+path.  Note that the frequency is not an absolute number of accesses, but a
+relative frequency among the pages of the target workloads.
+
+Users can also control the resolution of the reports by setting two time
+intervals, ``sampling interval`` and ``aggregation interval``.  In detail,
+DAMON checks access to each page per ``sampling interval``, aggregates the
+results (counts the number of the accesses to each page), and reports the
+aggregated results per ``aggregation interval``.  For the access check of each
+page, DAMON uses the Accessed bits of PTEs.
+
+This is thus similar to the previously mentioned periodic access checks based
+mechanisms, which overhead is increasing as the size of the target process
+grows.
+
+
+Region Based Sampling
+---------------------
+
+To avoid the unbounded increase of the overhead, DAMON groups a number of
+adjacent pages that assumed to have same access frequencies into a region.  As
+long as the assumption (pages in a region have same access frequencies) is
+kept, only one page in the region is required to be checked.  Thus, for each
+``sampling interval``, DAMON randomly picks one page in each region and clears
+its Accessed bit.  After one more ``sampling interval``, DAMON reads the
+Accessed bit of the page and increases the access frequency of the region if
+the bit has set meanwhile.  Therefore, the monitoring overhead is controllable
+by setting the number of regions.  DAMON allows users to set the minimal and
+maximum number of regions for the trade-off.
+
+Except the assumption, this is almost same with the above-mentioned
+miniature-like static region based sampling.  In other words, this scheme
+cannot preserve the quality of the output if the assumption is not guaranteed.
+
+
+Adaptive Regions Adjustment
+---------------------------
+
+At the beginning of the monitoring, DAMON constructs the initial regions by
+evenly splitting the memory mapped address space of the process into the
+user-specified minimal number of regions.  In this initial state, the
+assumption is normally not kept and thus the quality could be low.  To keep the
+assumption as much as possible, DAMON adaptively merges and splits each region.
+For each ``aggregation interval``, it compares the access frequencies of
+adjacent regions and merges those if the frequency difference is small.  Then,
+after it reports and clears the aggregated access frequency of each region, it
+splits each region into two regions if the total number of regions is smaller
+than the half of the user-specified maximum number of regions.
+
+In this way, DAMON provides its best-effort quality and minimal overhead while
+keeping the bounds users set for their trade-off.
+
+
+Applying Complex and Dynamic Memory Mappings
+--------------------------------------------
+
+Only a number of small parts in the super-huge virtual address space of the
+processes is mapped to physical memory and accessed.  Thus, tracking the
+unmapped address regions is just wasteful.  However, because DAMON can deal
+with some level of noises using the adaptive regions adjustment mechanism,
+tracking every mapping is not strictly required but could even incur a high
+overhead in somce cases.  That said, too huge unmapped areas inside the
+monitoring target should be removed to not take the time for the adaptive
+mechanism.
+
+For the reason, DAMON converts the complex mappings to three distinct regions
+that cover every mapped areas of the address space.  Also the two gaps between
+the three regions are the two biggest unmapped areas in the given address
+space.  The two biggest unmapped areas might be the gap between the heap and
+the uppermost mmap()-ed region, and the gap between the lowermost mmap()-ed
+region and the stack will be two biggest unmapped regions.  Because these gaps
+are exceptionally huge areas in usual address space, excluding these two
+biggest unmapped regions will be sufficient to make a trade-off.
+
+To further minimize dynamic mapping changes applying overhead, DAMON check the
+dynamic memory mapping changes and applies it to the abstracted target area
+only for each of a user-specified time interval (``regions update interval``).
+
+
+``debugfs`` Interface
+=====================
+
+DAMON exports four files, ``attrs``, ``pids``, ``record``, and ``monitor_on``
+under its debugfs directory, ``<debugfs>/damon/``.
+
+Attributes
+----------
+
+Users can read and write the ``sampling interval``, ``aggregation interval``,
+``regions update interval``, and min/max number of monitoring target regions by
+reading from and writing to the ``attrs`` file.  For example, below commands
+set those values to 5 ms, 100 ms, 1,000 ms, 10, 1000 and check it again::
+
+    # cd <debugfs>/damon
+    # echo 5000 100000 1000000 10 1000 > attrs
+    # cat attrs
+    5000 100000 1000000 10 1000
+
+Target PIDs
+-----------
+
+Users can read and write the pids of current monitoring target processes by
+reading from and writing to the ``pids`` file.  For example, below commands set
+processes having pids 42 and 4242 as the processes to be monitored and check it
+again::
+
+    # cd <debugfs>/damon
+    # echo 42 4242 > pids
+    # cat pids
+    42 4242
+
+Note that setting the pids doesn't start the monitoring.
+
+Record
+------
+
+DAMON supports direct monitoring result record feature.  The recorded results
+are first written to a buffer and flushed to a file in batch.  Users can set
+the size of the buffer and the path to the result file by reading from and
+writing to the ``record`` file.  For example, below commands set the buffer to
+be 4 KiB and the result to be saved in ``/damon.data``.
+
+    # cd <debugfs>/damon
+    # echo "4096 /damon.data" > record
+    # cat record
+    4096 /damon.data
+
+Turning On/Off
+--------------
+
+You can check current status, start and stop the monitoring by reading from and
+writing to the ``monitor_on`` file.  Writing ``on`` to the file starts DAMON to
+monitor the target processes with the attributes.  Writing ``off`` to the file
+stops DAMON.  DAMON also stops if every target processes is terminated.
+Below example commands turn on, off, and check status of DAMON::
+
+    # cd <debugfs>/damon
+    # echo on > monitor_on
+    # echo off > monitor_on
+    # cat monitor_on
+    off
+
+Please note that you cannot write to the ``attrs`` and ``pids`` files while the
+monitoring is turned on.  If you write to the files while DAMON is running, an
+error code such as ``-EBUSY`` will be returned.
+
+
+User Space Tool for DAMON
+=========================
+
+There is a user space tool for DAMON, ``/tools/damon/damo``.  It provides
+another user interface which more convenient than the debugfs interface.
+Nevertheless, note that it is only aimed to be used for minimal reference of
+the DAMON's debugfs interfaces and for tests of the DAMON itself.  Based on the
+debugfs interface, you can create another cool and more convenient user space
+tools.
+
+The interface of the tool is basically subcommand based.  You can almost always
+use ``-h`` option to get help of the use of each subcommand.  Currently, it
+supports two subcommands, ``record`` and ``report``.
+
+
+Recording Data Access Pattern
+-----------------------------
+
+The ``record`` subcommand records the data access pattern of target process in
+a file (``./damon.data`` by default) using DAMON.  You can specifies the target
+as either pid or a command for an execution of the process.  Below example
+shows a command target usage::
+
+    # cd <kernel>/tools/damon/
+    # ./damo record "sleep 5"
+
+The tool will execute ``sleep 5`` by itself and record the data access patterns
+of the process.  Below example shows a pid target usage::
+
+    # sleep 5 &
+    # ./damo record `pidof sleep`
+
+You can set more detailed attributes and path to the recorded data file using
+optional arguments to the subcommand.  Use the ``-h`` option for more help.
+
+
+Analyzing Data Access Pattern
+-----------------------------
+
+The ``report`` subcommand reads a data access pattern record file (if not
+explicitly specified, reads ``./damon.data`` file if exists) and generates
+reports of various types.  You can specify what type of report you want using
+sub-subcommand to ``report`` subcommand.  For supported types, pass the ``-h``
+option to ``report`` subcommand.
+
+
+raw
+~~~
+
+``raw`` sub-subcommand simply transforms the record, which is storing the data
+access patterns in binary format to human readable text.  For example::
+
+    $ ./damo report raw
+    start_time:  193485829398
+    rel time:                0
+    nr_tasks:  1
+    pid:  1348
+    nr_regions:  4
+    560189609000-56018abce000(  22827008):  0
+    7fbdff59a000-7fbdffaf1a00(   5601792):  0
+    7fbdffaf1a00-7fbdffbb5000(    800256):  1
+    7ffea0dc0000-7ffea0dfd000(    249856):  0
+
+    rel time:        100000731
+    nr_tasks:  1
+    pid:  1348
+    nr_regions:  6
+    560189609000-56018abce000(  22827008):  0
+    7fbdff59a000-7fbdff8ce933(   3361075):  0
+    7fbdff8ce933-7fbdffaf1a00(   2240717):  1
+    7fbdffaf1a00-7fbdffb66d99(    480153):  0
+    7fbdffb66d99-7fbdffbb5000(    320103):  1
+    7ffea0dc0000-7ffea0dfd000(    249856):  0
+
+The first line shows recording started timestamp (nanosecond).  Records of data
+access patterns are following this.  Each record is sperated by a blank line.
+Each record first specifies the recorded time (``rel time``), number of
+monitored tasks in this record (``nr_tasks``).  Multiple number of records of
+data access pattern for each task continue.  Each data access pattern for each
+task shows first it's pid (``pid``) and number of monitored virtual address
+regions in this access pattern (``nr_regions``).  After that, each line shows
+start/end address, size, and number of monitored accesses to the region for
+each of the regions.
+
+
+heats
+~~~~~
+
+The ``raw`` type shows detailed information but it is exhaustive to manually
+read and analyzed.  For the reason, ``heats`` plots the data in heatmap form,
+using time as x-axis, virtual address as y-axis, and access frequency as
+z-axis.  Also, users set the resolution and start/end point of each axis via
+optional arguments.  For example::
+
+    $ ./damo report heats --tres 3 --ares 3
+    0               0               0.0
+    0               7609002         0.0
+    0               15218004        0.0
+    66112620851     0               0.0
+    66112620851     7609002         0.0
+    66112620851     15218004        0.0
+    132225241702    0               0.0
+    132225241702    7609002         0.0
+    132225241702    15218004        0.0
+
+This command shows the recorded access pattern of the ``sleep`` command using 3
+data points for each of time axis and address axis.  Therefore, it shows 9 data
+points in total.
+
+Users can easily converts this text output into heatmap image or other 3D
+representation using various tools such as 'gnuplot'.  ``raw`` sub-subcommand
+also provides 'gnuplot' based heatmap image creation.  For this, you can use
+``--heatmap`` option.  Also, note that because it uses 'gnuplot' internally, it
+will fail if 'gnuplot' is not installed on your system.  For example::
+
+    $ ./damo report heats --heatmap heatmap.png
+
+Creates ``heatmap.png`` file containing the heatmap image.  It supports
+``pdf``, ``png``, ``jpeg``, and ``svg``.
+
+For proper zoom in / zoom out, you need to see the layout of the record.  For
+that, use '--guide' option.  If the option is given, it will provide useful
+information about the records in the record file.  For example::
+
+    $ ./damo report heats --guide
+    pid:1348
+    time: 193485829398-198337863555 (4852034157)
+    region   0: 00000094564599762944-00000094564622589952 (22827008)
+    region   1: 00000140454009610240-00000140454016012288 (6402048)
+    region   2: 00000140731597193216-00000140731597443072 (249856)
+
+The output shows monitored regions (start and end addresses in byte) and
+monitored time duration (start and end time in nanosecond) of each target task.
+Therefore, it would be wise to plot only each region rather than plotting
+entire address space in one heatmap because the gaps between the regions are so
+huge in this case.
+
+
+wss
+~~~
+
+The ``wss`` type shows the distribution or time-varying working set sizes of
+the recorded workload using the records.  For example::
+
+    $ ./damo report wss
+    # <percentile> <wss>
+    # pid   1348
+    # avr:  66228
+    0       0
+    25      0
+    50      0
+    75      0
+    100     1920615
+
+Without any option, it shows the distribution of the working set sizes as
+above.  Basically it shows 0th, 25th, 50th, 75th, and 100th percentile and
+average of the measured working set sizes in the access pattern records.  In
+this case, the working set size was zero for 75th percentile but 1,920,615
+bytes in max and 66,228 in average.
+
+By setting the sort key of the percentile using '--sortby', you can also see
+how the working set size is chronologically changed.  For example::
+
+    $ ./damo report wss --sortby time
+    # <percentile> <wss>
+    # pid   1348
+    # avr:  66228
+    0       0
+    25      0
+    50      0
+    75      0
+    100     0
+
+The average is still 66,228.  And, because we sorted the working set using
+recorded time and the access is very short, we cannot show when the access
+made.
+
+Users can specify the resolution of the distribution (``--range``).  It also
+supports 'gnuplot' based simple visualization (``--plot``) of the distribution.
diff --git a/Documentation/admin-guide/mm/index.rst b/Documentation/admin-guide/mm/index.rst
index 11db46448354..d3d0ba373eb6 100644
--- a/Documentation/admin-guide/mm/index.rst
+++ b/Documentation/admin-guide/mm/index.rst
@@ -27,6 +27,7 @@ the Linux memory management.
 
    concepts
    cma_debugfs
+   data_access_monitor
    hugetlbpage
    idle_page_tracking
    ksm
-- 
2.17.1

