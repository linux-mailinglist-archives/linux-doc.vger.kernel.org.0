Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8F204D26B8
	for <lists+linux-doc@lfdr.de>; Wed,  9 Mar 2022 05:06:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231409AbiCICO4 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 8 Mar 2022 21:14:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231420AbiCICOt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Mar 2022 21:14:49 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6AF21EC51
        for <linux-doc@vger.kernel.org>; Tue,  8 Mar 2022 18:13:43 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id q76-20020a25d94f000000b00628bdf8d1a9so642055ybg.17
        for <linux-doc@vger.kernel.org>; Tue, 08 Mar 2022 18:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc:content-transfer-encoding;
        bh=b2AbKuYXVq67nI5c0Cl2Ckh2lNHZ7s2FZkIwZ7/dMvs=;
        b=qaP1m8BPQ3RX5Gtv9OIdr80WN8YW190GQnXQBlWot5Vgia4xrxhAr6Oxy9l5NyEG82
         oW5YSBgFOILpUW76aTwND/Q70XQVl8keCfqN3/x39Fz4ni1tpasI0cLmpLj58BAS6kH/
         vgWIu6ln9BHQ2omM0wsX1svPUX7L1fnlvY0EKqbCY7Djj/Y6JkXRbHoyn7JDJ/Ej9x+M
         GoiXR5Xv38iTSiF1mAxmw55SYmPlr0dDd0Ex589ljLleZHcN+Ht/Mi1LQAvceE1B+pNk
         bm8xLST/fS5BxLwF4Wslsy/9mtutWzvyhMG6/ReoEF94SvHQz0nadqWIRyWUp2ua61uN
         YB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc:content-transfer-encoding;
        bh=b2AbKuYXVq67nI5c0Cl2Ckh2lNHZ7s2FZkIwZ7/dMvs=;
        b=79cll2Spx+qCaC7Z+3vb9y6KifIMLSFnAYyOIjsynxEHNEMQhOCrH16U49F9QnI9hJ
         J7WYadHdgguuh069rm5GAjJbo82YCi1CNU9Vl0PL9Q2/8c6W6jnXsqWhjfQBLx2z5xSB
         2yZ8w3F5a6RP+n5nCBlrINeJwywVcm8romwNfEoz0lzs7RHpG9GOWsHCBWRCRoi3lZAb
         vn2dj3lXV2K/jB0WzN6ttPVeCmFGjiQGUK+HxyPNHB6erQvg9YdeMfbovVXwib8LPgAp
         y4Rj265kjOSTxaKfHGWwMxihelMrX+/oWV6AQKCZianDh5OPxEHDLcQqLVqBh1RdJWlu
         U+yQ==
X-Gm-Message-State: AOAM532jQG7VNH+PHR/lJ8QM2kZvSB3Gq/zY8g1otQreksw6Qj/nQy/i
        gWMZJPTQ4GJ2oN2IQxLYzU539iBaRyc=
X-Google-Smtp-Source: ABdhPJzgkyIHxGvJgXdxwubeiLDAgq4aJJiWG+7+iJKI6Lsz1e+FtgSHC/4gxeTkGgnA7SGOncid1jXAngQ=
X-Received: from yuzhao.bld.corp.google.com ([2620:15c:183:200:57a6:54a6:aad1:c0a8])
 (user=yuzhao job=sendgmr) by 2002:a81:718b:0:b0:2d6:16d6:8e54 with SMTP id
 m133-20020a81718b000000b002d616d68e54mr15832138ywc.377.1646792022719; Tue, 08
 Mar 2022 18:13:42 -0800 (PST)
Date:   Tue,  8 Mar 2022 19:12:30 -0700
In-Reply-To: <20220309021230.721028-1-yuzhao@google.com>
Message-Id: <20220309021230.721028-14-yuzhao@google.com>
Mime-Version: 1.0
References: <20220309021230.721028-1-yuzhao@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v9 13/14] mm: multi-gen LRU: admin guide
From:   Yu Zhao <yuzhao@google.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        page-reclaim@google.com, x86@kernel.org,
        Yu Zhao <yuzhao@google.com>, Brian Geffon <bgeffon@google.com>,
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

