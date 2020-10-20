Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 355B229379E
	for <lists+linux-doc@lfdr.de>; Tue, 20 Oct 2020 11:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390687AbgJTJHe (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 20 Oct 2020 05:07:34 -0400
Received: from smtp-fw-6001.amazon.com ([52.95.48.154]:31396 "EHLO
        smtp-fw-6001.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390686AbgJTJHd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Oct 2020 05:07:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1603184840; x=1634720840;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=scH5DbqjRf9bRdnuwwJc9VZdM6HBLkfL+Z3oznZZNco=;
  b=G+ZBh/yeh/0Yiv4wK9q2i3m83oLweBMGHHcDF9cxxKmSarhuSC5ZR9XR
   l/BacYXuMB/M5Zeh/sp5laZWzNOxngvoMmsmUQG6S2I4TpxvP5G1KZ4wf
   HeuIO8NglyYq2NFC76NJ74lAypctISe4y0pJgbtcrEv4OQx6S8r5v6dI3
   0=;
X-IronPort-AV: E=Sophos;i="5.77,396,1596499200"; 
   d="scan'208";a="62135628"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-1a-715bee71.us-east-1.amazon.com) ([10.43.8.6])
  by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP; 20 Oct 2020 09:07:13 +0000
Received: from EX13D31EUB001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
        by email-inbound-relay-1a-715bee71.us-east-1.amazon.com (Postfix) with ESMTPS id 8290CA064E;
        Tue, 20 Oct 2020 09:07:01 +0000 (UTC)
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.161.237) by
 EX13D31EUB001.ant.amazon.com (10.43.166.210) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 20 Oct 2020 09:06:41 +0000
From:   SeongJae Park <sjpark@amazon.com>
To:     <akpm@linux-foundation.org>
CC:     SeongJae Park <sjpark@amazon.de>, <Jonathan.Cameron@Huawei.com>,
        <aarcange@redhat.com>, <acme@kernel.org>,
        <alexander.shishkin@linux.intel.com>, <amit@kernel.org>,
        <benh@kernel.crashing.org>, <brendan.d.gregg@gmail.com>,
        <brendanhiggins@google.com>, <cai@lca.pw>,
        <colin.king@canonical.com>, <corbet@lwn.net>, <david@redhat.com>,
        <dwmw@amazon.com>, <elver@google.com>, <fan.du@intel.com>,
        <foersleo@amazon.de>, <gthelen@google.com>, <irogers@google.com>,
        <jolsa@redhat.com>, <kirill@shutemov.name>, <mark.rutland@arm.com>,
        <mgorman@suse.de>, <minchan@kernel.org>, <mingo@redhat.com>,
        <namhyung@kernel.org>, <peterz@infradead.org>,
        <rdunlap@infradead.org>, <riel@surriel.com>, <rientjes@google.com>,
        <rostedt@goodmis.org>, <rppt@kernel.org>, <sblbir@amazon.com>,
        <shakeelb@google.com>, <shuah@kernel.org>, <sj38.park@gmail.com>,
        <snu@amazon.de>, <vbabka@suse.cz>, <vdavydov.dev@gmail.com>,
        <yang.shi@linux.alibaba.com>, <ying.huang@intel.com>,
        <zgf574564920@gmail.com>, <linux-damon@amazon.com>,
        <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v22 15/18] Documentation: Add documents for DAMON
