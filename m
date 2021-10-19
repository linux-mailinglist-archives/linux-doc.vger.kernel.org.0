Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C46144339B6
	for <lists+linux-doc@lfdr.de>; Tue, 19 Oct 2021 17:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232126AbhJSPKD (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 19 Oct 2021 11:10:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:57472 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232109AbhJSPKC (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 19 Oct 2021 11:10:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6F4FF60F22;
        Tue, 19 Oct 2021 15:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634656070;
        bh=+H87Uncj34Cx/PMBvgEaU/uvlSTbAFuE8APT0rdbAgs=;
        h=From:To:Cc:Subject:Date:From;
        b=RH1I+ciO+avleyR2SrjUREAjWZQ2WlByzX5FU6PJ6fn/OzZuV/p9RyvZHniK4c4GR
         rdRrKZ3X/RV004ofXHJprCkRGWjAx2L2YCFfNsHH8qV5LKHvS91XIesRCdhr4TIMgf
         PDz4f5O0qWn+wXZ+3lqG3HnFrbwZ2UVTKYqdNEY5T6RdEODyzV/S/G/wZzCMwMl7Xz
         1+VrWmCMZxHP8mqX1fMrjHmgmm6U6W5CUMK/K0MSVbMhQQ5kq2vofVnvnx7iWesrwP
         h6ylQdQYiL1Oe6NmKGO/hyDdD+40oUS5ceHGWP5+/aiCaUZP7ccSi5CsTNqa0aOqph
         BxwOdKJ3vlXbg==
From:   SeongJae Park <sj@kernel.org>
To:     akpm@linux-foundation.org
Cc:     SeongJae Park <sj@kernel.org>, Jonathan.Cameron@Huawei.com,
        amit@kernel.org, benh@kernel.crashing.org, corbet@lwn.net,
        david@redhat.com, dwmw@amazon.com, elver@google.com,
        foersleo@amazon.de, gthelen@google.com, markubo@amazon.de,
        rientjes@google.com, shakeelb@google.com, shuah@kernel.org,
        linux-damon@amazon.com, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 00/15] Introduce DAMON-based Proactive Reclamation
Date:   Tue, 19 Oct 2021 15:07:16 +0000
Message-Id: <20211019150731.16699-1-sj@kernel.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changes from Previous Version (RFC v3)
======================================

Compared to the RFC v3
(https://lore.kernel.org/linux-mm/20210720131309.22073-1-sj38.park@gmail.com/),
this version contains below changes.

- Rebase on latest -mm tree
- Use less aggressive default parameter values (coldness threshold: 5s ->
  2mins, cpu time quota: 100ms/1s -> 10ms/1s, size quota: 1GiB/s -> 128MiB/s)
- Update the evaluation results in the coverletter

Introduction
============

This patchset 1) makes the engine for general data access pattern-oriented
memory management (DAMOS) be more useful for production environments, and
2) implements a static kernel module for lightweight proactive reclamation
using the engine.

Proactive Reclamation
---------------------

On general memory over-committed systems, proactively reclaiming cold pages
helps saving memory and reducing latency spikes that incurred by the direct
reclaim or the CPU consumption of kswapd, while incurring only minimal
performance degradation[2].

A Free Pages Reporting[8] based memory over-commit virtualization system would
be one more specific use case.  In the system, the guest VMs reports their free
memory to host, and the host reallocates the reported memory to other guests.
As a result, the system's memory utilization can be maximized.  However, the
guests could be not so memory-frugal, because some kernel subsystems and
user-space applications are designed to use as much memory as available.  Then,
guests would report only small amount of free memory to host, results in poor
memory utilization.  Running the proactive reclamation in such guests could
help mitigating this problem.

Google has also implemented this idea and using it in their data center.  They
further proposed upstreaming it in LSFMM'19, and "the general consensus was
that, while this sort of proactive reclaim would be useful for a number of
users, the cost of this particular solution was too high to consider merging it
upstream"[3].  The cost mainly comes from the coldness tracking.  Roughly
speaking, the implementation periodically scans the 'Accessed' bit of each
page.  For the reason, the overhead linearly increases as the size of the
memory and the scanning frequency grows.  As a result, Google is known to
dedicating one CPU for the work.  That's a reasonable option to someone like
Google, but it wouldn't be so to some others.