Add an admin guide.

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
 Documentation/admin-guide/mm/index.rst        |   1 +
 Documentation/admin-guide/mm/multigen_lru.rst | 146 ++++++++++++++++++
 mm/Kconfig                                    |   3 +-
 3 files changed, 149 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/admin-guide/mm/multigen_lru.rst

diff --git a/Documentation/admin-guide/mm/index.rst b/Documentation/admin-g=
uide/mm/index.rst
index c21b5823f126..2cf5bae62036 100644
--- a/Documentation/admin-guide/mm/index.rst
+++ b/Documentation/admin-guide/mm/index.rst
@@ -32,6 +32,7 @@ the Linux memory management.
    idle_page_tracking
    ksm
    memory-hotplug
+   multigen_lru
    nommu-mmap
    numa_memory_policy
    numaperf
diff --git a/Documentation/admin-guide/mm/multigen_lru.rst b/Documentation/=
admin-guide/mm/multigen_lru.rst
new file mode 100644
index 000000000000..4ea6a801dc56
--- /dev/null
+++ b/Documentation/admin-guide/mm/multigen_lru.rst
@@ -0,0 +1,146 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Multi-Gen LRU
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Quick start
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Build the kernel with the following configurations.
+
+* ``CONFIG_LRU_GEN=3Dy``
+* ``CONFIG_LRU_GEN_ENABLED=3Dy``
+
+All set!
+
+Runtime options
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+``/sys/kernel/mm/lru_gen/`` contains stable ABIs described in the
+following subsections.
+
+Kill switch
+-----------
+``enable`` accepts different values to enable or disabled the
+following components. The default value of this file depends on
+``CONFIG_LRU_GEN_ENABLED``. All the components should be enabled
+unless some of them have unforeseen side effects. Writing to
+``enable`` has no effect when a component is not supported by the
+hardware, and valid values will be accepted even when the main switch
+is off.
+
+=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Values Components
+=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+0x0001 The main switch for the multi-gen LRU.
+0x0002 Clearing the accessed bit in leaf page table entries in large
+       batches, when MMU sets it (e.g., on x86). This behavior can
+       theoretically worsen lock contention (mmap_lock). If it is
+       disabled, the multi-gen LRU will suffer a minor performance
+       degradation.
+0x0004 Clearing the accessed bit in non-leaf page table entries as
+       well, when MMU sets it (e.g., on x86). This behavior was not
+       verified on x86 varieties other than Intel and AMD. If it is
+       disabled, the multi-gen LRU will suffer a negligible
+       performance degradation.
+[yYnN] Apply to all the components above.
+=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+E.g.,
+::
+
+    echo y >/sys/kernel/mm/lru_gen/enabled
+    cat /sys/kernel/mm/lru_gen/enabled
+    0x0007
+    echo 5 >/sys/kernel/mm/lru_gen/enabled
+    cat /sys/kernel/mm/lru_gen/enabled
+    0x0005
+
+Thrashing prevention
+--------------------
+Personal computers are more sensitive to thrashing because it can
+cause janks (lags when rendering UI) and negatively impact user
+experience. The multi-gen LRU offers thrashing prevention to the
+majority of laptop and desktop users who do not have ``oomd``.
+
+Users can write ``N`` to ``min_ttl_ms`` to prevent the working set of
+``N`` milliseconds from getting evicted. The OOM killer is triggered
+if this working set cannot be kept in memory. In other words, this
+option works as an adjustable pressure relief valve, and when open, it
+terminates applications that are hopefully not being used.
+
+Based on the average human detectable lag (~100ms), ``N=3D1000`` usually
+eliminates intolerable janks due to thrashing. Larger values like
+``N=3D3000`` make janks less noticeable at the risk of premature OOM
+kills.
+
+Experimental features
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+``/sys/kernel/debug/lru_gen`` accepts commands described in the
+following subsections. Multiple command lines are supported, so does
+concatenation with delimiters ``,`` and ``;``.
+
+``/sys/kernel/debug/lru_gen_full`` provides additional stats for
+debugging. ``CONFIG_LRU_GEN_STATS=3Dy`` keeps historical stats from
+evicted generations in this file.
+
+Working set estimation
+----------------------
+Working set estimation measures how much memory an application
+requires in a given time interval, and it is usually done with little
+impact on the performance of the application. E.g., data centers want
+to optimize job scheduling (bin packing) to improve memory
+utilizations. When a new job comes in, the job scheduler needs to find
+out whether each server it manages can allocate a certain amount of
+memory for this new job before it can pick a candidate. To do so, this
+job scheduler needs to estimate the working sets of the existing jobs.
+
+When it is read, ``lru_gen`` returns a histogram of numbers of pages
+accessed over different time intervals for each memcg and node.
+``MAX_NR_GENS`` decides the number of bins for each histogram.
+::
+
+    memcg  memcg_id  memcg_path
+       node  node_id
+           min_gen_nr  age_in_ms  nr_anon_pages  nr_file_pages
+           ...
+           max_gen_nr  age_in_ms  nr_anon_pages  nr_file_pages
+
+Each generation contains an estimated number of pages that have been
+accessed within ``age_in_ms`` non-cumulatively. E.g., ``min_gen_nr``
+contains the coldest pages and ``max_gen_nr`` contains the hottest
+pages, since ``age_in_ms`` of the former is the largest and that of
+the latter is the smallest.
+
+Users can write ``+ memcg_id node_id max_gen_nr
+[can_swap[full_scan]]`` to ``lru_gen`` to create a new generation
+``max_gen_nr+1``. ``can_swap`` defaults to the swap setting and, if it
+is set to ``1``, it forces the scan of anon pages when swap is off.
+``full_scan`` defaults to ``1`` and, if it is set to ``0``, it reduces
+the overhead as well as the coverage when scanning page tables.
+
+A typical use case is that a job scheduler writes to ``lru_gen`` at a
+certain time interval to create new generations, and it ranks the
+servers it manages based on the sizes of their cold memory defined by
+this time interval.
+
+Proactive reclaim
+-----------------
+Proactive reclaim induces memory reclaim when there is no memory
+pressure and usually targets cold memory only. E.g., when a new job
+comes in, the job scheduler wants to proactively reclaim memory on the
+server it has selected to improve the chance of successfully landing
+this new job.
+
+Users can write ``- memcg_id node_id min_gen_nr [swappiness
+[nr_to_reclaim]]`` to ``lru_gen`` to evict generations less than or
+equal to ``min_gen_nr``. Note that ``min_gen_nr`` should be less than
+``max_gen_nr-1`` as ``max_gen_nr`` and ``max_gen_nr-1`` are not fully
+aged and therefore cannot be evicted. ``swappiness`` overrides the
+default value in ``/proc/sys/vm/swappiness``. ``nr_to_reclaim`` limits
+the number of pages to evict.
+
+A typical use case is that a job scheduler writes to ``lru_gen``
+before it tries to land a new job on a server, and if it fails to
+materialize the cold memory without impacting the existing jobs on
+this server, it retries on the next server according to the ranking
+result obtained from the working set estimation step described
+earlier.
diff --git a/mm/Kconfig b/mm/Kconfig
index 050de1eae2d6..7fd84e0384dc 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -899,7 +899,8 @@ config LRU_GEN
 	# the following options can use up the spare bits in page flags
 	depends on !MAXSMP && (64BIT || !SPARSEMEM || SPARSEMEM_VMEMMAP)
 	help
-	  A high performance LRU implementation for memory overcommit.
+	  A high performance LRU implementation for memory overcommit. See
+	  Documentation/admin-guide/mm/multigen_lru.rst for details.
=20
 config LRU_GEN_ENABLED
 	bool "Enable by default"
--=20
2.35.1.616.g0bdcbb4464-goog

