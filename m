Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C3361515D8
	for <lists+linux-doc@lfdr.de>; Tue,  4 Feb 2020 07:23:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725834AbgBDGXd (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 4 Feb 2020 01:23:33 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:47046 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725813AbgBDGXd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Feb 2020 01:23:33 -0500
Received: by mail-pl1-f193.google.com with SMTP id y8so6823846pll.13;
        Mon, 03 Feb 2020 22:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8E+UZz4tOW3o5/5fziQljLgAZHX3cCZHEip5ctU5Jio=;
        b=ojbKfVqMYqyn0dIKgNR1QhUb38j2b7fh8ovJRcmrc811QUG2n4ZfTqkxwykStmbV2x
         H9FGT182YLcLjH6SGXVXwWRm+rHMaN5XZoCu77o2oCVM90inj7XOhVx1dXb5OAi62XiW
         hfb39cPEHaIdIaWhIlnzbTvgnUIvDyO56r9P9g92b1rOboGG+dc3BZlrY5DihI+6blF1
         WEA3GLTYegw62huBx8MT+PqY7NL5387m6308rBJqkU/BW9GvrQ3VyXZjoHBNcLjnIiKS
         RoqfMryW2NUN396cBoI1Ud74MS7JO5CnGO9051NBqNE63P0mqts9y0itTcBho1xx+19y
         Yy3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8E+UZz4tOW3o5/5fziQljLgAZHX3cCZHEip5ctU5Jio=;
        b=NBj9MyR1q3kzla+d3ZtxYYqyyJ6eov3NsIbE6RQooJ2UVzBCKcUga+uM8hCEzAZCIe
         wm1YrA9R+ijreiGXHHYErXmtR/C3oesMRSpTfBDEv+mh3rZqROseXV8U4mTbzINQtfMx
         7KJ56b+Dxz2TehsdJaw5eHtm2TIoYIAEJrBj1O3lGsMBrw5ORNmS8HH2aBEbsjsy9VI/
         90uIT4D7t/obNK2uh3Hx2VOjC9/Iwbn5qSQPBG7SwbjvFFhanmUQ3ZjUrgxEOP7s7hT/
         WGL9/hJv4XrN7rQgA4FSqbYPTmykASIRcHgxUPzv05bPwemxdLnG92N0+sQwDxBWqbrP
         6jnA==
X-Gm-Message-State: APjAAAXaG74G4cWfqCYpm/DfGEdfgYBqDTH7ucaTygskKZjqi3oO3uwt
        c2Kn3UhbCPAwUzMD0cnXDa4=
X-Google-Smtp-Source: APXvYqy1qla9VL3+vZcmuLr+tq//4LOViXgdZtY1InTnMDpq5QDlv4zefug3GRVZCN0uT71tBEBHyQ==
X-Received: by 2002:a17:90a:da03:: with SMTP id e3mr4268630pjv.57.1580797411520;
        Mon, 03 Feb 2020 22:23:31 -0800 (PST)
Received: from localhost.localdomain ([106.254.212.20])
        by smtp.gmail.com with ESMTPSA id u26sm21880240pfn.46.2020.02.03.22.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 22:23:30 -0800 (PST)
From:   sj38.park@gmail.com
To:     akpm@linux-foundation.org
Cc:     SeongJae Park <sjpark@amazon.de>, acme@kernel.org,
        alexander.shishkin@linux.intel.com, amit@kernel.org,
        brendan.d.gregg@gmail.com, brendanhiggins@google.com, cai@lca.pw,
        colin.king@canonical.com, corbet@lwn.net, dwmw@amazon.com,
        jolsa@redhat.com, kirill@shutemov.name, mark.rutland@arm.com,
        mgorman@suse.de, minchan@kernel.org, mingo@redhat.com,
        namhyung@kernel.org, peterz@infradead.org, rdunlap@infradead.org,
        rostedt@goodmis.org, sj38.park@gmail.com, vdavydov.dev@gmail.com,
        linux-mm@kvack.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/11] Introduce Data Access MONitor (DAMON)
Date:   Tue,  4 Feb 2020 06:23:01 +0000
Message-Id: <20200204062312.19913-1-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

Introduction
============

Memory management decisions can normally be more efficient if finer data access
informations are available.  However, because finer information usually comes
with higher overhead, most systems including Linux made a tradeoff: Forgive
some wise decisions and use coarse information and/or light-weight heuristics.

A number of experimental data access pattern awared memory management
optimizations (refer to 'Appendix D' for more detail) say the sacrifices are
huge (2.55x slowdown).  However, none of those has successfully adopted to
Linux kernel mainly due to the absence of a scalable and efficient data access
monitoring mechanism.  Refer to 'Appendix C' to see the limitations of existing
memory monitoring mechanisms.

DAMON is a data access monitoring solution for the problem.  It is 1) accurate
enough for the DRAM level memory management, 2) light-weight enough to be
applied online, and 3) keeps predefined upper-bound overhead regardless of the
size of target workloads (thus scalable).  Refer to 'Appendix A: Mechanisms of
DAMON' if you interested in how it is possible.

DAMON is implemented as a standalone kernel module and provides several simple
interfaces.  Owing to that, though it has mainly designed for the kernel's
memory management mechanisms, it can be also used for a wide range of user
space programs and people.  Refer to 'Appendix B: Expectd Use-cases' for more
detailed expected usages of DAMON.


Frequently Asked Questions
==========================

Q: Why not integrated with perf?
A: From the perspective of perf like profilers, DAMON can be thought of as a
data source in kernel, like tracepoints, pressure stall information (psi), or
idle page tracking.  Thus, it can be easily integrated with those.  However,
this patchset doesn't provide a fancy perf integration because current step of
DAMON development is focused on its core logic only.  That said, DAMON already
provides two interfaces for user space programs, which based on debugfs and
tracepoint, respectively.  Using the tracepoint interface, you can use DAMON
with perf.  This patchset also provides the debugfs interface based user space
tool for DAMON.  It can be used to record, visualize, and analyze data access
pattern of target processes in a convenient way.

