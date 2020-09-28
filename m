Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0FA927ABE6
	for <lists+linux-doc@lfdr.de>; Mon, 28 Sep 2020 12:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbgI1KgQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 28 Sep 2020 06:36:16 -0400
Received: from smtp-fw-6002.amazon.com ([52.95.49.90]:13421 "EHLO
        smtp-fw-6002.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbgI1KgQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Sep 2020 06:36:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1601289375; x=1632825375;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=5lenCskr89LpQ2AkgUWGLyG5rz1PujU6V1uVjmWt4d4=;
  b=hiY/JR1mEy5OI8881dHLDWBAgfPksfJ99SHxIUekk5lTtFBDel4IPZwM
   NF1zk/2kZzI+6GrXoH3myz6FCXFMqiTpRTnpE51BywON5WQI1Wfqr8+gQ
   g/DEZBV7yRKltaLaOTNJJq1AHxKkq7KeK1rSeZu2/iQIyvsGGRn1NzVZu
   o=;
X-IronPort-AV: E=Sophos;i="5.77,313,1596499200"; 
   d="scan'208";a="56638054"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com) ([10.43.8.6])
  by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP; 28 Sep 2020 10:36:14 +0000
Received: from EX13D31EUA001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
        by email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com (Postfix) with ESMTPS id 00BCBA1CF1;
        Mon, 28 Sep 2020 10:36:01 +0000 (UTC)
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.161.237) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 28 Sep 2020 10:35:43 +0000
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
Subject: [RFC PATCH 0/5] DAMON: Make coexistable with Idle Page Tracking
Date:   Mon, 28 Sep 2020 12:35:23 +0200
Message-ID: <20200928103528.4256-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.161.237]
X-ClientProxiedBy: EX13D10UWA003.ant.amazon.com (10.43.160.248) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

NOTE: This is an RFC for future change of DAMON patchsets[1,2,3], which is not
merged in the mainline yet.  The aim of this RFC is to show how the patchset
would be changed in the next version.  So, if you have some interest in this
RFC, please consider reviewing the DAMON patchset, either.

Currently, DAMON is configured to be exclusive with Idle Page Tracking because
both of the subsystems use PG_Idle flag and there is no way to synchronize with
Idle Page Tracking.  Though there are many use cases DAMON could do better than
Idle Page Tracking, DAMON cannot fully replace Idle Page Tracking, since

- DAMON doesn't support all features of Idle Page Tracking from the beginning
  (e.g., physical address space is supported from the third DAMON patchset[3]),
  and
- there are some use cases Idle Page Tracking could be more efficient (e.g.,
  page size granularity working set size calculation).

Therefore, this patchset makes DAMON coexistable with Idle Page Tracking.  As
the first decision of making DAMON exclusive was not a good idea, this change
will be merged in the next versions of the original patchsets[1,2,3].
Therefore, you could skip detail of the changes but wait for postings of the
next versions of the patchsets, except the 4th patch.

The changes significantly refactor the code, especially 'damon.c' and
'damon-test.c'.  Though the refactoring changes are only straightforward, if
you gave 'Reviewed-by' before and you want to drop it due to the changes,
please let me know.

[1] https://lore.kernel.org/linux-mm/20200817105137.19296-1-sjpark@amazon.com/
[2] https://lore.kernel.org/linux-mm/20200804142430.15384-1-sjpark@amazon.com/
[3] https://lore.kernel.org/linux-mm/20200831104730.28970-1-sjpark@amazon.com/

Sequence of Patches
===================

The 1st patch separates DAMON components that unnecessarily implemented in one
source file and depend on one config option (CONFIG_DAMON)
to multiple files and apply fine-grained dependency.  As a result, the core
framework part of DAMON becomes coexistable with Idle Page Tracking.

Following two patches further refactor the code for cleaner bound between the
components.

The 4th patch implements a synchronization infrastructure for PG_idle flag
users.  We implement it to eventually used for DAMON, but the change is
independent with DAMON and the also required for Idle Page Tracking itself.
This could be picked before DAMON patchsets merged.

Finally, the 5th patch updates DAMON to use the PG_idle synchronization
infrastructure and fully coexistable with Page Idle Tracking.

Baseline and Complete Git Trees
===============================

The patches are based on the v5.8 plus DAMON v20 patchset[1], RFC v14 of DAMOS
patchset, RFC v8 of physical address space support patchset, RFC v1 of user
space improvement[4], and some more trivial fixes (s/snprintf/scnprintf).  You
can also clone the complete git tree:

    $ git clone git://github.com/sjp38/linux -b damon-usi/rfc/v1

The web is also available:
https://github.com/sjp38/linux/releases/tag/damon-usi/rfc/v1


[1] https://lore.kernel.org/linux-mm/20200817105137.19296-1-sjpark@amazon.com/
[2] https://lore.kernel.org/linux-mm/20200804142430.15384-1-sjpark@amazon.com/
[3] https://lore.kernel.org/linux-mm/20200831104730.28970-1-sjpark@amazon.com/
[4] https://lore.kernel.org/linux-mm/20200915180807.18812-1-sjpark@amazon.com/

SeongJae Park (5):
  mm/damon: Separate components and apply fine-grained dependencies
  mm/damon: Separate DAMON schemes application to primitives
  mm/damon: Move recording feature from core to dbgfs
  mm/page_idle: Avoid interferences from concurrent users
  mm/damon/primitives: Make coexistable with Idle Page Tracking

 .../admin-guide/mm/idle_page_tracking.rst     |   22 +-
 MAINTAINERS                                   |    3 +-
 include/linux/damon.h                         |  109 +-
 include/linux/page_idle.h                     |    2 +
 mm/Kconfig                                    |   25 +-
 mm/Makefile                                   |    2 +-
 mm/damon-test.h                               |  724 -----
 mm/damon.c                                    | 2754 -----------------
 mm/damon/Kconfig                              |   68 +
 mm/damon/Makefile                             |    5 +
 mm/damon/core-test.h                          |  253 ++
 mm/damon/core.c                               |  860 +++++
 mm/damon/damon.h                              |    7 +
 mm/damon/dbgfs-test.h                         |  264 ++
 mm/damon/dbgfs.c                              | 1158 +++++++
 mm/damon/primitives-test.h                    |  328 ++
 mm/damon/primitives.c                         |  896 ++++++
 mm/page_idle.c                                |   40 +
 18 files changed, 3982 insertions(+), 3538 deletions(-)
 delete mode 100644 mm/damon-test.h
 delete mode 100644 mm/damon.c
 create mode 100644 mm/damon/Kconfig
 create mode 100644 mm/damon/Makefile
 create mode 100644 mm/damon/core-test.h
 create mode 100644 mm/damon/core.c
 create mode 100644 mm/damon/damon.h
 create mode 100644 mm/damon/dbgfs-test.h
 create mode 100644 mm/damon/dbgfs.c
 create mode 100644 mm/damon/primitives-test.h
 create mode 100644 mm/damon/primitives.c

-- 
2.17.1

