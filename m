Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 886093402E2
	for <lists+linux-doc@lfdr.de>; Thu, 18 Mar 2021 11:11:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230220AbhCRKKw (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 18 Mar 2021 06:10:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230087AbhCRKKX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Mar 2021 06:10:23 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66CFAC06174A;
        Thu, 18 Mar 2021 03:10:23 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id a9so1339360qkn.13;
        Thu, 18 Mar 2021 03:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c38wusKiZ9Be/xNlFcrywm9PQXTdOO8T5ykhQZird1w=;
        b=tPI4arDg32hzz+Oe0rsaUCiRLZq4LWQJDyJZk9xQoX8KD/MbwqZlSww7bNEJawU2yj
         j+ml/9zm5G9IkPG/Ul1NqiFl3oDfEFV8P3dnGsiAV4bh3f+PKa7iStgjbN+qFt8gKpe4
         HHBPGYgfu0OslOx06cehGUU98wJNbZryxlfSBjXYRW+IJiBXIbG9Cr86H2choj+lu/hm
         KdO1G6XsO/YdP4Bc5vCyDXyerWDOqnrOhxvcBQgwzBa/BSbbUn2SoqNY3u8WW/EZ35ZS
         XNHGTYVoknGlNiCvWZj9UG2JTqemH02i4EkCLGdhPQ5CuQztFXdq4RQznQfp/qDbl2P0
         v5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c38wusKiZ9Be/xNlFcrywm9PQXTdOO8T5ykhQZird1w=;
        b=l6k9Iao5sYyjc85b6WQ5sod5kjU0e7Y8MaZDFUjAm6Z+2ZXq0kDCAwJA83OSnbeuk/
         5sTqn24gRLS5mHZ2IYd05n0I/vw4pUXmRqYevAtapJa4FOfEviNoFivWTT4lwPWg701C
         5gKZCHiE56VBJXOOtWvc/CQQy0uxKSSBZWIhp62zjiUuvZZxv6f7mXxGHw6y0RHnST60
         6kfSKUj4v5geXLRmMcEFZeQR7XJGK9xQFqyG1+nVDt6KqEQFD3kBhdrpiOcpmhqLXyIb
         iBPC/KZk68TjRFmtUTLRJI+98aLS60EIrD+nFF33pLRUjUDtu6fee8SAZuVodjn3lIai
         jdVA==
X-Gm-Message-State: AOAM533S9XarSPG1r16lG9JcYsb+vHPC48uXfQI6VRWDkQF41DLHffKU
        FWVFBlAc+gG1u0d3QuPD/ns=
X-Google-Smtp-Source: ABdhPJyr/ibEGdy0Rf9I+7FhwL2nb7U2fQdIOz/54dCy2bNExq5sTnWHFUw1MiKBUpNcsbAJLmh/fQ==
X-Received: by 2002:ae9:df82:: with SMTP id t124mr3345335qkf.267.1616062221834;
        Thu, 18 Mar 2021 03:10:21 -0700 (PDT)
Received: from localhost.localdomain (ec2-35-169-212-159.compute-1.amazonaws.com. [35.169.212.159])
        by smtp.gmail.com with ESMTPSA id d16sm1358101qka.43.2021.03.18.03.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 03:10:21 -0700 (PDT)
From:   sj38.park@gmail.com
To:     akpm@linux-foundation.org
Cc:     SeongJae Park <sjpark@amazon.de>, Jonathan.Cameron@Huawei.com,
        acme@kernel.org, alexander.shishkin@linux.intel.com,
        amit@kernel.org, benh@kernel.crashing.org,
        brendanhiggins@google.com, corbet@lwn.net, david@redhat.com,
        dwmw@amazon.com, elver@google.com, fan.du@intel.com,
        foersleo@amazon.de, gthelen@google.com, mgorman@suse.de,
        minchan@kernel.org, mingo@redhat.com, namhyung@kernel.org,
        peterz@infradead.org, riel@surriel.com, rientjes@google.com,
        rostedt@goodmis.org, rppt@kernel.org, shakeelb@google.com,
        shuah@kernel.org, sj38.park@gmail.com, snu@amazon.de,
        vbabka@suse.cz, vdavydov.dev@gmail.com, zgf574564920@gmail.com,
        linux-damon@amazon.com, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v25 10/13] Documentation: Add documents for DAMON
