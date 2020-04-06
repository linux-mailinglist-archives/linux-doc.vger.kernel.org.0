Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47CC019F675
	for <lists+linux-doc@lfdr.de>; Mon,  6 Apr 2020 15:10:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728141AbgDFNK0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 6 Apr 2020 09:10:26 -0400
Received: from smtp-fw-9102.amazon.com ([207.171.184.29]:43629 "EHLO
        smtp-fw-9102.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728018AbgDFNK0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Apr 2020 09:10:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1586178618; x=1617714618;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lkswglfol+eQj6fUX0Tszs2pDbz1b82HdeNDq72a4K8=;
  b=l1rDZxBwdRUP7WgO5KBDXII4f6y5egpmQAoPly9f5M7Pi64c464VoAr+
   VMr+S85gbal8lsnqpLiSm1sngooHpwQgU9ucZ3AQLrfFD15fpVmKFjr4u
   VGAGEZB5C7X7HOWc6attpDnpjRHPvZhGK49CJr18xr/t0miWZyTPgUJ85
   g=;
IronPort-SDR: Bl9R0g9RCZvY1osAcrP5iqulPh5EaqE5eHHRyhlEPUluQ6HiHJo0vzmUoUUowGW6jx+gd++9bk
 hzLsidlF32Ow==
X-IronPort-AV: E=Sophos;i="5.72,351,1580774400"; 
   d="scan'208";a="35490781"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO email-inbound-relay-2b-55156cd4.us-west-2.amazon.com) ([10.47.23.38])
  by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP; 06 Apr 2020 13:10:15 +0000
Received: from EX13MTAUEA002.ant.amazon.com (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
        by email-inbound-relay-2b-55156cd4.us-west-2.amazon.com (Postfix) with ESMTPS id 72ECAA2596;
        Mon,  6 Apr 2020 13:10:13 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 6 Apr 2020 13:10:12 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.160.65) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 6 Apr 2020 13:09:58 +0000
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
        <rostedt@goodmis.org>, <shakeelb@google.com>, <shuah@kernel.org>,
        <sj38.park@gmail.com>, <vbabka@suse.cz>, <vdavydov.dev@gmail.com>,
        <yang.shi@linux.alibaba.com>, <ying.huang@intel.com>,
        <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 00/15] Introduce Data Access MONitor (DAMON)
Date:   Mon, 6 Apr 2020 15:09:23 +0200
Message-ID: <20200406130938.14066-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.43.160.65]
X-ClientProxiedBy: EX13D11UWB003.ant.amazon.com (10.43.161.206) To
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
CPU time.  It makes target worloads only 0.45% slower.

DAMON is accurate and useful for memory management optimizations.  An
experimental DAMON-based operation scheme for THP removes 68.22% of THP memory
overheads while preserving 51.88% of THP speedup.  Another experimental
DAMON-based 'proactive reclamation' implementation reduced 17.91% of system
memory footprint and 71.44% of residential sets while incurring only 1.25%
runtime overhead in best case (parsec3/freqmine).

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

    $ git clone git://github.com/sjp38/linux -b damon/patches/v8

The web is also available:
https://github.com/sjp38/linux/releases/tag/damon/patches/v8


Patch History
=============

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
 mm/damon-test.h                               |  602 +++++++
 mm/damon.c                                    | 1467 +++++++++++++++++
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
 25 files changed, 3910 insertions(+)
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

