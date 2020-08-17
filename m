Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 492A32464F9
	for <lists+linux-doc@lfdr.de>; Mon, 17 Aug 2020 12:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728248AbgHQK5y (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 17 Aug 2020 06:57:54 -0400
Received: from smtp-fw-4101.amazon.com ([72.21.198.25]:49464 "EHLO
        smtp-fw-4101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727849AbgHQK5e (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Aug 2020 06:57:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1597661842; x=1629197842;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W5slt6h0ldzO6EOg13JTdEA3p2Ph9qj003brJxltDKM=;
  b=gTb3sQEFwNlE0FOBLYx8FVYkw6elef0jATFbGR30rQdhSx3g+iNrZYJO
   RVdGUPbbYtjlyhxnih+N+rtzNS5nPdF8F47ARrdnr2pyP9IsjVn5S6gCO
   dSgATEbI/YF7v0PhFL1OGSANLNpRJqKAa+XtX1TVeEty3q5pryQRwKO74
   I=;
X-IronPort-AV: E=Sophos;i="5.76,322,1592870400"; 
   d="scan'208";a="48282337"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-2a-e7be2041.us-west-2.amazon.com) ([10.43.8.6])
  by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP; 17 Aug 2020 10:56:49 +0000
Received: from EX13MTAUEA001.ant.amazon.com (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
        by email-inbound-relay-2a-e7be2041.us-west-2.amazon.com (Postfix) with ESMTPS id CAE47A0753;
        Mon, 17 Aug 2020 10:56:36 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 17 Aug 2020 10:56:35 +0000
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.160.192) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 17 Aug 2020 10:56:18 +0000
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
        <zgf574564920@gmail.com>, <linux-damon@amazon.com>,
        <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v20 12/15] Documentation: Add documents for DAMON
Date:   Mon, 17 Aug 2020 12:51:34 +0200
Message-ID: <20200817105137.19296-13-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817105137.19296-1-sjpark@amazon.com>
References: <20200817105137.19296-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.43.160.192]
X-ClientProxiedBy: EX13D02UWC004.ant.amazon.com (10.43.162.236) To
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
 Documentation/vm/damon/eval.rst              | 225 ++++++++++++++
 Documentation/vm/damon/faq.rst               |  58 ++++
 Documentation/vm/damon/index.rst             |  31 ++
 Documentation/vm/index.rst                   |   1 +
 12 files changed, 1101 insertions(+)
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
index 000000000000..cb80c63c3ed2
--- /dev/null
+++ b/Documentation/vm/damon/eval.rst
@@ -0,0 +1,225 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==========
+Evaluation
+==========
+
+DAMON is lightweight.  It increases system memory usage by 0.12% and slows
+target workloads down by 1.39%.
+
+DAMON is accurate and useful for memory management optimizations.  An
+experimental DAMON-based operation scheme for THP, 'ethp', removes 88.16% of
+THP memory overheads while preserving 88.73% of THP speedup.  Another
+experimental DAMON-based 'proactive reclamation' implementation, 'prcl',
+reduces 91.34% of residential sets and 25.59% of system memory footprint while
+incurring only 1.58% runtime overhead in the best case (parsec3/freqmine).
+
+
+Setup
+=====
+
+On QEMU/KVM based virtual machines utilizing 130GB of RAM and 36 vCPUs hosted
+by AWS EC2 i3.metal instances that running a kernel that v20 DAMON patchset is
+applied, I measure runtime and consumed system memory while running various
+realistic workloads with several configurations.  I use 13 and 12 workloads in
+PARSEC3 [3]_ and SPLASH-2X [4]_ benchmark suites, respectively.  I use another
+wrapper scripts [5]_ for convenient setup and run of the workloads.
+
+
+Measurement
+-----------
+
+For the measurement of the amount of consumed memory in system global scope, I
+drop caches before starting each of the workloads and monitor 'MemFree' in the
+'/proc/meminfo' file.  To make results more stable, I repeat the runs 5 times
+and average results.
+
+
+Configurations
+--------------
+
+The configurations I use are as below.
+
+- orig: Linux v5.8 with 'madvise' THP policy
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
+    # pages if a region >=2MB shows 0 access rate for >=7 seconds
+    min     max     5       max     min     max     hugepage
+    2M      max     min     min     7s      max     nohugepage
+
+    # prcl: If a region >=4KB shows 0 access rate for >=10 seconds, page out.
+    4K      max     0       0       10s     max     pageout
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
+
+Results
+=======
+
+Below two tables show the measurement results.  The runtimes are in seconds
+while the memory usages are in KiB.  Each configuration except 'orig' shows
+its overhead relative to 'orig' in percent within parenthesizes.::
+
+    runtime                 orig     rec      (overhead) prec     (overhead) thp      (overhead) ethp     (overhead) prcl     (overhead)
+    parsec3/blackscholes    137.688  139.910  (1.61)     138.226  (0.39)     138.524  (0.61)     138.548  (0.62)     150.562  (9.35)
+    parsec3/bodytrack       124.496  123.294  (-0.97)    124.482  (-0.01)    124.874  (0.30)     123.514  (-0.79)    126.380  (1.51)
+    parsec3/canneal         196.513  209.465  (6.59)     223.213  (13.59)    189.302  (-3.67)    199.453  (1.50)     242.217  (23.26)
+    parsec3/dedup           18.060   18.128   (0.38)     18.378   (1.76)     18.210   (0.83)     18.397   (1.87)     20.545   (13.76)
+    parsec3/facesim         343.697  344.917  (0.36)     341.367  (-0.68)    337.696  (-1.75)    344.805  (0.32)     361.169  (5.08)
+    parsec3/ferret          288.868  286.110  (-0.95)    292.308  (1.19)     287.814  (-0.36)    284.243  (-1.60)    284.200  (-1.62)
+    parsec3/fluidanimate    342.267  337.743  (-1.32)    330.680  (-3.39)    337.356  (-1.43)    340.604  (-0.49)    343.565  (0.38)
+    parsec3/freqmine        437.385  436.854  (-0.12)    437.641  (0.06)     435.008  (-0.54)    436.998  (-0.09)    444.276  (1.58)
+    parsec3/raytrace        183.036  182.039  (-0.54)    184.859  (1.00)     187.330  (2.35)     185.660  (1.43)     209.707  (14.57)
+    parsec3/streamcluster   611.075  675.108  (10.48)    656.373  (7.41)     541.711  (-11.35)   473.679  (-22.48)   815.450  (33.45)
+    parsec3/swaptions       220.338  220.948  (0.28)     220.891  (0.25)     220.387  (0.02)     219.986  (-0.16)    -100.000 (0.00)
+    parsec3/vips            87.710   88.581   (0.99)     88.423   (0.81)     88.460   (0.86)     88.471   (0.87)     89.661   (2.22)
+    parsec3/x264            114.927  117.774  (2.48)     116.630  (1.48)     112.237  (-2.34)    110.709  (-3.67)    124.560  (8.38)
+    splash2x/barnes         131.034  130.895  (-0.11)    129.088  (-1.48)    118.213  (-9.78)    124.497  (-4.99)    167.966  (28.19)
+    splash2x/fft            59.805   60.237   (0.72)     59.895   (0.15)     47.008   (-21.40)   57.962   (-3.08)    87.183   (45.78)
+    splash2x/lu_cb          132.353  132.157  (-0.15)    132.473  (0.09)     131.561  (-0.60)    135.541  (2.41)     141.720  (7.08)
+    splash2x/lu_ncb         149.050  150.496  (0.97)     151.912  (1.92)     150.974  (1.29)     148.329  (-0.48)    152.227  (2.13)
+    splash2x/ocean_cp       82.189   77.735   (-5.42)    84.466   (2.77)     77.498   (-5.71)    82.586   (0.48)     113.737  (38.38)
+    splash2x/ocean_ncp      154.934  154.656  (-0.18)    164.204  (5.98)     101.861  (-34.26)   142.600  (-7.96)    281.650  (81.79)
+    splash2x/radiosity      142.710  141.643  (-0.75)    143.940  (0.86)     141.982  (-0.51)    142.017  (-0.49)    152.116  (6.59)
+    splash2x/radix          50.357   50.331   (-0.05)    50.717   (0.72)     45.664   (-9.32)    50.222   (-0.27)    73.981   (46.91)
+    splash2x/raytrace       134.039  132.650  (-1.04)    134.583  (0.41)     131.570  (-1.84)    133.050  (-0.74)    141.463  (5.54)
+    splash2x/volrend        120.769  120.220  (-0.45)    119.895  (-0.72)    120.159  (-0.50)    119.311  (-1.21)    119.581  (-0.98)
+    splash2x/water_nsquared 376.599  373.411  (-0.85)    382.601  (1.59)     348.701  (-7.41)    357.033  (-5.20)    397.427  (5.53)
+    splash2x/water_spatial  132.619  133.432  (0.61)     135.505  (2.18)     134.865  (1.69)     133.940  (1.00)     148.196  (11.75)
+    total                   4772.510 4838.740 (1.39)     4862.740 (1.89)     4568.970 (-4.26)    4592.160 (-3.78)    5189.560 (8.74)
+
+
+    memused.avg             orig         rec          (overhead) prec         (overhead) thp          (overhead) ethp         (overhead) prcl         (overhead)
+    parsec3/blackscholes    1825022.800  1863815.200  (2.13)     1830082.000  (0.28)     1800999.800  (-1.32)    1807743.800  (-0.95)    1580027.800  (-13.42)
+    parsec3/bodytrack       1425506.800  1438323.400  (0.90)     1439260.600  (0.96)     1400505.600  (-1.75)    1412295.200  (-0.93)    1412759.600  (-0.89)
+    parsec3/canneal         1040902.600  1050404.000  (0.91)     1053535.200  (1.21)     1027175.800  (-1.32)    1035229.400  (-0.55)    1039159.400  (-0.17)
+    parsec3/dedup           2526700.400  2540671.600  (0.55)     2503689.800  (-0.91)    2544440.200  (0.70)     2510519.000  (-0.64)    2503148.200  (-0.93)
+    parsec3/facesim         545844.600   550680.000   (0.89)     543658.600   (-0.40)    532320.200   (-2.48)    539429.600   (-1.18)    470836.800   (-13.74)
+    parsec3/ferret          352118.600   326782.600   (-7.20)    322645.600   (-8.37)    304054.800   (-13.65)   317259.000   (-9.90)    313532.400   (-10.96)
+    parsec3/fluidanimate    651597.600   580045.200   (-10.98)   578297.400   (-11.25)   569431.600   (-12.61)   577322.800   (-11.40)   482061.600   (-26.02)
+    parsec3/freqmine        989212.000   996291.200   (0.72)     989405.000   (0.02)     970891.000   (-1.85)    981122.000   (-0.82)    736030.000   (-25.59)
+    parsec3/raytrace        1749470.400  1751183.200  (0.10)     1740937.600  (-0.49)    1717138.800  (-1.85)    1731298.200  (-1.04)    1528069.000  (-12.66)
+    parsec3/streamcluster   123425.400   151548.200   (22.79)    144024.800   (16.69)    118379.000   (-4.09)    124845.400   (1.15)     118629.800   (-3.89)
+    parsec3/swaptions       4150.600     25679.200    (518.69)   19914.800    (379.80)   8577.000     (106.64)   17348.200    (317.97)   -100.000     (0.00)
+    parsec3/vips            2989801.200  3003285.400  (0.45)     3012055.400  (0.74)     2958369.000  (-1.05)    2970897.800  (-0.63)    2962063.000  (-0.93)
+    parsec3/x264            3242663.400  3256091.000  (0.41)     3248949.400  (0.19)     3195605.400  (-1.45)    3206571.600  (-1.11)    3219046.333  (-0.73)
+    splash2x/barnes         1208017.600  1212702.600  (0.39)     1194143.600  (-1.15)    1208450.200  (0.04)     1212607.600  (0.38)     878554.667   (-27.27)
+    splash2x/fft            9786259.000  9705563.600  (-0.82)    9391006.800  (-4.04)    9967230.600  (1.85)     9657639.400  (-1.31)    10215759.333 (4.39)
+    splash2x/lu_cb          512130.400   521431.800   (1.82)     513051.400   (0.18)     508534.200   (-0.70)    512643.600   (0.10)     328017.333   (-35.95)
+    splash2x/lu_ncb         511156.200   526566.400   (3.01)     513230.400   (0.41)     509823.800   (-0.26)    516302.000   (1.01)     418078.333   (-18.21)
+    splash2x/ocean_cp       3353269.200  3319496.000  (-1.01)    3251575.000  (-3.03)    3379639.800  (0.79)     3326416.600  (-0.80)    3143859.667  (-6.24)
+    splash2x/ocean_ncp      3905538.200  3914929.600  (0.24)     3877493.200  (-0.72)    7053949.400  (80.61)    4633035.000  (18.63)    3527482.667  (-9.68)
+    splash2x/radiosity      1462030.400  1468050.000  (0.41)     1454997.600  (-0.48)    1466985.400  (0.34)     1461777.400  (-0.02)    441332.000   (-69.81)
+    splash2x/radix          2367200.800  2363995.000  (-0.14)    2251124.600  (-4.90)    2417603.800  (2.13)     2317804.000  (-2.09)    2495581.667  (5.42)
+    splash2x/raytrace       42356.200    56270.200    (32.85)    49419.000    (16.67)    86408.400    (104.00)   50547.600    (19.34)    40341.000    (-4.76)
+    splash2x/volrend        148631.600   162954.600   (9.64)     153305.200   (3.14)     140089.200   (-5.75)    149831.200   (0.81)     150232.000   (1.08)
+    splash2x/water_nsquared 39835.800    54268.000    (36.23)    53659.400    (34.70)    41073.600    (3.11)     85322.600    (114.19)   49463.667    (24.17)
+    splash2x/water_spatial  669746.600   679634.200   (1.48)     667518.600   (-0.33)    664383.800   (-0.80)    684470.200   (2.20)     401946.000   (-39.99)
+    total                   41472600.000 41520700.000 (0.12)     40796900.000 (-1.63)    44592000.000 (7.52)     41840100.000 (0.89)     38456146.000 (-7.27)
+
+
+DAMON Overheads
+---------------
+
+In total, DAMON virtual memory access recording feature ('rec') incurs 1.39%
+runtime overhead and 0.12% memory space overhead.  Even though the size of the
+monitoring target region becomes much larger with the physical memory access
+recording ('prec'), it still shows only modest amount of overhead (1.89% for
+runtime and -1.63% for memory footprint).
+
+For a convenient test run of 'rec' and 'prec', I use a Python wrapper.  The
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
+THP 'always' enabled policy achieves 4.26% speedup but incurs 7.52% memory
+overhead.  It achieves 34.26% speedup in the best case, but 80.61% memory
+overhead in the worst case.  Interestingly, both the best and worst-case are
+with 'splash2x/ocean_ncp').
+
+The 2-lines implementation of data access monitoring based THP version ('ethp')
+shows 3.78% speedup and 0.89% memory overhead.  In other words, 'ethp' removes
+88.16% of THP memory waste while preserving 88.73% of THP speedup in total.  In
+the case of the 'splash2x/ocean_ncp', 'ethp' removes 76.90% of THP memory waste
+while preserving 23.23% of THP speedup.
+
+
+Proactive Reclamation
+---------------------
+
+As similar to the original work, I use 4G 'zram' swap device for this
+configuration.
+
+In total, our 1 line implementation of Proactive Reclamation, 'prcl', incurred
+8.74% runtime overhead in total while achieving 7.27% system memory footprint
+reduction.
+
+Nonetheless, as the memory usage is calculated with 'MemFree' in
+'/proc/meminfo', it contains the SwapCached pages.  As the swapcached pages can
+be easily evicted, I also measured the residential set size of the workloads::
+
+    rss.avg                 orig         rec          (overhead) prec         (overhead) thp          (overhead) ethp         (overhead) prcl         (overhead)
+    parsec3/blackscholes    587078.800   586930.400   (-0.03)    586355.200   (-0.12)    586147.400   (-0.16)    585203.400   (-0.32)    243110.800   (-58.59)
+    parsec3/bodytrack       32470.800    32488.400    (0.05)     32351.000    (-0.37)    32433.400    (-0.12)    32429.000    (-0.13)    18804.800    (-42.09)
+    parsec3/canneal         842418.600   842442.800   (0.00)     844396.000   (0.23)     840756.400   (-0.20)    841242.000   (-0.14)    825296.200   (-2.03)
+    parsec3/dedup           1180100.000  1179309.200  (-0.07)    1160477.800  (-1.66)    1198789.200  (1.58)     1171802.600  (-0.70)    595531.600   (-49.54)
+    parsec3/facesim         312056.000   312109.200   (0.02)     312044.400   (-0.00)    318102.200   (1.94)     316239.600   (1.34)     192002.600   (-38.47)
+    parsec3/ferret          99792.200    99641.800    (-0.15)    99044.800    (-0.75)    102041.800   (2.25)     100854.000   (1.06)     83628.200    (-16.20)
+    parsec3/fluidanimate    530735.400   530759.000   (0.00)     530865.200   (0.02)     532440.800   (0.32)     522778.600   (-1.50)    433547.400   (-18.31)
+    parsec3/freqmine        552951.000   552788.000   (-0.03)    552761.800   (-0.03)    556004.400   (0.55)     554001.200   (0.19)     47881.200    (-91.34)
+    parsec3/raytrace        883966.600   880061.400   (-0.44)    883144.800   (-0.09)    871786.400   (-1.38)    881000.200   (-0.34)    267210.800   (-69.77)
+    parsec3/streamcluster   110901.600   110863.400   (-0.03)    110893.600   (-0.01)    115612.600   (4.25)     114976.800   (3.67)     109728.600   (-1.06)
+    parsec3/swaptions       5708.800     5712.400     (0.06)     5681.400     (-0.48)    5720.400     (0.20)     5726.000     (0.30)     -100.000     (0.00)
+    parsec3/vips            32272.200    32427.400    (0.48)     31959.800    (-0.97)    34177.800    (5.90)     33306.400    (3.20)     28869.000    (-10.55)
+    parsec3/x264            81878.000    81914.200    (0.04)     81823.600    (-0.07)    83579.400    (2.08)     83236.800    (1.66)     81220.667    (-0.80)
+    splash2x/barnes         1211917.400  1211328.200  (-0.05)    1212450.400  (0.04)     1221951.000  (0.83)     1218924.600  (0.58)     489430.333   (-59.62)
+    splash2x/fft            9874359.000  9934912.400  (0.61)     9843789.600  (-0.31)    10204484.600 (3.34)     9980640.400  (1.08)     7003881.000  (-29.07)
+    splash2x/lu_cb          509066.200   509222.600   (0.03)     509059.600   (-0.00)    509594.600   (0.10)     509479.000   (0.08)     315538.667   (-38.02)
+    splash2x/lu_ncb         509192.200   508437.000   (-0.15)    509331.000   (0.03)     509606.000   (0.08)     509578.200   (0.08)     412065.667   (-19.07)
+    splash2x/ocean_cp       3380283.800  3380301.000  (0.00)     3377617.200  (-0.08)    3416531.200  (1.07)     3389845.200  (0.28)     2398084.000  (-29.06)
+    splash2x/ocean_ncp      3917913.600  3924529.200  (0.17)     3934911.800  (0.43)     7123907.400  (81.83)    4703623.600  (20.05)    2428288.000  (-38.02)
+    splash2x/radiosity      1467978.600  1468655.400  (0.05)     1467534.000  (-0.03)    1477722.600  (0.66)     1471036.000  (0.21)     148573.333   (-89.88)
+    splash2x/radix          2413933.400  2408367.600  (-0.23)    2381122.400  (-1.36)    2480169.400  (2.74)     2367118.800  (-1.94)    1848857.000  (-23.41)
+    splash2x/raytrace       23280.000    23272.800    (-0.03)    23259.000    (-0.09)    28715.600    (23.35)    28354.400    (21.80)    13302.333    (-42.86)
+    splash2x/volrend        44079.400    44091.600    (0.03)     44022.200    (-0.13)    44547.200    (1.06)     44615.600    (1.22)     29833.000    (-32.32)
+    splash2x/water_nsquared 29392.800    29425.600    (0.11)     29422.400    (0.10)     30317.800    (3.15)     30602.200    (4.11)     21769.000    (-25.94)
+    splash2x/water_spatial  658604.400   660276.800   (0.25)     660334.000   (0.26)     660491.000   (0.29)     660636.400   (0.31)     304246.667   (-53.80)
+    total                   29292400.000 29350400.000 (0.20)     29224634.000 (-0.23)    32985491.000 (12.61)    30157300.000 (2.95)     18340700.000 (-37.39)
+
+In total, 37.39% of residential sets were reduced.
+
+With parsec3/freqmine, 'prcl' reduced 91.34% of residential sets and 25.59% of
+system memory usage while incurring only 1.58% runtime overhead.
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

