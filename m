Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A35B39F5A3
	for <lists+linux-doc@lfdr.de>; Tue,  8 Jun 2021 13:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232360AbhFHLzT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 8 Jun 2021 07:55:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232353AbhFHLzR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Jun 2021 07:55:17 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68D3FC061574;
        Tue,  8 Jun 2021 04:53:14 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id e3so3389747qte.0;
        Tue, 08 Jun 2021 04:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ZWHDB8NKvIG2y1YIidZ3ys2LcT8lV7P1WCHXH/HLaJc=;
        b=idWUr7KUK/ucDSikAdGpiTXiYZa9jgcvQJOjGsBS6qwIqw6jg6bl24IFBJj31GQaPz
         EopUPAXuuYyejAV69e/loYzHMIiHIRXMLAC5bwHvw6CmhPWaXBbWPdOtelCF3fIRuTIi
         /1pWl/Lg1RzdJfI1OgAb9QbggvUcMH9ePjiic9rvvqtDFwD07LVs56yl0JpKYoE3oM1U
         nbKAqmUEgMsRVB876KXF2O3J5Xndjy+rQAiANzWDZVGQW6+QL3zs52/D6i94AR257HqZ
         y0De6G2KlDkwptmhCQYuQVonuK6mgK92+JW2jqrB5NBEql9zmOTut9Wk7cJD8BHrwnjf
         VNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ZWHDB8NKvIG2y1YIidZ3ys2LcT8lV7P1WCHXH/HLaJc=;
        b=rVfrueGjcgK84COmNf3cFR4gGdt+J4dHaWflCmJIETR4KOcMHXbvO+WZTZIilCJbjl
         gIXYzaMhL5gpeiuYuhpUe40Qy+VVGK/eN+1XLbaX9DaDZ1c/a+yko0GQqV/w9WYPQC7Q
         XsDQryWpEAqFeYDye+/3URJ6/2AS8LnbwF/h0/2/WYyGbS5M0ukKZqsUEyhNSov40uJy
         ALuyx+a9qxJlj8cXKMOVO0Gx05L+7bhQT61apmkcTHc3OYtQFrptXRnnGtEdx4xX6T89
         hd54R0Xp89hZTrzCzzHwRAyh5+iI0i04bkRQt5qd1Ryi4slPxDkJF+QRR2IgSgqnVT8o
         2NXw==
X-Gm-Message-State: AOAM530Flv8AzlvMEO00EVA4VqJljo51pH7ZNt0Obhbe8HVd3oaSOiqS
        BP3M5YF+kWlrJGnhryKBXgI=
X-Google-Smtp-Source: ABdhPJylGRjdcEparAshG3BpYV7WAhGwBHI9OpeH+/B8ZnbN3QbhCf7bUuRdIdUNKgIPfDl34ke8Hw==
X-Received: by 2002:a05:622a:40f:: with SMTP id n15mr20934717qtx.10.1623153190966;
        Tue, 08 Jun 2021 04:53:10 -0700 (PDT)
Received: from localhost.localdomain (ec2-35-169-212-159.compute-1.amazonaws.com. [35.169.212.159])
        by smtp.gmail.com with ESMTPSA id h4sm2133927qth.66.2021.06.08.04.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 04:53:10 -0700 (PDT)
From:   SeongJae Park <sj38.park@gmail.com>
To:     akpm@linux-foundation.org
Cc:     SeongJae Park <sjpark@amazon.de>, Jonathan.Cameron@Huawei.com,
        acme@kernel.org, alexander.shishkin@linux.intel.com,
        amit@kernel.org, benh@kernel.crashing.org,
        brendanhiggins@google.com, corbet@lwn.net, david@redhat.com,
        dwmw@amazon.com, elver@google.com, fan.du@intel.com,
        foersleo@amazon.de, greg@kroah.com, gthelen@google.com,
        guoju.fgj@alibaba-inc.com, jgowans@amazon.com, mgorman@suse.de,
        minchan@kernel.org, mingo@redhat.com, namhyung@kernel.org,
        peterz@infradead.org, riel@surriel.com, rientjes@google.com,
        rostedt@goodmis.org, rppt@kernel.org, shakeelb@google.com,
        shuah@kernel.org, sj38.park@gmail.com, snu@zelle79.org,
        vbabka@suse.cz, vdavydov.dev@gmail.com, zgf574564920@gmail.com,
        linux-damon@amazon.com, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC v2 00/14] Introduce DAMON-based Proactive Reclamation
Date:   Tue,  8 Jun 2021 11:52:40 +0000
Message-Id: <20210608115254.11930-1-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

