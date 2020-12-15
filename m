Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 922102DAC72
	for <lists+linux-doc@lfdr.de>; Tue, 15 Dec 2020 12:58:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727167AbgLOL4Z (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 15 Dec 2020 06:56:25 -0500
Received: from smtp-fw-9102.amazon.com ([207.171.184.29]:20320 "EHLO
        smtp-fw-9102.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbgLOL4Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Dec 2020 06:56:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1608033384; x=1639569384;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=MOdkUg3Fc9DMT8KJKSZ0cNhO1GevfsvudxujNnn3qNU=;
  b=tAtcm1BWUQpgeC3/6F5AHEriR58WnwJOrq7rsemS2uE1rN8V4FLTKelD
   E3yQfz5VVloE8feaI8xfgWpr8nU/jRexZuaPhb5thEKMTJyalHnx1bVho
   w79jc+7TJt7ScHCRGbCWsDQADOctUJz4J9XyJzVFMnJuyA8HqONwMshpU
   Q=;
X-IronPort-AV: E=Sophos;i="5.78,420,1599523200"; 
   d="scan'208";a="104418606"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO email-inbound-relay-1a-807d4a99.us-east-1.amazon.com) ([10.47.23.38])
  by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP; 15 Dec 2020 11:55:36 +0000
Received: from EX13D31EUA001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
        by email-inbound-relay-1a-807d4a99.us-east-1.amazon.com (Postfix) with ESMTPS id 435EDA11E0;
        Tue, 15 Dec 2020 11:55:22 +0000 (UTC)
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.162.252) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 15 Dec 2020 11:55:05 +0000
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
Subject: [PATCH v23 00/15] Introduce Data Access MONitor (DAMON)
Date:   Tue, 15 Dec 2020 12:54:33 +0100
Message-ID: <20201215115448.25633-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.162.252]
X-ClientProxiedBy: EX13D33UWC002.ant.amazon.com (10.43.162.11) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

Changes from Previous Version (v22)
===================================

- Support arbitrary targets; now DAMON incurs only zero space overhead for page
  granularity idleness monitoring
- Reorder patches for easier review (Shakeel Butt)
  - Introduce arbitrary targets with sampling first, then the overhead-accuracy
    control logic
  - Introduce data structure manipulation functions when it really used.
- Call callbacks explicitly, without macro (Shakeel Butt)
- Rename DAMON_PRIMITIVES to DAMON_VADDR (Shakeel Butt)
- Remove 'page_idle_lock' patch (Shakeel Butt)
- Drop pidfd support in debugfs (Shakeel Butt)

Introduction
============

DAMON is a data access monitoring framework for the Linux kernel.  The core
mechanisms of DAMON called 'region based sampling' and 'adaptive regions
adjustment' (refer to 'mechanisms.rst' in the 11th patch of this patchset for
the detail) make it

 - accurate (The monitored information is useful for DRAM level memory
   management. It might not appropriate for Cache-level accuracy, though.),
 - light-weight (The monitoring overhead is low enough to be applied online
   while making no impact on the performance of the target workloads.), and
 - scalable (the upper-bound of the instrumentation overhead is controllable
   regardless of the size of target workloads.).

Using this framework, therefore, several memory management mechanisms such as
reclamation and THP can be optimized to aware real data access patterns.
Experimental access pattern aware memory management optimization works that
incurring high instrumentation overhead will be able to have another try.

Though DAMON is for kernel subsystems, it can be easily exposed to the user
space by writing a DAMON-wrapper kernel subsystem.  Then, user space users who
have some special workloads will be able to write personalized tools or
applications for deeper understanding and specialized optimizations of their
systems.

Long-term Plan
--------------

