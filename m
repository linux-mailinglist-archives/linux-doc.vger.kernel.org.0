Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9222B189A97
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2020 12:28:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726933AbgCRL2g (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 18 Mar 2020 07:28:36 -0400
Received: from smtp-fw-9102.amazon.com ([207.171.184.29]:47955 "EHLO
        smtp-fw-9102.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbgCRL2g (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Mar 2020 07:28:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1584530911; x=1616066911;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=goJjFrQ5r/ivNxLv4BEjGzDzsca7FqQwjGqrh7HD5JQ=;
  b=nt25w0J3rMXrPrqhEfr0qXL/OtLQ2ou5wpc7lNwAvZqe6h5yUvPV0xSC
   UvNYTt6dMn2mPywvbvStXtrD3BKT8b5UbHCMtxJB5nIhpztSAemrcrlHk
   NJwM7vksGnhxsUfDjZPv+jcZB3oSYR6TLNXFArCRir2cuf4ccmPZd+BIl
   U=;
IronPort-SDR: wtgIPpFqsDYlHvdoXXnUFW7oA2vK60T7odK/75sP7Mc4KHjgv5b0Y0M3NMb05mxd4FAMiyzn6D
 CLqP5UQiA74A==
X-IronPort-AV: E=Sophos;i="5.70,567,1574121600"; 
   d="scan'208";a="31876083"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO email-inbound-relay-1e-c7c08562.us-east-1.amazon.com) ([10.47.23.38])
  by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP; 18 Mar 2020 11:28:26 +0000
Received: from EX13MTAUEA002.ant.amazon.com (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
        by email-inbound-relay-1e-c7c08562.us-east-1.amazon.com (Postfix) with ESMTPS id 78A93244F20;
        Wed, 18 Mar 2020 11:28:16 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 18 Mar 2020 11:28:15 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.161.235) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 18 Mar 2020 11:27:59 +0000
From:   SeongJae Park <sjpark@amazon.com>
To:     <akpm@linux-foundation.org>
CC:     SeongJae Park <sjpark@amazon.de>, <Jonathan.Cameron@Huawei.com>,
        <aarcange@redhat.com>, <acme@kernel.org>,
        <alexander.shishkin@linux.intel.com>, <amit@kernel.org>,
        <brendan.d.gregg@gmail.com>, <brendanhiggins@google.com>,
        <cai@lca.pw>, <colin.king@canonical.com>, <corbet@lwn.net>,
        <dwmw@amazon.com>, <jolsa@redhat.com>, <kirill@shutemov.name>,
        <mark.rutland@arm.com>, <mgorman@suse.de>, <minchan@kernel.org>,
        <mingo@redhat.com>, <namhyung@kernel.org>, <peterz@infradead.org>,
        <rdunlap@infradead.org>, <riel@surriel.com>, <rientjes@google.com>,
        <rostedt@goodmis.org>, <shuah@kernel.org>, <sj38.park@gmail.com>,
        <vbabka@suse.cz>, <vdavydov.dev@gmail.com>,
        <yang.shi@linux.alibaba.com>, <ying.huang@intel.com>,
        <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 00/15] Introduce Data Access MONitor (DAMON)
Date:   Wed, 18 Mar 2020 12:27:07 +0100
Message-ID: <20200318112722.30143-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.43.161.235]
X-ClientProxiedBy: EX13D28UWC001.ant.amazon.com (10.43.162.166) To
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


Visualized Outputs of DAMON
===========================

For intuitively understanding of DAMON, I made web pages[1-8] showing the
visualized dynamic data access pattern of various realistic workloads, which I
picked up from PARSEC3 and SPLASH-2X bechmark suites.  The figures are
generated using the user space tool in 10th patch of this patchset.

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


Data Access Monitoring-based Operation Schemes
==============================================

