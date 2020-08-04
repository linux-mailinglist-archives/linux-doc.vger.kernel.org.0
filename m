Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D807723B762
	for <lists+linux-doc@lfdr.de>; Tue,  4 Aug 2020 11:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbgHDJOy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 4 Aug 2020 05:14:54 -0400
Received: from smtp-fw-9101.amazon.com ([207.171.184.25]:21008 "EHLO
        smtp-fw-9101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725856AbgHDJOy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Aug 2020 05:14:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1596532494; x=1628068494;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=iudxm/crZn4sMOhK0kDQQmV1gKtVAeOg8t5T9Q+pV8g=;
  b=PorWoSOI1JyayMwFx5QTKjPvpdFRfiFSaZ3XYIapTeV8iCNFiCq7sxig
   VP13nVE4Tm0G0zyZUHVcnQGfxjn5okUF2d9Eo3Q27GXJ1oK0L4KYgDORy
   eqLRh3tt2fBoDDzO/6SOvhi1iBYjxpyJGqldBroAxw47/6Rtxb8tkKH3f
   o=;
IronPort-SDR: uhndI1gB1t0rHdAkoZEPlHjZxjfhtC7LZsBlUNwnayfoxEqBXJNqhcFaaGMQU0RG3QvYyrh47a
 4aUJw7Q3TwGA==
X-IronPort-AV: E=Sophos;i="5.75,433,1589241600"; 
   d="scan'208";a="57206321"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com) ([10.47.23.38])
  by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP; 04 Aug 2020 09:14:52 +0000
Received: from EX13MTAUEA002.ant.amazon.com (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
        by email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com (Postfix) with ESMTPS id B31D7A3A5B;
        Tue,  4 Aug 2020 09:14:49 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 4 Aug 2020 09:14:49 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.162.248) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 4 Aug 2020 09:14:31 +0000
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
Subject: [PATCH v19 00/15] Introduce Data Access MONitor (DAMON)
Date:   Tue, 4 Aug 2020 11:14:01 +0200
Message-ID: <20200804091416.31039-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.162.248]
X-ClientProxiedBy: EX13D36UWA004.ant.amazon.com (10.43.160.175) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

Changes from Previous Version
=============================

- Drop loadable module support (Mike Rapoport)
- Select PAGE_EXTENSION if !64BIT for 'set_page_young()'
- Take care of the MMU notification subscribers (Shakeel Butt)
- Substitute 'struct damon_task' with 'struct damon_target' for better abstract
- Use 'struct pid' instead of 'pid_t' as the target (Shakeel Butt)
- Support pidfd from the debugfs interface (Shakeel Butt)
- Fix typos (Greg Thelen)
- Properly isolate DAMON from other pmd/pte Accessed bit users (Greg Thelen)
- Rebase on v5.8

Introduction
============

DAMON is a data access monitoring framework subsystem for the Linux kernel.
The core mechanisms of DAMON called 'region based sampling' and 'adaptive
regions adjustment' (refer to 'mechanisms.rst' in the 11th patch of this
patchset for the detail) make it

 - accurate (The monitored information is useful for DRAM level memory
   management. It might not appropriate for Cache-level accuracy, though.),
 - light-weight (The monitoring overhead is low enough to be applied online
   while making no impact on the performance of the target workloads.), and
 - scalable (the upper-bound of the instrumentation overhead is controllable
   regardless of the size of target workloads.).

Using this framework, therefore, the kernel's core memory management mechanisms
such as reclamation and THP can be optimized for better memory management.  The
experimental memory management optimization works that incurring high
instrumentation overhead will be able to have another try.  In user space,
meanwhile, users who have some special workloads will be able to write
personalized tools or applications for deeper understanding and specialized
optimizations of their systems.

Evaluations
===========

We evaluated DAMON's overhead, monitoring quality and usefulness using 25
realistic workloads on my QEMU/KVM based virtual machine running a kernel that
v16 DAMON patchset is applied.

DAMON is lightweight. It increases system memory usage by only -0.25% and
consumes less than 1% CPU time in most case. It slows target workloads down by
only 0.94%.

DAMON is accurate and useful for memory management optimizations. An
experimental DAMON-based operation scheme for THP, 'ethp', removes 31.29% of
THP memory overheads while preserving 60.64% of THP speedup. Another
experimental DAMON-based 'proactive reclamation' implementation, 'prcl',
reduces 87.95% of residential sets and 29.52% of system memory footprint while
incurring only 2.15% runtime overhead in the best case (parsec3/freqmine).

NOTE that the experimentail THP optimization and proactive reclamation are not
for production, just only for proof of concepts.

Please refer to the official document[1] or "Documentation/admin-guide/mm: Add
a document for DAMON" patch in this patchset for detailed evaluation setup and
results.

[1] https://damonitor.github.io/doc/html/latest-damon/admin-guide/mm/damon/eval.html

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

The patches are based on the v5.8.  You can also clone the complete git
tree:

    $ git clone git://github.com/sjp38/linux -b damon/patches/v19

The web is also available:
https://github.com/sjp38/linux/releases/tag/damon/patches/v19

There are a couple of trees for entire DAMON patchset series.  It includes
future features.  The first one[1] contains the changes for latest release,
while the other one[2] contains the changes for next release.

[1] https://github.com/sjp38/linux/tree/damon/master
[2] https://github.com/sjp38/linux/tree/damon/next

Sequence Of Patches
===================

First four patches implement the target address space independent core logics
of DAMON and it's programming interface.  The 1st patch introduces DAMON
subsystem, it's data structures, and the data structure related basic
manipulation functions.  Following three patches (2nd to 4th) implements the
core mechanisms of DAMON, namely regions based sampling (patch 2), adaptive
regions adjustment (patch 3), and dynamic memory mapping change adoption (patch
4).

