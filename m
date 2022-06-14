Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F018454AA5D
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jun 2022 09:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353927AbiFNHSU (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 14 Jun 2022 03:18:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354033AbiFNHSK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Jun 2022 03:18:10 -0400
Received: from mail-oi1-x249.google.com (mail-oi1-x249.google.com [IPv6:2607:f8b0:4864:20::249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B22732EA1D
        for <linux-doc@vger.kernel.org>; Tue, 14 Jun 2022 00:17:47 -0700 (PDT)
Received: by mail-oi1-x249.google.com with SMTP id t10-20020aca5f0a000000b0032edae98904so4747721oib.22
        for <linux-doc@vger.kernel.org>; Tue, 14 Jun 2022 00:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc:content-transfer-encoding;
        bh=m/wwgMiItWfqLatypckgCmYKUvdG5LZ4zqOBxzlsPKw=;
        b=M18DQR/vookwbYyHNQAAb/5uGo6TjRlNWM2/xVe0BcNQ5QkcL28RzVeafslVaMYaxk
         w8WmSTNuq3iyYxd74SbmjLRy25oCzNeWWvjGv0UKJI6RUbQtHj6qRI0XkQp09zdGA0HG
         +xjgJQ/fy37htNGRzTinVYWf/l6rg3Hbufq+XkOaGLrQJT7sgPpdB7evrVxASgnIqSQW
         RlYsKSJb2ADh7676Gokx5fzSV7uq1cbWtH7wzxdUAJLmzNMy/76eYluFgPvHHyNb4wTt
         bcgHJYB09ObmzYIuY3u+2aCs7NH8nPrzAp6jnki/hPsuJDI/pLtm7560pNKel/Y5KfuN
         HShw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc:content-transfer-encoding;
        bh=m/wwgMiItWfqLatypckgCmYKUvdG5LZ4zqOBxzlsPKw=;
        b=tdD7h4uhbqbmXInJJ5CcHt8jQPye62naaLrpwTOBKylfVnTd0C0ZufPnTLohw9ubA+
         ZmWKyUja9uPD32/BdJutOUZ9iqcOMFbriwTh/4zpWHUpPHLkmC8zhG2PXhWhwXWhK4/P
         QzBg8nuEZ9ls2c3KwkjKoESzqAue8TBbxUINzt3MMHxiIc01taBUl9xy1fwa9k4P6dbc
         hMpdK2+V29v5hlB64HSCJj4WAT84wkmWLkdDLij1d0TmNkS8cIdWiKuRmp4mmqhUeXaZ
         fSoC84bD3kGbLswo6IAfeE4Q6dlw7bhUCsIzFtoNBoNso7mYrPEOpFcSglzNpOW+Vkc8
         OW3A==
X-Gm-Message-State: AJIora9E3P3ucpBXtSjTV/34ezI+nsBiFF37//4oaf7Y3nNxZzP67qki
        rWR8Ckr3hKBUz0vkd8SR3IO/R0QlKOg=
X-Google-Smtp-Source: AGRyM1vHTGwLMUz7pcUIf5zFxf66J12qOvNohzhDqK2eoIMFk87O+TwiO8JJ+W9dStwZ2m4NPydwxm7efMY=
X-Received: from yuzhao.bld.corp.google.com ([2620:15c:183:200:eaa7:1f3f:e74a:2a26])
 (user=yuzhao job=sendgmr) by 2002:a05:6870:c6a0:b0:f5:cf37:63a3 with SMTP id
 cv32-20020a056870c6a000b000f5cf3763a3mr1510005oab.288.1655191066941; Tue, 14
 Jun 2022 00:17:46 -0700 (PDT)
Date:   Tue, 14 Jun 2022 01:16:51 -0600
In-Reply-To: <20220614071650.206064-1-yuzhao@google.com>
Message-Id: <20220614071650.206064-15-yuzhao@google.com>
Mime-Version: 1.0
References: <20220614071650.206064-1-yuzhao@google.com>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH v12 14/14] mm: multi-gen LRU: design doc
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
        autolearn=unavailable autolearn_force=no version=3.4.6
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
 Documentation/vm/index.rst        |   1 +
 Documentation/vm/multigen_lru.rst | 159 ++++++++++++++++++++++++++++++
 2 files changed, 160 insertions(+)
 create mode 100644 Documentation/vm/multigen_lru.rst

diff --git a/Documentation/vm/index.rst b/Documentation/vm/index.rst
index 575ccd40e30c..4aa12b8be278 100644
--- a/Documentation/vm/index.rst
+++ b/Documentation/vm/index.rst
@@ -51,6 +51,7 @@ above structured documentation, or deleted if it has serv=
ed its purpose.
    ksm
    memory-model
    mmu_notifier
+   multigen_lru
    numa
    overcommit-accounting
    page_migration
diff --git a/Documentation/vm/multigen_lru.rst b/Documentation/vm/multigen_=
lru.rst
new file mode 100644
index 000000000000..d7062c6a8946
--- /dev/null
+++ b/Documentation/vm/multigen_lru.rst
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
2.36.1.476.g0c4daa206d-goog