As 'Appendix D' describes, DAMON can be used for data access monitoring-based
operation schemes (DAMOS).  RFC patchsets for DAMOS are already available
(https://lore.kernel.org/linux-mm/20200218085309.18346-1-sjpark@amazon.com/).

By applying a very simple scheme for THP promotion/demotion with a latest
version of the patchset (not posted yet), DAMON achieved 18x lower memory space
overhead compared to THP while preserving about 50% of the THP performance
benefit with SPLASH-2X benchmark suite.

The detailed setup and number will be posted soon with the next RFC patchset
for DAMOS.  The posting is currently scheduled for tomorrow.


Frequently Asked Questions
==========================

Q: Why DAMON is not integrated with perf?
A: From the perspective of perf like profilers, DAMON can be thought of as a
data source in kernel, like the tracepoints, the pressure stall information
(psi), or the idle page tracking.  Thus, it is easy to integrate DAMON with the
profilers.  However, this patchset doesn't provide a fancy perf integration
because current step of DAMON development is focused on its core logic only.
That said, DAMON already provides two interfaces for user space programs, which
based on debugfs and tracepoint, respectively.  Using the tracepoint interface,
you can use DAMON with perf.  This patchset also provides a debugfs interface
based user space tool for DAMON.  It can be used to record, visualize, and
analyze data access patterns of target processes in a convenient way.

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

Q: Can 'perf mem' provide the data required for DAMON?
A: On the systems supporting 'perf mem', yes.  DAMON is using the PTE Accessed
bits in low level.  Other H/W or S/W features that can be used for the purpose
could be used.  However, as explained with above question, DAMON need to be
implemented in the kernel space.


Evaluations
===========

We evaluated DAMON's overhead, monitoring quality and usefulness using 25
realistic workloads on my QEMU/KVM based virtual machine.

DAMON is lightweight.  It consumes only -0.08% more system memory and up to 1%
CPU time.  It makes target worloads only 0.76% slower.

DAMON is accurate and useful for memory management optimizations.  An
experimental DAMON-based operation scheme for THP removes 83.66% of THP memory
overheads while preserving 40.67% of THP speedup.  Another experimental
DAMON-based 'proactive reclamation' implementation reduced 22.42% of system
memory usage and 88.86% of residential sets while incurring only 3.07% runtime
overhead in best case.

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


Sequence Of Patches
===================

The patches are organized in the following sequence.  The first two patches are
preparation of DAMON patchset.  The 1st patch adds typos found in previous
versions of DAMON patchset to 'scripts/spelling.txt' so that the typos can be
caught by 'checkpatch.pl'.  The 2nd patch exports 'lookup_page_ext()' to GPL
modules so that it can be used by DAMON even though it is built as a loadable
module.

Next four patches implement the core of DAMON and it's programming interface.
The 3rd patch introduces DAMON module, it's data structures, and data structure
related common functions.  Each of following three patches (4nd to 6th)
implements the core mechanisms of DAMON, namely regions based sampling,
adaptive regions adjustment, and dynamic memory mapping chage adoption,
respectively, with programming interface supports of those.

Following four patches are for low level users of DAMON.  The 7th patch
implements callbacks for each of monitoring steps so that users can do whatever
they want with the access patterns.  The 8th one implements recording of access
patterns in DAMON for better convenience and efficiency.  Each of next two
patches (9th and 10th) respectively adds a debugfs interface for privileged
people and/or programs in user space, and a tracepoint for other tracepoints
supporting tracers such as perf.

Two patches for high level users of DAMON follows.  To provide a minimal
reference to the debugfs interface and for high level use/tests of the DAMON,
the next patch (11th) implements an user space tool.  The 12th patch adds a
document for administrators of DAMON.

Next two patches are for tests.  The 13th and 14th patches provide unit tests
(based on kunit) and user space tests (based on kselftest), respectively.

Finally, the last patch (15th) updates the MAINTAINERS file.

The patches are based on the v5.5.  You can also clone the complete git
tree:

    $ git clone git://github.com/sjp38/linux -b damon/patches/v7

The web is also available:
https://github.com/sjp38/linux/releases/tag/damon/patches/v7


Patch History
=============

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

SeongJae Park (15):
  scripts/spelling: Add a few more typos
  mm/page_ext: Export lookup_page_ext() to GPL modules
  mm: Introduce Data Access MONitor (DAMON)
  mm/damon: Implement region based sampling
  mm/damon: Adaptively adjust regions
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
 include/linux/damon.h                         |   79 +
 include/trace/events/damon.h                  |   43 +
 mm/Kconfig                                    |   22 +
 mm/Makefile                                   |    1 +
 mm/damon-test.h                               |  604 +++++++
 mm/damon.c                                    | 1437 +++++++++++++++++
 mm/page_ext.c                                 |    1 +
 scripts/spelling.txt                          |    4 +
 tools/damon/.gitignore                        |    1 +
 tools/damon/_dist.py                          |   36 +
 tools/damon/bin2txt.py                        |   64 +
 tools/damon/damo                              |   37 +
 tools/damon/heats.py                          |  358 ++++
 tools/damon/nr_regions.py                     |   89 +
 tools/damon/record.py                         |  212 +++
 tools/damon/report.py                         |   45 +
 tools/damon/wss.py                            |   95 ++
 tools/testing/selftests/damon/Makefile        |    7 +
 .../selftests/damon/_chk_dependency.sh        |   28 +
 tools/testing/selftests/damon/_chk_record.py  |   89 +
 .../testing/selftests/damon/debugfs_attrs.sh  |  139 ++
 .../testing/selftests/damon/debugfs_record.sh |   50 +
 25 files changed, 3882 insertions(+)
 create mode 100644 Documentation/admin-guide/mm/data_access_monitor.rst
 create mode 100644 include/linux/damon.h
 create mode 100644 include/trace/events/damon.h
 create mode 100644 mm/damon-test.h
 create mode 100644 mm/damon.c
 create mode 100644 tools/damon/.gitignore
 create mode 100644 tools/damon/_dist.py
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
its development to be highly optimized for the online/in-kernel uses.


A Future Plan: Data Access Monitoring-based Operation Schemes
-------------------------------------------------------------

As described in the above section, DAMON could be helpful for actual access
based memory management optimizations.  Nevertheless, users who want to do such
optimizations should run DAMON, read the traced data (either online or
offline), analyze it, plan a new memory management scheme, and apply the new
scheme by themselves.  It must be easier than the past, but could still require
some level of efforts.  In its next development stage, DAMON will reduce some
of such efforts by allowing users to specify some access based memory
management rules for their specific processes.

Because this is just a plan, the specific interface is not fixed yet, but for
example, users will be allowed to write their desired memory management rules
to a special file in a DAMON specific format.  The rules will be something like
'if a memory region of size in a range is keeping a range of hotness for more
than a duration, apply specific memory management rule using madvise() or
mlock() to the region'.  For example, we can imagine rules like below:

    # format is: <min/max size> <min/max frequency (0-99)> <duration> <action>

    # if a region of a size keeps a very high access frequency for more than
    # 100ms, lock the region in the main memory (call mlock()). But, if the
    # region is larger than 500 MiB, skip it. The exception might be helpful
    # if the system has only, say, 600 MiB of DRAM, a region of size larger
    # than 600 MiB cannot be locked in the DRAM at all.
    na 500M 90 99 100ms mlock

    # if a region keeps a high access frequency for more than 100ms, put the
    # region on the head of the LRU list (call madvise() with MADV_WILLNEED).
    na na 80 90 100ms madv_willneed

    # if a region keeps a low access frequency for more than 100ms, put the
    # region on the tail of the LRU list (call madvise() with MADV_COLD).
    na na 10 20 100ms madv_cold

    # if a region keeps a very low access frequency for more than 100ms, swap
    # out the region immediately (call madvise() with MADV_PAGEOUT).
    na na 0 10 100ms madv_pageout

    # if a region of a size bigger than 2MB keeps a very high access frequency
    # for more than 100ms, let the region to use huge pages (call madvise()
    # with MADV_HUGEPAGE).
    2M na 90 99 100ms madv_hugepage

    # If a regions of a size bigger than > 2MB keeps no high access frequency
    # for more than 100ms, avoid the region from using huge pages (call
    # madvise() with MADV_NOHUGEPAGE).
    2M na 0 25 100ms madv_nohugepage

An RFC patchset for this is available:
https://lore.kernel.org/linux-mm/20200218085309.18346-1-sjpark@amazon.com/


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
4K null    null 5    5s null      pageout

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
parsec3/blackscholes    106.586  107.160  (0.54)     106.535  (-0.05)    107.393  (0.76)     114.543  (7.47)    
parsec3/bodytrack       78.621   79.220   (0.76)     78.678   (0.07)     79.169   (0.70)     80.793   (2.76)    
parsec3/canneal         138.951  142.258  (2.38)     123.555  (-11.08)   133.588  (-3.86)    143.239  (3.09)    
parsec3/dedup           11.876   11.918   (0.35)     11.767   (-0.92)    11.957   (0.68)     13.235   (11.44)   
parsec3/facesim         207.761  208.159  (0.19)     204.735  (-1.46)    207.172  (-0.28)    208.663  (0.43)    
parsec3/ferret          190.694  192.004  (0.69)     190.345  (-0.18)    190.453  (-0.13)    192.081  (0.73)    
parsec3/fluidanimate    210.189  212.511  (1.10)     208.695  (-0.71)    210.843  (0.31)     213.379  (1.52)    
parsec3/freqmine        289.000  289.483  (0.17)     287.724  (-0.44)    289.761  (0.26)     297.878  (3.07)    
parsec3/raytrace        118.482  119.346  (0.73)     118.861  (0.32)     119.151  (0.56)     136.566  (15.26)   
parsec3/streamcluster   323.338  328.431  (1.58)     285.039  (-11.85)   296.830  (-8.20)    331.670  (2.58)    
parsec3/swaptions       155.853  156.826  (0.62)     154.089  (-1.13)    156.332  (0.31)     155.422  (-0.28)   
parsec3/vips            58.864   59.408   (0.92)     58.450   (-0.70)    58.976   (0.19)     61.068   (3.74)    
parsec3/x264            69.201   69.208   (0.01)     68.795   (-0.59)    71.501   (3.32)     71.766   (3.71)    
splash2x/barnes         81.140   80.869   (-0.33)    74.734   (-7.90)    79.859   (-1.58)    108.875  (34.18)   
splash2x/fft            33.442   33.579   (0.41)     22.949   (-31.38)   27.055   (-19.10)   40.261   (20.39)   
splash2x/lu_cb          85.064   85.441   (0.44)     84.688   (-0.44)    85.868   (0.95)     88.949   (4.57)    
splash2x/lu_ncb         92.606   93.615   (1.09)     90.484   (-2.29)    93.368   (0.82)     93.279   (0.73)    
splash2x/ocean_cp       44.672   44.826   (0.34)     43.024   (-3.69)    43.671   (-2.24)    45.889   (2.72)    
splash2x/ocean_ncp      81.360   81.434   (0.09)     51.157   (-37.12)   66.711   (-18.00)   91.611   (12.60)   
splash2x/radiosity      91.374   91.568   (0.21)     90.406   (-1.06)    91.609   (0.26)     103.790  (13.59)   
splash2x/radix          31.330   31.509   (0.57)     25.145   (-19.74)   26.296   (-16.07)   31.835   (1.61)    
splash2x/raytrace       84.715   85.274   (0.66)     82.034   (-3.16)    84.458   (-0.30)    84.967   (0.30)    
splash2x/volrend        86.625   87.844   (1.41)     86.206   (-0.48)    87.851   (1.42)     87.809   (1.37)    
splash2x/water_nsquared 231.661  233.817  (0.93)     221.024  (-4.59)    228.020  (-1.57)    236.306  (2.01)    
splash2x/water_spatial  89.101   89.616   (0.58)     88.845   (-0.29)    89.710   (0.68)     103.370  (16.01)   
total                   2992.490 3015.330 (0.76)     2857.950 (-4.50)    2937.610 (-1.83)    3137.260 (4.84)    


memused.avg             orig         rec          (overhead) thp          (overhead) ethp         (overhead) prcl         (overhead)
parsec3/blackscholes    1822704.400  1833697.600  (0.60)     1826160.400  (0.19)     1833316.800  (0.58)     1657871.000  (-9.04)   
parsec3/bodytrack       1417677.600  1434893.200  (1.21)     1420652.200  (0.21)     1431637.000  (0.98)     1433359.800  (1.11)    
parsec3/canneal         1044807.000  1056496.200  (1.12)     1037582.400  (-0.69)    1050845.200  (0.58)     1051668.200  (0.66)    
parsec3/dedup           2408896.200  2433019.000  (1.00)     2403343.200  (-0.23)    2421191.800  (0.51)     2461284.400  (2.17)    
parsec3/facesim         541808.200   554404.200   (2.32)     545591.600   (0.70)     553669.600   (2.19)     553910.600   (2.23)    
parsec3/ferret          319697.200   331642.400   (3.74)     320722.000   (0.32)     332126.000   (3.89)     330581.800   (3.40)    
parsec3/fluidanimate    573267.400   587376.200   (2.46)     574660.200   (0.24)     596108.600   (3.98)     538974.600   (-5.98)   
parsec3/freqmine        986872.400   998956.200   (1.22)     992037.800   (0.52)     989680.800   (0.28)     765626.800   (-22.42)  
parsec3/raytrace        1749641.800  1761473.200  (0.68)     1743617.800  (-0.34)    1753105.600  (0.20)     1580514.800  (-9.67)   
parsec3/streamcluster   125165.400   149479.600   (19.43)    122082.000   (-2.46)    140484.200   (12.24)    132027.000   (5.48)    
parsec3/swaptions       15515.400    29577.200    (90.63)    15692.000    (1.14)     26733.200    (72.30)    28423.000    (83.19)   
parsec3/vips            2954233.800  2970852.400  (0.56)     2954338.800  (0.00)     2959100.200  (0.16)     2951979.600  (-0.08)   
parsec3/x264            3174959.000  3191900.200  (0.53)     3192736.200  (0.56)     3201927.200  (0.85)     3194867.400  (0.63)    
splash2x/barnes         1215064.400  1209725.600  (-0.44)    1215945.600  (0.07)     1212294.600  (-0.23)    937605.800   (-22.83)  
splash2x/fft            9429331.600  9187727.600  (-2.56)    9290976.600  (-1.47)    9036430.800  (-4.17)    9409815.800  (-0.21)   
splash2x/lu_cb          512744.800   521964.600   (1.80)     521795.800   (1.77)     522445.600   (1.89)     346352.200   (-32.45)  
splash2x/lu_ncb         516623.000   523673.200   (1.36)     520129.200   (0.68)     522398.800   (1.12)     522246.200   (1.09)    
splash2x/ocean_cp       3325422.200  3287326.200  (-1.15)    3381646.400  (1.69)     3294803.400  (-0.92)    3287401.800  (-1.14)   
splash2x/ocean_ncp      3894128.600  3868638.400  (-0.65)    7065137.400  (81.43)    4844981.600  (24.42)    3811968.400  (-2.11)   
splash2x/radiosity      1471464.000  1470680.800  (-0.05)    1481054.600  (0.65)     1472332.200  (0.06)     521064.000   (-64.59)  
splash2x/radix          1698164.400  1707518.400  (0.55)     1385276.800  (-18.42)   1415885.000  (-16.62)   1717103.600  (1.12)    
splash2x/raytrace       45334.200    59478.400    (31.20)    52893.400    (16.67)    62366.000    (37.57)    53765.800    (18.60)   
splash2x/volrend        151118.400   167429.800   (10.79)    151600.000   (0.32)     163950.800   (8.49)     162873.800   (7.78)    
splash2x/water_nsquared 46839.000    61947.000    (32.26)    49173.600    (4.98)     58301.200    (24.47)    56678.400    (21.01)   
splash2x/water_spatial  666960.000   674851.600   (1.18)     668957.600   (0.30)     673287.400   (0.95)     463938.800   (-30.44)  
total                   40108199.000 40074800.000 (-0.08)    42933800.000 (7.04)     40569300.000 (1.15)     37972000.000 (-5.33)   


DAMON Overheads
~~~~~~~~~~~~~~~

In total, DAMON recording feature incurs 0.76% runtime overhead (up to 2.38% in
worst case with 'parsec3/canneal') and -0.08% memory space overhead.

For convenience test run of 'rec', I use a Python wrapper.  The wrapper
constantly consumes about 10-15MB of memory.  This becomes high memory overhead
if the target workload has small memory footprint.  In detail, 19%, 90%, 31%,
10%, and 32% overheads shown for parsec3/streamcluster (125 MiB),
parsec3/swaptions (15 MiB), splash2x/raytrace (45 MiB), splash2x/volrend (151
MiB), and splash2x/water_nsquared (46 MiB)).  Nonetheless, the overheads are
not from DAMON, but from the wrapper, and thus should be ignored.  This fake
memory overhead continues in 'ethp' and 'prcl', as those configurations are
also using the Python wrapper.