Now the essential parts of DAMON is complete but require low level primitives
to be implemented and configured with DAMON to just work.  The following two
patches makes it just work for virtual address spaces monitoring.  The 5th
patch makes 'PG_idle' could be used by DAMON and the 6th patch implements the
virtual memory address space specific low primitives using page table Accessed
bits and the 'PG_idle' page flag.

Now DAMON just works for virtual address space monitoring via the kernel space
api.  Following six patches adds interfaces for the users in the user space.
The 7th patch implements recording of access patterns in DAMON.  Each of next
two patches (8th and 9th) respectively adds a tracepoint for other tracepoints
supporting tracers such as perf, and a debugfs interface for privileged people
and/or programs in user space.  10th patch makes the debugfs interface further
support pidfd.  And, the 11th patch implements an user space tool to provide a
minimal reference to the debugfs interface and for high level use/tests of the
DAMON.

Three patches for maintainability follows.  The 12th patch adds documentations
for both the user space and the kernel space.  The 13th patch provides unit
tests (based on the kunit) while the 14th patch adds user space tests (based on
the kselftest).

Finally, the last patch (15th) updates the MAINTAINERS file.

Patch History
=============

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

Changes from v16
(https://lore.kernel.org/linux-mm/20200615161927.12637-1-sjpark@amazon.com/)
 - Wordsmith/cleanup the documentations and the code
 - user space tool: Simplify the code and add wss option for reuse histogram
 - recording: Check disablement condition properly
 - recording: Force minimal recording buffer size (1KB)

Changes from v15
(https://lore.kernel.org/linux-mm/20200608114047.26589-1-sjpark@amazon.com/)
 - Refine commit messages (David Hildenbrand)
 - Optimizes three vma regions search (Varad Gautam)
 - Support static granularity monitoring (Shakeel Butt)
 - Cleanup code and re-organize the sequence of patches

Changes from v14
(https://lore.kernel.org/linux-mm/20200602130125.20467-1-sjpark@amazon.com/)
 - Directly pass region and task to tracepoint (Steven Rostedt)
 - Refine comments for better read
 - Add more 'Reviewed-by's (Leonard Foerster, Brendan Higgins)

Changes from v13
(https://lore.kernel.org/linux-mm/20200525091512.30391-1-sjpark@amazon.com/)
 - Fix a typo (Leonard Foerster)
 - Fix wring condition of three sub ranges split (Leonard Foerster)
 - Rebase on v5.7

Please refer to the v13 patchset to get older history.

SeongJae Park (15):
  mm: Introduce Data Access MONitor (DAMON)
  mm/damon: Implement region based sampling
  mm/damon: Adaptively adjust regions
  mm/damon: Track dynamic monitoring target regions update
  mm/idle_page_tracking: Make PG_(idle|young) reusable
  mm/damon: Implement callbacks for the virtual memory address spaces
  mm/damon: Implement access pattern recording
  mm/damon: Add a tracepoint
  mm/damon: Implement a debugfs interface
  damon/debugfs: Support pidfd target id
  tools: Introduce a minimal user-space tool for DAMON
  Documentation: Add documents for DAMON
  mm/damon: Add kunit tests
  mm/damon: Add user space selftests
  MAINTAINERS: Update for DAMON

 Documentation/admin-guide/mm/damon/guide.rst  |  157 ++
 Documentation/admin-guide/mm/damon/index.rst  |   15 +
 Documentation/admin-guide/mm/damon/plans.rst  |   29 +
 Documentation/admin-guide/mm/damon/start.rst  |   96 +
 Documentation/admin-guide/mm/damon/usage.rst  |  302 +++
 Documentation/admin-guide/mm/index.rst        |    1 +
 Documentation/vm/damon/api.rst                |   20 +
 Documentation/vm/damon/design.rst             |  166 ++
 Documentation/vm/damon/eval.rst               |  222 +++
 Documentation/vm/damon/faq.rst                |   58 +
 Documentation/vm/damon/index.rst              |   31 +
 Documentation/vm/index.rst                    |    1 +
 MAINTAINERS                                   |   13 +
 include/linux/damon.h                         |  188 ++
 include/linux/page-flags.h                    |    4 +-
 include/linux/page_ext.h                      |    2 +-
 include/linux/page_idle.h                     |    6 +-
 include/trace/events/damon.h                  |   43 +
 include/trace/events/mmflags.h                |    2 +-
 mm/Kconfig                                    |   33 +
 mm/Makefile                                   |    1 +
 mm/damon-test.h                               |  671 +++++++
 mm/damon.c                                    | 1732 +++++++++++++++++
 mm/page_ext.c                                 |   12 +-
 mm/page_idle.c                                |   10 -
 tools/damon/.gitignore                        |    1 +
 tools/damon/_damon.py                         |  130 ++
 tools/damon/_dist.py                          |   36 +
 tools/damon/_recfile.py                       |   23 +
 tools/damon/bin2txt.py                        |   67 +
 tools/damon/damo                              |   37 +
 tools/damon/heats.py                          |  362 ++++
 tools/damon/nr_regions.py                     |   91 +
 tools/damon/record.py                         |  135 ++
 tools/damon/report.py                         |   45 +
 tools/damon/wss.py                            |  100 +
 tools/testing/selftests/damon/Makefile        |    7 +
 .../selftests/damon/_chk_dependency.sh        |   28 +
 tools/testing/selftests/damon/_chk_record.py  |  109 ++
 .../testing/selftests/damon/debugfs_attrs.sh  |  161 ++
 .../testing/selftests/damon/debugfs_record.sh |   50 +
 41 files changed, 5179 insertions(+), 18 deletions(-)
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
 create mode 100644 mm/damon-test.h
 create mode 100644 mm/damon.c
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