DAMON is a part of a project called Data Access-aware Operating System (DAOS).
As the name implies, I want to improve the performance and efficiency of
systems using fine-grained data access patterns.  The optimizations are for
both kernel and user spaces.  I will therefore modify or create kernel
subsystems, export some of those to user space and implement user space library
/ tools.  Below shows the layers and components for the project.

    ---------------------------------------------------------------------------
    Primitives:     PTE Accessed bit, PG_idle, rmap, (Intel CMT), ...
    Framework:      DAMON
    Features:       DAMOS, virtual addr, physical addr, ...
    Applications:   DAMON-debugfs, (DARC), ...
    ^^^^^^^^^^^^^^^^^^^^^^^    KERNEL SPACE    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    Raw Interface:  debugfs, (sysfs), (damonfs), tracepoints, (sys_damon), ...

    vvvvvvvvvvvvvvvvvvvvvvv    USER SPACE      vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
    Library:        (libdamon), ...
    Tools:          DAMO, (perf), ...
    ---------------------------------------------------------------------------

The components in parentheses or marked as '...' are not implemented yet but in
the future plan.  IOW, those are the TODO tasks of DAOS project.  For more
detail, please refer to the plans:
https://lore.kernel.org/linux-mm/20201202082731.24828-1-sjpark@amazon.com/

Evaluations
===========

We evaluated DAMON's overhead, monitoring quality and usefulness using 24
realistic workloads on my QEMU/KVM based virtual machine running a kernel that
v23 DAMON patchset is applied.

DAMON is lightweight.  It increases system memory usage by 0.42% and slows
target workloads down by 0.39%.

DAMON is accurate and useful for memory management optimizations.  An
experimental DAMON-based operation scheme for THP, 'ethp', removes 81.45% of
THP memory overheads while preserving 50.09% of THP speedup.  Another
experimental DAMON-based 'proactive reclamation' implementation, 'prcl',
reduces 91.45% of residential sets and 22.91% of system memory footprint while
incurring only 2.43% runtime overhead in the best case (parsec3/freqmine).

NOTE that the experimental THP optimization and proactive reclamation are not
for production but only for proof of concepts.

Please refer to the official document[1] or "Documentation/admin-guide/mm: Add
a document for DAMON" patch in this patchset for detailed evaluation setup and
results.

[1] https://damonitor.github.io/doc/html/latest-damon/admin-guide/mm/damon/eval.html

Real-world User Story
=====================

In summary, DAMON has used on production systems and proved its usefulness.

DAMON as a profiler
-------------------

We analyzed characteristics of a large scale production systems of our
customers using DAMON.  The systems utilize 70GB DRAM and 36 CPUs.  From this,
we were able to find interesting things below.

There were obviously different access pattern under idle workload and active
workload.  Under the idle workload, it accessed large memory regions with low
frequency, while the active workload accessed small memory regions with high
freuqnecy.

DAMON found a 7GB memory region that showing obviously high access frequency
under the active workload.  We believe this is the performance-effective
working set and need to be protected.

There was a 4KB memory region that showing highest access frequency under not
only active but also idle workloads.  We think this must be a hottest code
section like thing that should never be paged out.

For this analysis, DAMON used only 0.3-1% of single CPU time.  Because we used
recording-based analysis, it consumed about 3-12 MB of disk space per 20
minutes.  This is only small amount of disk space, but we can further reduce
the disk usage by using non-recording-based DAMON features.  I'd like to argue
that only DAMON can do such detailed analysis (finding 4KB highest region in
70GB memory) with the light overhead.

DAMON as a system optimization tool
-----------------------------------

We also found below potential performance problems on the systems and made
DAMON-based solutions.

The system doesn't want to make the workload suffer from the page reclamation
and thus it utilizes enough DRAM but no swap device.  However, we found the
system is actively reclaiming file-backed pages, because the system has
intensive file IO.  The file IO turned out to be not performance critical for
the workload, but the customer wanted to ensure performance critical
file-backed pages like code section to not mistakenly be evicted.

Using direct IO should or `mlock()` would be a straightforward solution, but
modifying the user space code is not easy for the customer.  Alternatively, we
could use DAMON-based operation scheme[1].  By using it, we can ask DAMON to
track access frequency of each region and make
'process_madvise(MADV_WILLNEED)[2]' call for regions having specific size and
access frequency for a time interval.

We also found the system is having high number of TLB misses.  We tried
'always' THP enabled policy and it greatly reduced TLB misses, but the page
reclamation also been more frequent due to the THP internal fragmentation
caused memory bloat.  We could try another DAMON-based operation scheme that
applies 'MADV_HUGEPAGE' to memory regions having >=2MB size and high access
frequency, while applying 'MADV_NOHUGEPAGE' to regions having <2MB size and low
access frequency.