Efficient THP
~~~~~~~~~~~~~

THP 'always' enabled policy achieves 4.5% speedup but incurs 7.04% memory
overhead.  It achieves 37.12% speedup in best case, but 81.43% memory overhead
in worst case.  Interestingly, both the best and worst case are with
'splash2x/ocean_ncp').

The 2-lines implementation of data access monitoring based THP version ('ethp')
shows 1.83% speedup and 1.15% memory overhead.  In other words, 'ethp' removes
83.66% of THP memory waste while preserving 40.67% of THP speedup in total.

In case of the 'splash2x/ocean_ncp', which is best for speedup but worst for
memory overhead of THP, 'ethp' removes 70% of THP memory space overhead while
preserving 48.49% of THP speedup.


Proactive Reclamation
~~~~~~~~~~~~~~~~~~~~

As same to the original work, I use 'zram' swap device for this configuration.

In total, our 1 line implementation of Proactive Reclamation, 'prcl', incurred
4.84% runtime overhead in total while achieving 5.33% system memory usage
reduction.

Nonetheless, as the memory usage is calculated with 'MemFree' in
'/proc/meminfo', it contains the SwapCached pages.  As the swapcached pages can
be easily evicted, I also measured the residential set size of the workloads:

rss.avg                 orig         prcl         (overhead)
parsec3/blackscholes    589633.600   329611.400   (-44.10)
parsec3/bodytrack       32217.600    21652.200    (-32.79)
parsec3/canneal         840411.600   838931.000   (-0.18)
parsec3/dedup           1223907.600  835473.600   (-31.74)
parsec3/facesim         311271.600   311070.200   (-0.06)
parsec3/ferret          99635.600    89290.800    (-10.38)
parsec3/fluidanimate    531760.000   484945.600   (-8.80)
parsec3/freqmine        552609.400   61583.600    (-88.86)
parsec3/raytrace        896446.600   317792.000   (-64.55)
parsec3/streamcluster   110793.600   108061.600   (-2.47)
parsec3/swaptions       5604.600     2694.400     (-51.93)
parsec3/vips            31779.600    28422.200    (-10.56)
parsec3/x264            81943.800    81874.600    (-0.08)
splash2x/barnes         1219389.600  619038.600   (-49.23)
splash2x/fft            9597789.600  7264542.200  (-24.31)
splash2x/lu_cb          510524.000   327813.600   (-35.79)
splash2x/lu_ncb         510131.200   510146.800   (0.00)
splash2x/ocean_cp       3406968.600  3341620.400  (-1.92)
splash2x/ocean_ncp      3919926.800  3670768.800  (-6.36)
splash2x/radiosity      1474387.800  254678.600   (-82.73)
splash2x/radix          1723283.200  1763916.000  (2.36)
splash2x/raytrace       23194.400    17454.000    (-24.75)
splash2x/volrend        43980.000    32524.600    (-26.05)
splash2x/water_nsquared 29327.200    23989.200    (-18.20)
splash2x/water_spatial  656323.200   381068.600   (-41.94)
total                   28423300.000 21719000.000 (-23.59)

In total, 23.59% of residential sets were reduced.

With parsec3/freqmine, 'prcl' reduced 22.42% of system memory usage and 88.86%
of residential sets while incurring only 3.07% runtime overhead.


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
