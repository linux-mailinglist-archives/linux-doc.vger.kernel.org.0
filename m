Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAD45302D17
	for <lists+linux-doc@lfdr.de>; Mon, 25 Jan 2021 22:00:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732196AbhAYUzn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 25 Jan 2021 15:55:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732134AbhAYTsf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jan 2021 14:48:35 -0500
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69384C06174A
        for <linux-doc@vger.kernel.org>; Mon, 25 Jan 2021 11:47:54 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id k193so13705016qke.6
        for <linux-doc@vger.kernel.org>; Mon, 25 Jan 2021 11:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CMoxsSdJeiKGLfWOk88GY5/NPQjHlx6ONHSuZw3X3Sw=;
        b=aCyk/qZeUY3TjhOjcrFr6KTfTio16UerfHW//cyQsd6jrP0nY/0P4spHYerV54jdLN
         jjTFZYlQx6zKl9g++n77zFdWchLEg2TIrFdq1XCh0QdRBMYrqsMP5XeISahHj+WGS53q
         eYd5CLqapEWai92rlAk6KJId2eN3Lan433b75VoHI8pAK3SOZrDG7JaHPZWiGHCk1IkB
         gSgKcG1TMy4aaeE/IWWIjVWFzPzwkZKB23ZZkY0OUr8HxAak5MAk90bCFvHPzyV9lCB/
         hwku4vIuU8q7eLAyU9a2rIOia7bq/IsYjua+cAUcjPrWI/fTz5iUG8Ohn2xKxDgLWp/9
         qb4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CMoxsSdJeiKGLfWOk88GY5/NPQjHlx6ONHSuZw3X3Sw=;
        b=irDGQT2cyJOZ0eGxzjrLH+yTrZ4RR34mmTXgR/nd6MsCC8MkHz6pA4B7BygtTTQNJI
         8YZ15B150vlcpStuisSgBw1wFz4Clpe9mnJFLJWj77R257U5p1HaXHwxnqf5mZY5TMcS
         jhF2dqGrcFDAtya+mXukbNpuc3aa7r7xM3O/wc4Y/D9utRoulz1+KQhmowUQGjUHHmNh
         D+pcjdMKDr8q+LLrAIDPM3T4uC3/3sg0l3T/CmrfToD88PbABTkhpZyLajF1v72yduqi
         VtVcINLn4CfM2rmzV/vM0iorkuBppuqi+i2ryElsADeig59gejnoRqnt5gaUSkaRxL1h
         7JxQ==
X-Gm-Message-State: AOAM530l5nHYve3m5WBLBUr9nUj0edTu0oXLVHjiFGpG5rFx2JBAG536
        26GIiQT4mHZK/UXzJyJod60o1g==
X-Google-Smtp-Source: ABdhPJxzvfxTOHGDwvh/84iFt5c+Bn+Nj003aub6jxAznhEWqZBh/DUxPlFQCiwHAf31ElF0qX9L8w==
X-Received: by 2002:a05:620a:13ae:: with SMTP id m14mr2316208qki.35.1611604073626;
        Mon, 25 Jan 2021 11:47:53 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id c12sm12121569qtq.76.2021.01.25.11.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 11:47:53 -0800 (PST)
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
        linux-kselftest@vger.kernel.org, jmorris@namei.org
Subject: [PATCH v8 00/14] prohibit pinning pages in ZONE_MOVABLE
Date:   Mon, 25 Jan 2021 14:47:37 -0500
Message-Id: <20210125194751.1275316-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changelog
---------
v8
- Added reviewed by's from John Hubbard
- Fixed subjects for selftests patches
- Moved zero page check inside is_pinnable_page() as requested by Jason
  Gunthorpe.

v7
- Added reviewed-by's
- Fixed a compile bug on non-mmu builds reported by robot

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
v6
https://lore.kernel.org/lkml/20210120014333.222547-1-pasha.tatashin@soleen.com
v7
https://lore.kernel.org/lkml/20210122033748.924330-1-pasha.tatashin@soleen.com

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
  mm/gup: longterm pin migration cleanup
  selftests/vm: gup_test: fix test flag
  selftests/vm: gup_test: test faulting in kernel, and verify pinnable
    pages

 .../admin-guide/mm/memory-hotplug.rst         |   9 +
 include/linux/migrate.h                       |   1 +
 include/linux/mm.h                            |  12 ++
 include/linux/mmzone.h                        |  13 +-
 include/linux/pgtable.h                       |   3 +-
 include/linux/sched.h                         |   2 +-
 include/linux/sched/mm.h                      |  27 +--
 include/trace/events/migrate.h                |   3 +-
 mm/gup.c                                      | 174 ++++++++----------
 mm/gup_test.c                                 |  29 +--
 mm/gup_test.h                                 |   3 +-
 mm/hugetlb.c                                  |   4 +-
 mm/page_alloc.c                               |  33 ++--
 tools/testing/selftests/vm/gup_test.c         |  36 +++-
 14 files changed, 190 insertions(+), 159 deletions(-)

-- 
2.25.1