We do not own the systems so we only reported the analysis results and possible
optimization solutions to the customers.  The customers satisfied about the
analysis results and promised to try the optimization guides.

[1] https://lore.kernel.org/linux-mm/20201006123931.5847-1-sjpark@amazon.com/
[2] https://lore.kernel.org/linux-api/20200622192900.22757-4-minchan@kernel.org/

Comparison with Idle Page Tracking
==================================

Idle Page Tracking allows users to set and read idleness of pages using a
bitmap file which represents each page with each bit of the file.  One
recommended usage of it is working set size detection.  Users can do that by

    1. find PFN of each page for workloads in interest,
    2. set all the pages as idle by doing writes to the bitmap file,
    3. wait until the workload accesses its working set, and
    4. read the idleness of the pages again and count pages became not idle.

NOTE: While Idle Page Tracking is for user space users, DAMON is primarily
designed for kernel subsystems though it can easily exposed to the user space.
Hence, this section only assumes such user space use of DAMON.

For what use cases Idle Page Tracking would be better?
------------------------------------------------------

1. Flexible usecases other than hotness monitoring.

Because Idle Page Tracking allows users to control the primitive (Page
idleness) by themselves, Idle Page Tracking users can do anything they want.
Meanwhile, DAMON is primarily designed to monitor the hotness of each memory
region.  For this, DAMON asks users to provide sampling interval and
aggregation interval.  For the reason, there could be some use case that using
Idle Page Tracking is simpler.

2. Physical memory monitoring.

Idle Page Tracking receives PFN range as input, so natively supports physical
memory monitoring.

DAMON is designed to be extensible for multiple address spaces and use cases by
implementing and using primitives for the given use case.  Therefore, by
theory, DAMON has no limitation in the type of target address space as long as
primitives for the given address space exists.  However, the default primitives
introduced by this patchset supports only virtual address spaces.

Therefore, for physical memory monitoring, you should implement your own
primitives and use it, or simply use Idle Page Tracking.

Nonetheless, RFC patchsets[1] for the physical memory address space primitives
is already available.  It also supports user memory same to Idle Page Tracking.

[1] https://lore.kernel.org/linux-mm/20200831104730.28970-1-sjpark@amazon.com/

For what use cases DAMON is better?
-----------------------------------

1. Hotness Monitoring.

Idle Page Tracking let users know only if a page frame is accessed or not.  For
hotness check, the user should write more code and use more memory.  DAMON do
that by itself.

2. Low Monitoring Overhead

DAMON receives user's monitoring request with one step and then provide the
results.  So, roughly speaking, DAMON require only O(1) user/kernel context
switches.

In case of Idle Page Tracking, however, because the interface receives
contiguous page frames, the number of user/kernel context switches increases as
the monitoring target becomes complex and huge.  As a result, the context
switch overhead could be not negligible.

Moreover, DAMON is born to handle with the monitoring overhead.  Because the
core mechanism is pure logical, Idle Page Tracking users might be able to
implement the mechanism on thier own, but it would be time consuming and the
user/kernel context switching will still more frequent than that of DAMON.
Also, the kernel subsystems cannot use the logic in this case.

3. Page granularity working set size detection.

Until v22 of this patchset, this was categorized as the thing Idle Page
Tracking could do better, because DAMON basically maintains additional metadata
for each of the monitoring target regions.  So, in the page granularity working
set size detection use case, DAMON would incur (number of monitoring target
pages * size of metadata) memory overhead.  Size of the single metadata item is
about 54 bytes, so assuming 4KB pages, about 1.3% of monitoring target pages
will be additionally used.

All essential metadata for Idle Page Tracking are embedded in 'struct page' and
page table entries.  Therefore, in this use case, only one counter variable for
working set size accounting is required if Idle Page Tracking is used.

There are more details to consider, but roughly speaking, this is true in most
cases.