DAMON and DAMOS: An engine for data access pattern-oriented memory management
-----------------------------------------------------------------------------

DAMON[4] is a framework for general data access monitoring.  Its adaptive
monitoring overhead control feature minimizes its monitoring overhead.  It also
let the upper-bound of the overhead be configurable by clients, regardless of
the size of the monitoring target memory.  While monitoring 70 GiB memory of a
production system every 5 milliseconds, it consumes less than 1% single CPU
time.  For this, it could sacrify some of the quality of the monitoring
results.  Nevertheless, the lower-bound of the quality is configurable, and it
uses a best-effort algorithm for better quality.  Our test results[5] show the
quality is practical enough.  From the production system monitoring, we were
able to find a 4 KiB region in the 70 GiB memory that shows highest access
frequency.

We normally don't monitor the data access pattern just for fun but to improve
something like memory management.  Proactive reclamation is one such usage.
For such general cases, DAMON provides a feature called DAMon-based Operation
Schemes (DAMOS)[6].  It makes DAMON an engine for general data access pattern
oriented memory management.  Using this, clients can ask DAMON to find memory
regions of specific data access pattern and apply some memory management action
(e.g., page out, move to head of the LRU list, use huge page, ...).  We call
the request 'scheme'.

Proactive Reclamation on top of DAMON/DAMOS
-------------------------------------------

Therefore, by using DAMON for the cold pages detection, the proactive
reclamation's monitoring overhead issue can be solved.  Actually, we previously
implemented a version of proactive reclamation using DAMOS and achieved
noticeable improvements with our evaluation setup[5].  Nevertheless, it more
for a proof-of-concept, rather than production uses.  It supports only virtual
address spaces of processes, and require additional tuning efforts for given
workloads and the hardware.  For the tuning, we introduced a simple auto-tuning
user space tool[8].  Google is also known to using a ML-based similar approach
for their fleets[2].  But, making it just works with intuitive knobs in the
kernel would be helpful for general users.

To this end, this patchset improves DAMOS to be ready for such production
usages, and implements another version of the proactive reclamation, namely
DAMON_RECLAIM, on top of it.

DAMOS Improvements: Aggressiveness Control, Prioritization, and Watermarks
--------------------------------------------------------------------------

First of all, the current version of DAMOS supports only virtual address
spaces.  This patchset makes it supports the physical address space for the
page out action.

Next major problem of the current version of DAMOS is the lack of the
aggressiveness control, which can results in arbitrary overhead.  For example,
if huge memory regions having the data access pattern of interest are found,
applying the requested action to all of the regions could incur significant
overhead.  It can be controlled by tuning the target data access pattern with
manual or automated approaches[2,7].  But, some people would prefer the kernel
to just work with only intuitive tuning or default values.

For such cases, this patchset implements a safeguard, namely time/size quota.
Using this, the clients can specify up to how much time can be used for
applying the action, and/or up to how much memory regions the action can be
applied within a user-specified time duration.  A followup question is, to
which memory regions should the action applied within the limits?  We implement
a simple regions prioritization mechanism for each action and make DAMOS to
apply the action to high priority regions first.  It also allows clients tune
the prioritization mechanism to use different weights for size, access
frequency, and age of memory regions.  This means we could use not only LRU but
also LFU or some fancy algorithms like CAR[9] with lightweight overhead.

Though DAMON is lightweight, someone would want to remove even the cold pages
monitoring overhead when it is unnecessary.  Currently, it should manually
turned on and off by clients, but some clients would simply want to turn it on
and off based on some metrics like free memory ratio or memory fragmentation.
For such cases, this patchset implements a watermarks-based automatic
activation feature.  It allows the clients configure the metric of their
interest, and three watermarks of the metric.  If the metric is higher than the
high watermark or lower than the low watermark, the scheme is deactivated.  If
the metric is lower than the mid watermark but higher than the low watermark,
the scheme is activated.

DAMON-based Reclaim
-------------------

