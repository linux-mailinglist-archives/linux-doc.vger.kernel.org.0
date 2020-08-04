Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 332E423B78A
	for <lists+linux-doc@lfdr.de>; Tue,  4 Aug 2020 11:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbgHDJTZ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 4 Aug 2020 05:19:25 -0400
Received: from smtp-fw-6001.amazon.com ([52.95.48.154]:25985 "EHLO
        smtp-fw-6001.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbgHDJTZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Aug 2020 05:19:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1596532753; x=1628068753;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KJ3mwej6vKfhQxGZYy5BqTBwgSUfFkmeP4xXT2NlByU=;
  b=MsJDtbVa6skQWZ0ee9lnPdMe7C6tkA9qFf1a2U+KWq0AZi/z0844pxXx
   H1aGMzlPkD4Sz8GxlL2CYoWSX74qxzyTZ3JApJS76aqCyg4lQ3EWcTsqG
   7LwAJp7yYqaJvXlc+KJR0SOZeEjh8LB+H1WfbrdyRqpJbMNiN8Zt/CD7H
   8=;
IronPort-SDR: WAn5IX1Sw2XtyWI2k62DI2aV+fbKDs6awORy+bVky9R9MFNDlvFc5Xy56y6aiDSqL1jCBUOnLk
 ihQI+4dsy17w==
X-IronPort-AV: E=Sophos;i="5.75,433,1589241600"; 
   d="scan'208";a="47335871"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-2b-859fe132.us-west-2.amazon.com) ([10.43.8.6])
  by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP; 04 Aug 2020 09:19:08 +0000
Received: from EX13MTAUEA002.ant.amazon.com (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
        by email-inbound-relay-2b-859fe132.us-west-2.amazon.com (Postfix) with ESMTPS id CA4DA2232DD;
        Tue,  4 Aug 2020 09:19:05 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 4 Aug 2020 09:19:05 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.162.248) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 4 Aug 2020 09:18:46 +0000
From:   SeongJae Park <sjpark@amazon.com>
To:     <akpm@linux-foundation.org>
CC:     SeongJae Park <sjpark@amazon.de>, <Jonathan.Cameron@Huawei.com>,
        <aarcange@redhat.com>, <acme@kernel.org>,
        <alexander.shishkin@linux.intel.com>, <amit@kernel.org>,
        <benh@kernel.crashing.org>, <brendan.d.gregg@gmail.com>,
        <brendanhiggins@google.com>, <cai@lca.pw>,
        <colin.king@canonical.com>, <corbet@lwn.net>, <david@redhat.com>,
        <dwmw@amazon.com>, <fan.du@intel.com>, <foersleo@amazon.de>,
        <gthelen@google.com>, <irogers@google.com>, <jolsa@redhat.com>,
        <kirill@shutemov.name>, <mark.rutland@arm.com>, <mgorman@suse.de>,
        <minchan@kernel.org>, <mingo@redhat.com>, <namhyung@kernel.org>,
        <peterz@infradead.org>, <rdunlap@infradead.org>,
        <riel@surriel.com>, <rientjes@google.com>, <rostedt@goodmis.org>,
        <rppt@kernel.org>, <sblbir@amazon.com>, <shakeelb@google.com>,
        <shuah@kernel.org>, <sj38.park@gmail.com>, <snu@amazon.de>,
        <vbabka@suse.cz>, <vdavydov.dev@gmail.com>,
        <yang.shi@linux.alibaba.com>, <ying.huang@intel.com>,
        <linux-damon@amazon.com>, <linux-mm@kvack.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v19 12/15] Documentation: Add documents for DAMON
Date:   Tue, 4 Aug 2020 11:14:13 +0200
Message-ID: <20200804091416.31039-13-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200804091416.31039-1-sjpark@amazon.com>
References: <20200804091416.31039-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.43.162.248]
X-ClientProxiedBy: EX13D36UWA004.ant.amazon.com (10.43.160.175) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

This commit adds documents for DAMON under
`Documentation/admin-guide/mm/damon/` and `Documentation/vm/damon/`.

Signed-off-by: SeongJae Park <sjpark@amazon.de>
---
 Documentation/admin-guide/mm/damon/guide.rst | 157 ++++++++++
 Documentation/admin-guide/mm/damon/index.rst |  15 +
 Documentation/admin-guide/mm/damon/plans.rst |  29 ++
 Documentation/admin-guide/mm/damon/start.rst |  96 ++++++
 Documentation/admin-guide/mm/damon/usage.rst | 302 +++++++++++++++++++
 Documentation/admin-guide/mm/index.rst       |   1 +
 Documentation/vm/damon/api.rst               |  20 ++
 Documentation/vm/damon/design.rst            | 166 ++++++++++
 Documentation/vm/damon/eval.rst              | 222 ++++++++++++++
 Documentation/vm/damon/faq.rst               |  58 ++++
 Documentation/vm/damon/index.rst             |  31 ++
 Documentation/vm/index.rst                   |   1 +
 12 files changed, 1098 insertions(+)
 create mode 100644 Documentation/admin-guide/mm/damon/guide.rst
 create mode 100644 Documentation/admin-guide/mm/damon/index.rst
 create mode 100644 Documentation/admin-guide/mm/damon/plans.rst
 create mode 100644 Documentation/admin-guide/mm/damon/start.rst
 create mode 100644 Documentation/admin-guide/mm/damon/usage.rst
 create mode 100644 Documentation/vm/damon/api.rst
 create mode 100644 Documentation/vm/damon/design.rst
 create mode 100644 Documentation/vm/damon/eval.rst
 create mode 100644 Documentation/vm/damon/faq.rst
 create mode 100644 Documentation/vm/damon/index.rst