NOTE: This is only an RFC for future features of DAMON patchset[1], which is
not merged in the mainline yet.  The aim of this RFC is to show how DAMON would
be evolved once it is merged in.  So, if you have some interest here, please
consider reviewing the DAMON patchset, either.

[1] https://lore.kernel.org/linux-mm/20210520075629.4332-1-sj38.park@gmail.com/

Changes from Previous Version
=============================

- Avoid fake I/O load reporting (James Gowans)
- Remove kernel configs for the build time enabling and the parameters setting
- Export kdamond pid via a readonly parameter file
- Elaborate coverletter, especially for evaluation and DAMON_RECLAIM interface
- Add documentation
- Rebase on -mm tree
- Cleanup code

Introduction
============

In short, this patchset 1) makes the engine for general data access
pattern-oriented memory management be useful for production environments, and
2) implements a static kernel module for lightweight proactive reclamation
using the engine.

Proactive Reclamation
---------------------

On general memory over-committed systems, proactively reclaiming cold pages
helps saving memory and reducing latency spikes that incurred by the direct
reclaim or the CPU consumption of kswapd, while incurring only minimal
performance degradation[2].

Particularly, a Free Pages Reporting[9] based memory over-commit virtualization
system would be one of such use cases.  In the system, the guest VMs reports
their free memory to host, and the host reallocates the reported memory to
other guests.  As a result, the system's memory can be fully utilized.
However, the guests could be not so memory-frugal, mainly because some kernel
subsystems and user-space applications are designed to use as much memory as
available.  Then, guests would report only small amount of free memory to host,
and results in poor memory utilization.  Running the proactive reclamation in
guests could help mitigating this problem.

Google has implemented the general idea and using it in their data center.
They further proposed upstreaming it in LSFMM'19, and "the general consensus
was that, while this sort of proactive reclaim would be useful for a number of
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
let the upper-bounded of the overhead be configurable by clients, regardless of
the size of the monitoring target memory.  While monitoring 70 GB memory of a
production system every 5 milliseconds, it consumes less than 1% single CPU
time.  For this, it could sacrify some of the quality of the monitoring
results.  Nevertheless, the lower-bound of the quality is configurable, and it
uses a best-effort algorithm for better quality.  Our test results[5] show the
quality is practical enough.  From the production system monitoring, we were
able to find a 4 KB region in the 70 GB memory that shows highest access
frequency.  For people having different requirements, the features can
selectively turned off, and DAMON supports the page-granularity monitoring[6],
though it makes the overhead higher and proportional to the memory size again.

We normally don't monitor the data access pattern just for fun but to improve
something like memory management.  Proactive reclamation is one such usage.
For such general cases, DAMON provides a feature called DAMon-based Operation
Schemes (DAMOS)[7].  It makes DAMON an engine for general data access pattern
oriented memory management.  Using this, clients can ask DAMON to find memory
regions of specific data access pattern and apply some memory management action
(e.g., page out, move to head of the LRU list, use huge page, ...).  We call
the request 'scheme'.

Proactive Reclamation on top of DAMON/DAMOS
-------------------------------------------

Therefore, by using DAMON for the cold pages detection, the proactive
reclamation's monitoring overhead issue could be solved.  If someone like
Google is ok to dedicate some CPUs for the monitoring and wants
page-granularity monitoring, they can configure DAMON so.

Actually, we previously implemented a version of proactive reclamation using
DAMOS and achieved noticeable improvements with our evaluation setup[5].
Nevertheless, it was only for a proof-of-concept.  It supports only virtual
address spaces of processes, and require additional tuning efforts for given
workloads and the hardware.  For the tuning, we recently introduced a simple
auto-tuning user space tool[8].  Google is also known to using a ML-based
similar approach for their fleets[2].  But, making it just works in the kernel
would be more convenient for general users.

To this end, this patchset improves DAMOS to be ready for such production
usages, and implements another version of the proactive reclamation, namely
DAMON_RECLAIM, on top of it.

DAMOS Improvements: Speed Limit, Prioritization, and Watermarks
---------------------------------------------------------------

First of all, the current version of DAMOS supports only virtual address
spaces.  This patchset makes it supports the physical address space for the
page out action.

One major problem of the current version of DAMOS is the lack of the
aggressiveness control, which can results in arbitrary overhead.  For example,
if huge memory regions having the data access pattern of interest are found,
applying the requested action to all of the regions could incur significant
overhead.  It can be controlled by modifying the target data access pattern
with manual or automated approaches[2,8].  But, for some people would prefer
the kernel just works with only intuitive tuning or default values.