Using the improved version of DAMOS, this patchset implements a static kernel
module called 'damon_reclaim'.  It finds memory regions that didn't accessed
for specific time duration and page out.  Consuming too much CPU for the paging
out operations, or doing pageout too frequently can be critical for systems
configuring their swap devices with software-defined in-memory block devices
like zram/zswap or total number of writes limited devices like SSDs,
respectively.  To avoid the problems, the time/size quotas can be configured.
Under the quotas, it pages out memory regions that didn't accessed longer
first.  Also, to remove the monitoring overhead under peaceful situation, and
to fall back to the LRU-list based page granularity reclamation when it doesn't
make progress, the three watermarks based activation mechanism is used, with
the free memory ratio as the watermark metric.

For convenient configurations, it provides several module parameters.  Using
these, sysadmins can enable/disable it, and tune its parameters including the
coldness identification time threshold, the time/size quotas and the three
watermarks.

Evaluation
==========

In short, DAMON_RECLAIM with 50ms/s time quota and regions prioritization on
v5.15-rc5 Linux kernel with ZRAM swap device achieves 38.58% memory saving with
only 1.94% runtime overhead.  For this, DAMON_RECLAIM consumes only 4.97% of
single CPU time.

Setup
-----

We evaluate DAMON_RECLAIM to show how each of the DAMOS improvements make
effect.  For this, we measure DAMON_RECLAIM's CPU consumption, entire system
memory footprint, total number of major page faults, and runtime of 24
realistic workloads in PARSEC3 and SPLASH-2X benchmark suites on my QEMU/KVM
based virtual machine.  The virtual machine runs on an i3.metal AWS instance,
has 130GiB memory, and runs a linux kernel built on latest -mm tree[1] plus
this patchset.  It also utilizes a 4 GiB ZRAM swap device.  We repeats the
measurement 5 times and use averages.

[1] https://github.com/hnaz/linux-mm/tree/v5.15-rc5-mmots-2021-10-13-19-55

Detailed Results
----------------

The results are summarized in the below table.

With coldness identification threshold of 5 seconds, DAMON_RECLAIM without the
time quota-based speed limit achieves 47.21% memory saving, but incur 4.59%
runtime slowdown to the workloads on average.  For this, DAMON_RECLAIM consumes
about 11.28% single CPU time.

Applying time quotas of 200ms/s, 50ms/s, and 10ms/s without the regions
prioritization reduces the slowdown to 4.89%, 2.65%, and 1.5%, respectively.
Time quota of 200ms/s (20%) makes no real change compared to the quota
unapplied version, because the quota unapplied version consumes only 11.28% CPU
time.  DAMON_RECLAIM's CPU utilization also similarly reduced: 11.24%, 5.51%,
and 2.01% of single CPU time.  That is, the overhead is proportional to the
speed limit.  Nevertheless, it also reduces the memory saving because it
becomes less aggressive.  In detail, the three variants show 48.76%, 37.83%,
and 7.85% memory saving, respectively.

Applying the regions prioritization (page out regions that not accessed longer
first within the time quota) further reduces the performance degradation.
Runtime slowdowns and total number of major page faults increase has been
4.89%/218,690% -> 4.39%/166,136% (200ms/s), 2.65%/111,886% -> 1.94%/59,053%
(50ms/s), and 1.5%/34,973.40% -> 2.08%/8,781.75% (10ms/s).  The runtime under
10ms/s time quota has increased with prioritization, but apparently that's
under the margin of error.

    time quota   prioritization  memory_saving  cpu_util  slowdown  pgmajfaults overhead
    N            N               47.21%         11.28%    4.59%     194,802%
    200ms/s      N               48.76%         11.24%    4.89%     218,690%
    50ms/s       N               37.83%         5.51%     2.65%     111,886%
    10ms/s       N               7.85%          2.01%     1.5%      34,793.40%
    200ms/s      Y               50.08%         10.38%    4.39%     166,136%
    50ms/s       Y               38.58%         4.97%     1.94%     59,053%
    10ms/s       Y               3.63%          1.73%     2.08%     8,781.75%

Baseline and Complete Git Trees
===============================

The patches are based on the latest -mm tree
(v5.15-rc5-mmots-2021-10-13-19-55).  You can also clone the complete git tree
from:

    $ git clone git://github.com/sjp38/linux -b damon_reclaim/patches/v1

The web is also available:
https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git/tag/?h=damon_reclaim/patches/v1

Sequence Of Patches
===================