==================================== >8 =======================================

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
parsec3/blackscholes    107.097  106.955  (-0.13)    106.352  (-0.70)    107.357  (0.24)     108.284  (1.11)
parsec3/bodytrack       79.135   79.062   (-0.09)    78.996   (-0.18)    79.261   (0.16)     79.824   (0.87)
parsec3/canneal         139.036  139.694  (0.47)     125.947  (-9.41)    131.071  (-5.73)    148.648  (6.91)
parsec3/dedup           11.914   11.905   (-0.07)    11.729   (-1.55)    11.916   (0.02)     12.613   (5.87)
parsec3/facesim         208.761  209.476  (0.34)     204.778  (-1.91)    206.157  (-1.25)    214.016  (2.52)
parsec3/ferret          190.854  191.309  (0.24)     190.223  (-0.33)    190.821  (-0.02)    191.847  (0.52)
parsec3/fluidanimate    211.317  213.798  (1.17)     208.883  (-1.15)    211.319  (0.00)     214.566  (1.54)
parsec3/freqmine        288.672  290.547  (0.65)     288.310  (-0.13)    288.727  (0.02)     292.294  (1.25)
parsec3/raytrace        118.692  119.443  (0.63)     118.625  (-0.06)    118.986  (0.25)     129.942  (9.48)
parsec3/streamcluster   323.387  327.244  (1.19)     284.931  (-11.89)   290.604  (-10.14)   330.111  (2.08)
parsec3/swaptions       154.304  154.891  (0.38)     154.373  (0.04)     155.226  (0.60)     155.338  (0.67)
parsec3/vips            58.879   59.254   (0.64)     58.459   (-0.71)    59.029   (0.25)     59.761   (1.50)
parsec3/x264            71.805   68.718   (-4.30)    67.262   (-6.33)    69.494   (-3.22)    71.291   (-0.72)
splash2x/barnes         80.624   80.680   (0.07)     74.538   (-7.55)    78.363   (-2.80)    86.373   (7.13)
splash2x/fft            33.462   33.285   (-0.53)    23.146   (-30.83)   33.306   (-0.47)    35.311   (5.53)
splash2x/lu_cb          85.474   85.681   (0.24)     84.516   (-1.12)    85.525   (0.06)     87.267   (2.10)
splash2x/lu_ncb         93.227   93.211   (-0.02)    90.939   (-2.45)    93.526   (0.32)     94.409   (1.27)
splash2x/ocean_cp       44.348   44.668   (0.72)     42.920   (-3.22)    44.128   (-0.50)    45.785   (3.24)
splash2x/ocean_ncp      81.234   81.275   (0.05)     51.441   (-36.67)   64.974   (-20.02)   94.207   (15.97)
splash2x/radiosity      90.976   91.131   (0.17)     90.325   (-0.72)    91.395   (0.46)     97.867   (7.57)
splash2x/radix          31.269   31.185   (-0.27)    25.103   (-19.72)   29.289   (-6.33)    37.713   (20.61)
splash2x/raytrace       83.945   84.242   (0.35)     82.314   (-1.94)    83.334   (-0.73)    84.655   (0.85)
splash2x/volrend        86.703   87.545   (0.97)     86.324   (-0.44)    86.717   (0.02)     87.925   (1.41)
splash2x/water_nsquared 230.426  232.979  (1.11)     219.950  (-4.55)    224.474  (-2.58)    235.770  (2.32)
splash2x/water_spatial  88.982   89.748   (0.86)     89.086   (0.12)     89.431   (0.50)     95.849   (7.72)
total                   2994.520 3007.910 (0.45)     2859.470 (-4.51)    2924.420 (-2.34)    3091.670 (3.24)