diff --git a/Documentation/admin-guide/mm/damon/guide.rst b/Documentation/admin-guide/mm/damon/guide.rst
new file mode 100644
index 000000000000..c51fb843efaa
--- /dev/null
+++ b/Documentation/admin-guide/mm/damon/guide.rst
@@ -0,0 +1,157 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==================
+Optimization Guide
+==================
+
+This document helps you estimating the amount of benefit that you could get
+from DAMON-based optimizations, and describes how you could achieve it.  You
+are assumed to already read :doc:`start`.
+
+
+Check The Signs
+===============
+
+No optimization can provide same extent of benefit to every case.  Therefore
+you should first guess how much improvements you could get using DAMON.  If
+some of below conditions match your situation, you could consider using DAMON.
+
+- *Low IPC and High Cache Miss Ratios.*  Low IPC means most of the CPU time is
+  spent waiting for the completion of time-consuming operations such as memory
+  access, while high cache miss ratios mean the caches don't help it well.
+  DAMON is not for cache level optimization, but DRAM level.  However,
+  improving DRAM management will also help this case by reducing the memory
+  operation latency.
+- *Memory Over-commitment and Unknown Users.*  If you are doing memory
+  overcommitment and you cannot control every user of your system, a memory
+  bank run could happen at any time.  You can estimate when it will happen
+  based on DAMON's monitoring results and act earlier to avoid or deal better
+  with the crisis.
+- *Frequent Memory Pressure.*  Frequent memory pressure means your system has
+  wrong configurations or memory hogs.  DAMON will help you find the right
+  configuration and/or the criminals.
+- *Heterogeneous Memory System.*  If your system is utilizing memory devices
+  that placed between DRAM and traditional hard disks, such as non-volatile
+  memory or fast SSDs, DAMON could help you utilizing the devices more
+  efficiently.
+
+
+Profile
+=======
+
+If you found some positive signals, you could start by profiling your workloads
+using DAMON.  Find major workloads on your systems and analyze their data
+access pattern to find something wrong or can be improved.  The DAMON user
+space tool (``damo``) will be useful for this.
+
+We recommend you to start from working set size distribution check using ``damo
+report wss``.  If the distribution is ununiform or quite different from what
+you estimated, you could consider `Memory Configuration`_ optimization.
+
+Then, review the overall access pattern in heatmap form using ``damo report
+heats``.  If it shows a simple pattern consists of a small number of memory
+regions having high contrast of access temperature, you could consider manual
+`Program Modification`_.
+
+If you still want to absorb more benefits, you should develop `Personalized
+DAMON Application`_ for your special case.
+
+You don't need to take only one approach among the above plans, but you could
+use multiple of the above approaches to maximize the benefit.
+
+
+Optimize
+========
+
+If the profiling result also says it's worth trying some optimization, you
+could consider below approaches.  Note that some of the below approaches assume
+that your systems are configured with swap devices or other types of auxiliary
+memory so that you don't strictly required to accommodate the whole working set
+in the main memory.  Most of the detailed optimization should be made on your
+concrete understanding of your memory devices.
+
+
+Memory Configuration
+--------------------
+
+No more no less, DRAM should be large enough to accommodate only important
+working sets, because DRAM is highly performance critical but expensive and
+heavily consumes the power.  However, knowing the size of the real important
+working sets is difficult.  As a consequence, people usually equips
+unnecessarily large or too small DRAM.  Many problems stem from such wrong
+configurations.
+
+Using the working set size distribution report provided by ``damo report wss``,
+you can know the appropriate DRAM size for you.  For example, roughly speaking,
+if you worry about only 95 percentile latency, you don't need to equip DRAM of
+a size larger than 95 percentile working set size.
+
+Let's see a real example.  This `page
+<https://damonitor.github.io/doc/html/v17/admin-guide/mm/damon/guide.html#memory-configuration>`_
+shows the heatmap and the working set size distributions/changes of
+``freqmine`` workload in PARSEC3 benchmark suite.  The working set size spikes
+up to 180 MiB, but keeps smaller than 50 MiB for more than 95% of the time.
+Even though you give only 50 MiB of memory space to the workload, it will work
+well for 95% of the time.  Meanwhile, you can save the 130 MiB of memory space.
+
+
+Program Modification
+--------------------
+
+If the data access pattern heatmap plotted by ``damo report heats`` is quite
+simple so that you can understand how the things are going in the workload with
+your human eye, you could manually optimize the memory management.
+
+For example, suppose that the workload has two big memory object but only one
+object is frequently accessed while the other one is only occasionally
+accessed.  Then, you could modify the program source code to keep the hot
+object in the main memory by invoking ``mlock()`` or ``madvise()`` with
+``MADV_WILLNEED``.  Or, you could proactively evict the cold object using
+``madvise()`` with ``MADV_COLD`` or ``MADV_PAGEOUT``.  Using both together
+would be also worthy.
+
+A research work [1]_ using the ``mlock()`` achieved up to 2.55x performance
+speedup.
+
+Let's see another realistic example access pattern for this kind of
+optimizations.  This `page
+<https://damonitor.github.io/doc/html/v17/admin-guide/mm/damon/guide.html#program-modification>`_
+shows the visualized access patterns of streamcluster workload in PARSEC3
+benchmark suite.  We can easily identify the 100 MiB sized hot object.
+
+
+Personalized DAMON Application
+------------------------------
+
+Above approaches will work well for many general cases, but would not enough
+for some special cases.
+
+If this is the case, it might be the time to forget the comfortable use of the
+user space tool and dive into the debugfs interface (refer to :doc:`usage` for
+the detail) of DAMON.  Using the interface, you can control the DAMON more
+flexibly.  Therefore, you can write your personalized DAMON application that
+controls the monitoring via the debugfs interface, analyzes the result, and
+applies complex optimizations itself.  Using this, you can make more creative
+and wise optimizations.
+
+If you are a kernel space programmer, writing kernel space DAMON applications
+using the API (refer to the :doc:`/vm/damon/api` for more detail) would be an
+option.
+
+
+Reference Practices
+===================
+
+Referencing previously done successful practices could help you getting the
+sense for this kind of optimizations.  There is an academic paper [1]_
+reporting the visualized access pattern and manual `Program
+Modification`_ results for a number of realistic workloads.  You can also get
+the visualized access patterns [3]_ [4]_ [5]_ and automated DAMON-based memory
+operations results for other realistic workloads that collected with latest
+version of DAMON [2]_ .
+
+.. [1] https://dl.acm.org/doi/10.1145/3366626.3368125
+.. [2] https://damonitor.github.io/test/result/perf/latest/html/
+.. [3] https://damonitor.github.io/test/result/visual/latest/rec.heatmap.1.png.html
+.. [4] https://damonitor.github.io/test/result/visual/latest/rec.wss_sz.png.html
+.. [5] https://damonitor.github.io/test/result/visual/latest/rec.wss_time.png.html
diff --git a/Documentation/admin-guide/mm/damon/index.rst b/Documentation/admin-guide/mm/damon/index.rst
new file mode 100644
index 000000000000..0baae7a5402b
--- /dev/null
+++ b/Documentation/admin-guide/mm/damon/index.rst
@@ -0,0 +1,15 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+========================
+Monitoring Data Accesses
+========================
+
+:doc:`DAMON </vm/damon/index>` allows light-weight data access monitoring.
+Using this, users can analyze and optimize their systems.
+
+.. toctree::
+   :maxdepth: 2
+
+   start
+   guide
+   usage
diff --git a/Documentation/admin-guide/mm/damon/plans.rst b/Documentation/admin-guide/mm/damon/plans.rst
new file mode 100644
index 000000000000..e3aa5ab96c29
--- /dev/null
+++ b/Documentation/admin-guide/mm/damon/plans.rst
@@ -0,0 +1,29 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+============
+Future Plans
+============
+
+DAMON is still on its first stage.  Below plans are still under development.
+
+
+Automate Data Access Monitoring-based Memory Operation Schemes Execution
+========================================================================
+
+The ultimate goal of DAMON is to be used as a building block for the data
+access pattern aware kernel memory management optimization.  It will make
+system just works efficiently.  However, some users having very special
+workloads will want to further do their own optimization.  DAMON will automate
+most of the tasks for such manual optimizations in near future.  Users will be
+required to only describe what kind of data access pattern-based operation
+schemes they want in a simple form.
+
+By applying a very simple scheme for THP promotion/demotion with a prototype
+implementation, DAMON reduced 60% of THP memory footprint overhead while
+preserving 50% of the THP performance benefit.  The detailed results can be
+seen on an external web page [1]_.
+
+Several RFC patchsets for this plan are available [2]_.
+
+.. [1] https://damonitor.github.io/test/result/perf/latest/html/
+.. [2] https://lore.kernel.org/linux-mm/20200616073828.16509-1-sjpark@amazon.com/
diff --git a/Documentation/admin-guide/mm/damon/start.rst b/Documentation/admin-guide/mm/damon/start.rst
new file mode 100644
index 000000000000..deed2ea2321e
--- /dev/null
+++ b/Documentation/admin-guide/mm/damon/start.rst
@@ -0,0 +1,96 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===============
+Getting Started
+===============
+
+This document briefly describes how you can use DAMON by demonstrating its
+default user space tool.  Please note that this document describes only a part
+of its features for brevity.  Please refer to :doc:`usage` for more details.
+
+
+TL; DR
+======
+
+Follow below 5 commands to monitor and visualize the access pattern of your
+workload. ::
+
+    $ git clone https://github.com/sjp38/linux -b damon/master
+    /* build the kernel with CONFIG_DAMON=y, install, reboot */
+    $ mount -t debugfs none /sys/kernel/debug/
+    $ cd linux/tools/damon
+    $ ./damo record $(pidof <your workload>)
+    $ ./damo report heats --heatmap access_pattern.png
+
+
+Prerequisites
+=============
+
+Kernel
+------
+
+You should first ensure your system is running on a kernel built with
+``CONFIG_DAMON=y``.
+
+
+User Space Tool
+---------------
+
+For the demonstration, we will use the default user space tool for DAMON,
+called DAMON Operator (DAMO).  It is located at ``tools/damon/damo`` of the
+kernel source tree.  For brevity, below examples assume you set ``$PATH`` to
+point it.  It's not mandatory, though.
+
+Because DAMO is using the debugfs interface (refer to :doc:`usage` for the
+detail) of DAMON, you should ensure debugfs is mounted.  Mount it manually as
+below::
+
+    # mount -t debugfs none /sys/kernel/debug/
+
+or append below line to your ``/etc/fstab`` file so that your system can
+automatically mount debugfs from next booting::
+
+    debugfs /sys/kernel/debug debugfs defaults 0 0
+
+
+Recording Data Access Patterns
+==============================
+
+Below commands record memory access pattern of a program and save the
+monitoring results in a file. ::
+
+    $ git clone https://github.com/sjp38/masim
+    $ cd masim; make; ./masim ./configs/zigzag.cfg &
+    $ sudo damo record -o damon.data $(pidof masim)
+
+The first two lines of the commands get an artificial memory access generator
+program and runs it in the background.  It will repeatedly access two 100 MiB
+sized memory regions one by one.  You can substitute this with your real
+workload.  The last line asks ``damo`` to record the access pattern in
+``damon.data`` file.
+
+
+Visualizing Recorded Patterns
+=============================
+
+Below three commands visualize the recorded access patterns into three
+image files. ::
+
+    $ damo report heats --heatmap access_pattern_heatmap.png
+    $ damo report wss --range 0 101 1 --plot wss_dist.png
+    $ damo report wss --range 0 101 1 --sortby time --plot wss_chron_change.png
+
+- ``access_pattern_heatmap.png`` will show the data access pattern in a
+  heatmap, which shows when (x-axis) what memory region (y-axis) is how
+  frequently accessed (color).
+- ``wss_dist.png`` will show the distribution of the working set size.
+- ``wss_chron_change.png`` will show how the working set size has
+  chronologically changed.
+
+You can show the images in a web page [1]_ .  Those made with other realistic
+workloads are also available [2]_ [3]_ [4]_.
+
+.. [1] https://damonitor.github.io/doc/html/v17/admin-guide/mm/damon/start.html#visualizing-recorded-patterns
+.. [2] https://damonitor.github.io/test/result/visual/latest/rec.heatmap.1.png.html
+.. [3] https://damonitor.github.io/test/result/visual/latest/rec.wss_sz.png.html
+.. [4] https://damonitor.github.io/test/result/visual/latest/rec.wss_time.png.html
diff --git a/Documentation/admin-guide/mm/damon/usage.rst b/Documentation/admin-guide/mm/damon/usage.rst
new file mode 100644
index 000000000000..a6606d27a559
--- /dev/null
+++ b/Documentation/admin-guide/mm/damon/usage.rst
@@ -0,0 +1,302 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===============
+Detailed Usages
+===============
+
+DAMON provides below three interfaces for different users.
+
+- *DAMON user space tool.*
+  This is for privileged people such as system administrators who want a
+  just-working human-friendly interface.  Using this, users can use the DAMON’s
+  major features in a human-friendly way.  It may not be highly tuned for
+  special cases, though.  It supports only virtual address spaces monitoring.
+- *debugfs interface.*
+  This is for privileged user space programmers who want more optimized use of
+  DAMON.  Using this, users can use DAMON’s major features by reading
+  from and writing to special debugfs files.  Therefore, you can write and use
+  your personalized DAMON debugfs wrapper programs that reads/writes the
+  debugfs files instead of you.  The DAMON user space tool is also a reference
+  implementation of such programs.  It supports only virtual address spaces
+  monitoring.
+- *Kernel Space Programming Interface.*
+  This is for kernel space programmers.  Using this, users can utilize every
+  feature of DAMON most flexibly and efficiently by writing kernel space
+  DAMON application programs for you.  You can even extend DAMON for various
+  address spaces.
+
+This document does not describe the kernel space programming interface in
+detail.  For that, please refer to the :doc:`/vm/damon/api`.
+
+
+DAMON User Space Tool
+=====================
+
+A reference implementation of the DAMON user space tools which provides a
+convenient user interface is in the kernel source tree.  It is located at
+``tools/damon/damo`` of the tree.
+
+The tool provides a subcommands based interface.  Every subcommand provides
+``-h`` option, which provides the minimal usage of it.  Currently, the tool
+supports two subcommands, ``record`` and ``report``.
+
+Below example commands assume you set ``$PATH`` to point ``tools/damon/`` for
+brevity.  It is not mandatory for use of ``damo``, though.
+
+
+Recording Data Access Pattern
+-----------------------------
+
+The ``record`` subcommand records the data access pattern of target workloads
+in a file (``./damon.data`` by default).  You can specify the target with 1)
+the command for execution of the monitoring target process, or 2) pid of
+running target process.  Below example shows a command target usage::
+
+    # cd <kernel>/tools/damon/
+    # damo record "sleep 5"
+
+The tool will execute ``sleep 5`` by itself and record the data access patterns
+of the process.  Below example shows a pid target usage::
+
+    # sleep 5 &
+    # damo record `pidof sleep`
+
+The location of the recorded file can be explicitly set using ``-o`` option.
+You can further tune this by setting the monitoring attributes.  To know about
+the monitoring attributes in detail, please refer to the
+:doc:`/vm/damon/design`.
+
+
+Analyzing Data Access Pattern
+-----------------------------
+
+The ``report`` subcommand reads a data access pattern record file (if not
+explicitly specified using ``-i`` option, reads ``./damon.data`` file by
+default) and generates human-readable reports.  You can specify what type of
+report you want using a sub-subcommand to ``report`` subcommand.  ``raw``,
+``heats``, and ``wss`` report types are supported for now.
+
+
+raw
+~~~
+
+``raw`` sub-subcommand simply transforms the binary record into a
+human-readable text.  For example::
+
+    $ damo report raw
+    start_time:  193485829398
+    rel time:                0
+    nr_tasks:  1
+    target_id:  1348
+    nr_regions:  4
+    560189609000-56018abce000(  22827008):  0
+    7fbdff59a000-7fbdffaf1a00(   5601792):  0
+    7fbdffaf1a00-7fbdffbb5000(    800256):  1
+    7ffea0dc0000-7ffea0dfd000(    249856):  0
+
+    rel time:        100000731
+    nr_tasks:  1
+    target_id:  1348
+    nr_regions:  6
+    560189609000-56018abce000(  22827008):  0
+    7fbdff59a000-7fbdff8ce933(   3361075):  0
+    7fbdff8ce933-7fbdffaf1a00(   2240717):  1
+    7fbdffaf1a00-7fbdffb66d99(    480153):  0
+    7fbdffb66d99-7fbdffbb5000(    320103):  1
+    7ffea0dc0000-7ffea0dfd000(    249856):  0
+
+The first line shows the recording started timestamp (nanosecond).  Records of
+data access patterns follows.  Each record is separated by a blank line.  Each
+record first specifies the recorded time (``rel time``) in relative to the
+start time, the number of monitored tasks in this record (``nr_tasks``).
+Recorded data access patterns of each task follow.  Each data access pattern
+for each task shows the target's pid (``target_id``) and a number of monitored
+address regions in this access pattern (``nr_regions``) first.  After that,
+each line shows the start/end address, size, and the number of observed
+accesses of each region.
+
+
+heats
+~~~~~
+
+The ``raw`` output is very detailed but hard to manually read.  ``heats``
+sub-subcommand plots the data in 3-dimensional form, which represents the time
+in x-axis, address of regions in y-axis, and the access frequency in z-axis.
+Users can set the resolution of the map (``--tres`` and ``--ares``) and
+start/end point of each axis (``--tmin``, ``--tmax``, ``--amin``, and
+``--amax``) via optional arguments.  For example::
+
+    $ damo report heats --tres 3 --ares 3
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
+This command shows a recorded access pattern in heatmap of 3x3 resolution.
+Therefore it shows 9 data points in total.  Each line shows each of the data
+points.  The three numbers in each line represent time in nanosecond, address,
+and the observed access frequency.
+
+Users will be able to convert this text output into a heatmap image (represents
+z-axis values with colors) or other 3D representations using various tools such
+as 'gnuplot'.  For more convenience, ``heats`` sub-subcommand provides the
+'gnuplot' based heatmap image creation.  For this, you can use ``--heatmap``
+option.  Also, note that because it uses 'gnuplot' internally, it will fail if
+'gnuplot' is not installed on your system.  For example::
+
+    $ ./damo report heats --heatmap heatmap.png
+
+Creates the heatmap image in ``heatmap.png`` file.  It supports ``pdf``,
+``png``, ``jpeg``, and ``svg``.
+
+If the target address space is virtual memory address space and you plot the
+entire address space, the huge unmapped regions will make the picture looks
+only black.  Therefore you should do proper zoom in / zoom out using the
+resolution and axis boundary-setting arguments.  To make this effort minimal,
+you can use ``--guide`` option as below::
+
+    $ ./damo report heats --guide
+    target_id:1348
+    time: 193485829398-198337863555 (4852034157)
+    region   0: 00000094564599762944-00000094564622589952 (22827008)
+    region   1: 00000140454009610240-00000140454016012288 (6402048)
+    region   2: 00000140731597193216-00000140731597443072 (249856)
+
+The output shows unions of monitored regions (start and end addresses in byte)
+and the union of monitored time duration (start and end time in nanoseconds) of
+each target task.  Therefore, it would be wise to plot the data points in each
+union.  If no axis boundary option is given, it will automatically find the
+biggest union in ``--guide`` output and set the boundary in it.
+
+
+wss
+~~~
+
+The ``wss`` type extracts the distribution and chronological working set size
+changes from the records.  For example::
+
+    $ ./damo report wss
+    # <percentile> <wss>
+    # target_id   1348
+    # avr:  66228
+    0       0
+    25      0
+    50      0
+    75      0
+    100     1920615
+
+Without any option, it shows the distribution of the working set sizes as
+above.  It shows 0th, 25th, 50th, 75th, and 100th percentile and the average of
+the measured working set sizes in the access pattern records.  In this case,
+the working set size was zero for 75th percentile but 1,920,615 bytes in max
+and 66,228 bytes on average.
+
+By setting the sort key of the percentile using '--sortby', you can show how
+the working set size has chronologically changed.  For example::
+
+    $ ./damo report wss --sortby time
+    # <percentile> <wss>
+    # target_id   1348
+    # avr:  66228
+    0       0
+    25      0
+    50      0
+    75      0
+    100     0
+
+The average is still 66,228.  And, because the access was spiked in very short
+duration and this command plots only 4 data points, we cannot show when the
+access spikes made.  Users can specify the resolution of the distribution
+(``--range``).  By giving more fine resolution, the short duration spikes could
+be found.
+
+Similar to that of ``heats --heatmap``, it also supports 'gnuplot' based simple
+visualization of the distribution via ``--plot`` option.
+
+
+debugfs Interface
+=================
+
+DAMON exports four files, ``attrs``, ``target_ids``, ``record``, and
+``monitor_on`` under its debugfs directory, ``<debugfs>/damon/``.
+
+
+Attributes
+----------
+
+Users can get and set the ``sampling interval``, ``aggregation interval``,
+``regions update interval``, and min/max number of monitoring target regions by
+reading from and writing to the ``attrs`` file.  To know about the monitoring
+attributes in detail, please refer to the :doc:`/vm/damon/design`.  For
+example, below commands set those values to 5 ms, 100 ms, 1,000 ms, 10 and
+1000, and then check it again::
+
+    # cd <debugfs>/damon
+    # echo 5000 100000 1000000 10 1000 > attrs
+    # cat attrs
+    5000 100000 1000000 10 1000
+
+
+Target IDs
+----------
+
+Some types of address spaces supports multiple monitoring target.  For example,
+the virtual memory address spaces monitoring can have multiple processes as the
+monitoring targets.  Users can set the targets by writing relevant id values of
+the targets to, and get the ids of the current targets by reading from the
+``target_ids`` file.  In case of the virtual address spaces monitoring, the
+values should be pids of the monitoring target processes.  For example, below
+commands set processes having pids 42 and 4242 as the monitoring targets and
+check it again::
+
+    # cd <debugfs>/damon
+    # echo 42 4242 > target_ids
+    # cat target_ids
+    42 4242
+
+Note that setting the target ids doesn't start the monitoring.
+
+
+Record
+------
+
+This debugfs file allows you to record monitored access patterns in a regular
+binary file.  The recorded results are first written in an in-memory buffer and
+flushed to a file in batch.  Users can get and set the size of the buffer and
+the path to the result file by reading from and writing to the ``record`` file.
+For example, below commands set the buffer to be 4 KiB and the result to be
+saved in ``/damon.data``. ::
+
+    # cd <debugfs>/damon
+    # echo "4096 /damon.data" > record
+    # cat record
+    4096 /damon.data
+
+The recording can be disabled by setting the buffer size zero.
+
+
+Turning On/Off
+--------------
+
+Setting the files as described above doesn't incur effect unless you explicitly
+start the monitoring.  You can start, stop, and check the current status of the
+monitoring by writing to and reading from the ``monitor_on`` file.  Writing
+``on`` to the file starts the monitoring of the targets with the attributes.
+Writing ``off`` to the file stops those.  DAMON also stops if every target
+process is terminated.  Below example commands turn on, off, and check the
+status of DAMON::
+
+    # cd <debugfs>/damon
+    # echo on > monitor_on
+    # echo off > monitor_on
+    # cat monitor_on
+    off
+
+Please note that you cannot write to the above-mentioned debugfs files while
+the monitoring is turned on.  If you write to the files while DAMON is running,
+an error code such as ``-EBUSY`` will be returned.
diff --git a/Documentation/admin-guide/mm/index.rst b/Documentation/admin-guide/mm/index.rst
index 11db46448354..e6de5cd41945 100644
--- a/Documentation/admin-guide/mm/index.rst
+++ b/Documentation/admin-guide/mm/index.rst
@@ -27,6 +27,7 @@ the Linux memory management.
 
    concepts
    cma_debugfs