The first patch makes DAMOS support the physical address space for the page out
action.  Following five patches (patches 2-6) implement the time/size quotas.
Next four patches (patches 7-10) implement the memory regions prioritization
within the limit.  Then, three following patches (patches 11-13) implement the
watermarks-based schemes activation.  Finally, the last two patches (patches
14-15) implement and document the DAMON-based reclamation using the advanced
DAMOS.

[1] https://www.kernel.org/doc/html/v5.15-rc1/vm/damon/index.html
[2] https://research.google/pubs/pub48551/
[3] https://lwn.net/Articles/787611/
[4] https://damonitor.github.io
[5] https://damonitor.github.io/doc/html/latest/vm/damon/eval.html
[6] https://lore.kernel.org/linux-mm/20211001125604.29660-1-sj@kernel.org/
[7] https://github.com/awslabs/damoos
[8] https://www.kernel.org/doc/html/latest/vm/free_page_reporting.html
[9] https://www.usenix.org/conference/fast-04/car-clock-adaptive-replacement

Patch History
=============

Changes from RFC v3
(https://lore.kernel.org/linux-mm/20210720131309.22073-1-sj38.park@gmail.com/)
- Rebase on latest -mm tree
- Use less aggressive default parameter values (coldness threshold: 5s ->
  2mins, cpu time quota: 100ms/1s -> 10ms/1s, size quota: 1GiB/s -> 128MiB/s)
- Update the evaluation results in the coverletter

Changes from RFC v2
(https://lore.kernel.org/linux-mm/20210608115254.11930-1-sj38.park@gmail.com/)
- Rebase on latest -mm tree (v5.14-rc1-mmots-2021-07-15-18-47)
- Make reclamation restarts from exactly the point it stopped due to the limit
- Implement a time quota (limits the time for trying reclamation of cold pages)

[1] https://lore.kernel.org/linux-mm/20210716081449.22187-1-sj38.park@gmail.com/

Changes from RFC v1
(https://lore.kernel.org/linux-mm/20210531133816.12689-1-sj38.park@gmail.com/)
- Avoid fake I/O load reporting (James Gowans)
- Remove kernel configs for the build time enabling and the parameters setting
- Export kdamond pid via a readonly parameter file
- Elaborate coverletter, especially for evaluation and DAMON_RECLAIM interface
- Add documentation
- Rebase on -mm tree
- Cleanup code

SeongJae Park (15):
  mm/damon/paddr: Support the pageout scheme
  mm/damon/schemes: Implement size quota for schemes application speed
    control
  mm/damon/schemes: Skip already charged targets and regions
  mm/damon/schemes: Implement time quota
  mm/damon/dbgfs: Support quotas of schemes
  mm/damon/selftests: Support schemes quotas
  mm/damon/schemes: Prioritize regions within the quotas
  mm/damon/vaddr,paddr: Support pageout prioritization
  mm/damon/dbgfs: Support prioritization weights
  tools/selftests/damon: Update for regions prioritization of schemes
  mm/damon/schemes: Activate schemes based on a watermarks mechanism
  mm/damon/dbgfs: Support watermarks
  selftests/damon: Support watermarks
  mm/damon: Introduce DAMON-based Reclamation (DAMON_RECLAIM)
  Documentation/admin-guide/mm/damon: Add a document for DAMON_RECLAIM

 Documentation/admin-guide/mm/damon/index.rst  |   1 +
 .../admin-guide/mm/damon/reclaim.rst          | 235 ++++++++++++
 include/linux/damon.h                         | 136 ++++++-
 mm/damon/Kconfig                              |  12 +
 mm/damon/Makefile                             |   1 +
 mm/damon/core.c                               | 283 +++++++++++++-
 mm/damon/dbgfs.c                              |  29 +-
 mm/damon/paddr.c                              |  51 ++-
 mm/damon/prmtv-common.c                       |  46 +++
 mm/damon/prmtv-common.h                       |   3 +
 mm/damon/reclaim.c                            | 354 ++++++++++++++++++
 mm/damon/vaddr.c                              |  15 +
 .../testing/selftests/damon/debugfs_attrs.sh  |   4 +-
 13 files changed, 1145 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/admin-guide/mm/damon/reclaim.rst
 create mode 100644 mm/damon/reclaim.c

-- 
2.17.1

