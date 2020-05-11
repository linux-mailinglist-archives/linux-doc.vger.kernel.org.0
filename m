Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B2361CD9F7
	for <lists+linux-doc@lfdr.de>; Mon, 11 May 2020 14:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729849AbgEKMeF (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 11 May 2020 08:34:05 -0400
Received: from smtp-fw-33001.amazon.com ([207.171.190.10]:49956 "EHLO
        smtp-fw-33001.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727994AbgEKMeE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 May 2020 08:34:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1589200438; x=1620736438;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7UJUEQHtRFv2rne8EoT1fCT4gbQROtLDJhWGy4RKvpM=;
  b=KaOHnINiYkc1gnWE2hxDtZrpusQ5pXGqx0mSB8o6R+6c44Xw/eYTZ14v
   63PmJEHA/lxONTxqdQHD1QylSpeitJRh97A2DgNuJaWdz4kHAr/WqEqY8
   57J9kpEBM89+9LLBetcObNCq9/kcJ5G0HNGSiEexQKuxGPSVDdnuhHLt7
   I=;
IronPort-SDR: UZSykiLRT4cnHuO1srBjANzlzZnQte4z3Uv1hkUX/zzTtKHOkuJdaFuxGe1ArqCE10aNLM7XUM
 aKPf168P/N4A==
X-IronPort-AV: E=Sophos;i="5.73,379,1583193600"; 
   d="scan'208";a="43929391"
Received: from sea32-co-svc-lb4-vlan2.sea.corp.amazon.com (HELO email-inbound-relay-1e-57e1d233.us-east-1.amazon.com) ([10.47.23.34])
  by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP; 11 May 2020 12:33:53 +0000
Received: from EX13MTAUEA002.ant.amazon.com (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
        by email-inbound-relay-1e-57e1d233.us-east-1.amazon.com (Postfix) with ESMTPS id 351A714173F;
        Mon, 11 May 2020 12:33:41 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 11 May 2020 12:33:41 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.161.253) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 11 May 2020 12:33:24 +0000
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
Subject: [PATCH v11 00/16] Introduce Data Access MONitor (DAMON)
Date:   Mon, 11 May 2020 14:32:46 +0200
Message-ID: <20200511123302.12520-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.43.161.253]
X-ClientProxiedBy: EX13D06UWC001.ant.amazon.com (10.43.162.91) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

Introduction
============

Memory management decisions can be improved if finer data access information is
available.  However, because such finer information usually comes with higher
overhead, most systems including Linux forgives the potential benefit and rely
on only coarse information or some light-weight heuristics.  The pseudo-LRU and
the aggressive THP promotions are such examples.

A number of data access pattern awared memory management optimizations (refer
to 'Appendix A' for more details) consistently say the potential benefit is not
small.  However, none of those has successfully merged to the mainline Linux
kernel mainly due to the absence of a scalable and efficient data access
monitoring mechanism.  Refer to 'Appendix B' to see the limitations of existing
memory monitoring mechanisms.

DAMON is a data access monitoring subsystem for the problem.  It is 1) accurate
enough to be used for the DRAM level memory management (a straightforward
DAMON-based optimization achieved up to 2.55x speedup), 2) light-weight enough
to be applied online (compared to a straightforward access monitoring scheme,
DAMON is up to 94,242.42x lighter) and 3) keeps predefined upper-bound overhead
regardless of the size of target workloads (thus scalable).  Refer to 'Appendix
C' if you interested in how it is possible, and 'Appendix F' to know how the
numbers collected.

DAMON has mainly designed for the kernel's memory management mechanisms.
However, because it is implemented as a standalone kernel module and provides
several interfaces, it can be used by a wide range of users including kernel
space programs, user space programs, programmers, and administrators.  DAMON
is now supporting the monitoring only, but it will also provide simple and
convenient data access pattern awared memory managements by itself.  Refer to
'Appendix D' for more detailed expected usages of DAMON.


Boring? Here Are Something Colorful
===================================

For intuitive understanding of DAMON, I made web pages[1-8] showing the
visualized dynamic data access pattern of various realistic workloads in
PARSEC3 and SPLASH-2X bechmark suites.  The figures are generated using the
user space tool in 10th patch of this patchset.

There are pages showing the heatmap format dynamic access pattern of each
workload for heap area[1], mmap()-ed area[2], and stack[3] area.  I splitted
the entire address space to the three area because there are huge unmapped
regions between the areas.

You can also show how the dynamic working set size of each workload is
distributed[4], and how it is chronologically changing[5].

The most important characteristic of DAMON is its promise of the upperbound of
the monitoring overhead.  To show whether DAMON keeps the promise well, I
visualized the number of monitoring operations required for each 5
milliseconds, which is configured to not exceed 1000.  You can show the
distribution of the numbers[6] and how it changes chronologically[7].

[1] https://damonitor.github.io/reports/latest/by_image/heatmap.0.png.html
[2] https://damonitor.github.io/reports/latest/by_image/heatmap.1.png.html
[3] https://damonitor.github.io/reports/latest/by_image/heatmap.2.png.html
[4] https://damonitor.github.io/reports/latest/by_image/wss_sz.png.html
[5] https://damonitor.github.io/reports/latest/by_image/wss_time.png.html
[6] https://damonitor.github.io/reports/latest/by_image/nr_regions_sz.png.html
[7] https://damonitor.github.io/reports/latest/by_image/nr_regions_time.png.html


Future Plans
============

This patchset is only for the first stage of DAMON.  As soon as this patchset
is merged, official patchsets for below future plans will be posted.


Automate Data Access Pattern-aware Memory Management
----------------------------------------------------

Though DAMON provides the monitoring feature, implementing data access pattern
aware memory management schemes could be difficult to beginners.  DAMON will be
able to do most of the work by itself in near future.  Users will be required
to only describe what kind of data access monitoring-based operation schemes
they want.

By applying a very simple scheme for THP promotion/demotion with a latest
version of the patchset (not posted yet), DAMON achieved 18x lower memory space
overhead compared to THP while preserving about 50% of the THP performance
benefit with SPLASH-2X benchmark suite.