+   damon/index
    hugetlbpage
    idle_page_tracking
    ksm
diff --git a/Documentation/vm/damon/api.rst b/Documentation/vm/damon/api.rst
new file mode 100644
index 000000000000..649409828eab
--- /dev/null
+++ b/Documentation/vm/damon/api.rst
@@ -0,0 +1,20 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=============
+API Reference
+=============
+
+Kernel space programs can use every feature of DAMON using below APIs.  All you
+need to do is including ``damon.h``, which is located in ``include/linux/`` of
+the source tree.
+
+Structures
+==========
+
+.. kernel-doc:: include/linux/damon.h
+
+
+Functions
+=========
+
+.. kernel-doc:: mm/damon.c
diff --git a/Documentation/vm/damon/design.rst b/Documentation/vm/damon/design.rst
new file mode 100644
index 000000000000..727d72093f8f
--- /dev/null
+++ b/Documentation/vm/damon/design.rst
@@ -0,0 +1,166 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+======
+Design
+======
+
+Configurable Layers
+===================
+
+DAMON provides data access monitoring functionality while making the accuracy
+and the overhead controllable.  The fundamental access monitorings require
+primitives that dependent on and optimized for the target address space.  On
+the other hand, the accuracy and overhead tradeoff mechanism, which is the core
+of DAMON, is in the pure logic space.  DAMON separates the two parts in
+different layers and defines its interface to allow various low level
+primitives implementations configurable with the core logic.
+
+Due to this separated design and the configurable interface, users can extend
+DAMON for any address space by configuring the core logics with appropriate low
+level primitive implementations.  If appropriate one is not provided, users can
+implement the primitives on their own.
+
+For example, physical memory, virtual memory, swap space, those for specific
+processes, NUMA nodes, files, and backing memory devices would be supportable.
+Also, if some architectures or devices support special optimized access check
+primitives, those will be easily configurable.
+
+
+Reference Implementations of Address Space Specific Primitives
+==============================================================
+
+The low level primitives for the fundamental access monitoring are defined in
+two parts:
+
+1. Identification of the monitoring target address range for the address space.
+2. Access check of specific address range in the target space.
+
+DAMON currently provides the implementation of the primitives for only the
+virtual address spaces. Below two subsections describe how it works.
+
+
+PTE Accessed-bit Based Access Check
+-----------------------------------
+
+The implementation for the virtual address space uses PTE Accessed-bit for
+basic access checks.  It finds the relevant PTE Accessed bit from the address
+by walking the page table for the target task of the address.  In this way, the
+implementation finds and clears the bit for next sampling target address and
+checks whether the bit set again after one sampling period.  This could disturb
+other kernel subsystems using the Accessed bits, namely Idle page tracking and
+the reclaim logic.  To avoid such disturbances, DAMON makes it mutually
+exclusive with Idle page tracking and uses ``PG_idle`` and ``PG_young`` page
+flags to solve the conflict with the reclaim logic, as Idle page tracking does.
+
+
+VMA-based Target Address Range Construction
+-------------------------------------------
+
+Only small parts in the super-huge virtual address space of the processes are
+mapped to the physical memory and accessed.  Thus, tracking the unmapped
+address regions is just wasteful.  However, because DAMON can deal with some
+level of noise using the adaptive regions adjustment mechanism, tracking every
+mapping is not strictly required but could even incur a high overhead in some
+cases.  That said, too huge unmapped areas inside the monitoring target should
+be removed to not take the time for the adaptive mechanism.
+
+For the reason, this implementation converts the complex mappings to three
+distinct regions that cover every mapped area of the address space.  The two
+gaps between the three regions are the two biggest unmapped areas in the given
+address space.  The two biggest unmapped areas would be the gap between the
+heap and the uppermost mmap()-ed region, and the gap between the lowermost
+mmap()-ed region and the stack in most of the cases.  Because these gaps are
+exceptionally huge in usual address spaces, excluding these will be sufficient
+to make a reasonable trade-off.  Below shows this in detail::
+
+    <heap>
+    <BIG UNMAPPED REGION 1>
+    <uppermost mmap()-ed region>
+    (small mmap()-ed regions and munmap()-ed regions)
+    <lowermost mmap()-ed region>
+    <BIG UNMAPPED REGION 2>
+    <stack>
+
+
+Address Space Independent Core Mechanisms
+=========================================
+
+Below four sections describe each of the DAMON core mechanisms and the five
+monitoring attributes, ``sampling interval``, ``aggregation interval``,
+``regions update interval``, ``minimum number of regions``, and ``maximum
+number of regions``.
+
+
+Access Frequency Monitoring
+---------------------------
+
+The output of DAMON says what pages are how frequently accessed for a given
+duration.  The resolution of the access frequency is controlled by setting
+``sampling interval`` and ``aggregation interval``.  In detail, DAMON checks
+access to each page per ``sampling interval`` and aggregates the results.  In
+other words, counts the number of the accesses to each page.  After each
+``aggregation interval`` passes, DAMON calls callback functions that previously
+registered by users so that users can read the aggregated results and then
+clears the results.  This can be described in below simple pseudo-code::
+
+    while monitoring_on:
+        for page in monitoring_target:
+            if accessed(page):
+                nr_accesses[page] += 1
+        if time() % aggregation_interval == 0:
+            for callback in user_registered_callbacks:
+                callback(monitoring_target, nr_accesses)
+            for page in monitoring_target:
+                nr_accesses[page] = 0
+        sleep(sampling interval)
+
+The monitoring overhead of this mechanism will arbitrarily increase as the
+size of the target workload grows.
+
+
+Region Based Sampling
+---------------------
+
+To avoid the unbounded increase of the overhead, DAMON groups adjacent pages
+that assumed to have the same access frequencies into a region.  As long as the
+assumption (pages in a region have the same access frequencies) is kept, only
+one page in the region is required to be checked.  Thus, for each ``sampling
+interval``, DAMON randomly picks one page in each region, waits for one
+``sampling interval``, checks whether the page is accessed meanwhile, and
+increases the access frequency of the region if so.  Therefore, the monitoring
+overhead is controllable by setting the number of regions.  DAMON allows users
+to set the minimum and the maximum number of regions for the trade-off.
+
+This scheme, however, cannot preserve the quality of the output if the
+assumption is not guaranteed.
+
+
+Adaptive Regions Adjustment
+---------------------------
+
+Even somehow the initial monitoring target regions are well constructed to
+fulfill the assumption (pages in same region have similar access frequencies),
+the data access pattern can be dynamically changed.  This will result in low
+monitoring quality.  To keep the assumption as much as possible, DAMON
+adaptively merges and splits each region based on their access frequency.
+
+For each ``aggregation interval``, it compares the access frequencies of
+adjacent regions and merges those if the frequency difference is small.  Then,
+after it reports and clears the aggregated access frequency of each region, it
+splits each region into two or three regions if the total number of regions
+will not exceed the user-specified maximum number of regions after the split.
+
+In this way, DAMON provides its best-effort quality and minimal overhead while
+keeping the bounds users set for their trade-off.
+
+
+Dynamic Target Space Updates Handling
+-------------------------------------
+
+The monitoring target address range could dynamically changed.  For example,
+virtual memory could be dynamically mapped and unmapped.  Physical memory could
+be hot-plugged.
+
+As the changes could be quite frequent in some cases, DAMON checks the dynamic
+memory mapping changes and applies it to the abstracted target area only for
+each of a user-specified time interval (``regions update interval``).
diff --git a/Documentation/vm/damon/eval.rst b/Documentation/vm/damon/eval.rst
new file mode 100644
index 000000000000..b233890b4e45
--- /dev/null
+++ b/Documentation/vm/damon/eval.rst
@@ -0,0 +1,222 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==========
+Evaluation
+==========
+
+DAMON is lightweight.  It increases system memory usage by only -0.25% and
+consumes less than 1% CPU time in most case.  It slows target workloads down by
+only 0.94%.
+
+DAMON is accurate and useful for memory management optimizations.  An
+experimental DAMON-based operation scheme for THP, 'ethp', removes 31.29% of
+THP memory overheads while preserving 60.64% of THP speedup.  Another
+experimental DAMON-based 'proactive reclamation' implementation, 'prcl',
+reduces 87.95% of residential sets and 29.52% of system memory footprint while
+incurring only 2.15% runtime overhead in the best case (parsec3/freqmine).
+
+Setup
+=====
+
+On a QEMU/KVM based virtual machine utilizing 20GB of RAM and hosted by an
+Intel i7 machine that running a kernel that v16 DAMON patchset is applied, I
+measure runtime and consumed system memory while running various realistic
+workloads with several configurations.  I use 13 and 12 workloads in PARSEC3
+[3]_ and SPLASH-2X [4]_ benchmark suites, respectively.  I use another wrapper
+scripts [5]_ for convenient setup and run of the workloads.
+
+Measurement
+-----------
+
+For the measurement of the amount of consumed memory in system global scope, I
+drop caches before starting each of the workloads and monitor 'MemFree' in the
+'/proc/meminfo' file.  To make results more stable, I repeat the runs 5 times
+and average results.
+
+Configurations
+--------------
+
+The configurations I use are as below.
+
+- orig: Linux v5.7 with 'madvise' THP policy
+- rec: 'orig' plus DAMON running with virtual memory access recording
+- prec: 'orig' plus DAMON running with physical memory access recording
+- thp: same with 'orig', but use 'always' THP policy
+- ethp: 'orig' plus a DAMON operation scheme, 'efficient THP'
+- prcl: 'orig' plus a DAMON operation scheme, 'proactive reclaim [6]_'
+
+I use 'rec' for measurement of DAMON overheads to target workloads and system
+memory.  'prec' is for physical memory monitroing and recording.  It monitors
+17GB sized 'System RAM' region.  The remaining configs including 'thp', 'ethp',
+and 'prcl' are for measurement of DAMON monitoring accuracy.
+
+'ethp' and 'prcl' are simple DAMON-based operation schemes developed for
+proof of concepts of DAMON.  'ethp' reduces memory space waste of THP by using
+DAMON for the decision of promotions and demotion for huge pages, while 'prcl'
+is as similar as the original work.  Those are implemented as below::
+
+    # format: <min/max size> <min/max frequency (0-100)> <min/max age> <action>
+    # ethp: Use huge pages if a region shows >=5% access rate, use regular
+    # pages if a region >=2MB shows <5% access rate for >=13 seconds
+    null    null    5       null    null    null    hugepage
+    2M      null    null    null    13s     null    nohugepage
+
+    # prcl: If a region >=4KB shows <=5% access rate for >=7 seconds, page out.
+    4K null    null 5    7s null      pageout
+
+Note that both 'ethp' and 'prcl' are designed with my only straightforward
+intuition because those are for only proof of concepts and monitoring accuracy
+of DAMON.  In other words, those are not for production.  For production use,
+those should be more tuned.
+
+.. [1] "Redis latency problems troubleshooting", https://redis.io/topics/latency
+.. [2] "Disable Transparent Huge Pages (THP)",
+    https://docs.mongodb.com/manual/tutorial/transparent-huge-pages/
+.. [3] "The PARSEC Becnhmark Suite", https://parsec.cs.princeton.edu/index.htm
+.. [4] "SPLASH-2x", https://parsec.cs.princeton.edu/parsec3-doc.htm#splash2x
+.. [5] "parsec3_on_ubuntu", https://github.com/sjp38/parsec3_on_ubuntu
+.. [6] "Proactively reclaiming idle memory", https://lwn.net/Articles/787611/
+
+Results
+=======
+
+Below two tables show the measurement results.  The runtimes are in seconds
+while the memory usages are in KiB.  Each configuration except 'orig' shows
+its overhead relative to 'orig' in percent within parenthesizes.::
+
+    runtime                 orig     rec      (overhead) prec     (overhead) thp      (overhead) ethp     (overhead) prcl     (overhead)
+    parsec3/blackscholes    107.228  107.859  (0.59)     108.110  (0.82)     107.381  (0.14)     106.811  (-0.39)    114.766  (7.03)
+    parsec3/bodytrack       79.292   79.609   (0.40)     79.777   (0.61)     79.313   (0.03)     78.892   (-0.50)    80.398   (1.40)
+    parsec3/canneal         148.887  150.878  (1.34)     153.337  (2.99)     127.873  (-14.11)   132.272  (-11.16)   167.631  (12.59)
+    parsec3/dedup           11.970   11.975   (0.04)     12.024   (0.45)     11.752   (-1.82)    11.921   (-0.41)    13.244   (10.64)
+    parsec3/facesim         212.800  215.927  (1.47)     215.004  (1.04)     205.117  (-3.61)    207.401  (-2.54)    220.834  (3.78)
+    parsec3/ferret          190.646  192.560  (1.00)     192.414  (0.93)     190.662  (0.01)     192.309  (0.87)     193.497  (1.50)
+    parsec3/fluidanimate    213.951  216.459  (1.17)     217.578  (1.70)     209.500  (-2.08)    211.826  (-0.99)    218.299  (2.03)
+    parsec3/freqmine        291.050  292.117  (0.37)     293.279  (0.77)     289.553  (-0.51)    291.768  (0.25)     297.309  (2.15)
+    parsec3/raytrace        118.645  119.734  (0.92)     119.521  (0.74)     117.715  (-0.78)    118.844  (0.17)     134.045  (12.98)
+    parsec3/streamcluster   332.843  336.997  (1.25)     337.049  (1.26)     279.716  (-15.96)   290.985  (-12.58)   346.646  (4.15)
+    parsec3/swaptions       155.437  157.174  (1.12)     156.159  (0.46)     155.017  (-0.27)    154.955  (-0.31)    156.555  (0.72)
+    parsec3/vips            59.215   59.426   (0.36)     59.156   (-0.10)    59.243   (0.05)     58.858   (-0.60)    60.184   (1.64)
+    parsec3/x264            67.445   71.400   (5.86)     71.122   (5.45)     64.078   (-4.99)    66.027   (-2.10)    71.489   (6.00)
+    splash2x/barnes         81.826   81.800   (-0.03)    82.648   (1.00)     74.343   (-9.15)    79.063   (-3.38)    103.785  (26.84)
+    splash2x/fft            33.850   34.148   (0.88)     33.912   (0.18)     23.493   (-30.60)   32.684   (-3.44)    48.303   (42.70)
+    splash2x/lu_cb          86.404   86.333   (-0.08)    86.988   (0.68)     85.720   (-0.79)    85.944   (-0.53)    89.338   (3.40)
+    splash2x/lu_ncb         94.908   98.021   (3.28)     96.041   (1.19)     90.304   (-4.85)    93.279   (-1.72)    97.270   (2.49)
+    splash2x/ocean_cp       47.122   47.391   (0.57)     47.902   (1.65)     43.227   (-8.26)    44.609   (-5.33)    51.410   (9.10)
+    splash2x/ocean_ncp      93.147   92.911   (-0.25)    93.886   (0.79)     51.451   (-44.76)   71.107   (-23.66)   112.554  (20.83)
+    splash2x/radiosity      92.150   92.604   (0.49)     93.339   (1.29)     90.802   (-1.46)    91.824   (-0.35)    104.439  (13.34)
+    splash2x/radix          31.961   32.113   (0.48)     32.066   (0.33)     25.184   (-21.20)   30.412   (-4.84)    49.989   (56.41)
+    splash2x/raytrace       84.781   85.278   (0.59)     84.763   (-0.02)    83.192   (-1.87)    83.970   (-0.96)    85.382   (0.71)
+    splash2x/volrend        87.401   87.978   (0.66)     87.977   (0.66)     86.636   (-0.88)    87.169   (-0.26)    88.043   (0.73)
+    splash2x/water_nsquared 239.140  239.570  (0.18)     240.901  (0.74)     221.323  (-7.45)    224.670  (-6.05)    244.492  (2.24)
+    splash2x/water_spatial  89.538   89.978   (0.49)     90.171   (0.71)     89.729   (0.21)     89.238   (-0.34)    99.331   (10.94)
+    total                   3051.620 3080.230 (0.94)     3085.130 (1.10)     2862.320 (-6.20)    2936.830 (-3.76)    3249.240 (6.48)
+
+
+    memused.avg             orig         rec          (overhead) prec         (overhead) thp          (overhead) ethp         (overhead) prcl         (overhead)
+    parsec3/blackscholes    1676679.200  1683789.200  (0.42)     1680281.200  (0.21)     1613817.400  (-3.75)    1835229.200  (9.46)     1407952.800  (-16.03)
+    parsec3/bodytrack       1295736.000  1308412.600  (0.98)     1311988.000  (1.25)     1243417.400  (-4.04)    1435410.600  (10.78)    1255566.400  (-3.10)
+    parsec3/canneal         1004062.000  1008823.800  (0.47)     1000100.200  (-0.39)    983976.000   (-2.00)    1051719.600  (4.75)     993055.800   (-1.10)
+    parsec3/dedup           2389765.800  2393381.000  (0.15)     2366668.200  (-0.97)    2412948.600  (0.97)     2435885.600  (1.93)     2380172.800  (-0.40)
+    parsec3/facesim         488927.200   498228.000   (1.90)     496683.800   (1.59)     476327.800   (-2.58)    552890.000   (13.08)    449143.600   (-8.14)
+    parsec3/ferret          280324.600   282032.400   (0.61)     282284.400   (0.70)     258211.000   (-7.89)    331493.800   (18.25)    265850.400   (-5.16)
+    parsec3/fluidanimate    560636.200   569038.200   (1.50)     565067.400   (0.79)     556923.600   (-0.66)    588021.200   (4.88)     512901.600   (-8.51)
+    parsec3/freqmine        883286.000   904960.200   (2.45)     886105.200   (0.32)     849347.400   (-3.84)    998358.000   (13.03)    622542.800   (-29.52)
+    parsec3/raytrace        1639370.200  1642318.200  (0.18)     1626673.200  (-0.77)    1591284.200  (-2.93)    1755088.400  (7.06)     1410261.600  (-13.98)
+    parsec3/streamcluster   116955.600   127251.400   (8.80)     121441.000   (3.84)     113853.800   (-2.65)    139659.400   (19.41)    120335.200   (2.89)
+    parsec3/swaptions       8342.400     18555.600    (122.43)   16581.200    (98.76)    6745.800     (-19.14)   27487.200    (229.49)   14275.600    (71.12)
+    parsec3/vips            2776417.600  2784989.400  (0.31)     2820564.600  (1.59)     2694060.800  (-2.97)    2968650.000  (6.92)     2713590.000  (-2.26)
+    parsec3/x264            2912885.000  2936474.600  (0.81)     2936775.800  (0.82)     2799599.200  (-3.89)    3168695.000  (8.78)     2829085.800  (-2.88)
+    splash2x/barnes         1206459.600  1204145.600  (-0.19)    1177390.000  (-2.41)    1210556.800  (0.34)     1214978.800  (0.71)     907737.000   (-24.76)
+    splash2x/fft            9384156.400  9258749.600  (-1.34)    8560377.800  (-8.78)    9337563.000  (-0.50)    9228873.600  (-1.65)    9823394.400  (4.68)
+    splash2x/lu_cb          510210.800   514052.800   (0.75)     502735.200   (-1.47)    514459.800   (0.83)     523884.200   (2.68)     367563.200   (-27.96)
+    splash2x/lu_ncb         510091.200   516046.800   (1.17)     505327.600   (-0.93)    512568.200   (0.49)     524178.400   (2.76)     427981.800   (-16.10)
+    splash2x/ocean_cp       3342260.200  3294531.200  (-1.43)    3171236.000  (-5.12)    3379693.600  (1.12)     3314896.600  (-0.82)    3252406.000  (-2.69)
+    splash2x/ocean_ncp      3900447.200  3881682.600  (-0.48)    3816493.200  (-2.15)    7065506.200  (81.15)    4449224.400  (14.07)    3829931.200  (-1.81)
+    splash2x/radiosity      1466372.000  1463840.200  (-0.17)    1438554.000  (-1.90)    1475151.600  (0.60)     1474828.800  (0.58)     496636.000   (-66.13)
+    splash2x/radix          1760056.600  1691719.000  (-3.88)    1613057.400  (-8.35)    1384416.400  (-21.34)   1632274.400  (-7.26)    2141640.200  (21.68)
+    splash2x/raytrace       38794.000    48187.400    (24.21)    46728.400    (20.45)    41323.400    (6.52)     61499.800    (58.53)    68455.200    (76.46)
+    splash2x/volrend        138107.400   148197.000   (7.31)     146223.400   (5.88)     128076.400   (-7.26)    164593.800   (19.18)    140885.200   (2.01)
+    splash2x/water_nsquared 39072.000    49889.200    (27.69)    47548.400    (21.69)    37546.400    (-3.90)    57195.400    (46.38)    42994.200    (10.04)
+    splash2x/water_spatial  662099.800   665964.800   (0.58)     651017.000   (-1.67)    659808.400   (-0.35)    674475.600   (1.87)     519677.600   (-21.51)
+    total                   38991500.000 38895300.000 (-0.25)    37787817.000 (-3.09)    41347200.000 (6.04)     40609600.000 (4.15)     36994100.000 (-5.12)
+
+
+DAMON Overheads
+---------------
+
+In total, DAMON virtual memory access recording feature ('rec') incurs 0.94%
+runtime overhead and -0.25% memory space overhead.  Even though the size of the
+monitoring target region becomes much larger with the physical memory access
+recording ('prec'), it still shows only modest amount of overhead (1.10% for
+runtime and -3.09% for memory footprint).
+
+For a convenience test run of 'rec' and 'prec', I use a Python wrapper.  The
+wrapper constantly consumes about 10-15MB of memory.  This becomes a high
+memory overhead if the target workload has a small memory footprint.
+Nonetheless, the overheads are not from DAMON, but from the wrapper, and thus
+should be ignored.  This fake memory overhead continues in 'ethp' and 'prcl',
+as those configurations are also using the Python wrapper.
+
+
+Efficient THP
+-------------
+
+THP 'always' enabled policy achieves 6.20% speedup but incurs 6.04% memory
+overhead.  It achieves 44.76% speedup in the best case, but 81.15% memory
+overhead in the worst case.  Interestingly, both the best and worst-case are
+with 'splash2x/ocean_ncp').
+
+The 2-lines implementation of data access monitoring based THP version ('ethp')
+shows 3.76% speedup and 4.15% memory overhead.  In other words, 'ethp' removes
+31.29% of THP memory waste while preserving 60.64% of THP speedup in total.  In
+the case of the 'splash2x/ocean_ncp', 'ethp' removes 82.66% of THP memory waste
+while preserving 52.85% of THP speedup.
+
+
+Proactive Reclamation
+---------------------
+
+As similar to the original work, I use 4G 'zram' swap device for this
+configuration.
+
+In total, our 1 line implementation of Proactive Reclamation, 'prcl', incurred
+6.48% runtime overhead in total while achieving 5.12% system memory usage
+reduction.
+
+Nonetheless, as the memory usage is calculated with 'MemFree' in
+'/proc/meminfo', it contains the SwapCached pages.  As the swapcached pages can
+be easily evicted, I also measured the residential set size of the workloads::
+
+    rss.avg                 orig         rec          (overhead) prec         (overhead) thp          (overhead) ethp         (overhead) prcl         (overhead)
+    parsec3/blackscholes    590412.200   589991.400   (-0.07)    591716.400   (0.22)     591131.000   (0.12)     591055.200   (0.11)     274623.600   (-53.49)
+    parsec3/bodytrack       32202.200    32297.400    (0.30)     32301.400    (0.31)     32328.000    (0.39)     32169.800    (-0.10)    25311.200    (-21.40)
+    parsec3/canneal         840063.600   839145.200   (-0.11)    839506.200   (-0.07)    835102.600   (-0.59)    839766.000   (-0.04)    833091.800   (-0.83)
+    parsec3/dedup           1185493.200  1202688.800  (1.45)     1204597.000  (1.61)     1238071.400  (4.44)     1201689.400  (1.37)     920688.600   (-22.34)
+    parsec3/facesim         311570.400   311542.000   (-0.01)    311665.000   (0.03)     316106.400   (1.46)     312003.400   (0.14)     252646.000   (-18.91)
+    parsec3/ferret          99783.200    99330.000    (-0.45)    99735.000    (-0.05)    102000.600   (2.22)     99927.400    (0.14)     90967.400    (-8.83)
+    parsec3/fluidanimate    531780.800   531800.800   (0.00)     531754.600   (-0.00)    532009.600   (0.04)     531822.400   (0.01)     479116.000   (-9.90)
+    parsec3/freqmine        551787.600   551550.600   (-0.04)    551950.000   (0.03)     556030.000   (0.77)     553720.400   (0.35)     66480.000    (-87.95)
+    parsec3/raytrace        895247.000   895240.200   (-0.00)    895770.400   (0.06)     895880.200   (0.07)     893516.600   (-0.19)    327339.600   (-63.44)
+    parsec3/streamcluster   110862.200   110840.400   (-0.02)    110878.600   (0.01)     112067.200   (1.09)     112010.800   (1.04)     109763.600   (-0.99)
+    parsec3/swaptions       5630.000     5580.800     (-0.87)    5599.600     (-0.54)    5624.200     (-0.10)    5697.400     (1.20)     3792.400     (-32.64)
+    parsec3/vips            31677.200    31881.800    (0.65)     31785.800    (0.34)     32177.000    (1.58)     32456.800    (2.46)     29692.000    (-6.27)
+    parsec3/x264            81796.400    81918.600    (0.15)     81827.600    (0.04)     82734.800    (1.15)     82854.000    (1.29)     81478.200    (-0.39)
+    splash2x/barnes         1216014.600  1215462.000  (-0.05)    1218535.200  (0.21)     1227689.400  (0.96)     1219022.000  (0.25)     650771.000   (-46.48)
+    splash2x/fft            9622775.200  9511973.400  (-1.15)    9688178.600  (0.68)     9733868.400  (1.15)     9651488.000  (0.30)     7567077.400  (-21.36)
+    splash2x/lu_cb          511102.400   509911.600   (-0.23)    511123.800   (0.00)     514466.800   (0.66)     510462.800   (-0.13)    361014.000   (-29.37)
+    splash2x/lu_ncb         510569.800   510724.600   (0.03)     510888.800   (0.06)     513951.600   (0.66)     509474.400   (-0.21)    424030.400   (-16.95)
+    splash2x/ocean_cp       3413563.600  3413721.800  (0.00)     3398399.600  (-0.44)    3446878.000  (0.98)     3404799.200  (-0.26)    3244787.400  (-4.94)
+    splash2x/ocean_ncp      3927797.400  3936294.400  (0.22)     3917698.800  (-0.26)    7181781.200  (82.85)    4525783.600  (15.22)    3693747.800  (-5.96)
+    splash2x/radiosity      1477264.800  1477569.200  (0.02)     1476954.200  (-0.02)    1485724.800  (0.57)     1474684.800  (-0.17)    230128.000   (-84.42)
+    splash2x/radix          1773025.000  1754424.200  (-1.05)    1743194.400  (-1.68)    1445575.200  (-18.47)   1694855.200  (-4.41)    1769750.000  (-0.18)
+    splash2x/raytrace       23292.000    23284.000    (-0.03)    23292.800    (0.00)     28704.800    (23.24)    26489.600    (13.73)    15753.000    (-32.37)
+    splash2x/volrend        44095.800    44068.200    (-0.06)    44107.600    (0.03)     44114.600    (0.04)     44054.000    (-0.09)    31616.000    (-28.30)
+    splash2x/water_nsquared 29416.800    29403.200    (-0.05)    29406.400    (-0.04)    30103.200    (2.33)     29433.600    (0.06)     24927.400    (-15.26)
+    splash2x/water_spatial  657791.000   657840.400   (0.01)     657826.600   (0.01)     657595.800   (-0.03)    656617.800   (-0.18)    481334.800   (-26.83)
+    total                   28475091.000 28368400.000 (-0.37)    28508700.000 (0.12)     31641800.000 (11.12)    29036000.000 (1.97)     21989800.000 (-22.78)
+
+In total, 22.78% of residential sets were reduced.
+
+With parsec3/freqmine, 'prcl' reduced 87.95% of residential sets and 29.52% of
+system memory usage while incurring only 2.15% runtime overhead.
diff --git a/Documentation/vm/damon/faq.rst b/Documentation/vm/damon/faq.rst
new file mode 100644
index 000000000000..088128bbf22b
--- /dev/null
+++ b/Documentation/vm/damon/faq.rst
@@ -0,0 +1,58 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==========================
+Frequently Asked Questions
+==========================
+
+Why a new subsystem, instead of extending perf or other user space tools?
+=========================================================================
+
+First, because it needs to be lightweight as much as possible so that it can be
+used online, any unnecessary overhead such as kernel - user space context
+switching cost should be avoided.  Second, DAMON aims to be used by other
+programs including the kernel.  Therefore, having a dependency on specific
+tools like perf is not desirable.  These are the two biggest reasons why DAMON
+is implemented in the kernel space.
+
+
+Can 'idle pages tracking' or 'perf mem' substitute DAMON?
+=========================================================
+
+Idle page tracking is a low level primitive for access check of the physical
+address space.  'perf mem' is similar, though it can use sampling to minimize
+the overhead.  On the other hand, DAMON is a higher-level framework for the
+monitoring of various address spaces.  It is focused on memory management
+optimization and provides sophisticated accuracy/overhead handling mechanisms.
+Therefore, 'idle pages tracking' and 'perf mem' could provide a subset of
+DAMON's output, but cannot substitute DAMON.
+
+
+How can I optimize my system's memory management using DAMON?
+=============================================================
+
+Because there are several ways for the DAMON-based optimizations, we wrote a
+separate document, :doc:`/admin-guide/mm/damon/guide`.  Please refer to that.
+
+
+Does DAMON support virtual memory only?
+=======================================
+
+No.  The core of the DAMON is address space independent.  The address space
+specific low level primitive parts including monitoring target regions
+constructions and actual access checks can be implemented and configured on the
+DAMON core by the users.  In this way, DAMON users can monitor any address
+space with any access check technique.
+
+Nonetheless, DAMON provides vma tracking and PTE Accessed bit check based
+implementations of the address space dependent functions for the virtual memory
+by default, for a reference and convenient use.  In near future, we will
+provide those for physical memory address space.
+
+
+Can I simply monitor page granularity?
+======================================
+
+Yes.  You can do so by setting the ``min_nr_regions`` attribute higher than the
+working set size divided by the page size.  Because the monitoring target
+regions size is forced to be ``>=page size``, the region split will make no
+effect.
diff --git a/Documentation/vm/damon/index.rst b/Documentation/vm/damon/index.rst
new file mode 100644
index 000000000000..17dca3c12aad
--- /dev/null
+++ b/Documentation/vm/damon/index.rst
@@ -0,0 +1,31 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==========================
+DAMON: Data Access MONitor
+==========================
+
+DAMON is a data access monitoring framework subsystem for the Linux kernel.
+The core mechanisms of DAMON (refer to :doc:`design` for the detail) make it
+
+ - *accurate* (the monitoring output is useful enough for DRAM level memory
+   management; It might not appropriate for CPU Cache levels, though),
+ - *light-weight* (the monitoring overhead is low enough to be applied online),
+   and
+ - *scalable* (the upper-bound of the overhead is in constant range regardless
+   of the size of target workloads).
+
+Using this framework, therefore, the kernel's memory management mechanisms can
+make advanced decisions.  Experimental memory management optimization works
+that incurring high data accesses monitoring overhead could implemented again.
+In user space, meanwhile, users who have some special workloads can write
+personalized applications for better understanding and optimizations of their
+workloads and systems.
+
+.. toctree::
+   :maxdepth: 2
+
+   faq
+   design
+   eval
+   api
+   plans
diff --git a/Documentation/vm/index.rst b/Documentation/vm/index.rst
index 611140ffef7e..8d8d088bc7af 100644
--- a/Documentation/vm/index.rst
+++ b/Documentation/vm/index.rst
@@ -31,6 +31,7 @@ descriptions of data structures and algorithms.
    active_mm
    balance
    cleancache
+   damon/index
    free_page_reporting
    frontswap
    highmem
-- 
2.17.1