Date:   Thu, 18 Mar 2021 10:08:53 +0000
Message-Id: <20210318100856.34715-11-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210318100856.34715-1-sj38.park@gmail.com>
References: <20210318100856.34715-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

This commit adds documents for DAMON under
`Documentation/admin-guide/mm/damon/` and `Documentation/vm/damon/`.

Signed-off-by: SeongJae Park <sjpark@amazon.de>
---
 Documentation/admin-guide/mm/damon/guide.rst | 159 +++++++++++++
 Documentation/admin-guide/mm/damon/index.rst |  15 ++
 Documentation/admin-guide/mm/damon/plans.rst |  29 +++
 Documentation/admin-guide/mm/damon/start.rst |  97 ++++++++
 Documentation/admin-guide/mm/damon/usage.rst | 112 +++++++++
 Documentation/admin-guide/mm/index.rst       |   1 +
 Documentation/vm/damon/api.rst               |  20 ++
 Documentation/vm/damon/design.rst            | 166 +++++++++++++
 Documentation/vm/damon/eval.rst              | 232 +++++++++++++++++++
 Documentation/vm/damon/faq.rst               |  58 +++++
 Documentation/vm/damon/index.rst             |  31 +++
 Documentation/vm/index.rst                   |   1 +
 12 files changed, 921 insertions(+)
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
index 000000000000..49da40bc4ba9
--- /dev/null
+++ b/Documentation/admin-guide/mm/damon/guide.rst
@@ -0,0 +1,159 @@
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
+space tool (``damo``) will be useful for this.  You can get ``damo`` from
+``tools/damon/`` directory in the DAMON development tree (``damon/master``
+branch of https://github.com/sjp38/linux.git).
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
index 000000000000..69bac6782624
--- /dev/null
+++ b/Documentation/admin-guide/mm/damon/start.rst
@@ -0,0 +1,97 @@
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
+DAMON development kernel source tree (``damon/master`` branch of
+https://github.com/sjp38/linux).  For brevity, below examples assume you set
+``$PATH`` to point it.  It's not mandatory, though.
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
index 000000000000..ccf631c3c2c2
--- /dev/null
+++ b/Documentation/admin-guide/mm/damon/usage.rst
@@ -0,0 +1,112 @@
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
+This document describes only the debugfs interface because the user space tool
+is only in the development tree (``damon/master`` branch of
+https://github.com/sjp38/linux) and you could refer to :doc:`/vm/damon/api` for
+the kernel space programming interface.
+
+
+debugfs Interface
+=================
+
+DAMON exports three files, ``attrs``, ``target_ids``, and ``monitor_on`` under
+its debugfs directory, ``<debugfs>/damon/``.
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
+
+
+Tracepoint for Monitoring Results
+=================================
+
+DAMON provides the monitoring results via a tracepoint,
+``damon:damon_aggregated``.  While the monitoring is turned on, you could
+record the tracepoint events and show results using tracepoint supporting tools
+like ``perf``.  For example::
+
+    # echo on > monitor_on
+    # perf record damon:damon_aggregated &
+    # sleep 5
+    # kill 9 $(pidof perf)
+    # echo off > monitor_on
+    # perf script
diff --git a/Documentation/admin-guide/mm/index.rst b/Documentation/admin-guide/mm/index.rst
index 4b14d8b50e9e..cbd19d5e625f 100644
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
index 000000000000..4ce1a6d86036
--- /dev/null
+++ b/Documentation/vm/damon/eval.rst
@@ -0,0 +1,232 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==========
+Evaluation
+==========
+
+DAMON is lightweight.  It increases system memory usage by 0.39% and slows
+target workloads down by 1.16%.
+
+DAMON is accurate and useful for memory management optimizations.  An
+experimental DAMON-based operation scheme for THP, namely 'ethp', removes
+76.15% of THP memory overheads while preserving 51.25% of THP speedup.  Another
+experimental DAMON-based 'proactive reclamation' implementation, namely 'prcl',
+reduces 93.38% of residential sets and 23.63% of system memory footprint while
+incurring only 1.22% runtime overhead in the best case (parsec3/freqmine).
+
+
+Setup
+=====
+
+On QEMU/KVM based virtual machines utilizing 130GB of RAM and 36 vCPUs hosted
+by AWS EC2 i3.metal instances that running a kernel that v24 DAMON patchset is
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
+is as similar as the original work.  For example, those can be implemented as
+below::
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
+Note that these examples are designed with my only straightforward intuition
+because those are for only proof of concepts and monitoring accuracy of DAMON.
+In other words, those are not for production.  For production use, those should
+be more tuned.  For automation of such tuning, you can use a user space tool
+called DAMOOS [8]_.  For the evaluation, we use 'ethp' as same to above
+example, but we use DAMOOS-tuned 'prcl' for each workload.
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
+.. [8] "DAMOOS", https://github.com/awslabs/damoos
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
+    parsec3/blackscholes    139.658  140.168  (0.37)     139.385  (-0.20)    138.367  (-0.92)    139.279  (-0.27)    147.024  (5.27)
+    parsec3/bodytrack       123.788  124.622  (0.67)     123.636  (-0.12)    125.115  (1.07)     123.840  (0.04)     141.928  (14.65)
+    parsec3/canneal         207.491  210.318  (1.36)     217.927  (5.03)     174.287  (-16.00)   202.609  (-2.35)    225.483  (8.67)
+    parsec3/dedup           18.292   18.301   (0.05)     18.378   (0.47)     18.264   (-0.15)    18.298   (0.03)     20.541   (12.30)
+    parsec3/facesim         343.893  340.286  (-1.05)    338.217  (-1.65)    332.953  (-3.18)    333.840  (-2.92)    365.650  (6.33)
+    parsec3/fluidanimate    339.959  326.886  (-3.85)    330.286  (-2.85)    331.239  (-2.57)    326.011  (-4.10)    341.684  (0.51)
+    parsec3/freqmine        445.987  436.332  (-2.16)    435.946  (-2.25)    435.704  (-2.31)    437.595  (-1.88)    451.414  (1.22)
+    parsec3/raytrace        184.106  182.158  (-1.06)    182.056  (-1.11)    183.180  (-0.50)    183.545  (-0.30)    202.197  (9.83)
+    parsec3/streamcluster   599.990  674.091  (12.35)    617.314  (2.89)     521.864  (-13.02)   551.971  (-8.00)    696.127  (16.02)
+    parsec3/swaptions       220.462  222.637  (0.99)     220.449  (-0.01)    219.921  (-0.25)    221.607  (0.52)     223.956  (1.59)
+    parsec3/vips            87.767   88.700   (1.06)     87.461   (-0.35)    87.466   (-0.34)    87.875   (0.12)     91.768   (4.56)
+    parsec3/x264            110.843  117.856  (6.33)     113.023  (1.97)     108.665  (-1.97)    115.434  (4.14)     117.811  (6.29)
+    splash2x/barnes         131.441  129.275  (-1.65)    128.341  (-2.36)    119.317  (-9.22)    126.199  (-3.99)    147.602  (12.30)
+    splash2x/fft            59.705   58.382   (-2.22)    58.858   (-1.42)    45.949   (-23.04)   59.939   (0.39)     64.548   (8.11)
+    splash2x/lu_cb          132.552  131.604  (-0.72)    131.846  (-0.53)    132.320  (-0.18)    132.100  (-0.34)    140.289  (5.84)
+    splash2x/lu_ncb         150.215  149.670  (-0.36)    149.646  (-0.38)    148.823  (-0.93)    149.416  (-0.53)    152.338  (1.41)
+    splash2x/ocean_cp       84.033   76.405   (-9.08)    75.104   (-10.63)   73.487   (-12.55)   77.789   (-7.43)    77.380   (-7.92)
+    splash2x/ocean_ncp      153.833  154.247  (0.27)     156.227  (1.56)     106.619  (-30.69)   139.299  (-9.45)    165.030  (7.28)
+    splash2x/radiosity      143.566  143.654  (0.06)     142.426  (-0.79)    141.193  (-1.65)    141.740  (-1.27)    157.817  (9.93)
+    splash2x/radix          49.984   49.996   (0.02)     50.519   (1.07)     46.573   (-6.82)    50.724   (1.48)     50.695   (1.42)
+    splash2x/raytrace       133.238  134.337  (0.83)     134.389  (0.86)     134.833  (1.20)     131.073  (-1.62)    145.541  (9.23)
+    splash2x/volrend        121.700  120.652  (-0.86)    120.560  (-0.94)    120.629  (-0.88)    119.581  (-1.74)    129.422  (6.35)
+    splash2x/water_nsquared 370.771  375.236  (1.20)     376.829  (1.63)     355.592  (-4.09)    354.087  (-4.50)    419.606  (13.17)
+    splash2x/water_spatial  133.295  132.931  (-0.27)    132.762  (-0.40)    133.090  (-0.15)    133.809  (0.39)     153.647  (15.27)
+    total                   4486.580 4538.750 (1.16)     4481.600 (-0.11)    4235.430 (-5.60)    4357.660 (-2.87)    4829.510 (7.64)
+
+
+    memused.avg             orig         rec          (overhead) prec         (overhead) thp          (overhead) ethp         (overhead) prcl         (overhead)
+    parsec3/blackscholes    1828693.600  1834084.000  (0.29)     1823839.800  (-0.27)    1819296.600  (-0.51)    1830281.800  (0.09)     1603975.800  (-12.29)
+    parsec3/bodytrack       1424963.400  1440085.800  (1.06)     1438384.200  (0.94)     1421718.400  (-0.23)    1432834.600  (0.55)     1439283.000  (1.00)
+    parsec3/canneal         1036782.600  1052828.800  (1.55)     1050148.600  (1.29)     1035104.400  (-0.16)    1051145.400  (1.39)     1050019.400  (1.28)
+    parsec3/dedup           2511841.400  2507374.000  (-0.18)    2472450.600  (-1.57)    2523557.600  (0.47)     2508912.000  (-0.12)    2493347.200  (-0.74)
+    parsec3/facesim         537769.800   550740.800   (2.41)     548683.600   (2.03)     543547.800   (1.07)     560556.600   (4.24)     482782.600   (-10.23)
+    parsec3/fluidanimate    570268.600   585598.000   (2.69)     579837.800   (1.68)     571433.000   (0.20)     582112.800   (2.08)     470073.400   (-17.57)
+    parsec3/freqmine        982941.400   996253.200   (1.35)     993919.800   (1.12)     990531.800   (0.77)     1000994.400  (1.84)     750685.800   (-23.63)
+    parsec3/raytrace        1737446.000  1749908.800  (0.72)     1741183.800  (0.22)     1726674.800  (-0.62)    1748530.200  (0.64)     1552275.600  (-10.66)
+    parsec3/streamcluster   115857.000   155194.400   (33.95)    158272.800   (36.61)    122125.200   (5.41)     134545.600   (16.13)    133448.600   (15.18)
+    parsec3/swaptions       13694.200    28451.800    (107.76)   28464.600    (107.86)   12797.800    (-6.55)    25328.200    (84.96)    28138.400    (105.48)
+    parsec3/vips            2976126.400  3002408.600  (0.88)     3008218.800  (1.08)     2978258.600  (0.07)     2995428.600  (0.65)     2936338.600  (-1.34)
+    parsec3/x264            3233886.200  3258790.200  (0.77)     3248355.000  (0.45)     3232070.000  (-0.06)    3256360.200  (0.69)     3254707.400  (0.64)
+    splash2x/barnes         1210470.600  1211918.600  (0.12)     1204507.000  (-0.49)    1210892.800  (0.03)     1217414.800  (0.57)     944053.400   (-22.01)
+    splash2x/fft            9697440.000  9604535.600  (-0.96)    9210571.800  (-5.02)    9867368.000  (1.75)     9637571.800  (-0.62)    9804092.000  (1.10)
+    splash2x/lu_cb          510680.400   521792.600   (2.18)     517724.600   (1.38)     513500.800   (0.55)     519980.600   (1.82)     351787.000   (-31.11)
+    splash2x/lu_ncb         512896.200   529353.600   (3.21)     521248.600   (1.63)     513493.200   (0.12)     523793.400   (2.12)     418701.600   (-18.37)
+    splash2x/ocean_cp       3320800.200  3313688.400  (-0.21)    3225585.000  (-2.87)    3359032.200  (1.15)     3316591.800  (-0.13)    3304702.200  (-0.48)
+    splash2x/ocean_ncp      3915132.400  3917401.000  (0.06)     3884086.400  (-0.79)    7050398.600  (80.08)    4532528.600  (15.77)    3920395.800  (0.13)
+    splash2x/radiosity      1456908.200  1467611.800  (0.73)     1453612.600  (-0.23)    1466695.400  (0.67)     1467495.600  (0.73)     421197.600   (-71.09)
+    splash2x/radix          2345874.600  2318202.200  (-1.18)    2261499.200  (-3.60)    2438228.400  (3.94)     2373697.800  (1.19)     2336605.600  (-0.40)
+    splash2x/raytrace       43258.800    57624.200    (33.21)    55164.600    (27.52)    46204.400    (6.81)     60475.000    (39.80)    48865.400    (12.96)
+    splash2x/volrend        149615.000   163809.400   (9.49)     162115.400   (8.36)     149119.600   (-0.33)    162747.800   (8.78)     157734.600   (5.43)
+    splash2x/water_nsquared 40384.400    54848.600    (35.82)    53796.600    (33.21)    41455.800    (2.65)     53226.400    (31.80)    58260.600    (44.27)
+    splash2x/water_spatial  670580.200   680444.200   (1.47)     670020.400   (-0.08)    668262.400   (-0.35)    678552.000   (1.19)     372931.000   (-44.39)
+    total                   40844300.000 41002900.000 (0.39)     40311600.000 (-1.30)    44301900.000 (8.47)     41671052.000 (2.02)     38334431.000 (-6.14)
+
+
+DAMON Overheads
+---------------
+
+In total, DAMON virtual memory access recording feature ('rec') incurs 1.16%
+runtime overhead and 0.39% memory space overhead.  Even though the size of the
+monitoring target region becomes much larger with the physical memory access
+recording ('prec'), it still shows only modest amount of overhead (-0.11% for
+runtime and -1.30% for memory footprint).
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
+THP 'always' enabled policy achieves 5.60% speedup but incurs 8.47% memory
+overhead.  It achieves 30.69% speedup in the best case, but 80.08% memory
+overhead in the worst case.  Interestingly, both the best and worst-case are
+with 'splash2x/ocean_ncp').
+
+The 2-lines implementation of data access monitoring based THP version ('ethp')
+shows 2.87% speedup and 2.02% memory overhead.  In other words, 'ethp' removes
+76.15% of THP memory waste while preserving 51.25% of THP speedup in total.  In
+the case of the 'splash2x/ocean_ncp', 'ethp' removes 80.30% of THP memory waste
+while preserving 30.79% of THP speedup.
+
+
+Proactive Reclamation
+---------------------
+
+As similar to the original work, I use 4G 'zram' swap device for this
+configuration.  Also note that we use DAMOOS-tuned ethp schemes for each
+workload.
+
+In total, our 1 line implementation of Proactive Reclamation, 'prcl', incurred
+7.64% runtime overhead in total while achieving 6.14% system memory footprint
+reduction.  Even in the worst case, the runtime overhead was only 16.02%.
+
+Nonetheless, as the memory usage is calculated with 'MemFree' in
+'/proc/meminfo', it contains the SwapCached pages.  As the swapcached pages can
+be easily evicted, I also measured the residential set size of the workloads::
+
+    rss.avg                 orig         rec          (overhead) prec         (overhead) thp          (overhead) ethp         (overhead) prcl         (overhead)
+    parsec3/blackscholes    587536.800   585720.000   (-0.31)    586233.400   (-0.22)    587045.400   (-0.08)    586753.400   (-0.13)    252207.400   (-57.07)
+    parsec3/bodytrack       32302.200    32290.600    (-0.04)    32261.800    (-0.13)    32215.800    (-0.27)    32173.000    (-0.40)    6798.800     (-78.95)
+    parsec3/canneal         842370.600   841443.400   (-0.11)    844012.400   (0.19)     838074.400   (-0.51)    841700.800   (-0.08)    840804.000   (-0.19)
+    parsec3/dedup           1180414.800  1164634.600  (-1.34)    1188886.200  (0.72)     1207821.000  (2.32)     1193896.200  (1.14)     572359.200   (-51.51)
+    parsec3/facesim         311848.400   311709.800   (-0.04)    311790.800   (-0.02)    317345.800   (1.76)     315443.400   (1.15)     188488.000   (-39.56)
+    parsec3/fluidanimate    531868.000   531885.600   (0.00)     531828.800   (-0.01)    532988.000   (0.21)     532959.600   (0.21)     415153.200   (-21.94)
+    parsec3/freqmine        552491.000   552718.600   (0.04)     552807.200   (0.06)     556574.200   (0.74)     554374.600   (0.34)     36573.400    (-93.38)
+    parsec3/raytrace        879683.400   880752.200   (0.12)     879907.000   (0.03)     870631.000   (-1.03)    880952.200   (0.14)     293119.200   (-66.68)
+    parsec3/streamcluster   110991.800   110937.200   (-0.05)    110964.600   (-0.02)    115606.800   (4.16)     116199.000   (4.69)     110108.200   (-0.80)
+    parsec3/swaptions       5665.000     5718.400     (0.94)     5720.600     (0.98)     5682.200     (0.30)     5628.600     (-0.64)    3613.800     (-36.21)
+    parsec3/vips            32143.600    31823.200    (-1.00)    31912.200    (-0.72)    33164.200    (3.18)     33925.800    (5.54)     27813.600    (-13.47)
+    parsec3/x264            81534.000    81811.000    (0.34)     81708.400    (0.21)     83052.400    (1.86)     83758.800    (2.73)     81691.800    (0.19)
+    splash2x/barnes         1220515.200  1218291.200  (-0.18)    1217699.600  (-0.23)    1228551.600  (0.66)     1220669.800  (0.01)     681096.000   (-44.20)
+    splash2x/fft            9915850.400  10036461.000 (1.22)     9881242.800  (-0.35)    10334603.600 (4.22)     10006993.200 (0.92)     8975181.200  (-9.49)
+    splash2x/lu_cb          511327.200   511679.000   (0.07)     511761.600   (0.08)     511971.600   (0.13)     511711.200   (0.08)     338005.000   (-33.90)
+    splash2x/lu_ncb         511505.000   506816.800   (-0.92)    511392.800   (-0.02)    496623.000   (-2.91)    511410.200   (-0.02)    404734.000   (-20.87)
+    splash2x/ocean_cp       3398834.000  3405017.800  (0.18)     3415287.800  (0.48)     3443604.600  (1.32)     3416264.200  (0.51)     3387134.000  (-0.34)
+    splash2x/ocean_ncp      3947092.800  3939805.400  (-0.18)    3952311.600  (0.13)     7165858.800  (81.55)    4610075.000  (16.80)    3944753.400  (-0.06)
+    splash2x/radiosity      1475024.000  1474053.200  (-0.07)    1475032.400  (0.00)     1483718.800  (0.59)     1475919.600  (0.06)     99637.200    (-93.25)
+    splash2x/radix          2431302.200  2416928.600  (-0.59)    2455596.800  (1.00)     2568526.400  (5.64)     2479966.800  (2.00)     2437406.600  (0.25)
+    splash2x/raytrace       23274.400    23278.400    (0.02)     23287.200    (0.05)     28828.000    (23.86)    27800.200    (19.45)    5667.000     (-75.65)
+    splash2x/volrend        44106.800    44151.400    (0.10)     44186.000    (0.18)     45200.400    (2.48)     44751.200    (1.46)     16912.000    (-61.66)
+    splash2x/water_nsquared 29427.200    29425.600    (-0.01)    29402.400    (-0.08)    28055.400    (-4.66)    28572.400    (-2.90)    13207.800    (-55.12)
+    splash2x/water_spatial  664312.200   664095.600   (-0.03)    663025.200   (-0.19)    664100.600   (-0.03)    663597.400   (-0.11)    261214.200   (-60.68)
+    total                   29321300.000 29401500.000 (0.27)     29338300.000 (0.06)     33179900.000 (13.16)    30175600.000 (2.91)     23393600.000 (-20.22)
+
+In total, 20.22% of residential sets were reduced.
+
+With parsec3/freqmine, 'prcl' reduced 93.38% of residential sets and 23.63% of
+system memory usage while incurring only 1.22% runtime overhead.
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