An RFC patchset for this plan is already available
(https://lore.kernel.org/linux-mm/20200429124540.32232-1-sjpark@amazon.com/).


Support Various Address Spaces
------------------------------

Currently, DAMON supports virtual memory address spaces using PTE Accessed bits
as its access checking primitive.  However, the core design of DAMON is not
dependent to such implementation details.  In a future, DAMON will decouple
those and support various address spaces including physical memory.  It will
further allow users to configure and even implement the primitives by
themselves for their special usecase.  Monitoring of page cache, NUMA nodes,
specific files, or block devices would be examples of such usecases.

An RFC patchset for this plan is already available
(https://lore.kernel.org/linux-mm/20200409094232.29680-1-sjpark@amazon.com/).


Frequently Asked Questions
==========================

Q: Why a new module, instead of extending perf or other tools?
A: First, DAMON aims to be used by other programs including the kernel.
Therefore, having dependency to specific tools like perf is not desirable.
Second, because it need to be lightweight as much as possible so that it can be
used online, any unnecessary overhead such as kernel - user space context
switching cost should be avoided.  These are the two most biggest reasons why
DAMON is implemented in the kernel space.  The idle page tracking subsystem
would be the kernel module that most seems similar to DAMON.  However, its own
interface is not compatible with DAMON.  Also, the internal implementation of
it has no common part to be reused by DAMON.

Q: Can 'perf mem' or PMUs used instead of DAMON?
A: No.  Roughly speaking, DAMON has two seperate layers.  The low layer is
access check of pages, and the higher layer is its core mechanisms for overhead
controlling.  For the low layer, DAMON is now using the PTE Accessed bits.
Other H/W or S/W features that can be used for the access check of pages, such
as 'perf mem', PMU, or even page idle, could be used instead in the layer.
However, those could not alternate the high layer of DAMON.


Evaluations
===========

We evaluated DAMON's overhead, monitoring quality and usefulness using 25
realistic workloads on my QEMU/KVM based virtual machine.

DAMON is lightweight.  It consumes only 0.03% more system memory and up to 1%
CPU time.  It makes target worloads only 0.7% slower.

DAMON is accurate and useful for memory management optimizations.  An
experimental DAMON-based operation scheme for THP removes 63.12% of THP memory
overheads while preserving 49.15% of THP speedup.  Another experimental
DAMON-based 'proactive reclamation' implementation reduces 85.85% of
residentail sets and 21.98% of system memory footprint while incurring only
2.42% runtime overhead in best case (parsec3/freqmine).

NOTE that the experimentail THP optimization and proactive reclamation are not
for production, just only for proof of concepts.

Please refer to 'Appendix E' for detailed evaluation setup and results.


References
==========

Prototypes of DAMON have introduced by an LPC kernel summit track talk[1] and
two academic papers[2,3].  Please refer to those for more detailed information,
especially the evaluations.  The latest version of the patchsets has also
introduced by an LWN artice[4].

[1] SeongJae Park, Tracing Data Access Pattern with Bounded Overhead and
    Best-effort Accuracy. In The Linux Kernel Summit, September 2019.
    https://linuxplumbersconf.org/event/4/contributions/548/
[2] SeongJae Park, Yunjae Lee, Heon Y. Yeom, Profiling Dynamic Data Access
    Patterns with Controlled Overhead and Quality. In 20th ACM/IFIP
    International Middleware Conference Industry, December 2019.
    https://dl.acm.org/doi/10.1145/3366626.3368125
[3] SeongJae Park, Yunjae Lee, Yunhee Kim, Heon Y. Yeom, Profiling Dynamic Data
    Access Patterns with Bounded Overhead and Accuracy. In IEEE International
    Workshop on Foundations and Applications of Self- Systems (FAS 2019), June
    2019.
[4] Jonathan Corbet, Memory-management optimization with DAMON. In Linux Weekly
    News (LWN), Feb 2020. https://lwn.net/Articles/812707/


Baseline and Complete Git Trees
===============================

The patches are based on the v5.6.  You can also clone the complete git
tree:

    $ git clone git://github.com/sjp38/linux -b damon/patches/v11

The web is also available:
https://github.com/sjp38/linux/releases/tag/damon/patches/v11

This patchset contains patches for the stabled main logic of DAMON only.  The
latest DAMON development tree is also available at:
https://github.com/sjp38/linux/tree/damon/master


Sequence Of Patches
===================

The patches are organized in the following sequence.  The first two patches are
preparation of DAMON patchset.  The 1st patch adds typos found in previous
versions of DAMON patchset to 'scripts/spelling.txt' so that the typos can be
caught by 'checkpatch.pl'.  The 2nd patch exports 'lookup_page_ext()' to GPL
modules so that it can be used by DAMON even though it is built as a loadable
module.

Next five patches implement the core of DAMON and it's programming interface.
The 3rd patch introduces DAMON module, it's data structures, and data structure
related common functions.  Following four patches (4nd to 7th) implements the
core mechanisms of DAMON, namely regions based sampling (patch 4), adaptive
regions adjustment (patches 5-6), and dynamic memory mapping chage adoption
(patch 7).

Following four patches are for low level users of DAMON.  The 8th patch
implements callbacks for each of monitoring steps so that users can do whatever
they want with the access patterns.  The 9th one implements recording of access
patterns in DAMON for better convenience and efficiency.  Each of next two
patches (10th and 11th) respectively adds a debugfs interface for privileged
people and/or programs in user space, and a tracepoint for other tracepoints
supporting tracers such as perf.

Two patches for high level users of DAMON follows.  To provide a minimal
reference to the debugfs interface and for high level use/tests of the DAMON,
the next patch (12th) implements an user space tool.  The 13th patch adds a
document for administrators of DAMON.

Next two patches are for tests.  The 14th and 15th patches provide unit tests
(based on kunit) and user space tests (based on kselftest), respectively.

Finally, the last patch (16th) updates the MAINTAINERS file.


Patch History
=============

The most biggest change in this version is support of minimal region size,
which defaults to 'PAGE_SIZE'.  This change will reduce unnecessary region
splits and thus improve the quality of the output.  In a future, we will be
able to make this configurable for support of various access check primitives
such as PMUs.

Changes from v10
(https://lore.kernel.org/linux-mm/20200505110815.10532-1-sjpark@amazon.com/)
 - Reduce aggressive split overhead by doing it only if required

Changes from v9
(https://lore.kernel.org/linux-mm/20200427120442.24179-1-sjpark@amazon.com/)
 - Split each region into 4 subregions if possible (Jonathan Cameraon)
 - Update kunit test for the split code change

Changes from v8
(https://lore.kernel.org/linux-mm/20200406130938.14066-1-sjpark@amazon.com/)
 - Make regions always aligned by minimal region size that can be changed
   (Stefan Nuernberger)
 - Store binary format version in the recording file (Stefan Nuernberger)
 - Use 'int' for pid instead of 'unsigned long' (Stefan Nuernberger)
 - Fix a race condition in damon thread termination (Stefan Nuernberger)
 - Optimize random value generation and recording (Stefan Nuernberger)
 - Clean up commit messages and comments (Stefan Nuernberger)
 - Clean up code (Stefan Nuernberger)
 - Use explicit signalling and 'do_exit()' for damon thread termination 
 - Add more typos to spelling.txt
 - Update the performance evaluation results
 - Describe future plans in the cover letter

Changes from v7
(https://lore.kernel.org/linux-mm/20200318112722.30143-1-sjpark@amazon.com/)
 - Cleanup variable names (Jonathan Cameron)
 - Split sampling address setup from access_check() (Jonathan Cameron)
 - Make sampling address to always locate in the region (Jonathan Cameron)
 - Make initial region's sampling addr to be old (Jonathan Cameron)
 - Split kdamond on/off function to seperate functions (Jonathan Cameron)
 - Fix wrong kernel doc comments (Jonathan Cameron)
 - Reset 'last_accessed' to false in kdamond_check_access() if necessary
 - Rebase on v5.6

Changes from v6
(https://lore.kernel.org/linux-mm/20200224123047.32506-1-sjpark@amazon.com/)
 - Wordsmith cover letter (Shakeel Butt)
 - Cleanup code and commit messages (Jonathan Cameron)
 - Avoid kthread_run() under spinlock critical section (Jonathan Cameron)
 - Use kthread_stop() (Jonathan Cameron)
 - Change tracepoint to trace regions (Jonathan Cameron)
 - Implement API from the beginning (Jonathan Cameron)
 - Fix typos (Jonathan Cameron)
 - Fix access checking to properly handle regions smaller than single page
   (Jonathan Cameron)
 - Add found typos to 'scripts/spelling.txt'
 - Add recent evaluation results including DAMON-based Operation Schemes

Changes from v5
(https://lore.kernel.org/linux-mm/20200217103110.30817-1-sjpark@amazon.com/)
 - Fix minor bugs (sampling, record attributes, debugfs and user space tool)
 - selftests: Add debugfs interface tests for the bugs
 - Modify the user space tool to use its self default values for parameters
 - Fix pmg huge page access check

Changes from v4
(https://lore.kernel.org/linux-mm/20200210144812.26845-1-sjpark@amazon.com/)
 - Add 'Reviewed-by' for the kunit tests patch (Brendan Higgins)
 - Make the unit test to depedns on 'DAMON=y' (Randy Dunlap and kbuild bot)
   Reported-by: kbuild test robot <lkp@intel.com>
 - Fix m68k module build issue
   Reported-by: kbuild test robot <lkp@intel.com>
 - Add selftests
 - Seperate patches for low level users from core logics for better reading
 - Clean up debugfs interface
 - Trivial nitpicks

Changes from v3
(https://lore.kernel.org/linux-mm/20200204062312.19913-1-sj38.park@gmail.com/)
 - Fix i386 build issue
   Reported-by: kbuild test robot <lkp@intel.com>
 - Increase the default size of the monitoring result buffer to 1 MiB
 - Fix misc bugs in debugfs interface

Changes from v2
(https://lore.kernel.org/linux-mm/20200128085742.14566-1-sjpark@amazon.com/)
 - Move MAINTAINERS changes to last commit (Brendan Higgins)
 - Add descriptions for kunittest: why not only entire mappings and what the 4
   input sets are trying to test (Brendan Higgins)
 - Remove 'kdamond_need_stop()' test (Brendan Higgins)
 - Discuss about the 'perf mem' and DAMON (Peter Zijlstra)
 - Make CV clearly say what it actually does (Peter Zijlstra)
 - Answer why new module (Qian Cai)
 - Diable DAMON by default (Randy Dunlap)
 - Change the interface: Seperate recording attributes
   (attrs, record, rules) and allow multiple kdamond instances
 - Implement kernel API interface

Changes from v1
(https://lore.kernel.org/linux-mm/20200120162757.32375-1-sjpark@amazon.com/)
 - Rebase on v5.5
 - Add a tracepoint for integration with other tracers (Kirill A. Shutemov)
 - document: Add more description for the user space tool (Brendan Higgins)
 - unittest: Improve readability (Brendan Higgins)
 - unittest: Use consistent name and helpers function (Brendan Higgins)
 - Update PG_Young to avoid reclaim logic interference (Yunjae Lee)

Changes from RFC
(https://lore.kernel.org/linux-mm/20200110131522.29964-1-sjpark@amazon.com/)
 - Specify an ambiguous plan of access pattern based mm optimizations
 - Support loadable module build
 - Cleanup code

SeongJae Park (16):
  scripts/spelling: Add a few more typos
  mm/page_ext: Export lookup_page_ext() to GPL modules
  mm: Introduce Data Access MONitor (DAMON)
  mm/damon: Implement region based sampling
  mm/damon: Adaptively adjust regions
  mm/damon: Split regions into 3 subregions if necessary
  mm/damon: Apply dynamic memory mapping changes
  mm/damon: Implement callbacks
  mm/damon: Implement access pattern recording
  mm/damon: Add debugfs interface
  mm/damon: Add tracepoints
  tools: Add a minimal user-space tool for DAMON
  Documentation/admin-guide/mm: Add a document for DAMON
  mm/damon: Add kunit tests
  mm/damon: Add user space selftests
  MAINTAINERS: Update for DAMON

 .../admin-guide/mm/data_access_monitor.rst    |  428 +++++
 Documentation/admin-guide/mm/index.rst        |    1 +
 MAINTAINERS                                   |   12 +
 include/linux/damon.h                         |   78 +
 include/trace/events/damon.h                  |   43 +
 mm/Kconfig                                    |   23 +
 mm/Makefile                                   |    1 +
 mm/damon-test.h                               |  622 +++++++
 mm/damon.c                                    | 1511 +++++++++++++++++
 mm/page_ext.c                                 |    1 +
 scripts/spelling.txt                          |    8 +
 tools/damon/.gitignore                        |    1 +
 tools/damon/_dist.py                          |   36 +
 tools/damon/_recfile.py                       |   23 +
 tools/damon/bin2txt.py                        |   67 +
 tools/damon/damo                              |   37 +
 tools/damon/heats.py                          |  362 ++++
 tools/damon/nr_regions.py                     |   91 +
 tools/damon/record.py                         |  212 +++
 tools/damon/report.py                         |   45 +
 tools/damon/wss.py                            |   97 ++
 tools/testing/selftests/damon/Makefile        |    7 +
 .../selftests/damon/_chk_dependency.sh        |   28 +
 tools/testing/selftests/damon/_chk_record.py  |  108 ++
 .../testing/selftests/damon/debugfs_attrs.sh  |  139 ++
 .../testing/selftests/damon/debugfs_record.sh |   50 +
 26 files changed, 4031 insertions(+)
 create mode 100644 Documentation/admin-guide/mm/data_access_monitor.rst
 create mode 100644 include/linux/damon.h
 create mode 100644 include/trace/events/damon.h
 create mode 100644 mm/damon-test.h
 create mode 100644 mm/damon.c
 create mode 100644 tools/damon/.gitignore
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

================================== >8 =========================================
Appendix A: Related Works
=========================

There are a number of researches[1,2,3,4,5,6] optimizing memory management
mechanisms based on the actual memory access patterns that shows impressive
results.  However, most of those has no deep consideration about the monitoring
of the accesses itself.  Some of those focused on the overhead of the
monitoring, but does not consider the accuracy scalability[6] or has additional
dependencies[7].  Indeed, one recent research[5] about the proactive
reclamation has also proposed[8] to the kernel community but the monitoring
overhead was considered a main problem.

[1] Subramanya R Dulloor, Amitabha Roy, Zheguang Zhao, Narayanan Sundaram,
    Nadathur Satish, Rajesh Sankaran, Jeff Jackson, and Karsten Schwan. 2016.
    Data tiering in heterogeneous memory systems. In Proceedings of the 11th
    European Conference on Computer Systems (EuroSys). ACM, 15.
[2] Youngjin Kwon, Hangchen Yu, Simon Peter, Christopher J Rossbach, and Emmett
    Witchel. 2016. Coordinated and efficient huge page management with ingens.
    In 12th USENIX Symposium on Operating Systems Design and Implementation
    (OSDI).  705–721.
[3] Harald Servat, Antonio J Peña, Germán Llort, Estanislao Mercadal,
    HansChristian Hoppe, and Jesús Labarta. 2017. Automating the application
    data placement in hybrid memory systems. In 2017 IEEE International
    Conference on Cluster Computing (CLUSTER). IEEE, 126–136.
[4] Vlad Nitu, Boris Teabe, Alain Tchana, Canturk Isci, and Daniel Hagimont.
    2018. Welcome to zombieland: practical and energy-efficient memory
    disaggregation in a datacenter. In Proceedings of the 13th European
    Conference on Computer Systems (EuroSys). ACM, 16.
[5] Andres Lagar-Cavilla, Junwhan Ahn, Suleiman Souhlal, Neha Agarwal, Radoslaw
    Burny, Shakeel Butt, Jichuan Chang, Ashwin Chaugule, Nan Deng, Junaid
    Shahid, Greg Thelen, Kamil Adam Yurtsever, Yu Zhao, and Parthasarathy
    Ranganathan.  2019. Software-Defined Far Memory in Warehouse-Scale
    Computers.  In Proceedings of the 24th International Conference on
    Architectural Support for Programming Languages and Operating Systems
    (ASPLOS).  ACM, New York, NY, USA, 317–330.
    DOI:https://doi.org/10.1145/3297858.3304053
[6] Carl Waldspurger, Trausti Saemundsson, Irfan Ahmad, and Nohhyun Park.
    2017. Cache Modeling and Optimization using Miniature Simulations. In 2017
    USENIX Annual Technical Conference (ATC). USENIX Association, Santa
    Clara, CA, 487–498.
    https://www.usenix.org/conference/atc17/technical-sessions/
[7] Haojie Wang, Jidong Zhai, Xiongchao Tang, Bowen Yu, Xiaosong Ma, and
    Wenguang Chen. 2018. Spindle: Informed Memory Access Monitoring. In 2018
    USENIX Annual Technical Conference (ATC). USENIX Association, Boston, MA,
    561–574.  https://www.usenix.org/conference/atc18/presentation/wang-haojie
[8] Jonathan Corbet. 2019. Proactively reclaiming idle memory. (2019).
    https://lwn.net/Articles/787611/.


Appendix B: Limitations of Other Access Monitoring Techniques
=============================================================

The memory access instrumentation techniques which are applied to
many tools such as Intel PIN is essential for correctness required cases such
as memory access bug detections or cache level optimizations.  However, those
usually incur exceptionally high overhead which is unacceptable.

Periodic access checks based on access counting features (e.g., PTE Accessed
bits or PG_Idle flags) can reduce the overhead.  It sacrifies some of the
quality but it's still ok to many of this domain.  However, the overhead
arbitrarily increase as the size of the target workload grows.  Miniature-like
static region based sampling can set the upperbound of the overhead, but it
will now decrease the quality of the output as the size of the workload grows.

DAMON is another solution that overcomes the limitations.  It is 1) accurate
enough for this domain, 2) light-weight so that it can be applied online, and
3) allow users to set the upper-bound of the overhead, regardless of the size
of target workloads.  It is implemented as a simple and small kernel module to
support various users in both of the user space and the kernel space.  Refer to
'Evaluations' section below for detailed performance of DAMON.

For the goals, DAMON utilizes its two core mechanisms, which allows lightweight
overhead and high quality of output, repectively.  To show how DAMON promises
those, refer to 'Mechanisms of DAMON' section below.


Appendix C: Mechanisms of DAMON
===============================


Basic Access Check
------------------

DAMON basically reports what pages are how frequently accessed.  The report is
passed to users in binary format via a ``result file`` which users can set it's
path.  Note that the frequency is not an absolute number of accesses, but a
relative frequency among the pages of the target workloads.

Users can also control the resolution of the reports by setting two time
intervals, ``sampling interval`` and ``aggregation interval``.  In detail,
DAMON checks access to each page per ``sampling interval``, aggregates the
results (counts the number of the accesses to each page), and reports the
aggregated results per ``aggregation interval``.  For the access check of each
page, DAMON uses the Accessed bits of PTEs.

This is thus similar to the previously mentioned periodic access checks based
mechanisms, which overhead is increasing as the size of the target process
grows.


Region Based Sampling
---------------------

To avoid the unbounded increase of the overhead, DAMON groups a number of
adjacent pages that assumed to have same access frequencies into a region.  As
long as the assumption (pages in a region have same access frequencies) is
kept, only one page in the region is required to be checked.  Thus, for each
``sampling interval``, DAMON randomly picks one page in each region and clears
its Accessed bit.  After one more ``sampling interval``, DAMON reads the
Accessed bit of the page and increases the access frequency of the region if
the bit has set meanwhile.  Therefore, the monitoring overhead is controllable
by setting the number of regions.  DAMON allows users to set the minimal and
maximum number of regions for the trade-off.

Except the assumption, this is almost same with the above-mentioned
miniature-like static region based sampling.  In other words, this scheme
cannot preserve the quality of the output if the assumption is not guaranteed.


Adaptive Regions Adjustment
---------------------------

At the beginning of the monitoring, DAMON constructs the initial regions by
evenly splitting the memory mapped address space of the process into the
user-specified minimal number of regions.  In this initial state, the
assumption is normally not kept and thus the quality could be low.  To keep the
assumption as much as possible, DAMON adaptively merges and splits each region.
For each ``aggregation interval``, it compares the access frequencies of
adjacent regions and merges those if the frequency difference is small.  Then,
after it reports and clears the aggregated access frequency of each region, it
splits each region into two regions if the total number of regions is smaller
than the half of the user-specified maximum number of regions.

In this way, DAMON provides its best-effort quality and minimal overhead while
keeping the bounds users set for their trade-off.


Applying Dynamic Memory Mappings
--------------------------------

Only a number of small parts in the super-huge virtual address space of the
processes is mapped to physical memory and accessed.  Thus, tracking the
unmapped address regions is just wasteful.  However, tracking every memory
mapping change might incur an overhead.  For the reason, DAMON applies the
dynamic memory mapping changes to the tracking regions only for each of an
user-specified time interval (``regions update interval``).


Appendix D: Expected Use-cases
==============================

A straightforward usecase of DAMON would be the program behavior analysis.
With the DAMON output, users can confirm whether the program is running as
intended or not.  This will be useful for debuggings and tests of design
points.

The monitored results can also be useful for counting the dynamic working set
size of workloads.  For the administration of memory overcommitted systems or
selection of the environments (e.g., containers providing different amount of
memory) for your workloads, this will be useful.

If you are a programmer, you can optimize your program by managing the memory
based on the actual data access pattern.  For example, you can identify the
dynamic hotness of your data using DAMON and call ``mlock()`` to keep your hot
data in DRAM, or call ``madvise()`` with ``MADV_PAGEOUT`` to proactively
reclaim cold data.  Even though your program is guaranteed to not encounter
memory pressure, you can still improve the performance by applying the DAMON
outputs for call of ``MADV_HUGEPAGE`` and ``MADV_NOHUGEPAGE``.  More creative
optimizations would be possible.  Our evaluations of DAMON includes a
straightforward optimization using the ``mlock()``.  Please refer to the below
Evaluation section for more detail.

As DAMON incurs very low overhead, such optimizations can be applied not only
offline, but also online.  Also, there is no reason to limit such optimizations
to the user space.  Several parts of the kernel's memory management mechanisms
could be also optimized using DAMON. The reclamation, the THP (de)promotion
decisions, and the compaction would be such a candidates.  DAMON will continue
its development to be highly optimized for the online/in-kernel uses.  We will
further automate the optimization for many usecases.


Appendix E: Evaluations
=======================

Setup
-----

On my personal QEMU/KVM based virtual machine on an Intel i7 host machine
running Ubuntu 18.04, I measure runtime and consumed system memory while
running various realistic workloads with several configurations.  I use 13 and
12 workloads in PARSEC3[3] and SPLASH-2X[4] benchmark suites, respectively.  I
personally use another wrapper scripts[5] for setup and run of the workloads.
On top of this patchset, we also applied the DAMON-based operation schemes
patchset[6] for this evaluation.

Measurement
~~~~~~~~~~~

For the measurement of the amount of consumed memory in system global scope, I
drop caches before starting each of the workloads and monitor 'MemFree' in the
'/proc/meminfo' file.  To make results more stable, I repeat the runs 5 times
and average results.  You can get stdev, min, and max of the numbers among the
repeated runs in appendix below.

Configurations
~~~~~~~~~~~~~~

The configurations I use are as below.

orig: Linux v5.5 with 'madvise' THP policy
rec: 'orig' plus DAMON running with record feature
thp: same with 'orig', but use 'always' THP policy
ethp: 'orig' plus a DAMON operation scheme[6], 'efficient THP'
prcl: 'orig' plus a DAMON operation scheme, 'proactive reclaim[7]'

I use 'rec' for measurement of DAMON overheads to target workloads and system
memory.  The remaining configs including 'thp', 'ethp', and 'prcl' are for
measurement of DAMON monitoring accuracy.

'ethp' and 'prcl' is simple DAMON-based operation schemes developed for
proof of concepts of DAMON.  'ethp' reduces memory space waste of THP by using
DAMON for decision of promotions and demotion for huge pages, while 'prcl' is
as similar as the original work.  Those are implemented as below:

# format: <min/max size> <min/max frequency (0-100)> <min/max age> <action>
# ethp: Use huge pages if a region >2MB shows >5% access rate, use regular
# pages if a region >2MB shows <5% access rate for >1 second
2M null    5 null    null null    hugepage
2M null    null 5    1s null      nohugepage

# prcl: If a region >4KB shows <5% access rate for >5 seconds, page out.
4K null    null 5    500ms null      pageout

Note that both 'ethp' and 'prcl' are designed with my only straightforward
intuition, because those are for only proof of concepts and monitoring accuracy
of DAMON.  In other words, those are not for production.  For production use,
those should be tuned more.


[1] "Redis latency problems troubleshooting", https://redis.io/topics/latency
[2] "Disable Transparent Huge Pages (THP)",
    https://docs.mongodb.com/manual/tutorial/transparent-huge-pages/
[3] "The PARSEC Becnhmark Suite", https://parsec.cs.princeton.edu/index.htm
[4] "SPLASH-2x", https://parsec.cs.princeton.edu/parsec3-doc.htm#splash2x
[5] "parsec3_on_ubuntu", https://github.com/sjp38/parsec3_on_ubuntu
[6] "[RFC v4 0/7] Implement Data Access Monitoring-based Memory Operation
    Schemes",
    https://lore.kernel.org/linux-mm/20200303121406.20954-1-sjpark@amazon.com/
[7] "Proactively reclaiming idle memory", https://lwn.net/Articles/787611/


Results
-------

Below two tables show the measurement results.  The runtimes are in seconds
while the memory usages are in KiB.  Each configurations except 'orig' shows
its overhead relative to 'orig' in percent within parenthesises.

runtime                 orig     rec      (overhead) thp      (overhead) ethp     (overhead) prcl     (overhead)
parsec3/blackscholes    107.065  107.478  (0.39)     106.682  (-0.36)    107.365  (0.28)     111.811  (4.43)
parsec3/bodytrack       79.256   79.450   (0.25)     78.645   (-0.77)    79.314   (0.07)     80.305   (1.32)
parsec3/canneal         139.497  141.181  (1.21)     121.526  (-12.88)   130.074  (-6.75)    154.644  (10.86)
parsec3/dedup           11.879   11.873   (-0.05)    11.693   (-1.56)    11.948   (0.58)     12.694   (6.86)
parsec3/facesim         207.814  208.467  (0.31)     203.743  (-1.96)    206.759  (-0.51)    214.603  (3.27)
parsec3/ferret          190.124  190.955  (0.44)     189.575  (-0.29)    190.852  (0.38)     191.548  (0.75)
parsec3/fluidanimate    211.046  212.282  (0.59)     208.832  (-1.05)    212.143  (0.52)     218.774  (3.66)
parsec3/freqmine        289.259  290.096  (0.29)     288.510  (-0.26)    290.177  (0.32)     296.269  (2.42)
parsec3/raytrace        118.522  119.701  (0.99)     119.469  (0.80)     118.964  (0.37)     130.584  (10.18)
parsec3/streamcluster   323.619  327.830  (1.30)     283.374  (-12.44)   287.837  (-11.06)   330.216  (2.04)
parsec3/swaptions       154.007  155.714  (1.11)     154.767  (0.49)     154.955  (0.62)     155.256  (0.81)
parsec3/vips            58.822   58.750   (-0.12)    58.564   (-0.44)    58.807   (-0.02)    60.320   (2.55)
parsec3/x264            67.335   72.516   (7.69)     64.680   (-3.94)    70.096   (4.10)     72.465   (7.62)
splash2x/barnes         80.335   80.979   (0.80)     73.758   (-8.19)    78.874   (-1.82)    99.226   (23.52)
splash2x/fft            33.441   33.312   (-0.38)    22.909   (-31.49)   31.561   (-5.62)    41.496   (24.09)
splash2x/lu_cb          85.691   85.706   (0.02)     84.352   (-1.56)    85.943   (0.29)     88.914   (3.76)
splash2x/lu_ncb         92.338   92.749   (0.45)     89.773   (-2.78)    92.888   (0.60)     94.104   (1.91)
splash2x/ocean_cp       44.542   44.795   (0.57)     42.958   (-3.56)    44.061   (-1.08)    49.091   (10.21)
splash2x/ocean_ncp      82.101   82.006   (-0.12)    51.418   (-37.37)   64.496   (-21.44)   105.998  (29.11)
splash2x/radiosity      91.296   91.353   (0.06)     90.668   (-0.69)    91.379   (0.09)     103.265  (13.11)
splash2x/radix          31.243   31.417   (0.56)     25.176   (-19.42)   30.297   (-3.03)    38.474   (23.14)
splash2x/raytrace       84.405   84.863   (0.54)     83.498   (-1.08)    83.637   (-0.91)    85.166   (0.90)
splash2x/volrend        87.516   88.156   (0.73)     86.311   (-1.38)    87.016   (-0.57)    88.318   (0.92)
splash2x/water_nsquared 233.515  233.826  (0.13)     221.169  (-5.29)    224.430  (-3.89)    236.929  (1.46)
splash2x/water_spatial  89.207   89.448   (0.27)     89.396   (0.21)     89.826   (0.69)     97.700   (9.52)
total                   2993.890 3014.920 (0.70)     2851.460 (-4.76)    2923.710 (-2.34)    3158.180 (5.49)


memused.avg             orig         rec          (overhead) thp          (overhead) ethp         (overhead) prcl         (overhead)
parsec3/blackscholes    1819997.200  1832626.000  (0.69)     1821707.000  (0.09)     1830010.400  (0.55)     1651016.200  (-9.28)
parsec3/bodytrack       1416437.600  1430462.200  (0.99)     1420736.400  (0.30)     1428355.600  (0.84)     1430327.000  (0.98)
parsec3/canneal         1040414.400  1050736.800  (0.99)     1041515.600  (0.11)     1048562.200  (0.78)     1049049.400  (0.83)
parsec3/dedup           2414431.800  2454260.400  (1.65)     2423175.400  (0.36)     2396560.200  (-0.74)    2379898.200  (-1.43)
parsec3/facesim         540432.200   551410.200   (2.03)     545978.200   (1.03)     558558.400   (3.35)     483755.400   (-10.49)
parsec3/ferret          318728.600   333971.800   (4.78)     322158.200   (1.08)     332889.200   (4.44)     327896.400   (2.88)
parsec3/fluidanimate    576917.800   585126.600   (1.42)     575123.200   (-0.31)    585429.200   (1.48)     484810.600   (-15.97)
parsec3/freqmine        987882.200   997030.600   (0.93)     990429.200   (0.26)     998484.000   (1.07)     770740.200   (-21.98)
parsec3/raytrace        1747059.800  1752904.000  (0.33)     1738853.600  (-0.47)    1753948.600  (0.39)     1578118.000  (-9.67)
parsec3/streamcluster   121857.600   133934.400   (9.91)     121777.800   (-0.07)    133145.800   (9.26)     131512.800   (7.92)
parsec3/swaptions       14123.000    29254.400    (107.14)   14017.200    (-0.75)    26470.600    (87.43)    28429.800    (101.30)
parsec3/vips            2957631.800  2972884.400  (0.52)     2938855.400  (-0.63)    2960746.000  (0.11)     2946850.800  (-0.36)
parsec3/x264            3184777.200  3214527.400  (0.93)     3177061.000  (-0.24)    3192446.600  (0.24)     3185851.800  (0.03)
splash2x/barnes         1209737.200  1214763.200  (0.42)     1242138.400  (2.68)     1215857.600  (0.51)     994280.800   (-17.81)
splash2x/fft            9362799.400  9178844.600  (-1.96)    9264052.600  (-1.05)    9164996.600  (-2.11)    9452048.200  (0.95)
splash2x/lu_cb          515716.000   524071.600   (1.62)     521226.200   (1.07)     524261.400   (1.66)     372910.200   (-27.69)
splash2x/lu_ncb         512898.200   523057.600   (1.98)     520630.800   (1.51)     523779.000   (2.12)     446282.400   (-12.99)
splash2x/ocean_cp       3346038.000  3288703.600  (-1.71)    3386906.600  (1.22)     3330937.200  (-0.45)    3266442.400  (-2.38)
splash2x/ocean_ncp      3886945.600  3871894.000  (-0.39)    7066192.000  (81.79)    5065229.800  (30.31)    3652078.200  (-6.04)
splash2x/radiosity      1467107.200  1468850.800  (0.12)     1481292.600  (0.97)     1470335.800  (0.22)     530923.400   (-63.81)
splash2x/radix          1708330.800  1699792.200  (-0.50)    1352708.600  (-20.82)   1601339.200  (-6.26)    2043947.800  (19.65)
splash2x/raytrace       44817.200    59047.800    (31.75)    52010.200    (16.05)    60407.200    (34.79)    53916.400    (20.30)
splash2x/volrend        151534.200   167791.400   (10.73)    151759.000   (0.15)     165012.400   (8.89)     160864.600   (6.16)
splash2x/water_nsquared 46549.400    61846.800    (32.86)    51741.200    (11.15)    59214.400    (27.21)    91869.400    (97.36)
splash2x/water_spatial  669085.200   675929.200   (1.02)     665924.600   (-0.47)    676218.200   (1.07)     538430.200   (-19.53)
total                   40062200.000 40073700.000 (0.03)     42888000.000 (7.05)     41103100.000 (2.60)     38052200.000 (-5.02)


DAMON Overheads
~~~~~~~~~~~~~~~

In total, DAMON recording feature incurs 0.70% runtime overhead and 0.03%
memory space overhead.

For convenience test run of 'rec', I use a Python wrapper.  The wrapper
constantly consumes about 10-15MB of memory.  This becomes high memory overhead
if the target workload has small memory footprint.  Nonetheless, the overheads
are not from DAMON, but from the wrapper, and thus should be ignored.  This
fake memory overhead continues in 'ethp' and 'prcl', as those configurations
are also using the Python wrapper.


Efficient THP
~~~~~~~~~~~~~

THP 'always' enabled policy achieves 4.76% speedup but incurs 7.05% memory
overhead.  It achieves 37.37% speedup in best case, but 81.79% memory overhead
in worst case.  Interestingly, both the best and worst case are with
'splash2x/ocean_ncp').

The 2-lines implementation of data access monitoring based THP version ('ethp')
shows 2.34% speedup and 2.60% memory overhead.  In other words, 'ethp' removes
63.12% of THP memory waste while preserving 49.15% of THP speedup in total.  In
case of the 'splash2x/ocean_ncp', 'ethp' removes 62.94% of THP memory waste
while preserving 57.37% of THP speedup.


Proactive Reclamation
~~~~~~~~~~~~~~~~~~~~

As same to the original work, I use 'zram' swap device for this configuration.

In total, our 1 line implementation of Proactive Reclamation, 'prcl', incurred
8.41% runtime overhead in total while achieving 5.83% system memory usage
reduction.

Nonetheless, as the memory usage is calculated with 'MemFree' in
'/proc/meminfo', it contains the SwapCached pages.  As the swapcached pages can
be easily evicted, I also measured the residential set size of the workloads:

rss.avg                 orig         rec          (overhead) thp          (overhead) ethp         (overhead) prcl         (overhead)
parsec3/blackscholes    591452.000   591466.400   (0.00)     593145.200   (0.29)     590609.400   (-0.14)    324379.000   (-45.16)
parsec3/bodytrack       32458.600    32352.200    (-0.33)    32218.400    (-0.74)    32376.400    (-0.25)    27186.000    (-16.24)
parsec3/canneal         841311.600   839888.400   (-0.17)    837008.400   (-0.51)    837811.000   (-0.42)    823276.200   (-2.14)
parsec3/dedup           1219096.600  1228038.800  (0.73)     1235610.800  (1.35)     1214267.000  (-0.40)    992031.000   (-18.63)
parsec3/facesim         311322.200   311574.400   (0.08)     316277.000   (1.59)     312593.800   (0.41)     188789.400   (-39.36)
parsec3/ferret          99536.600    99556.800    (0.02)     102366.000   (2.84)     99799.000    (0.26)     88392.000    (-11.20)
parsec3/fluidanimate    531893.600   531856.000   (-0.01)    532143.400   (0.05)     532190.200   (0.06)     421798.800   (-20.70)
parsec3/freqmine        553533.200   552730.400   (-0.15)    555642.600   (0.38)     553895.400   (0.07)     78335.000    (-85.85)
parsec3/raytrace        894094.200   894849.000   (0.08)     889964.000   (-0.46)    892865.000   (-0.14)    332911.800   (-62.77)
parsec3/streamcluster   110938.000   110968.200   (0.03)     111673.400   (0.66)     111312.200   (0.34)     109911.200   (-0.93)
parsec3/swaptions       5630.000     5634.800     (0.09)     5656.600     (0.47)     5692.000     (1.10)     4028.400     (-28.45)
parsec3/vips            32107.000    32045.200    (-0.19)    32207.800    (0.31)     32293.800    (0.58)     29093.600    (-9.39)
parsec3/x264            81926.000    82143.000    (0.26)     83258.400    (1.63)     82570.600    (0.79)     80651.800    (-1.56)
splash2x/barnes         1215468.800  1217889.800  (0.20)     1222006.800  (0.54)     1217425.600  (0.16)     752405.200   (-38.10)
splash2x/fft            9584734.800  9568872.800  (-0.17)    9660321.400  (0.79)     9646012.000  (0.64)     8367492.800  (-12.70)
splash2x/lu_cb          510555.400   510807.400   (0.05)     514448.600   (0.76)     509281.800   (-0.25)    349272.200   (-31.59)
splash2x/lu_ncb         510310.000   508915.600   (-0.27)    513886.000   (0.70)     510288.400   (-0.00)    431521.800   (-15.44)
splash2x/ocean_cp       3408724.400  3408424.600  (-0.01)    3446054.400  (1.10)     3419536.200  (0.32)     3173818.600  (-6.89)
splash2x/ocean_ncp      3923539.600  3922605.400  (-0.02)    7175526.600  (82.88)    5152558.800  (31.32)    3475756.000  (-11.41)
splash2x/radiosity      1476050.000  1475470.400  (-0.04)    1485747.000  (0.66)     1476232.600  (0.01)     269512.200   (-81.74)
splash2x/radix          1756385.400  1752676.000  (-0.21)    1431621.600  (-18.49)   1711460.800  (-2.56)    1923448.200  (9.51)
splash2x/raytrace       23286.400    23311.200    (0.11)     28440.800    (22.13)    26977.200    (15.85)    15685.200    (-32.64)
splash2x/volrend        44089.400    44125.600    (0.08)     44436.600    (0.79)     44250.400    (0.37)     27616.800    (-37.36)
splash2x/water_nsquared 29437.600    29403.200    (-0.12)    29817.400    (1.29)     30040.000    (2.05)     25369.600    (-13.82)
splash2x/water_spatial  656264.400   656566.400   (0.05)     656016.400   (-0.04)    656420.200   (0.02)     474480.400   (-27.70)
total                   28444100.000 28432200.000 (-0.04)    31535300.000 (10.87)    29698900.000 (4.41)     22787200.000 (-19.89)

In total, 19.89% of residential sets were reduced.

With parsec3/freqmine, 'prcl' reduced 85.85% of residential sets and 21.98% of
system memory usage while incurring only 2.42% runtime overhead.


Appendix F: Prototype Evaluations
=================================

A prototype of DAMON has evaluated on an Intel Xeon E7-8837 machine using 20
benchmarks that picked from SPEC CPU 2006, NAS, Tensorflow Benchmark,
SPLASH-2X, and PARSEC 3 benchmark suite.  Nonethless, this section provides
only summary of the results.  For more detail, please refer to the slides used
for the introduction of DAMON at the Linux Plumbers Conference 2019[1] or the
MIDDLEWARE'19 industrial track paper[2].

[1] SeongJae Park, Tracing Data Access Pattern with Bounded Overhead and
    Best-effort Accuracy. In The Linux Kernel Summit, September 2019.
    https://linuxplumbersconf.org/event/4/contributions/548/
[2] SeongJae Park, Yunjae Lee, Heon Y. Yeom, Profiling Dynamic Data Access
    Patterns with Controlled Overhead and Quality. In 20th ACM/IFIP
    International Middleware Conference Industry, December 2019.
    https://dl.acm.org/doi/10.1145/3366626.3368125


Quality
-------

We first traced and visualized the data access pattern of each workload.  We
were able to confirm that the visualized results are reasonably accurate by
manually comparing those with the source code of the workloads.

To see the usefulness of the monitoring, we optimized 9 memory intensive
workloads among them for memory pressure situations using the DAMON outputs.
In detail, we identified frequently accessed memory regions in each workload
based on the DAMON results and protected them with ``mlock()`` system calls by
manually modifying the source code.  The optimized versions consistently show
speedup (2.55x in best case, 1.65x in average) under artificial memory
pressures.  We use cgroups for the pressure.


Overhead
--------

We also measured the overhead of DAMON.  The upperbound we set was kept as
expected.  Besides, it was much lower (0.6 percent of the bound in best case,
13.288 percent of the bound in average).  This reduction of the overhead is
mainly resulted from its core mechanism called adaptive regions adjustment.
Refer to 'Appendix D' for more detail about the mechanism.  We also compared
the overhead of DAMON with that of a straightforward periodic PTE Accessed bit
checking based monitoring.  DAMON's overhead was smaller than it by 94,242.42x
in best case, 3,159.61x in average.

The latest version of DAMON running with its default configuration consumes
only up to 1% of CPU time when applied to realistic workloads in PARSEC3 and
SPLASH-2X and makes no visible slowdown to the target processes.