For this, this patchset implements a safeguard called speed limit.  Using this,
the clients can specify up to how much amount of memory the action is allowed
to be applied within specific time duration.  A followup question is, to which
memory regions should the action applied within the limit?  We implement a
simple regions prioritization mechanism for each action and make DAMOS to apply
the action to high priority regions first.  It also allows clients tune the
prioritization mechanism to use different weights for region's size, access
frequency, and age.  This means we could use not only LRU but also LFU or some
fancy algorithms like CAR[10] with lightweight overhead.

Though DAMON is lightweight, someone would want to remove even the overhead
when it is unnecessary.  Currently, it should manually turned on and off by
clients, but some clients would simply want to turn it on and off based on some
metrics like free memory ratio or memory fragmentation.  For such cases, this
patchset implements a watermarks-based automatic activation feature.  It allows
the clients configure the metric of their interest, and three watermarks of the
metric.  If the metric is higher than the high watermark or lower than the low
watermark, the scheme is deactivated.  If the metric is lower than the mid
watermark but higher than the low watermark, the scheme is activated.

DAMON-based Reclaim
-------------------

Using the improved DAMOS, this patchset implements a static kernel module
called 'damon_reclaim'.  It finds memory regions that didn't accessed for
specific time duration and page out.  To avoid it consuming too much CPU for
the paging out operations, the speed limit can be configured.  Under the speed
limit, it pages out memory regions that didn't accessed longer first.  Also, to
remove the monitoring overhead under peaceful situation, and to fall back to
the LRU-list based page granularity reclamation when it doesn't make progress,
the three watermarks based activation mechanism is used, with the free memory
ratio as the watermark metric.

For convenient configuration, it utilizes module parameters.  Using these,
sysadmins can enable/disable it and tune the coldness identification time
threshold, the speed limit, and the three watermarks.  For this, they can use
the kernel command line for a boot time tuning, or the sysfs
('/sys/modules/damon_reclaimparameters/') for a runtime tuning.

Evaluation
==========

In short, DAMON_RECLAIM on v5.12 Linux kernel with ZRAM swap device and 10GB/s
speed limit achieves 32% memory saving with only 1.91% runtime overhead.  For
this, DAMON_RECLAIM consumes only 5.72% of single CPU time.  Among the CPU
consumption, only about 1.448% of single CPU time is expected to be used for
the access pattern monitoring.

Setup
-----

We evaluate DAMON_RECLAIM to show how each of the DAMOS improvements make
effect.  For this, we measure entire system memory footprint and runtime of 24
realistic workloads in PARSEC3 and SPLASH-2X benchmark suites on my QEMU/KVM
based virtual machine.  The virtual machine runs on an i3.metal AWS instance
and has 130GiB memory.  It also utilizes a 4 GiB ZRAM swap device.  We do the
measurement 5 times and use averages.  We also measure the CPU consumption of
DAMON_RECLAIM.

Detailed Results
----------------

The result numbers are shown in below table.

DAMON_RECLAIM without the speed limit achieves 46.50% memory saving, but incur
4.79% runtime slowdown to the workloads on average.  For this, DAMON_RECLAIM
consumes about 11% single CPU time.

Applying 1GB/s, 5GB/s, and 10GB/s speed limits without the regions
prioritization reduces the slowdown to 1.76%, 2.26%, and 2.88%, respectively.
DAMON_RECLAIM's CPU utilization also similarly reduced: 1.98%, 4.34%, and 6.27%
of single CPU time.  That is, the overhead is proportional to the speed limit.
Nevertheless, it also reduces the memory saving because it becomes less
aggressive.  In detail, the three variants show 11.66%, 26.73%, and 36.42%
memory saving, respectively.

Applying the regions prioritization (page out regions that not accessed longer
first within the speed limit) further reduces the performance degradation.
Runtime slowdowns has been 1.76% -> 0.91% (1GB/s), 2.26% -> 1.93% (5GB/s), and
2.88% -> 1.91% (10GB/s).  Interestingly, prioritization also reduced memory
saving a little bit.  I think that's because already paged out regions are
prioritized again.

    speed_limit  prioritization  memory_saving  cpu_util  slowdown
    N            N               46.50%         11.00%    4.79%
    1GB/s        N               11.66%         1.98%     1.76%
    5GB/s        N               26.73%         4.34%     2.26%
    10GB/s       N               36.42%         6.27%     2.88%
    1GB/s        Y               3.50%          1.55%     0.91%
    5GB/s        Y               19.11%         3.45%     1.93%
    10GB/s       Y               32.07%         5.39%     1.91%