memused.avg             orig         rec          (overhead) thp          (overhead) ethp         (overhead) prcl         (overhead)
parsec3/blackscholes    1821479.200  1836018.600  (0.80)     1822020.600  (0.03)     1834214.200  (0.70)     1721607.800  (-5.48)
parsec3/bodytrack       1418698.400  1434689.800  (1.13)     1419134.400  (0.03)     1430609.800  (0.84)     1433137.600  (1.02)
parsec3/canneal         1045065.400  1052992.400  (0.76)     1042607.400  (-0.24)    1048730.400  (0.35)     1049446.000  (0.42)
parsec3/dedup           2387073.200  2425093.600  (1.59)     2398469.600  (0.48)     2416738.400  (1.24)     2433976.800  (1.96)
parsec3/facesim         540075.800   554130.000   (2.60)     544759.400   (0.87)     553325.800   (2.45)     489255.600   (-9.41)
parsec3/ferret          316932.800   331383.600   (4.56)     320355.800   (1.08)     331042.000   (4.45)     328275.600   (3.58)
parsec3/fluidanimate    576466.400   587466.600   (1.91)     582737.000   (1.09)     582560.600   (1.06)     499228.800   (-13.40)
parsec3/freqmine        985864.000   996351.800   (1.06)     990195.000   (0.44)     997435.400   (1.17)     809333.800   (-17.91)
parsec3/raytrace        1749485.600  1753601.400  (0.24)     1744385.000  (-0.29)    1755230.400  (0.33)     1597574.400  (-8.68)
parsec3/streamcluster   120976.200   133270.000   (10.16)    118688.200   (-1.89)    132846.800   (9.81)     133412.400   (10.28)
parsec3/swaptions       14953.600    28689.400    (91.86)    15826.000    (5.83)     26803.000    (79.24)    27754.400    (85.60)
parsec3/vips            2940086.400  2965866.800  (0.88)     2943217.200  (0.11)     2960823.600  (0.71)     2968121.000  (0.95)
parsec3/x264            3179843.200  3186839.600  (0.22)     3175893.600  (-0.12)    3182023.400  (0.07)     3202598.000  (0.72)
splash2x/barnes         1210899.200  1211648.600  (0.06)     1219328.800  (0.70)     1217686.000  (0.56)     1126669.000  (-6.96)
splash2x/fft            9322834.800  9142039.200  (-1.94)    9183937.800  (-1.49)    9159042.800  (-1.76)    9321729.200  (-0.01)
splash2x/lu_cb          515411.200   523698.400   (1.61)     521019.800   (1.09)     523047.400   (1.48)     461828.400   (-10.40)
splash2x/lu_ncb         514869.000   525223.000   (2.01)     521820.600   (1.35)     522588.800   (1.50)     480118.400   (-6.75)
splash2x/ocean_cp       3345433.400  3298946.800  (-1.39)    3377377.000  (0.95)     3289771.600  (-1.66)    3273329.800  (-2.16)
splash2x/ocean_ncp      3902999.600  3873302.600  (-0.76)    7069853.000  (81.14)    4962220.800  (27.14)    3772835.600  (-3.33)
splash2x/radiosity      1471551.000  1470698.600  (-0.06)    1481433.200  (0.67)     1466283.400  (-0.36)    838138.400   (-43.04)
splash2x/radix          1700185.000  1674226.400  (-1.53)    1386397.600  (-18.46)   1544387.800  (-9.16)    1957567.600  (15.14)
splash2x/raytrace       45493.800    57050.800    (25.40)    50134.000    (10.20)    60166.400    (32.25)    57634.000    (26.69)
splash2x/volrend        150549.200   165190.600   (9.73)     151509.600   (0.64)     162845.000   (8.17)     161346.000   (7.17)
splash2x/water_nsquared 46275.200    58483.600    (26.38)    71529.200    (54.57)    56770.200    (22.68)    59995.800    (29.65)
splash2x/water_spatial  666577.200   672511.800   (0.89)     667422.200   (0.13)     674555.000   (1.20)     608374.000   (-8.73)
total                   39990000.000 39959400.000 (-0.08)    42819900.000 (7.08)     40891655.000 (2.25)     38813174.000 (-2.94)


DAMON Overheads
~~~~~~~~~~~~~~~

In total, DAMON recording feature incurs 0.41% runtime overhead (up to 1.19% in
worst case with 'parsec3/streamcluster') and -0.08% memory space overhead.

For convenience test run of 'rec', I use a Python wrapper.  The wrapper
constantly consumes about 10-15MB of memory.  This becomes high memory overhead
if the target workload has small memory footprint.  In detail, 10%, 91%, 25%,
9%, and 26% overheads shown for parsec3/streamcluster (125 MiB),
parsec3/swaptions (15 MiB), splash2x/raytrace (45 MiB), splash2x/volrend (151
MiB), and splash2x/water_nsquared (46 MiB)).  Nonetheless, the overheads are
not from DAMON, but from the wrapper, and thus should be ignored.  This fake
memory overhead continues in 'ethp' and 'prcl', as those configurations are
also using the Python wrapper.


Efficient THP
~~~~~~~~~~~~~

THP 'always' enabled policy achieves 4.51% speedup but incurs 7.08% memory
overhead.  It achieves 36.67% speedup in best case, but 81.14% memory overhead
in worst case.  Interestingly, both the best and worst case are with
'splash2x/ocean_ncp').

The 2-lines implementation of data access monitoring based THP version ('ethp')
shows 2.34% speedup and 2.25% memory overhead.  In other words, 'ethp' removes
68.22% of THP memory waste while preserving 51.88% of THP speedup in total.  In
case of the 'splash2x/ocean_ncp', 'ethp' removes 66.55% of THP memory waste
while preserving 74% of THP speedup.


Proactive Reclamation
~~~~~~~~~~~~~~~~~~~~

As same to the original work, I use 'zram' swap device for this configuration.

In total, our 1 line implementation of Proactive Reclamation, 'prcl', incurred
3.24% runtime overhead in total while achieving 2.94% system memory usage
reduction.

Nonetheless, as the memory usage is calculated with 'MemFree' in
'/proc/meminfo', it contains the SwapCached pages.  As the swapcached pages can
be easily evicted, I also measured the residential set size of the workloads:

rss.avg                 orig         rec          (overhead) thp          (overhead) ethp         (overhead) prcl         (overhead)
parsec3/blackscholes    589877.400   591587.600   (0.29)     593797.000   (0.66)     591090.800   (0.21)     424841.800   (-27.98)
parsec3/bodytrack       32326.600    32289.800    (-0.11)    32284.000    (-0.13)    32249.600    (-0.24)    28931.800    (-10.50)
parsec3/canneal         839469.400   840116.600   (0.08)     838083.800   (-0.17)    837870.400   (-0.19)    833193.800   (-0.75)
parsec3/dedup           1194881.800  1207486.800  (1.05)     1217461.000  (1.89)     1225107.000  (2.53)     995459.400   (-16.69)
parsec3/facesim         311416.600   311812.800   (0.13)     314923.000   (1.13)     312525.200   (0.36)     195057.600   (-37.36)
parsec3/ferret          99787.800    99655.400    (-0.13)    101332.800   (1.55)     99820.400    (0.03)     93295.000    (-6.51)
parsec3/fluidanimate    531801.600   531784.800   (-0.00)    531775.400   (-0.00)    531928.600   (0.02)     432113.400   (-18.75)
parsec3/freqmine        552404.600   553054.400   (0.12)     555716.400   (0.60)     554045.600   (0.30)     157776.200   (-71.44)
parsec3/raytrace        894502.400   892753.600   (-0.20)    888306.200   (-0.69)    892790.600   (-0.19)    374962.600   (-58.08)
parsec3/streamcluster   110877.200   110846.400   (-0.03)    111255.400   (0.34)     111467.600   (0.53)     110063.400   (-0.73)
parsec3/swaptions       5637.600     5611.600     (-0.46)    5621.400     (-0.29)    5630.200     (-0.13)    4594.800     (-18.50)
parsec3/vips            31897.600    31803.800    (-0.29)    32336.400    (1.38)     32168.000    (0.85)     30496.800    (-4.39)
parsec3/x264            82068.400    81975.600    (-0.11)    83066.400    (1.22)     82656.400    (0.72)     80752.400    (-1.60)
splash2x/barnes         1210976.600  1215669.400  (0.39)     1224071.200  (1.08)     1219203.200  (0.68)     1047794.600  (-13.48)
splash2x/fft            9714139.000  9623503.600  (-0.93)    9523996.200  (-1.96)    9555242.400  (-1.64)    9050047.000  (-6.84)
splash2x/lu_cb          510368.800   510468.800   (0.02)     514496.800   (0.81)     510299.200   (-0.01)    445912.000   (-12.63)
splash2x/lu_ncb         510149.600   510325.600   (0.03)     513899.000   (0.73)     510331.200   (0.04)     465811.200   (-8.69)
splash2x/ocean_cp       3407224.400  3405827.200  (-0.04)    3437758.400  (0.90)     3394473.000  (-0.37)    3334869.600  (-2.12)
splash2x/ocean_ncp      3919511.200  3934023.000  (0.37)     7181317.200  (83.22)    5074390.600  (29.46)    3560788.200  (-9.15)
splash2x/radiosity      1474982.000  1476292.400  (0.09)     1485884.000  (0.74)     1474162.800  (-0.06)    695592.400   (-52.84)
splash2x/radix          1765313.200  1752605.000  (-0.72)    1440052.200  (-18.43)   1662186.600  (-5.84)    1888954.800  (7.00)
splash2x/raytrace       23277.600    23289.600    (0.05)     29185.600    (25.38)    26960.600    (15.82)    21139.400    (-9.19)
splash2x/volrend        44110.600    44069.200    (-0.09)    44321.600    (0.48)     44436.000    (0.74)     28610.400    (-35.14)
splash2x/water_nsquared 29412.800    29443.200    (0.10)     29470.000    (0.19)     29894.600    (1.64)     27927.800    (-5.05)
splash2x/water_spatial  655785.200   656694.400   (0.14)     655665.200   (-0.02)    656572.000   (0.12)     558691.000   (-14.81)
total                   28542100.000 28472900.000 (-0.24)    31386000.000 (9.96)     29467572.000 (3.24)     24887691.000 (-12.80)

In total, 12.80% of residential sets were reduced.

With parsec3/freqmine, 'prcl' reduced 17.91% of system memory usage and 71.44%
of residential sets while incurring only 1.25% runtime overhead.


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