Q: Why a new module, instead of extending perf or other tools?
A: First, DAMON aims to be used by other programs including the kernel.
Therfore, having dependency to specific tools like perf is not desirable.
Second, because it need to be lightweight as much as possible so that it can be
used online, any unnecessary overhead such as kernel - user space context
switching cost should be avoided.  These are the two most biggest reasons why
DAMON is implemented in the kernel space.  The idle page tracking subsystem
would be the kernel module that most seems similar to DAMON.  However, it's own
interface is not compatible with DAMON.  Also, the internal implementation of
it has no common part to be reused by DAMON.

Q: Can 'perf mem' provide the data required for DAMON?
A: On the systems supporting 'perf mem', yes.  DAMON is using the PTE Accessed
bits in low level.  Other H/W or S/W features that can be used for the purpose
could be used.  However, as explained with above question, DAMON need to be
implemented in the kernel space.


Evaluations
===========

A prototype of DAMON has evaluated on an Intel Xeon E7-8837 machine using 20
benchmarks that picked from SPEC CPU 2006, NAS, Tensorflow Benchmark,
SPLASH-2X, and PARSEC 3 benchmark suite.  Nonethless, this section provides
only summary of the results.  For more detail, please refer to the slides used
for the introduction of DAMON at the Linux Plumbers Conference 2019[1] or the
MIDDLEWARE'19 industrial track paper[2].


Quality
-------

We first traced and visualized the data access pattern of each workload.  We
were able to confirm that the visualized results are reasonably accurate by
manually comparing those with the source code of the workloads.

To see the usefulness of the monitoring, we optimized 9 memory intensive
workloads among them for memory pressure situations using the DAMON outputs.
In detail, we identified frequently accessed memory regions in each workload
based on the DAMON results and protected them with ``mlock()`` system calls.
The optimized versions consistently show speedup (2.55x in best case, 1.65x in
average) under memory pressure situation.


Overhead
--------

We also measured the overhead of DAMON.  It was not only under the upperbound
we set, but was much lower (0.6 percent of the bound in best case, 13.288
percent of the bound in average).  This reduction of the overhead is mainly
resulted from the adaptive regions adjustment.  We also compared the overhead
with that of the straightforward periodic Accessed bit check-based monitoring,
which checks the access of every page frame.  DAMON's overhead was much smaller
than the straightforward mechanism by 94,242.42x in best case, 3,159.61x in
average.


References
==========

Prototypes of DAMON have introduced by an LPC kernel summit track talk[1] and
two academic papers[2,3].  Please refer to those for more detailed information,
especially the evaluations.

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


Sequence Of Patches
===================

The patches are organized in the following sequence.  The first patch
introduces DAMON module and it's small common functions.  Following three
patches (2nd to 4th) implement the core logics of DAMON, regions based
sampling, adaptive regions adjustment, and dynamic memory mapping chage
adoption, one by one.

Next three patches (5th to 7th) adds interfaces of DAMON.  Each of those adds
an api for other kernel code, a debugfs interface for super users and a
tracepoint for other tracepoint supporting tracers such as perf.

To provide a minimal reference to the debugfs interface and for more convenient
use/tests of the DAMON, the next patch (8th) implements an user space tool.
The 9th patch adds a document for administrators of DAMON, and the 10th patch
provides DAMON's kunit tests.  Finally, the last patch (11th) updates the
MAINTAINERS file.

The patches are based on the v5.5.  You can also clone the complete git
tree:

    $ git clone git://github.com/sjp38/linux -b damon/patches/v3

The web is also available:
https://github.com/sjp38/linux/releases/tag/damon/patches/v3


Patch History
=============

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

SeongJae Park (11):
  Introduce Data Access MONitor (DAMON)
  mm/damon: Implement region based sampling
  mm/damon: Adaptively adjust regions
  mm/damon: Apply dynamic memory mapping changes
  mm/damon: Implement kernel space API
  mm/damon: Add debugfs interface
  mm/damon: Add a tracepoint for result writing
  mm/damon: Add minimal user-space tools
  Documentation/admin-guide/mm: Add a document for DAMON
  mm/damon: Add kunit tests
  MAINTAINERS: Update for DAMON

 .../admin-guide/mm/data_access_monitor.rst    |  414 +++++
 Documentation/admin-guide/mm/index.rst        |    1 +
 MAINTAINERS                                   |   11 +
 include/linux/damon.h                         |   71 +
 include/trace/events/damon.h                  |   32 +
 mm/Kconfig                                    |   23 +
 mm/Makefile                                   |    1 +
 mm/damon-test.h                               |  604 +++++++
 mm/damon.c                                    | 1412 +++++++++++++++++
 tools/damon/.gitignore                        |    1 +
 tools/damon/_dist.py                          |   35 +
 tools/damon/bin2txt.py                        |   64 +
 tools/damon/damo                              |   37 +
 tools/damon/heats.py                          |  358 +++++
 tools/damon/nr_regions.py                     |   88 +
 tools/damon/record.py                         |  219 +++
 tools/damon/report.py                         |   45 +
 tools/damon/wss.py                            |   94 ++
 18 files changed, 3510 insertions(+)
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

-- 
2.17.1

----

Appendix A: Mechanisms of DAMON
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


Appendix B: Expected Use-cases
===============================

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


A Future Plan: Data Access Based Optimizations Support
------------------------------------------------------

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


Appendix C: Limitations of Other Access Monitoring Techniques
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


Appendix D: Related Works
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