Date:   Tue, 20 Oct 2020 10:59:37 +0200
Message-ID: <20201020085940.13875-16-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201020085940.13875-1-sjpark@amazon.com>
References: <20201020085940.13875-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.43.161.237]
X-ClientProxiedBy: EX13D41UWC001.ant.amazon.com (10.43.162.107) To
 EX13D31EUB001.ant.amazon.com (10.43.166.210)
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
 Documentation/vm/damon/eval.rst              | 227 ++++++++++++++
 Documentation/vm/damon/faq.rst               |  58 ++++
 Documentation/vm/damon/index.rst             |  31 ++
 Documentation/vm/index.rst                   |   1 +
 12 files changed, 1103 insertions(+)
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
index cd727cfc1b04..32c27fbf1913 100644
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
index 000000000000..08f34df45523
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
+.. kernel-doc:: mm/damon/core.c
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
index 000000000000..66c6cbc04b89
--- /dev/null
+++ b/Documentation/vm/damon/eval.rst
@@ -0,0 +1,227 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==========
+Evaluation
+==========
+
+DAMON is lightweight.  It increases system memory usage by 0.25% and slows
+target workloads down by 0.89%.
+
+DAMON is accurate and useful for memory management optimizations.  An
+experimental DAMON-based operation scheme for THP, namely 'ethp', removes
+81.73% of THP memory overheads while preserving 95.29% of THP speedup.  Another
+experimental DAMON-based 'proactive reclamation' implementation, namely 'prcl',
+reduces 91.30% of residential sets and 23.45% of system memory footprint while
+incurring only 2.08% runtime overhead in the best case (parsec3/freqmine).
+
+
+Setup
+=====
+
+On QEMU/KVM based virtual machines utilizing 130GB of RAM and 36 vCPUs hosted
+by AWS EC2 i3.metal instances that running a kernel that v21 DAMON patchset is
+applied, I measure runtime and consumed system memory while running various
+realistic workloads with several configurations.  From each of PARSEC3 [3]_ and
+SPLASH-2X [4]_ benchmark suites I pick 12 workloads, so I use 24 workloads in
+total.  I use another wrapper scripts [5]_ for convenient setup and run of the
+workloads.
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
+- orig: Linux v5.9 with 'madvise' THP policy
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
+    # prcl: If a region >=4KB shows 0 access rate for >=5 seconds, page out.
+    4K      max     0       0       5s     max     pageout
+
+Note that both 'ethp' and 'prcl' are designed with my only straightforward
+intuition because those are for only proof of concepts and monitoring accuracy
+of DAMON.  In other words, those are not for production.  For production use,
+those should be more tuned.
+
+The evaluation is done using the tests package for DAMON, ``damon-tests`` [7]_.
+You can run this and generate a report on your own using it.
+
+.. [1] "Redis latency problems troubleshooting", https://redis.io/topics/latency
+.. [2] "Disable Transparent Huge Pages (THP)",
+    https://docs.mongodb.com/manual/tutorial/transparent-huge-pages/
+.. [3] "The PARSEC Becnhmark Suite", https://parsec.cs.princeton.edu/index.htm
+.. [4] "SPLASH-2x", https://parsec.cs.princeton.edu/parsec3-doc.htm#splash2x
+.. [5] "parsec3_on_ubuntu", https://github.com/sjp38/parsec3_on_ubuntu
+.. [6] "Proactively reclaiming idle memory", https://lwn.net/Articles/787611/
+.. [7] "damon-tests", https://github.com/awslabs/damon-tests
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
+    parsec3/blackscholes    138.208  139.078  (0.63)     138.962  (0.55)     139.357  (0.83)     139.132  (0.67)     152.354  (10.24)
+    parsec3/bodytrack       123.803  124.525  (0.58)     123.751  (-0.04)    123.908  (0.08)     123.528  (-0.22)    126.714  (2.35)
+    parsec3/canneal         210.538  205.626  (-2.33)    217.886  (3.49)     190.580  (-9.48)    206.514  (-1.91)    234.559  (11.41)
+    parsec3/dedup           17.959   18.370   (2.29)     18.503   (3.03)     18.183   (1.25)     18.058   (0.55)     20.268   (12.86)
+    parsec3/facesim         349.911  339.685  (-2.92)    350.295  (0.11)     332.965  (-4.84)    340.523  (-2.68)    361.546  (3.33)
+    parsec3/fluidanimate    338.126  337.623  (-0.15)    336.554  (-0.47)    332.614  (-1.63)    326.699  (-3.38)    334.859  (-0.97)
+    parsec3/freqmine        436.102  435.539  (-0.13)    439.250  (0.72)     436.600  (0.11)     437.302  (0.28)     445.161  (2.08)
+    parsec3/raytrace        182.141  182.190  (0.03)     183.468  (0.73)     183.476  (0.73)     185.025  (1.58)     205.497  (12.82)
+    parsec3/streamcluster   646.643  712.713  (10.22)    648.129  (0.23)     635.973  (-1.65)    543.135  (-16.01)   712.380  (10.17)
+    parsec3/swaptions       219.022  219.598  (0.26)     219.895  (0.40)     221.296  (1.04)     221.085  (0.94)     221.645  (1.20)
+    parsec3/vips            88.331   87.952   (-0.43)    87.964   (-0.42)    88.928   (0.68)     87.761   (-0.65)    89.482   (1.30)
+    parsec3/x264            118.899  112.892  (-5.05)    120.804  (1.60)     108.313  (-8.90)    108.274  (-8.94)    111.550  (-6.18)
+    splash2x/barnes         131.914  132.544  (0.48)     129.800  (-1.60)    119.006  (-9.78)    127.286  (-3.51)    174.193  (32.05)
+    splash2x/fft            58.555   58.440   (-0.20)    58.585   (0.05)     46.276   (-20.97)   57.530   (-1.75)    90.741   (54.97)
+    splash2x/lu_cb          133.300  134.141  (0.63)     132.406  (-0.67)    132.350  (-0.71)    132.668  (-0.47)    142.068  (6.58)
+    splash2x/lu_ncb         149.119  152.106  (2.00)     150.765  (1.10)     151.501  (1.60)     148.956  (-0.11)    153.701  (3.07)
+    splash2x/ocean_cp       75.054   78.269   (4.28)     76.888   (2.44)     73.014   (-2.72)    84.143   (12.11)    121.053  (61.29)
+    splash2x/ocean_ncp      160.563  150.627  (-6.19)    152.911  (-4.77)    95.034   (-40.81)   141.612  (-11.80)   277.269  (72.69)
+    splash2x/radiosity      143.127  142.501  (-0.44)    142.117  (-0.71)    142.312  (-0.57)    143.355  (0.16)     152.270  (6.39)
+    splash2x/radix          52.191   49.788   (-4.60)    50.223   (-3.77)    44.351   (-15.02)   48.513   (-7.05)    81.601   (56.35)
+    splash2x/raytrace       133.755  135.314  (1.17)     132.448  (-0.98)    132.043  (-1.28)    133.600  (-0.12)    138.558  (3.59)
+    splash2x/volrend        120.503  119.950  (-0.46)    121.021  (0.43)     119.837  (-0.55)    119.831  (-0.56)    120.592  (0.07)
+    splash2x/water_nsquared 376.371  375.451  (-0.24)    375.487  (-0.23)    354.005  (-5.94)    354.730  (-5.75)    397.614  (5.64)
+    splash2x/water_spatial  133.994  133.460  (-0.40)    132.586  (-1.05)    132.831  (-0.87)    134.327  (0.25)     150.644  (12.43)
+    total                   4538.100 4578.380 (0.89)     4540.720 (0.06)     4354.760 (-4.04)    4363.570 (-3.85)    5016.310 (10.54)
+
+
+    memused.avg             orig         rec          (overhead) prec         (overhead) thp          (overhead) ethp         (overhead) prcl         (overhead)
+    parsec3/blackscholes    1826309.600  1833818.200  (0.41)     1828786.000  (0.14)     1820143.600  (-0.34)    1830923.600  (0.25)     1598872.000  (-12.45)
+    parsec3/bodytrack       1424217.000  1436974.600  (0.90)     1436398.000  (0.86)     1421633.800  (-0.18)    1434718.200  (0.74)     1434411.200  (0.72)
+    parsec3/canneal         1040253.400  1052139.800  (1.14)     1052512.400  (1.18)     1035381.800  (-0.47)    1049653.400  (0.90)     1049317.800  (0.87)
+    parsec3/dedup           2501867.800  2526307.800  (0.98)     2466466.000  (-1.42)    2526893.000  (1.00)     2509818.000  (0.32)     2497495.600  (-0.17)
+    parsec3/facesim         535597.000   549611.600   (2.62)     548756.200   (2.46)     537688.400   (0.39)     553604.200   (3.36)     484130.600   (-9.61)
+    parsec3/fluidanimate    567666.200   579418.800   (2.07)     579690.400   (2.12)     567742.400   (0.01)     580155.600   (2.20)     491283.200   (-13.46)
+    parsec3/freqmine        987479.800   997061.400   (0.97)     994319.400   (0.69)     988948.400   (0.15)     998694.000   (1.14)     755928.400   (-23.45)
+    parsec3/raytrace        1738269.000  1753006.000  (0.85)     1744824.200  (0.38)     1730549.200  (-0.44)    1750131.800  (0.68)     1548381.400  (-10.92)
+    parsec3/streamcluster   117605.200   158332.400   (34.63)    159858.800   (35.93)    120675.600   (2.61)     134289.800   (14.19)    129397.000   (10.03)
+    parsec3/swaptions       13600.000    27782.000    (104.28)   31959.600    (135.00)   12666.000    (-6.87)    25009.600    (83.89)    25763.000    (89.43)
+    parsec3/vips            2985688.800  2999933.000  (0.48)     3007744.400  (0.74)     2986884.000  (0.04)     3002386.000  (0.56)     2978898.800  (-0.23)
+    parsec3/x264            3245603.400  3247109.400  (0.05)     3263116.600  (0.54)     3232282.600  (-0.41)    3247899.800  (0.07)     3246118.400  (0.02)
+    splash2x/barnes         1201901.800  1214834.400  (1.08)     1202295.800  (0.03)     1209412.600  (0.62)     1214202.400  (1.02)     884999.000   (-26.37)
+    splash2x/fft            9664686.600  9600248.400  (-0.67)    9349118.800  (-3.27)    9933514.600  (2.78)     9631206.600  (-0.35)    10280275.800 (6.37)
+    splash2x/lu_cb          510420.400   523148.200   (2.49)     514914.600   (0.88)     513755.400   (0.65)     520163.400   (1.91)     336801.200   (-34.01)
+    splash2x/lu_ncb         511532.200   529326.600   (3.48)     519711.000   (1.60)     537526.600   (5.08)     523745.800   (2.39)     429269.200   (-16.08)
+    splash2x/ocean_cp       3319439.200  3302381.000  (-0.51)    3238411.400  (-2.44)    3361820.800  (1.28)     3327733.200  (0.25)     3153352.000  (-5.00)
+    splash2x/ocean_ncp      3909858.200  3903840.600  (-0.15)    3860902.600  (-1.25)    7022147.400  (79.60)    4470036.000  (14.33)    3521609.000  (-9.93)
+    splash2x/radiosity      1460921.000  1465081.000  (0.28)     1456779.800  (-0.28)    1470047.000  (0.62)     1467061.600  (0.42)     446035.400   (-69.47)
+    splash2x/radix          2427095.200  2336602.600  (-3.73)    2250746.200  (-7.27)    2399454.800  (-1.14)    2292519.600  (-5.54)    2458012.200  (1.27)
+    splash2x/raytrace       42109.600    56762.400    (34.80)    55746.200    (32.38)    49447.000    (17.42)    59412.200    (41.09)    49360.600    (17.22)
+    splash2x/volrend        149513.000   162802.400   (8.89)     162495.800   (8.68)     148992.000   (-0.35)    161995.600   (8.35)     159614.800   (6.76)
+    splash2x/water_nsquared 39106.600    54252.000    (38.73)    54117.000    (38.38)    39747.600    (1.64)     54016.000    (38.12)    50599.800    (29.39)
+    splash2x/water_spatial  667480.200   678556.600   (1.66)     674177.400   (1.00)     669400.400   (0.29)     678370.800   (1.63)     413530.600   (-38.05)
+    total                   40888200.000 40989200.000 (0.25)     40453800.000 (-1.06)    44336700.000 (8.43)     41517700.000 (1.54)     38423500.000 (-6.03)
+
+
+DAMON Overheads
+---------------
+
+In total, DAMON virtual memory access recording feature ('rec') incurs 0.89%
+runtime overhead and 0.25% memory space overhead.  Even though the size of the
+monitoring target region becomes much larger with the physical memory access
+recording ('prec'), it still shows only modest amount of overhead (0.06% for
+runtime and -1.06% for memory footprint).
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
+THP 'always' enabled policy achieves 4.04% speedup but incurs 8.43% memory
+overhead.  It achieves 40.81% speedup in the best case, but 79.60% memory
+overhead in the worst case.  Interestingly, both the best and worst-case are
+with 'splash2x/ocean_ncp').
+
+The 2-lines implementation of data access monitoring based THP version ('ethp')
+shows 3.85% speedup and 1.54% memory overhead.  In other words, 'ethp' removes
+81.73% of THP memory waste while preserving 95.29% of THP speedup in total.  In
+the case of the 'splash2x/ocean_ncp', 'ethp' removes 81.99% of THP memory waste
+while preserving 28.91% of THP speedup.
+
+
+Proactive Reclamation
+---------------------
+
+As similar to the original work, I use 4G 'zram' swap device for this
+configuration.
+
+In total, our 1 line implementation of Proactive Reclamation, 'prcl', incurred
+10.54% runtime overhead in total while achieving 6.03% system memory footprint
+reduction.
+
+Nonetheless, as the memory usage is calculated with 'MemFree' in
+'/proc/meminfo', it contains the SwapCached pages.  As the swapcached pages can
+be easily evicted, I also measured the residential set size of the workloads::
+
+    rss.avg                 orig         rec          (overhead) prec         (overhead) thp          (overhead) ethp         (overhead) prcl         (overhead)
+    parsec3/blackscholes    588097.000   586885.200   (-0.21)    586744.600   (-0.23)    587201.800   (-0.15)    587311.800   (-0.13)    240537.000   (-59.10)
+    parsec3/bodytrack       32399.200    32313.800    (-0.26)    32348.600    (-0.16)    32461.400    (0.19)     32323.400    (-0.23)    18773.400    (-42.06)
+    parsec3/canneal         844943.600   841299.200   (-0.43)    844106.000   (-0.10)    840850.800   (-0.48)    841133.400   (-0.45)    826411.600   (-2.19)
+    parsec3/dedup           1176571.000  1169106.600  (-0.63)    1186366.000  (0.83)     1209152.400  (2.77)     1177493.600  (0.08)     566093.600   (-51.89)
+    parsec3/facesim         311871.800   311856.400   (-0.00)    311872.800   (0.00)     316593.800   (1.51)     315922.000   (1.30)     190055.200   (-39.06)
+    parsec3/fluidanimate    531868.800   531871.200   (0.00)     531865.600   (-0.00)    533324.600   (0.27)     532909.200   (0.20)     439318.000   (-17.40)
+    parsec3/freqmine        552617.200   552677.000   (0.01)     552905.400   (0.05)     556087.800   (0.63)     554862.600   (0.41)     48064.800    (-91.30)
+    parsec3/raytrace        879575.200   882800.000   (0.37)     885056.600   (0.62)     872658.000   (-0.79)    879860.400   (0.03)     265878.400   (-69.77)
+    parsec3/streamcluster   110927.000   110883.800   (-0.04)    110891.000   (-0.03)    115691.000   (4.29)     115954.800   (4.53)     109740.000   (-1.07)
+    parsec3/swaptions       5681.600     5655.400     (-0.46)    5691.000     (0.17)     5667.800     (-0.24)    5703.600     (0.39)     3727.600     (-34.39)
+    parsec3/vips            32070.600    31970.000    (-0.31)    32084.800    (0.04)     34018.400    (6.07)     33693.600    (5.06)     28923.600    (-9.81)
+    parsec3/x264            81945.400    81576.200    (-0.45)    81549.000    (-0.48)    83007.200    (1.30)     83291.400    (1.64)     80758.000    (-1.45)
+    splash2x/barnes         1219427.800  1218697.800  (-0.06)    1218086.600  (-0.11)    1229194.000  (0.80)     1221392.200  (0.16)     474703.400   (-61.07)
+    splash2x/fft            10017796.200 9985709.600  (-0.32)    9977135.000  (-0.41)    10340846.200 (3.22)     9674628.200  (-3.43)    6946312.200  (-30.66)
+    splash2x/lu_cb          512014.400   511950.800   (-0.01)    511906.000   (-0.02)    512169.600   (0.03)     511962.800   (-0.01)    321004.400   (-37.31)
+    splash2x/lu_ncb         511463.600   511441.000   (-0.00)    511419.400   (-0.01)    511313.800   (-0.03)    511552.600   (0.02)     413957.000   (-19.06)
+    splash2x/ocean_cp       3404969.200  3385687.000  (-0.57)    3403813.800  (-0.03)    3435857.600  (0.91)     3422585.200  (0.52)     2231218.200  (-34.47)
+    splash2x/ocean_ncp      3939590.400  3947029.400  (0.19)     3949499.400  (0.25)     7186627.400  (82.42)    4522456.000  (14.80)    2382259.600  (-39.53)
+    splash2x/radiosity      1474598.000  1472188.800  (-0.16)    1475263.600  (0.05)     1485444.800  (0.74)     1475750.600  (0.08)     138284.600   (-90.62)
+    splash2x/radix          2497487.400  2406411.000  (-3.65)    2437140.600  (-2.42)    2466633.200  (-1.24)    2388150.000  (-4.38)    1611689.400  (-35.47)
+    splash2x/raytrace       23265.600    23294.400    (0.12)     23277.600    (0.05)     28612.600    (22.98)    27758.000    (19.31)    13457.400    (-42.16)
+    splash2x/volrend        43833.400    44100.600    (0.61)     44112.600    (0.64)     44937.200    (2.52)     44933.000    (2.51)     29907.000    (-31.77)
+    splash2x/water_nsquared 29396.800    29381.600    (-0.05)    29422.400    (0.09)     30712.800    (4.48)     29536.000    (0.47)     21251.000    (-27.71)
+    splash2x/water_spatial  664097.000   664098.400   (0.00)     664158.000   (0.01)     664195.400   (0.01)     664306.000   (0.03)     306858.400   (-53.79)
+    total                   29486597.000 29339000.000 (-0.50)    29406758.000 (-0.27)    33123200.000 (12.33)    29655583.000 (0.57)     17709300.000 (-39.94)
+
+In total, 39.94% of residential sets were reduced.
+
+With parsec3/freqmine, 'prcl' reduced 91.30% of residential sets and 23.45% of
+system memory usage while incurring only 2.08% runtime overhead.
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

