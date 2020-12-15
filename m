Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F3202DACA3
	for <lists+linux-doc@lfdr.de>; Tue, 15 Dec 2020 13:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729041AbgLOMCv (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 15 Dec 2020 07:02:51 -0500
Received: from smtp-fw-4101.amazon.com ([72.21.198.25]:42488 "EHLO
        smtp-fw-4101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728773AbgLOMCo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Dec 2020 07:02:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1608033752; x=1639569752;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jkdyOsKh/um0w+NgtR3t+hFHCJX6kNRxy0XsI4AS6X4=;
  b=UVvpkDoRRbbN50hVxovX4drFNiIIMNmnVyTLlbWKXB3favLto7OboLHy
   pxgoG0PBi9gXsensNej7XTnlwJ31ty3YX65etidO3t84Tn0TZl9Pg+VVp
   cWd1sYEj579AuvFivWS9fBsD7Mnd5bQT1VwMXpjTmr8TtrD1DFu99jDWm
   o=;
X-IronPort-AV: E=Sophos;i="5.78,420,1599523200"; 
   d="scan'208";a="69462894"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-1d-e69428c4.us-east-1.amazon.com) ([10.43.8.2])
  by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP; 15 Dec 2020 12:01:44 +0000
Received: from EX13D31EUA001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
        by email-inbound-relay-1d-e69428c4.us-east-1.amazon.com (Postfix) with ESMTPS id 6EFB8C2730;
        Tue, 15 Dec 2020 12:01:31 +0000 (UTC)
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.162.252) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 15 Dec 2020 12:01:14 +0000
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
Subject: [PATCH v23 12/15] Documentation: Add documents for DAMON
Date:   Tue, 15 Dec 2020 12:54:45 +0100
Message-ID: <20201215115448.25633-13-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201215115448.25633-1-sjpark@amazon.com>
References: <20201215115448.25633-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.43.162.252]
X-ClientProxiedBy: EX13D33UWC002.ant.amazon.com (10.43.162.11) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
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
index 000000000000..ca97e6334aa7
--- /dev/null
+++ b/Documentation/vm/damon/eval.rst
@@ -0,0 +1,227 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==========
+Evaluation
+==========
+
+DAMON is lightweight.  It increases system memory usage by 0.42% and slows
+target workloads down by 0.39%.
+
+DAMON is accurate and useful for memory management optimizations.  An
+experimental DAMON-based operation scheme for THP, namely 'ethp', removes
+81.45% of THP memory overheads while preserving 50.09% of THP speedup.  Another
+experimental DAMON-based 'proactive reclamation' implementation, namely 'prcl',
+reduces 91.45% of residential sets and 22.91% of system memory footprint while
+incurring only 2.43% runtime overhead in the best case (parsec3/freqmine).
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
+- orig: Linux v5.10 with 'madvise' THP policy
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
+Using it, you can do the evaluation and generate a report on your own.
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
+    parsec3/blackscholes    138.247  139.131  (0.64)     138.872  (0.45)     138.436  (0.14)     138.599  (0.25)     151.104  (9.30)
+    parsec3/bodytrack       124.338  124.450  (0.09)     124.624  (0.23)     124.357  (0.02)     124.705  (0.29)     125.329  (0.80)
+    parsec3/canneal         211.054  216.642  (2.65)     213.773  (1.29)     176.039  (-16.59)   214.460  (1.61)     249.492  (18.21)
+    parsec3/dedup           18.452   18.218   (-1.27)    18.334   (-0.64)    18.074   (-2.05)    18.315   (-0.74)    20.489   (11.04)
+    parsec3/facesim         347.473  352.724  (1.51)     345.951  (-0.44)    340.480  (-2.01)    344.158  (-0.95)    371.561  (6.93)
+    parsec3/fluidanimate    339.895  337.531  (-0.70)    335.378  (-1.33)    326.410  (-3.97)    333.322  (-1.93)    332.785  (-2.09)
+    parsec3/freqmine        436.827  437.962  (0.26)     439.345  (0.58)     436.844  (0.00)     438.301  (0.34)     447.430  (2.43)
+    parsec3/raytrace        185.539  183.376  (-1.17)    185.962  (0.23)     186.311  (0.42)     184.981  (-0.30)    207.715  (11.95)
+    parsec3/streamcluster   682.926  686.849  (0.57)     677.420  (-0.81)    599.544  (-12.21)   615.506  (-9.87)    789.596  (15.62)
+    parsec3/swaptions       219.616  221.386  (0.81)     221.320  (0.78)     220.269  (0.30)     221.426  (0.82)     -100.000 (0.00)
+    parsec3/vips            88.397   88.504   (0.12)     87.550   (-0.96)    87.801   (-0.67)    87.638   (-0.86)    89.135   (0.84)
+    parsec3/x264            113.634  114.143  (0.45)     116.506  (2.53)     112.728  (-0.80)    116.572  (2.59)     114.607  (0.86)
+    splash2x/barnes         130.160  130.475  (0.24)     130.006  (-0.12)    119.679  (-8.05)    128.869  (-0.99)    173.767  (33.50)
+    splash2x/fft            61.243   60.419   (-1.35)    60.144   (-1.79)    46.930   (-23.37)   58.679   (-4.19)    94.651   (54.55)
+    splash2x/lu_cb          132.438  132.733  (0.22)     132.746  (0.23)     131.756  (-0.52)    132.492  (0.04)     146.579  (10.68)
+    splash2x/lu_ncb         151.133  150.656  (-0.32)    151.187  (0.04)     150.106  (-0.68)    149.088  (-1.35)    156.120  (3.30)
+    splash2x/ocean_cp       87.010   88.161   (1.32)     90.317   (3.80)     77.344   (-11.11)   77.739   (-10.65)   113.273  (30.18)
+    splash2x/ocean_ncp      161.819  160.428  (-0.86)    161.508  (-0.19)    117.250  (-27.54)   141.303  (-12.68)   279.021  (72.43)
+    splash2x/radiosity      144.159  142.662  (-1.04)    145.874  (1.19)     141.937  (-1.54)    142.184  (-1.37)    151.460  (5.06)
+    splash2x/radix          51.341   51.156   (-0.36)    51.601   (0.51)     46.678   (-9.08)    49.119   (-4.33)    82.058   (59.83)
+    splash2x/raytrace       133.543  134.201  (0.49)     134.022  (0.36)     132.010  (-1.15)    133.065  (-0.36)    141.626  (6.05)
+    splash2x/volrend        120.229  120.489  (0.22)     121.690  (1.22)     119.702  (-0.44)    119.693  (-0.45)    122.247  (1.68)
+    splash2x/water_nsquared 371.382  375.238  (1.04)     373.726  (0.63)     355.410  (-4.30)    358.243  (-3.54)    403.058  (8.53)
+    splash2x/water_spatial  133.738  134.831  (0.82)     133.865  (0.10)     133.270  (-0.35)    133.320  (-0.31)    152.743  (14.21)
+    total                   4584.600 4602.380 (0.39)     4591.740 (0.16)     4339.370 (-5.35)    4461.770 (-2.68)    4915.870 (7.23)
+
+
+    memused.avg             orig         rec          (overhead) prec         (overhead) thp          (overhead) ethp         (overhead) prcl         (overhead)
+    parsec3/blackscholes    1822419.200  1832932.800  (0.58)     1825942.600  (0.19)     1817011.600  (-0.30)    1830445.600  (0.44)     1595311.600  (-12.46)
+    parsec3/bodytrack       1424439.600  1437080.200  (0.89)     1438747.200  (1.00)     1423658.600  (-0.05)    1434771.600  (0.73)     1437144.200  (0.89)
+    parsec3/canneal         1036933.000  1054711.800  (1.71)     1050022.200  (1.26)     1032368.400  (-0.44)    1052744.400  (1.52)     1049121.200  (1.18)
+    parsec3/dedup           2500773.600  2502254.800  (0.06)     2467656.000  (-1.32)    2511153.400  (0.42)     2495594.600  (-0.21)    2488489.200  (-0.49)
+    parsec3/facesim         535653.600   550504.000   (2.77)     547305.400   (2.18)     542355.200   (1.25)     552392.400   (3.12)     484499.000   (-9.55)
+    parsec3/fluidanimate    572288.600   585018.400   (2.22)     582106.200   (1.72)     571557.400   (-0.13)    583349.400   (1.93)     493663.400   (-13.74)
+    parsec3/freqmine        982803.000   997657.400   (1.51)     995492.200   (1.29)     986962.000   (0.42)     998352.400   (1.58)     757675.800   (-22.91)
+    parsec3/raytrace        1742834.000  1754262.200  (0.66)     1747630.800  (0.28)     1731301.600  (-0.66)    1749506.400  (0.38)     1543049.400  (-11.46)
+    parsec3/streamcluster   117851.800   158437.400   (34.44)    158582.400   (34.56)    122982.600   (4.35)     135280.200   (14.79)    136526.600   (15.85)
+    parsec3/swaptions       14375.800    28709.600    (99.71)    28302.000    (96.87)    13821.400    (-3.86)    25697.800    (78.76)    -100.000     (0.00)
+    parsec3/vips            2982188.400  2998594.600  (0.55)     3004458.800  (0.75)     2981225.200  (-0.03)    2997897.400  (0.53)     2979860.000  (-0.08)
+    parsec3/x264            3241201.800  3250602.600  (0.29)     3257842.600  (0.51)     3238675.800  (-0.08)    3254314.200  (0.40)     3243305.667  (0.06)
+    splash2x/barnes         1202953.000  1212273.400  (0.77)     1199432.200  (-0.29)    1214065.600  (0.92)     1218764.400  (1.31)     881206.000   (-26.75)
+    splash2x/fft            9729496.200  9631956.200  (-1.00)    9282596.600  (-4.59)    9892176.200  (1.67)     9632687.800  (-0.99)    10320735.333 (6.08)
+    splash2x/lu_cb          512464.200   523658.200   (2.18)     515659.200   (0.62)     513609.000   (0.22)     520062.000   (1.48)     338391.667   (-33.97)
+    splash2x/lu_ncb         512790.400   528954.400   (3.15)     521128.600   (1.63)     513166.000   (0.07)     523937.800   (2.17)     426409.333   (-16.85)
+    splash2x/ocean_cp       3342031.600  3326082.400  (-0.48)    3258501.400  (-2.50)    3367646.400  (0.77)     3314408.400  (-0.83)    3181677.000  (-4.80)
+    splash2x/ocean_ncp      3904158.200  3922279.200  (0.46)     3870676.800  (-0.86)    7071312.600  (81.12)    4513390.200  (15.60)    3517213.000  (-9.91)
+    splash2x/radiosity      1460571.200  1463947.200  (0.23)     1454906.200  (-0.39)    1470355.800  (0.67)     1465063.200  (0.31)     450619.333   (-69.15)
+    splash2x/radix          2379050.200  2377324.000  (-0.07)    2270805.200  (-4.55)    2477275.200  (4.13)     2313398.800  (-2.76)    2433462.333  (2.29)
+    splash2x/raytrace       42587.000    55138.400    (29.47)    55933.200    (31.34)    49202.200    (15.53)    59114.400    (38.81)    50805.000    (19.30)
+    splash2x/volrend        149927.000   163164.400   (8.83)     161644.400   (7.82)     149249.000   (-0.45)    160589.600   (7.11)     159004.000   (6.05)
+    splash2x/water_nsquared 39653.400    54180.600    (36.64)    53137.800    (34.01)    42475.000    (7.12)     52911.800    (33.44)    47500.333    (19.79)
+    splash2x/water_spatial  669766.600   681525.600   (1.76)     674610.800   (0.72)     670925.800   (0.17)     679559.000   (1.46)     405725.667   (-39.42)
+    total                   40919400.000 41091400.000 (0.42)     40423000.000 (-1.21)    44404600.000 (8.52)     41564259.000 (1.58)     38421300.000 (-6.10)
+
+
+DAMON Overheads
+---------------
+
+In total, DAMON virtual memory access recording feature ('rec') incurs 0.39%
+runtime overhead and 0.42% memory space overhead.  Even though the size of the
+monitoring target region becomes much larger with the physical memory access
+recording ('prec'), it still shows only modest amount of overhead (0.16% for
+runtime and -1.21% for memory footprint).
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
+THP 'always' enabled policy achieves 5.35% speedup but incurs 8.52% memory
+overhead.  It achieves 27.54% speedup in the best case, but 81.72% memory
+overhead in the worst case.  Interestingly, both the best and worst-case are
+with 'splash2x/ocean_ncp').
+
+The 2-lines implementation of data access monitoring based THP version ('ethp')
+shows 2.68% speedup and 1.58% memory overhead.  In other words, 'ethp' removes
+81.45% of THP memory waste while preserving 50.09% of THP speedup in total.  In
+the case of the 'splash2x/ocean_ncp', 'ethp' removes 80.76% of THP memory waste
+while preserving 46.04% of THP speedup.
+
+
+Proactive Reclamation
+---------------------
+
+As similar to the original work, I use 4G 'zram' swap device for this
+configuration.
+
+In total, our 1 line implementation of Proactive Reclamation, 'prcl', incurred
+7.23% runtime overhead in total while achieving 6.10% system memory footprint
+reduction.
+
+Nonetheless, as the memory usage is calculated with 'MemFree' in
+'/proc/meminfo', it contains the SwapCached pages.  As the swapcached pages can
+be easily evicted, I also measured the residential set size of the workloads::
+
+    rss.avg                 orig         rec          (overhead) prec         (overhead) thp          (overhead) ethp         (overhead) prcl         (overhead)
+    parsec3/blackscholes    585288.600   586175.800   (0.15)     586433.800   (0.20)     587028.600   (0.30)     587996.000   (0.46)     240808.600   (-58.86)
+    parsec3/bodytrack       32139.000    32312.400    (0.54)     32201.800    (0.20)     32357.000    (0.68)     32263.000    (0.39)     18371.000    (-42.84)
+    parsec3/canneal         843125.000   842998.800   (-0.01)    842991.000   (-0.02)    837536.400   (-0.66)    843580.600   (0.05)     825739.000   (-2.06)
+    parsec3/dedup           1187272.400  1175883.400  (-0.96)    1183341.800  (-0.33)    1192656.600  (0.45)     1178204.600  (-0.76)    582322.000   (-50.95)
+    parsec3/facesim         311757.600   311792.200   (0.01)     311751.400   (-0.00)    317679.400   (1.90)     315929.200   (1.34)     187274.800   (-39.93)
+    parsec3/fluidanimate    531844.800   531840.800   (-0.00)    531816.800   (-0.01)    532855.200   (0.19)     532576.400   (0.14)     439993.400   (-17.27)
+    parsec3/freqmine        552634.600   552707.800   (0.01)     552549.600   (-0.02)    555529.400   (0.52)     554548.200   (0.35)     47231.400    (-91.45)
+    parsec3/raytrace        887301.000   883878.400   (-0.39)    884147.800   (-0.36)    874717.000   (-1.42)    881240.200   (-0.68)    264899.000   (-70.15)
+    parsec3/streamcluster   110901.000   110899.200   (-0.00)    110906.200   (0.00)     115357.800   (4.02)     115521.800   (4.17)     109695.400   (-1.09)
+    parsec3/swaptions       5697.800     5682.600     (-0.27)    5704.400     (0.12)     5684.000     (-0.24)    5668.600     (-0.51)    -100.000     (0.00)
+    parsec3/vips            32083.400    31877.000    (-0.64)    31873.800    (-0.65)    33041.200    (2.99)     33781.600    (5.29)     28844.667    (-10.09)
+    parsec3/x264            81776.600    81616.600    (-0.20)    81822.800    (0.06)     84827.400    (3.73)     83490.400    (2.10)     81161.333    (-0.75)
+    splash2x/barnes         1219285.200  1218478.600  (-0.07)    1218261.800  (-0.08)    1227469.800  (0.67)     1222605.400  (0.27)     460175.000   (-62.26)
+    splash2x/fft            10080559.600 10000486.200 (-0.79)    9996101.600  (-0.84)    10296965.200 (2.15)     9974327.200  (-1.05)    6932814.000  (-31.23)
+    splash2x/lu_cb          511985.800   511815.600   (-0.03)    511759.600   (-0.04)    511275.800   (-0.14)    511932.400   (-0.01)    319837.000   (-37.53)
+    splash2x/lu_ncb         511416.400   511389.800   (-0.01)    511257.800   (-0.03)    511574.800   (0.03)     511356.400   (-0.01)    412134.333   (-19.41)
+    splash2x/ocean_cp       3424155.800  3421099.600  (-0.09)    3415628.600  (-0.25)    3443500.000  (0.56)     3415558.200  (-0.25)    2436061.333  (-28.86)
+    splash2x/ocean_ncp      3939855.400  3934175.600  (-0.14)    3938673.800  (-0.03)    7177367.200  (82.17)    4581698.000  (16.29)    2391616.000  (-39.30)
+    splash2x/radiosity      1471925.400  1418593.800  (-3.62)    1474347.000  (0.16)     1485447.800  (0.92)     1475442.800  (0.24)     144195.333   (-90.20)
+    splash2x/radix          2465408.000  2484122.000  (0.76)     2449926.000  (-0.63)    2562083.200  (3.92)     2403580.400  (-2.51)    1539977.333  (-37.54)
+    splash2x/raytrace       23279.200    23288.800    (0.04)     23319.200    (0.17)     29137.000    (25.16)    26747.000    (14.90)    13287.667    (-42.92)
+    splash2x/volrend        44203.600    44115.000    (-0.20)    43493.000    (-1.61)    45079.000    (1.98)     45301.000    (2.48)     30139.333    (-31.82)
+    splash2x/water_nsquared 29424.000    29413.600    (-0.04)    29425.600    (0.01)     30163.800    (2.51)     30527.400    (3.75)     22633.667    (-23.08)
+    splash2x/water_spatial  663586.800   664276.200   (0.10)     664012.800   (0.06)     664078.800   (0.07)     663830.800   (0.04)     299712.667   (-54.83)
+    total                   29547000.000 29408900.000 (-0.47)    29431800.000 (-0.39)    33153500.000 (12.21)    30027700.000 (1.63)     17828900.000 (-39.66)
+
+In total, 39.66% of residential sets were reduced.
+
+With parsec3/freqmine, 'prcl' reduced 91.45% of residential sets and 22.91% of
+system memory usage while incurring only 2.43% runtime overhead.
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
index eff5fbd492d0..b51f0d8992f8 100644
--- a/Documentation/vm/index.rst
+++ b/Documentation/vm/index.rst
@@ -32,6 +32,7 @@ descriptions of data structures and algorithms.
    arch_pgtable_helpers
    balance
    cleancache
+   damon/index
    free_page_reporting
    frontswap
    highmem
-- 
2.17.1