However, the situation changed from v23.  Now DAMON supports arbitrary types of
monitoring targets, which don't use the metadata.  Using that, DAMON can do the
working set size detection with no additional space overhead but less
user-kernel context switch.  A first draft for the implementation of monitoring
primitives for this usage is available in a DAMON development tree[1].  An RFC
patchset for it based on this patchset will also be available soon.

[1] https://github.com/sjp38/linux/tree/damon/pgidle_hack

4. More future usecases

While Idle Page Tracking has tight coupling with base primitives (PG_Idle and
page table Accessed bits), DAMON is designed to be extensible for many use
cases and address spaces.  If you need some special address type or want to use
special h/w access check primitives, you can write your own primitives for that
and configure DAMON to use those.  Therefore, if your use case could be changed
a lot in future, using DAMON could be better.

Can I use both Idle Page Tracking and DAMON?
--------------------------------------------

Yes, though using them concurrently for overlapping memory regions could result
in interference to each other.  Nevertheless, such use case would be rare or
makes no sense at all.  Even in the case, the noise would bot be really
significant.  So, you can choose whatever you want depending on the
characteristics of your use cases.

More Information
================

We prepared a showcase web site[1] that you can get more information.  There
are

- the official documentations[2],
- the heatmap format dynamic access pattern of various realistic workloads for
  heap area[3], mmap()-ed area[4], and stack[5] area,
- the dynamic working set size distribution[6] and chronological working set
  size changes[7], and
- the latest performance test results[8].

[1] https://damonitor.github.io/_index
[2] https://damonitor.github.io/doc/html/latest-damon
[3] https://damonitor.github.io/test/result/visual/latest/rec.heatmap.0.png.html
[4] https://damonitor.github.io/test/result/visual/latest/rec.heatmap.1.png.html
[5] https://damonitor.github.io/test/result/visual/latest/rec.heatmap.2.png.html
[6] https://damonitor.github.io/test/result/visual/latest/rec.wss_sz.png.html
[7] https://damonitor.github.io/test/result/visual/latest/rec.wss_time.png.html
[8] https://damonitor.github.io/test/result/perf/latest/html/index.html

Baseline and Complete Git Trees
===============================

The patches are based on the v5.10.  You can also clone the complete git
tree:

    $ git clone git://github.com/sjp38/linux -b damon/patches/v23

The web is also available:
https://github.com/sjp38/linux/releases/tag/damon/patches/v23

There are a couple of trees for entire DAMON patchset series.  It includes
future features.  The first one[1] contains the changes for latest release,
while the other one[2] contains the changes for next release.

[1] https://github.com/sjp38/linux/tree/damon/master
[2] https://github.com/sjp38/linux/tree/damon/next

Sequence Of Patches
===================

First three patches implement the core logics of DAMON.  The 1st patch
introduces basic sampling based hotness monitoring for arbitrary types of
targets.  Following two patches implement the core mechanisms for control of
overhead and accuracy, namely regions based sampling (patch 2) and adaptive
regions adjustment (patch 3).

Now the essential parts of DAMON is complete, but it cannot work unless someone
provides monitoring primitives for a specific use case.  The following two
patches make it just work for virtual address spaces monitoring.  The 4th patch
makes 'PG_idle' can be used by DAMON and the 5th patch implements the virtual
memory address space specific monitoring primitives using page table Accessed
bits and the 'PG_idle' page flag.

Now DAMON just works for virtual address space monitoring via the kernel space
api.  To let the user space users can use DAMON, following six patches add
interfaces for them.  The 6th patch adds a tracepoint for monitoring results.
The 7th patch implements a DAMON application kernel module, namely damon-dbgfs,
that simply wraps DAMON and exposes DAMON interface to the user space via the
debugfs interface.  To let the user space get the monitoring results more
easily, the 8th patch implements a simple recording feature in 'damon-dbgfs'.
The 9th patch further exports pid of monitoring thread (kdamond) to user space
for easier cpu usage accounting, and the 10th patch makes the debugfs interface
to support multiple contexts.  Then, the 11th patch implements a user space
tool to provide a minimal reference to the debugfs interface and for high level
use/tests of the DAMON.

