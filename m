Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B0A52FC704
	for <lists+linux-doc@lfdr.de>; Wed, 20 Jan 2021 02:44:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729482AbhATBoW (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 19 Jan 2021 20:44:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729307AbhATBoR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jan 2021 20:44:17 -0500
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE4DDC0613CF
        for <linux-doc@vger.kernel.org>; Tue, 19 Jan 2021 17:43:36 -0800 (PST)
Received: by mail-qk1-x72c.google.com with SMTP id n142so24034409qkn.2
        for <linux-doc@vger.kernel.org>; Tue, 19 Jan 2021 17:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fPD67UzCk98LAJ6Vu+XL6V48bUTmpnZw0NniS4q7Fus=;
        b=YrxniE6SMmxLETdX5/ZkDdXkLspmOnyNxTqfdKpiXO8pSGFyZbXXn7MIaJ5y6R6oGY
         XDS0Rrk0Kjwn7a2mXktkD3avg1myoTzcatzmmQaGBuoqhaN7MlZhybSrinyLhCWhlk7N
         s6iPgiqDQCJ5WfBaDAMRggDPran7MBfjtalwdP2hAHSzejFbF3B/cFmtwtCE64oWMRzZ
         vtl6O7G8B5AE/F6wdMQV60JM0j668itxxusI4w1nDO8qLB05OwmuciV2X8kz8B9kceOb
         GebY8Y7P9HkTEjrtC0HNAoP8Rdk9y4/R7L5kvVVDD/h0tz0kPVIm2DeFpcaNDz8Nw4TI
         lhhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fPD67UzCk98LAJ6Vu+XL6V48bUTmpnZw0NniS4q7Fus=;
        b=U/xaglOP9v3FBtmh1Ov7D/5gDcxx8H1U6WD6A4kXDmAg5aQ43/dduAOET0AvEGwdm2
         gjONko2iPmUCnagdYfouJHWz/RxYkcRgn0kjm0kd+WE5k9zCS3+E5jZT5Rr5eizD5AJW
         N0ZVME36ajC7SeSF35NWokvRs0m6Y/gzWFHY1hyaLM7zxMfveGb+lKnoDHue5etuSxYc
         srMbTwv+f9EdtVzkMCH6ndkwMoFSTvAXuiVwnwM1ixM7wnALtPIJ0+SAryZyxdsUouTL
         vo5XJcK2edVfLXGmFOcvzwiaS5Onf+uU5l9dnzzObs3WEVViVyKp39O3+Mu0H4ntbF0h
         smZg==
X-Gm-Message-State: AOAM5303jcTkLeQFXL35ZXf9u6OgpMdRLAVYW27ievoAGfR4gKoeFLQe
        j0LxSiJD5iH4n93FCPxgFxuNaQ==
X-Google-Smtp-Source: ABdhPJwkg27Z+riB+yAiL8Y5v77a2a29WA0N50uAYVxh9YQvEjU4ReY/pYEWivhixSXk+9oF3GoiPQ==
X-Received: by 2002:a37:628b:: with SMTP id w133mr7409379qkb.247.1611107015849;
        Tue, 19 Jan 2021 17:43:35 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id a9sm391871qkk.39.2021.01.19.17.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 17:43:35 -0800 (PST)
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, akpm@linux-foundation.org, vbabka@suse.cz,
        mhocko@suse.com, david@redhat.com, osalvador@suse.de,
        dan.j.williams@intel.com, sashal@kernel.org,
        tyhicks@linux.microsoft.com, iamjoonsoo.kim@lge.com,
        mike.kravetz@oracle.com, rostedt@goodmis.org, mingo@redhat.com,
        jgg@ziepe.ca, peterz@infradead.org, mgorman@suse.de,
        willy@infradead.org, rientjes@google.com, jhubbard@nvidia.com,
        linux-doc@vger.kernel.org, ira.weiny@intel.com,
        linux-kselftest@vger.kernel.org
Subject: [PATCH v6 00/14] prohibit pinning pages in ZONE_MOVABLE
Date:   Tue, 19 Jan 2021 20:43:19 -0500
Message-Id: <20210120014333.222547-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changelog
---------
v6
  Small update, but I wanted to send it out quicker, as it removes a
  controversial patch and replaces it with something sane.
- Removed forcing FOLL_WRITE for longterm gup, instead added a patch to
  skip zero pages during migration.
- Added reviewed-by's and minor log changes.

v5
- Added the following patches to the beginning of series, which are fixes
   to the other existing problems with CMA migration code:
	mm/gup: check every subpage of a compound page during isolation
	mm/gup: return an error on migration failure
	mm/gup: check for isolation errors also at the beginning of series
	mm/gup: do not allow zero page for pinned pages
- remove .gfp_mask/.reclaim_idx changes from mm/vmscan.c
- update movable zone header comment in patch 8 instead of patch 3, fix
  the comment
- Added acked, sign-offs
- Updated commit logs based on feedback
- Addressed issues reported by Michal and Jason.
- Remove:
	#define PINNABLE_MIGRATE_MAX	10
	#define PINNABLE_ISOLATE_MAX	100
   Instead: fail on the first migration failure, and retry isolation
   forever as their failures are transient.

- In self-set addressed some of the comments from John Hubbard, updated
  commit logs, and added comments. Renamed gup->flags with gup->test_flags.

v4
- Address page migration comments. New patch:
  mm/gup: limit number of gup migration failures, honor failures
  Implements the limiting number of retries for migration failures, and
  also check for isolation failures.
  Added a test case into gup_test to verify that pages never long-term
  pinned in a movable zone, and also added tests to fault both in kernel
  and in userland.
v3
- Merged with linux-next, which contains clean-up patch from Jason,
  therefore this series is reduced by two patches which did the same
  thing.
v2
- Addressed all review comments
- Added Reviewed-by's.
- Renamed PF_MEMALLOC_NOMOVABLE to PF_MEMALLOC_PIN
- Added is_pinnable_page() to check if page can be longterm pinned
- Fixed gup fast path by checking is_in_pinnable_zone()
- rename cma_page_list to movable_page_list
- add a admin-guide note about handling pinned pages in ZONE_MOVABLE,
  updated caveat about pinned pages from linux/mmzone.h
- Move current_gfp_context() to fast-path

---------
When page is pinned it cannot be moved and its physical address stays
the same until pages is unpinned.

This is useful functionality to allows userland to implementation DMA
access. For example, it is used by vfio in vfio_pin_pages().

However, this functionality breaks memory hotplug/hotremove assumptions
that pages in ZONE_MOVABLE can always be migrated.

This patch series fixes this issue by forcing new allocations during
page pinning to omit ZONE_MOVABLE, and also to migrate any existing
pages from ZONE_MOVABLE during pinning.

It uses the same scheme logic that is currently used by CMA, and extends
the functionality for all allocations.

For more information read the discussion [1] about this problem.
[1] https://lore.kernel.org/lkml/CA+CK2bBffHBxjmb9jmSKacm0fJMinyt3Nhk8Nx6iudcQSj80_w@mail.gmail.com

Previous versions:
v1
https://lore.kernel.org/lkml/20201202052330.474592-1-pasha.tatashin@soleen.com
v2
https://lore.kernel.org/lkml/20201210004335.64634-1-pasha.tatashin@soleen.com
v3
https://lore.kernel.org/lkml/20201211202140.396852-1-pasha.tatashin@soleen.com
v4
https://lore.kernel.org/lkml/20201217185243.3288048-1-pasha.tatashin@soleen.com
v5
https://lore.kernel.org/lkml/20210119043920.155044-1-pasha.tatashin@soleen.com

Pavel Tatashin (14):
  mm/gup: don't pin migrated cma pages in movable zone
  mm/gup: check every subpage of a compound page during isolation
  mm/gup: return an error on migration failure
  mm/gup: check for isolation errors
  mm cma: rename PF_MEMALLOC_NOCMA to PF_MEMALLOC_PIN
  mm: apply per-task gfp constraints in fast path
  mm: honor PF_MEMALLOC_PIN for all movable pages
  mm/gup: do not migrate zero page
  mm/gup: migrate pinned pages out of movable zone
  memory-hotplug.rst: add a note about ZONE_MOVABLE and page pinning
  mm/gup: change index type to long as it counts pages
  mm/gup: longterm pin migration cleaup
  selftests/vm: test flag is broken
  selftests/vm: test faulting in kernel, and verify pinnable pages

 .../admin-guide/mm/memory-hotplug.rst         |   9 +
 include/linux/migrate.h                       |   1 +
 include/linux/mm.h                            |  11 ++
 include/linux/mmzone.h                        |  13 +-
 include/linux/sched.h                         |   2 +-
 include/linux/sched/mm.h                      |  27 +--
 include/trace/events/migrate.h                |   3 +-
 mm/gup.c                                      | 175 ++++++++----------
 mm/gup_test.c                                 |  29 +--
 mm/gup_test.h                                 |   3 +-
 mm/hugetlb.c                                  |   4 +-
 mm/page_alloc.c                               |  33 ++--
 tools/testing/selftests/vm/gup_test.c         |  36 +++-
 13 files changed, 185 insertions(+), 161 deletions(-)

-- 
2.25.1