Baseline and Complete Git Tree
==============================

The patches are based on the latest -mm tree (v5.13-rc5-mmots-2021-06-07-18-41)
plus DAMON patchset[1], DAMOS patchset[7], and physical address space support
patchset[6].  You can also clone the complete git tree from:

    $ git clone git://github.com/sjp38/linux -b damon_reclaim/rfc/v2

The web is also available:
https://github.com/sjp38/linux/releases/tag/damon_reclaim/rfc/v2

Development Trees
-----------------

There are a couple of trees for entire DAMON patchset series and
features for future release.

- For latest release: https://github.com/sjp38/linux/tree/damon/master
- For next release: https://github.com/sjp38/linux/tree/damon/next

Long-term Support Trees
-----------------------

For people who want to test DAMON patchset series but using only LTS kernels,
there are another couple of trees based on two latest LTS kernels respectively
and containing the 'damon/master' backports.

- For v5.4.y: https://github.com/sjp38/linux/tree/damon/for-v5.4.y
- For v5.10.y: https://github.com/sjp38/linux/tree/damon/for-v5.10.y

Sequence Of Patches
===================

The first patch makes DAMOS to support the physical address space for the page
out action.  Following four patches (patches 2-5) implement the speed limit.
Next four patches (patches 6-9) implement the memory regions prioritization
within the limit.  Then, three following patches (patches 10-12) implement the
watermarks-based schemes activation.  Finally, the last two patches (patches
13-14) implement and document the DAMON-based reclamation on top of DAMOS.

[1] https://lore.kernel.org/linux-mm/20210520075629.4332-1-sj38.park@gmail.com/
[2] https://research.google/pubs/pub48551/
[3] https://lwn.net/Articles/787611/
[4] https://damonitor.github.io
[5] https://damonitor.github.io/doc/html/latest/vm/damon/eval.html
[6] https://lore.kernel.org/linux-mm/20201216094221.11898-1-sjpark@amazon.com/
[7] https://lore.kernel.org/linux-mm/20201216084404.23183-1-sjpark@amazon.com/
[8] https://github.com/awslabs/damoos
[9] https://www.kernel.org/doc/html/latest/vm/free_page_reporting.html
[10] https://www.usenix.org/conference/fast-04/car-clock-adaptive-replacement

Patch History
=============

Changes from RFC v1
(https://lore.kernel.org/linux-mm/20210531133816.12689-1-sj38.park@gmail.com/)

- Avoid fake I/O load reporting (James Gowans)
- Remove kernel configs for the build time enabling and the parameters setting
- Export kdamond pid via a readonly parameter file
- Elaborate coverletter, especially for evaluation and DAMON_RECLAIM interface
- Add documentation
- Rebase on -mm tree
- Cleanup code

SeongJae Park (14):
  mm/damon/paddr: Support the pageout scheme
  mm/damon/damos: Make schemes aggressiveness controllable
  damon/core/schemes: Skip already charged targets and regions
  mm/damon/dbgfs: Support schemes speed limit
  mm/damon/selftests: Support schemes speed limit
  mm/damon/schemes: Prioritize regions within speed limit
  mm/damon/vaddr,paddr: Support pageout prioritization
  mm/damon/dbgfs: Support prioritization weights
  tools/selftests/damon: Update for regions prioritization of schemes
  mm/damon/schemes: Activate schemes based on a watermarks mechanism
  mm/damon/dbgfs: Support watermarks
  selftests/damon: Support watermarks
  mm/damon: Introduce DAMON-based reclamation
  Documentation/admin-guide/mm/damon: Add a document for DAMON_RECLAIM

 Documentation/admin-guide/mm/damon/index.rst  |   1 +
 .../admin-guide/mm/damon/reclaim.rst          | 211 +++++++++++
 include/linux/damon.h                         | 118 ++++++-
 mm/damon/Kconfig                              |  12 +
 mm/damon/Makefile                             |   1 +
 mm/damon/core.c                               | 226 +++++++++++-
 mm/damon/dbgfs.c                              |  45 ++-
 mm/damon/paddr.c                              |  52 ++-
 mm/damon/prmtv-common.c                       |  48 ++-
 mm/damon/prmtv-common.h                       |   5 +
 mm/damon/reclaim.c                            | 330 ++++++++++++++++++
 mm/damon/vaddr.c                              |  15 +
 .../testing/selftests/damon/debugfs_attrs.sh  |   4 +-
 13 files changed, 1041 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/admin-guide/mm/damon/reclaim.rst
 create mode 100644 mm/damon/reclaim.c

-- 
2.17.1