Three patches for maintainability follows.  The 12th patch adds documentations
for both the user space and the kernel space.  The 13th patch provides unit
tests (based on the kunit) while the 14th patch adds user space tests (based on
the kselftest).

Finally, the last patch (15th) updates the MAINTAINERS file.

Patch History
=============

Changes from v22
(https://lore.kernel.org/linux-mm/20201020085940.13875-1-sjpark@amazon.com/)
- Support arbitrary targets; now DAMON incurs only zero space overhead for page
  granularity idleness monitoring
- Reorder patches for easier review (Shakeel Butt)
  - Introduce arbitrary targets with sampling first, then the overhead-accuracy
    control logic
  - Introduce data structure manipulation functions when it really used.
- Call callbacks explicitly, without macro (Shakeel Butt)
- Rename DAMON_PRIMITIVES to DAMON_VADDR (Shakeel Butt)
- Remove 'page_idle_lock' patch (Shakeel Butt)
- Drop pidfd support in debugfs (Shakeel Butt)

Changes from v21
(https://lore.kernel.org/linux-doc/20201005105522.23841-1-sjpark@amazon.com/)
- Fix build warnings and errors (kernel test robot)
- Fix a memory leak (kmemleak)
- Respect KUNIT_ALL_TESTS
- Rebase on v5.9
- Update the evaluation results

Changes from v20
(https://lore.kernel.org/linux-mm/20200817105137.19296-1-sjpark@amazon.com/)
- s/snprintf()/scnprintf() (Marco Elver)
- Support multiple contexts for user space users (Shakeel Butt)
- Export pid of monitoring thread to user space (Shakeel Butt)
- Let coexistable with Idle Page Tracking
- Place three parts of DAMON (core, primitives, and dbgfs) in different files

Changes from v19
(https://lore.kernel.org/linux-mm/20200804091416.31039-1-sjpark@amazon.com/)
- Place 'CREATE_TRACE_POINTS' after '#include' statements (Steven Rostedt)
- Support large record file (Alkaid)
- Place 'put_pid()' of virtual monitoring targets in 'cleanup' callback
- Avoid conflict between concurrent DAMON users
- Update evaluation result document

Changes from v18
(https://lore.kernel.org/linux-mm/20200713084144.4430-1-sjpark@amazon.com/)
- Drop loadable module support (Mike Rapoport)
- Select PAGE_EXTENSION if !64BIT for 'set_page_young()'
- Take care of the MMU notification subscribers (Shakeel Butt)
- Substitute 'struct damon_task' with 'struct damon_target' for better abstract
- Use 'struct pid' instead of 'pid_t' as the target (Shakeel Butt)
- Support pidfd from the debugfs interface (Shakeel Butt)
- Fix typos (Greg Thelen)
- Properly isolate DAMON from other pmd/pte Accessed bit users (Greg Thelen)
- Rebase on v5.8

Changes from v17
(https://lore.kernel.org/linux-mm/20200706115322.29598-1-sjpark@amazon.com/)
- Reorganize the doc and remove png blobs (Mike Rapoport)
- Wordsmith mechnisms doc and commit messages
- tools/wss: Set default working set access frequency threshold
- Avoid race in damon deamon start

Please refer to the v17 patchset to get older history.

SeongJae Park (15):
  mm: Introduce Data Access MONitor (DAMON)
  mm/damon/core: Implement region-based sampling
  mm/damon: Adaptively adjust regions
  mm/idle_page_tracking: Make PG_idle reusable
  mm/damon: Implement primitives for the virtual memory address spaces
  mm/damon: Add a tracepoint
  mm/damon: Implement a debugfs-based user space interface
  mm/damon/dbgfs: Implement recording feature
  mm/damon/dbgfs: Export kdamond pid to the user space
  mm/damon/dbgfs: Support multiple contexts
  tools: Introduce a minimal user-space tool for DAMON
  Documentation: Add documents for DAMON
  mm/damon: Add kunit tests
  mm/damon: Add user space selftests
  MAINTAINERS: Update for DAMON

 Documentation/admin-guide/mm/damon/guide.rst  | 157 ++++
 Documentation/admin-guide/mm/damon/index.rst  |  15 +
 Documentation/admin-guide/mm/damon/plans.rst  |  29 +
 Documentation/admin-guide/mm/damon/start.rst  |  96 ++
 Documentation/admin-guide/mm/damon/usage.rst  | 302 ++++++
 Documentation/admin-guide/mm/index.rst        |   1 +
 Documentation/vm/damon/api.rst                |  20 +
 Documentation/vm/damon/design.rst             | 166 ++++
 Documentation/vm/damon/eval.rst               | 227 +++++
 Documentation/vm/damon/faq.rst                |  58 ++
 Documentation/vm/damon/index.rst              |  31 +
 Documentation/vm/index.rst                    |   1 +
 MAINTAINERS                                   |  12 +
 include/linux/damon.h                         | 293 ++++++
 include/linux/page-flags.h                    |   4 +-
 include/linux/page_ext.h                      |   2 +-
 include/linux/page_idle.h                     |   6 +-
 include/trace/events/damon.h                  |  43 +
 include/trace/events/mmflags.h                |   2 +-
 mm/Kconfig                                    |  10 +
 mm/Makefile                                   |   1 +
 mm/damon/Kconfig                              |  69 ++
 mm/damon/Makefile                             |   5 +
 mm/damon/core-test.h                          | 253 +++++
 mm/damon/core.c                               | 717 +++++++++++++++
 mm/damon/dbgfs-test.h                         | 209 +++++
 mm/damon/dbgfs.c                              | 867 ++++++++++++++++++
 mm/damon/vaddr-test.h                         | 328 +++++++
 mm/damon/vaddr.c                              | 586 ++++++++++++
 mm/page_ext.c                                 |  12 +-
 mm/page_idle.c                                |  10 -
 tools/damon/.gitignore                        |   1 +
 tools/damon/_damon.py                         | 130 +++
 tools/damon/_dist.py                          |  35 +
 tools/damon/_recfile.py                       |  23 +
 tools/damon/bin2txt.py                        |  67 ++
 tools/damon/damo                              |  37 +
 tools/damon/heats.py                          | 362 ++++++++
 tools/damon/nr_regions.py                     |  91 ++
 tools/damon/record.py                         | 135 +++
 tools/damon/report.py                         |  45 +
 tools/damon/wss.py                            | 100 ++
 tools/testing/selftests/damon/Makefile        |   7 +
 .../selftests/damon/_chk_dependency.sh        |  28 +
 tools/testing/selftests/damon/_chk_record.py  | 109 +++
 .../testing/selftests/damon/debugfs_attrs.sh  | 161 ++++
 .../testing/selftests/damon/debugfs_record.sh |  50 +
 47 files changed, 5895 insertions(+), 18 deletions(-)
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
 create mode 100644 include/linux/damon.h
 create mode 100644 include/trace/events/damon.h
 create mode 100644 mm/damon/Kconfig
 create mode 100644 mm/damon/Makefile
 create mode 100644 mm/damon/core-test.h
 create mode 100644 mm/damon/core.c
 create mode 100644 mm/damon/dbgfs-test.h
 create mode 100644 mm/damon/dbgfs.c
 create mode 100644 mm/damon/vaddr-test.h
 create mode 100644 mm/damon/vaddr.c
 create mode 100644 tools/damon/.gitignore
 create mode 100644 tools/damon/_damon.py
 create mode 100644 tools/damon/_dist.py
 create mode 100644 tools/damon/_recfile.py
 create mode 100644 tools/damon/bin2txt.py
 create mode 100755 tools/damon/damo
 create mode 100644 tools/damon/heats.py
 create mode 100644 tools/damon/nr_regions.py
 create mode 100644 tools/damon/record.py
 create mode 100644 tools/damon/report.py
 create mode 100644 tools/damon/wss.py
 create mode 100644 tools/testing/selftests/damon/Makefile
 create mode 100644 tools/testing/selftests/damon/_chk_dependency.sh
 create mode 100644 tools/testing/selftests/damon/_chk_record.py
 create mode 100755 tools/testing/selftests/damon/debugfs_attrs.sh
 create mode 100755 tools/testing/selftests/damon/debugfs_record.sh

-- 
2.17.1

