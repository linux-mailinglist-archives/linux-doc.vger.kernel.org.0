Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72F34592A40
	for <lists+linux-doc@lfdr.de>; Mon, 15 Aug 2022 09:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232982AbiHOHPv (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 15 Aug 2022 03:15:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233289AbiHOHPI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Aug 2022 03:15:08 -0400
Received: from mail-il1-x14a.google.com (mail-il1-x14a.google.com [IPv6:2607:f8b0:4864:20::14a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D0971D314
        for <linux-doc@vger.kernel.org>; Mon, 15 Aug 2022 00:14:35 -0700 (PDT)
Received: by mail-il1-x14a.google.com with SMTP id k15-20020a92c24f000000b002e2f53254d2so4543691ilo.15
        for <linux-doc@vger.kernel.org>; Mon, 15 Aug 2022 00:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:from:to:cc;
        bh=BAVTVhb7gZgl1iJYc7ztfS+MVBtiYqa44fDrm6wk918=;
        b=E/KUjz9qYl5rnMdSSLuhyWa6ezzUzs5F747sC2n3ZLk4NZ1K4I+2aqX8tyiv6Y2O34
         niUFKfAw3PWXxuhjO6t4PtT8rhIc0c4LX6k+zTfHtLRplp/gVH7J9aZHIFkHQScdZYJD
         9i1WEeqO5cHoWdL6vv0kHzonp3t9GjsDDoOBZoK53o9m6gvHprVfq9CjGSPyj95kq/Fa
         8QSVAhDBMeMgn8if1R9Gjjcr4+4DCvgXuJaUoaoPR6OZfH6+wISYzRwhpryA0dy+7Yj8
         mm5s6dORoIWXYBYsvf81TqsfRU0l388ncxBkC85oBu12oVxHx3dYMd08CHvJKOSh53uT
         1EbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:x-gm-message-state:from:to
         :cc;
        bh=BAVTVhb7gZgl1iJYc7ztfS+MVBtiYqa44fDrm6wk918=;
        b=Pk6bRN/2O/XmxPPe+puMVrE1pZtLNPkmkBGHgp/hxKlqCyrXud8eMnZZrzsviwkxQU
         lOEsTAA2PMjx3uP3ceVOcjY4dprvzVVkWpIcJbxJUybDjnOQ3HkXipzxFzm7YzU7BR/3
         sZSqqF+24hxx9tmRCkBo6rlD4WtFa7qyyEsLKq83q3NXRT+zhv5vb/EdjVJqksxdtR+h
         27wGYq+kzVlme7nJpkX1VVQWZMbB549sKI/iYRJFar0y9SHKRIGjYupgnVrceMANSvI+
         5LUOgTPCOynYvyA8/hbkCNoZqKJjJtYrWMdeGJKTXzoMYNi+AutPihB+Mb27Tg8aMZ9g
         Fszw==
X-Gm-Message-State: ACgBeo25FHmf6xvxma/uTsIBrKwIQcUQW9H43blFuXh71GWZ8SkCmNQy
        uqR0mMapTkds7EQW1KTgz2Ox+RzhRUg=
X-Google-Smtp-Source: AA6agR45YmGv57iGGSwbRHn5bhHV9M7sMkBfSANjxbeOHlLP3SVMZ8GvTTIVy18fahMG/UrA1b5pCZAIRtg=
X-Received: from yuzhao.bld.corp.google.com ([2620:15c:183:200:d91:5887:ac93:ddf0])
 (user=yuzhao job=sendgmr) by 2002:a92:c544:0:b0:2e5:cfa1:286a with SMTP id
 a4-20020a92c544000000b002e5cfa1286amr848343ilj.296.1660547674147; Mon, 15 Aug
 2022 00:14:34 -0700 (PDT)
Date:   Mon, 15 Aug 2022 01:13:33 -0600
In-Reply-To: <20220815071332.627393-1-yuzhao@google.com>
Message-Id: <20220815071332.627393-15-yuzhao@google.com>
Mime-Version: 1.0
References: <20220815071332.627393-1-yuzhao@google.com>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
Subject: [PATCH v14 14/14] mm: multi-gen LRU: design doc
From:   Yu Zhao <yuzhao@google.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Tejun Heo <tj@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
        page-reclaim@google.com, Yu Zhao <yuzhao@google.com>,
        Brian Geffon <bgeffon@google.com>,
        Jan Alexander Steffens <heftig@archlinux.org>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Steven Barrett <steven@liquorix.net>,
        Suleiman Souhlal <suleiman@google.com>,
        Daniel Byrne <djbyrne@mtu.edu>,
        Donald Carr <d@chaos-reins.com>,
        "=?UTF-8?q?Holger=20Hoffst=C3=A4tte?=" 
        <holger@applied-asynchrony.com>,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>,
        Shuang Zhai <szhai2@cs.rochester.edu>,
        Sofia Trinh <sofia.trinh@edi.works>,
        Vaibhav Jain <vaibhav@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a design doc.

Signed-off-by: Yu Zhao <yuzhao@google.com>
Acked-by: Brian Geffon <bgeffon@google.com>
Acked-by: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
Acked-by: Oleksandr Natalenko <oleksandr@natalenko.name>
Acked-by: Steven Barrett <steven@liquorix.net>
Acked-by: Suleiman Souhlal <suleiman@google.com>
Tested-by: Daniel Byrne <djbyrne@mtu.edu>
Tested-by: Donald Carr <d@chaos-reins.com>
Tested-by: Holger Hoffst=C3=A4tte <holger@applied-asynchrony.com>
Tested-by: Konstantin Kharlamov <Hi-Angel@yandex.ru>
Tested-by: Shuang Zhai <szhai2@cs.rochester.edu>
Tested-by: Sofia Trinh <sofia.trinh@edi.works>
Tested-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 Documentation/mm/index.rst        |   1 +
 Documentation/mm/multigen_lru.rst | 159 ++++++++++++++++++++++++++++++
 2 files changed, 160 insertions(+)
 create mode 100644 Documentation/mm/multigen_lru.rst

diff --git a/Documentation/mm/index.rst b/Documentation/mm/index.rst
index 575ccd40e30c..4aa12b8be278 100644
--- a/Documentation/mm/index.rst
+++ b/Documentation/mm/index.rst
@@ -51,6 +51,7 @@ above structured documentation, or deleted if it has serv=
ed its purpose.
    ksm
    memory-model
    mmu_notifier
+   multigen_lru
    numa
    overcommit-accounting
    page_migration
diff --git a/Documentation/mm/multigen_lru.rst b/Documentation/mm/multigen_=
lru.rst
new file mode 100644
index 000000000000..d7062c6a8946
--- /dev/null
+++ b/Documentation/mm/multigen_lru.rst
@@ -0,0 +1,159 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Multi-Gen LRU
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+The multi-gen LRU is an alternative LRU implementation that optimizes
+page reclaim and improves performance under memory pressure. Page
+reclaim decides the kernel's caching policy and ability to overcommit
+memory. It directly impacts the kswapd CPU usage and RAM efficiency.
+
+Design overview
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Objectives
+----------
+The design objectives are:
+
+* Good representation of access recency
+* Try to profit from spatial locality
+* Fast paths to make obvious choices
+* Simple self-correcting heuristics
+
+The representation of access recency is at the core of all LRU
+implementations. In the multi-gen LRU, each generation represents a
+group of pages with similar access recency. Generations establish a
+(time-based) common frame of reference and therefore help make better
+choices, e.g., between different memcgs on a computer or different
+computers in a data center (for job scheduling).
+
+Exploiting spatial locality improves efficiency when gathering the
+accessed bit. A rmap walk targets a single page and does not try to
+profit from discovering a young PTE. A page table walk can sweep all
+the young PTEs in an address space, but the address space can be too
+sparse to make a profit. The key is to optimize both methods and use
+them in combination.
+
+Fast paths reduce code complexity and runtime overhead. Unmapped pages
+do not require TLB flushes; clean pages do not require writeback.
+These facts are only helpful when other conditions, e.g., access
+recency, are similar. With generations as a common frame of reference,
+additional factors stand out. But obvious choices might not be good
+choices; thus self-correction is necessary.
+
+The benefits of simple self-correcting heuristics are self-evident.
+Again, with generations as a common frame of reference, this becomes
+attainable. Specifically, pages in the same generation can be
+categorized based on additional factors, and a feedback loop can
+statistically compare the refault percentages across those categories
+and infer which of them are better choices.
+
+Assumptions
+-----------
+The protection of hot pages and the selection of cold pages are based
+on page access channels and patterns. There are two access channels:
+
+* Accesses through page tables
+* Accesses through file descriptors
+
+The protection of the former channel is by design stronger because:
+
+1. The uncertainty in determining the access patterns of the former
+   channel is higher due to the approximation of the accessed bit.
+2. The cost of evicting the former channel is higher due to the TLB
+   flushes required and the likelihood of encountering the dirty bit.
+3. The penalty of underprotecting the former channel is higher because
+   applications usually do not prepare themselves for major page
+   faults like they do for blocked I/O. E.g., GUI applications
+   commonly use dedicated I/O threads to avoid blocking rendering
+   threads.
+
+There are also two access patterns:
+
+* Accesses exhibiting temporal locality
+* Accesses not exhibiting temporal locality
+
+For the reasons listed above, the former channel is assumed to follow
+the former pattern unless ``VM_SEQ_READ`` or ``VM_RAND_READ`` is
+present, and the latter channel is assumed to follow the latter
+pattern unless outlying refaults have been observed.
+
+Workflow overview
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Evictable pages are divided into multiple generations for each
+``lruvec``. The youngest generation number is stored in
+``lrugen->max_seq`` for both anon and file types as they are aged on
+an equal footing. The oldest generation numbers are stored in
+``lrugen->min_seq[]`` separately for anon and file types as clean file
+pages can be evicted regardless of swap constraints. These three
+variables are monotonically increasing.
+
+Generation numbers are truncated into ``order_base_2(MAX_NR_GENS+1)``
+bits in order to fit into the gen counter in ``folio->flags``. Each
+truncated generation number is an index to ``lrugen->lists[]``. The
+sliding window technique is used to track at least ``MIN_NR_GENS`` and
+at most ``MAX_NR_GENS`` generations. The gen counter stores a value
+within ``[1, MAX_NR_GENS]`` while a page is on one of
+``lrugen->lists[]``; otherwise it stores zero.
+
+Each generation is divided into multiple tiers. A page accessed ``N``
+times through file descriptors is in tier ``order_base_2(N)``. Unlike
+generations, tiers do not have dedicated ``lrugen->lists[]``. In
+contrast to moving across generations, which requires the LRU lock,
+moving across tiers only involves atomic operations on
+``folio->flags`` and therefore has a negligible cost. A feedback loop
+modeled after the PID controller monitors refaults over all the tiers
+from anon and file types and decides which tiers from which types to
+evict or protect.
+
+There are two conceptually independent procedures: the aging and the
+eviction. They form a closed-loop system, i.e., the page reclaim.
+
+Aging
+-----
+The aging produces young generations. Given an ``lruvec``, it
+increments ``max_seq`` when ``max_seq-min_seq+1`` approaches
+``MIN_NR_GENS``. The aging promotes hot pages to the youngest
+generation when it finds them accessed through page tables; the
+demotion of cold pages happens consequently when it increments
+``max_seq``. The aging uses page table walks and rmap walks to find
+young PTEs. For the former, it iterates ``lruvec_memcg()->mm_list``
+and calls ``walk_page_range()`` with each ``mm_struct`` on this list
+to scan PTEs, and after each iteration, it increments ``max_seq``. For
+the latter, when the eviction walks the rmap and finds a young PTE,
+the aging scans the adjacent PTEs. For both, on finding a young PTE,
+the aging clears the accessed bit and updates the gen counter of the
+page mapped by this PTE to ``(max_seq%MAX_NR_GENS)+1``.
+
+Eviction
+--------
+The eviction consumes old generations. Given an ``lruvec``, it
+increments ``min_seq`` when ``lrugen->lists[]`` indexed by
+``min_seq%MAX_NR_GENS`` becomes empty. To select a type and a tier to
+evict from, it first compares ``min_seq[]`` to select the older type.
+If both types are equally old, it selects the one whose first tier has
+a lower refault percentage. The first tier contains single-use
+unmapped clean pages, which are the best bet. The eviction sorts a
+page according to its gen counter if the aging has found this page
+accessed through page tables and updated its gen counter. It also
+moves a page to the next generation, i.e., ``min_seq+1``, if this page
+was accessed multiple times through file descriptors and the feedback
+loop has detected outlying refaults from the tier this page is in. To
+this end, the feedback loop uses the first tier as the baseline, for
+the reason stated earlier.
+
+Summary
+-------
+The multi-gen LRU can be disassembled into the following parts:
+
+* Generations
+* Rmap walks
+* Page table walks
+* Bloom filters
+* PID controller
+
+The aging and the eviction form a producer-consumer model;
+specifically, the latter drives the former by the sliding window over
+generations. Within the aging, rmap walks drive page table walks by
+inserting hot densely populated page tables to the Bloom filters.
+Within the eviction, the PID controller uses refaults as the feedback
+to select types to evict and tiers to protect.
--=20
2.37.1.595.g718a3a8f04-goog

