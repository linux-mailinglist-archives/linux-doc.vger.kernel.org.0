Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A35054AA6E
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jun 2022 09:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354165AbiFNHSN (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 14 Jun 2022 03:18:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353767AbiFNHSI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Jun 2022 03:18:08 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D03B27CD6
        for <linux-doc@vger.kernel.org>; Tue, 14 Jun 2022 00:17:38 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id z67-20020a254c46000000b0065cd3d2e67eso6919360yba.7
        for <linux-doc@vger.kernel.org>; Tue, 14 Jun 2022 00:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc:content-transfer-encoding;
        bh=B/NvT0OPgDIWT8hKi28/u5JC7pC5Jdn84r9TxTNzr44=;
        b=giSUEviifsvZuwfrp7tP1PwlMkX14Up79foKorgCyEtcB82JVraIr7WfnTwNhGcXog
         WIM1lkqsbKLhWc8YEiLR9x4H1FsXRBLsUs0jc5jtaCa8R10CZmiq/MKYvBfil6wBnBKg
         pqMFVK8BcR14KjQWsAj1i+nytcq4CHbrU7fLY3nTU718bVCeT17FuVdvAbQb1Fi2oHe1
         5XtKOE9cg2ADmWW+GmNI/98dzgq62XppVLEV12Gk3gUOfl9VGy97982fEVTJAdgTO58T
         jyiLZQxjOwVvLCP2CmYbWYzpxTLYeqWU2jYW5vbMplIExq6kPRcXNUSgENyrg/JMXzjh
         nPyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc:content-transfer-encoding;
        bh=B/NvT0OPgDIWT8hKi28/u5JC7pC5Jdn84r9TxTNzr44=;
        b=ggoYW67JkCbQe2Ku4nfLX07EgfiRSqB7T3qlwJAJDR2Zkrm1hb+UG3k7wTrn2pnEl0
         APtNUVke9cBCx6yhj09eTMjWAQekSgQpStGLkvblF44BmVrfAGFF5xndaddEhLRMmeyV
         woELFu1BRPyVDmwjIQ1ZU8htpB0Hd9Fv/ZjIFsRI4fL7Ae1TeqtQVMkavLXUKnQolajc
         QXcd78FfUvregDWO16WnmPywmFrhh3LCCB+Naf2didcksZOPtjaUeSAiCgx5egD1I9ek
         M7Lv53dwMh6WTrzdJdxIljqOLUApDwb+S5sCuSY/nhKF2kfjjCErbru2227mfUlFWnt5
         qMtQ==
X-Gm-Message-State: AJIora95GLqUPOV9kM1SfrWLby/kI5IkGROjfUAR2MOEzeA8/Dnh5BGS
        horPiY3FQUNDxoMv4+lB2+XjBAbd50A=
X-Google-Smtp-Source: AGRyM1v52t5G4KT4qSINoR3PxvXwHcwq0zcDPzXoCrxtWZ6g7N5bWiowPRZelG9ovcJmI9LlcUJYaMZZ/7w=
X-Received: from yuzhao.bld.corp.google.com ([2620:15c:183:200:eaa7:1f3f:e74a:2a26])
 (user=yuzhao job=sendgmr) by 2002:a05:6902:1009:b0:665:197a:d168 with SMTP id
 w9-20020a056902100900b00665197ad168mr2694682ybt.550.1655191057869; Tue, 14
 Jun 2022 00:17:37 -0700 (PDT)
Date:   Tue, 14 Jun 2022 01:16:45 -0600
In-Reply-To: <20220614071650.206064-1-yuzhao@google.com>
Message-Id: <20220614071650.206064-9-yuzhao@google.com>
Mime-Version: 1.0
References: <20220614071650.206064-1-yuzhao@google.com>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH v12 08/14] mm: multi-gen LRU: support page table walks
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

To further exploit spatial locality, the aging prefers to walk page
tables to search for young PTEs and promote hot pages. A kill switch
will be added in the next patch to disable this behavior. When
disabled, the aging relies on the rmap only.

NB: this behavior has nothing similar with the page table scanning in
the 2.4 kernel [1], which searches page tables for old PTEs, adds cold
pages to swapcache and unmaps them.

To avoid confusion, the term "iteration" specifically means the
traversal of an entire mm_struct list; the term "walk" will be applied
to page tables and the rmap, as usual.

An mm_struct list is maintained for each memcg, and an mm_struct
follows its owner task to the new memcg when this task is migrated.
Given an lruvec, the aging iterates lruvec_memcg()->mm_list and calls
walk_page_range() with each mm_struct on this list to promote hot
pages before it increments max_seq.

When multiple page table walkers iterate the same list, each of them
gets a unique mm_struct; therefore they can run concurrently. Page
table walkers ignore any misplaced pages, e.g., if an mm_struct was
migrated, pages it left in the previous memcg will not be promoted
when its current memcg is under reclaim. Similarly, page table walkers
will not promote pages from nodes other than the one under reclaim.

This patch uses the following optimizations when walking page tables:
1. It tracks the usage of mm_struct's between context switches so that
   page table walkers can skip processes that have been sleeping since
   the last iteration.
2. It uses generational Bloom filters to record populated branches so
   that page table walkers can reduce their search space based on the
   query results, e.g., to skip page tables containing mostly holes or
   misplaced pages.
3. It takes advantage of the accessed bit in non-leaf PMD entries when
   CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG=3Dy.
4. It does not zigzag between a PGD table and the same PMD table
   spanning multiple VMAs. IOW, it finishes all the VMAs within the
   range of the same PMD table before it returns to a PGD table. This
   improves the cache performance for workloads that have large
   numbers of tiny VMAs [2], especially when CONFIG_PGTABLE_LEVELS=3D5.

Server benchmark results:
  Single workload:
    fio (buffered I/O): no change

  Single workload:
    memcached (anon): +[8, 10]%
                Ops/sec      KB/sec
      patch1-7: 1147696.57   44640.29
      patch1-8: 1245274.91   48435.66

  Configurations:
    no change

Client benchmark results:
  kswapd profiles:
    patch1-7
      48.16%  lzo1x_1_do_compress (real work)
       8.20%  page_vma_mapped_walk (overhead)
       7.06%  _raw_spin_unlock_irq
       2.92%  ptep_clear_flush
       2.53%  __zram_bvec_write
       2.11%  do_raw_spin_lock
       2.02%  memmove
       1.93%  lru_gen_look_around
       1.56%  free_unref_page_list
       1.40%  memset

    patch1-8
      49.44%  lzo1x_1_do_compress (real work)
       6.19%  page_vma_mapped_walk (overhead)
       5.97%  _raw_spin_unlock_irq
       3.13%  get_pfn_folio
       2.85%  ptep_clear_flush
       2.42%  __zram_bvec_write
       2.08%  do_raw_spin_lock
       1.92%  memmove
       1.44%  alloc_zspage
       1.36%  memset

  Configurations:
    no change

Thanks to the following developers for their efforts [3].
  kernel test robot <lkp@intel.com>

[1] https://lwn.net/Articles/23732/
[2] https://llvm.org/docs/ScudoHardenedAllocator.html
[3] https://lore.kernel.org/r/202204160827.ekEARWQo-lkp@intel.com/

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
 fs/exec.c                  |    2 +
 include/linux/memcontrol.h |    5 +
 include/linux/mm_types.h   |   77 +++
 include/linux/mmzone.h     |   56 +-
 include/linux/swap.h       |    4 +
 kernel/exit.c              |    1 +
 kernel/fork.c              |    9 +
 kernel/sched/core.c        |    1 +
 mm/memcontrol.c            |   25 +
 mm/vmscan.c                | 1000 +++++++++++++++++++++++++++++++++++-
 10 files changed, 1162 insertions(+), 18 deletions(-)

diff --git a/fs/exec.c b/fs/exec.c
index 0989fb8472a1..b1fda634e01a 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1015,6 +1015,7 @@ static int exec_mmap(struct mm_struct *mm)
 	active_mm =3D tsk->active_mm;
 	tsk->active_mm =3D mm;
 	tsk->mm =3D mm;
+	lru_gen_add_mm(mm);
 	/*
 	 * This prevents preemption while active_mm is being loaded and
 	 * it and mm are being updated, which could cause problems for
@@ -1030,6 +1031,7 @@ static int exec_mmap(struct mm_struct *mm)
 	tsk->mm->vmacache_seqnum =3D 0;
 	vmacache_flush(tsk);
 	task_unlock(tsk);
+	lru_gen_use_mm(mm);
 	if (old_mm) {
 		mmap_read_unlock(old_mm);
 		BUG_ON(active_mm !=3D old_mm);
diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 9d0fea17f9ef..eca62345fdd5 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -350,6 +350,11 @@ struct mem_cgroup {
 	struct deferred_split deferred_split_queue;
 #endif
=20
+#ifdef CONFIG_LRU_GEN
+	/* per-memcg mm_struct list */
+	struct lru_gen_mm_list mm_list;
+#endif
+
 	struct mem_cgroup_per_node *nodeinfo[];
 };
=20
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index c29ab4c0cd5c..7db51151a28b 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -3,6 +3,7 @@
 #define _LINUX_MM_TYPES_H
=20
 #include <linux/mm_types_task.h>
+#include <linux/sched.h>
=20
 #include <linux/auxvec.h>
 #include <linux/kref.h>
@@ -17,6 +18,7 @@
 #include <linux/page-flags-layout.h>
 #include <linux/workqueue.h>
 #include <linux/seqlock.h>
+#include <linux/mmdebug.h>
=20
 #include <asm/mmu.h>
=20
@@ -667,6 +669,22 @@ struct mm_struct {
 		 */
 		unsigned long ksm_merging_pages;
 #endif
+#ifdef CONFIG_LRU_GEN
+		struct {
+			/* this mm_struct is on lru_gen_mm_list */
+			struct list_head list;
+			/*
+			 * Set when switching to this mm_struct, as a hint of
+			 * whether it has been used since the last time per-node
+			 * page table walkers cleared the corresponding bits.
+			 */
+			unsigned long bitmap;
+#ifdef CONFIG_MEMCG
+			/* points to the memcg of "owner" above */
+			struct mem_cgroup *memcg;
+#endif
+		} lru_gen;
+#endif /* CONFIG_LRU_GEN */
 	} __randomize_layout;
=20
 	/*
@@ -693,6 +711,65 @@ static inline cpumask_t *mm_cpumask(struct mm_struct *=
mm)
 	return (struct cpumask *)&mm->cpu_bitmap;
 }
=20
+#ifdef CONFIG_LRU_GEN
+
+struct lru_gen_mm_list {
+	/* mm_struct list for page table walkers */
+	struct list_head fifo;
+	/* protects the list above */
+	spinlock_t lock;
+};
+
+void lru_gen_add_mm(struct mm_struct *mm);
+void lru_gen_del_mm(struct mm_struct *mm);
+#ifdef CONFIG_MEMCG
+void lru_gen_migrate_mm(struct mm_struct *mm);
+#endif
+
+static inline void lru_gen_init_mm(struct mm_struct *mm)
+{
+	INIT_LIST_HEAD(&mm->lru_gen.list);
+	mm->lru_gen.bitmap =3D 0;
+#ifdef CONFIG_MEMCG
+	mm->lru_gen.memcg =3D NULL;
+#endif
+}
+
+static inline void lru_gen_use_mm(struct mm_struct *mm)
+{
+	/* unlikely but not a bug when racing with lru_gen_migrate_mm() */
+	VM_WARN_ON_ONCE(list_empty(&mm->lru_gen.list));
+
+	if (!(current->flags & PF_KTHREAD))
+		WRITE_ONCE(mm->lru_gen.bitmap, -1);
+}
+
+#else /* !CONFIG_LRU_GEN */
+
+static inline void lru_gen_add_mm(struct mm_struct *mm)
+{
+}
+
+static inline void lru_gen_del_mm(struct mm_struct *mm)
+{
+}
+
+#ifdef CONFIG_MEMCG
+static inline void lru_gen_migrate_mm(struct mm_struct *mm)
+{
+}
+#endif
+
+static inline void lru_gen_init_mm(struct mm_struct *mm)
+{
+}
+
+static inline void lru_gen_use_mm(struct mm_struct *mm)
+{
+}
+
+#endif /* CONFIG_LRU_GEN */
+
 struct mmu_gather;
 extern void tlb_gather_mmu(struct mmu_gather *tlb, struct mm_struct *mm);
 extern void tlb_gather_mmu_fullmm(struct mmu_gather *tlb, struct mm_struct=
 *mm);
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 4fd7fc16eeb4..0cf0856b484a 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -405,7 +405,7 @@ enum {
  * min_seq behind.
  *
  * The number of pages in each generation is eventually consistent and the=
refore
- * can be transiently negative.
+ * can be transiently negative when reset_batch_size() is pending.
  */
 struct lru_gen_struct {
 	/* the aging increments the youngest generation number */
@@ -427,6 +427,53 @@ struct lru_gen_struct {
 	atomic_long_t refaulted[NR_HIST_GENS][ANON_AND_FILE][MAX_NR_TIERS];
 };
=20
+enum {
+	MM_LEAF_TOTAL,		/* total leaf entries */
+	MM_LEAF_OLD,		/* old leaf entries */
+	MM_LEAF_YOUNG,		/* young leaf entries */
+	MM_NONLEAF_TOTAL,	/* total non-leaf entries */
+	MM_NONLEAF_FOUND,	/* non-leaf entries found in Bloom filters */
+	MM_NONLEAF_ADDED,	/* non-leaf entries added to Bloom filters */
+	NR_MM_STATS
+};
+
+/* double-buffering Bloom filters */
+#define NR_BLOOM_FILTERS	2
+
+struct lru_gen_mm_state {
+	/* set to max_seq after each iteration */
+	unsigned long seq;
+	/* where the current iteration continues (inclusive) */
+	struct list_head *head;
+	/* where the last iteration ended (exclusive) */
+	struct list_head *tail;
+	/* to wait for the last page table walker to finish */
+	struct wait_queue_head wait;
+	/* Bloom filters flip after each iteration */
+	unsigned long *filters[NR_BLOOM_FILTERS];
+	/* the mm stats for debugging */
+	unsigned long stats[NR_HIST_GENS][NR_MM_STATS];
+	/* the number of concurrent page table walkers */
+	int nr_walkers;
+};
+
+struct lru_gen_mm_walk {
+	/* the lruvec under reclaim */
+	struct lruvec *lruvec;
+	/* unstable max_seq from lru_gen_struct */
+	unsigned long max_seq;
+	/* the next address within an mm to scan */
+	unsigned long next_addr;
+	/* to batch promoted pages */
+	int nr_pages[MAX_NR_GENS][ANON_AND_FILE][MAX_NR_ZONES];
+	/* to batch the mm stats */
+	int mm_stats[NR_MM_STATS];
+	/* total batched items */
+	int batched;
+	bool can_swap;
+	bool force_scan;
+};
+
 void lru_gen_init_lruvec(struct lruvec *lruvec);
 void lru_gen_look_around(struct page_vma_mapped_walk *pvmw);
=20
@@ -477,6 +524,8 @@ struct lruvec {
 #ifdef CONFIG_LRU_GEN
 	/* evictable pages divided into generations */
 	struct lru_gen_struct		lrugen;
+	/* to concurrently iterate lru_gen_mm_list */
+	struct lru_gen_mm_state		mm_state;
 #endif
 #ifdef CONFIG_MEMCG
 	struct pglist_data *pgdat;
@@ -1070,6 +1119,11 @@ typedef struct pglist_data {
=20
 	unsigned long		flags;
=20
+#ifdef CONFIG_LRU_GEN
+	/* kswap mm walk data */
+	struct lru_gen_mm_walk	mm_walk;
+#endif
+
 	ZONE_PADDING(_pad2_)
=20
 	/* Per-node vmstats */
diff --git a/include/linux/swap.h b/include/linux/swap.h
index 0c0fed1b348f..b66cbc7ea93c 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -162,6 +162,10 @@ union swap_header {
  */
 struct reclaim_state {
 	unsigned long reclaimed_slab;
+#ifdef CONFIG_LRU_GEN
+	/* per-thread mm walk data */
+	struct lru_gen_mm_walk *mm_walk;
+#endif
 };
=20
 #ifdef __KERNEL__
diff --git a/kernel/exit.c b/kernel/exit.c
index f072959fcab7..f2d4d48ea790 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -466,6 +466,7 @@ void mm_update_next_owner(struct mm_struct *mm)
 		goto retry;
 	}
 	WRITE_ONCE(mm->owner, c);
+	lru_gen_migrate_mm(mm);
 	task_unlock(c);
 	put_task_struct(c);
 }
diff --git a/kernel/fork.c b/kernel/fork.c
index 9d44f2d46c69..67b7666d7321 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1152,6 +1152,7 @@ static struct mm_struct *mm_init(struct mm_struct *mm=
, struct task_struct *p,
 		goto fail_nocontext;
=20
 	mm->user_ns =3D get_user_ns(user_ns);
+	lru_gen_init_mm(mm);
 	return mm;
=20
 fail_nocontext:
@@ -1194,6 +1195,7 @@ static inline void __mmput(struct mm_struct *mm)
 	}
 	if (mm->binfmt)
 		module_put(mm->binfmt->module);
+	lru_gen_del_mm(mm);
 	mmdrop(mm);
 }
=20
@@ -2676,6 +2678,13 @@ pid_t kernel_clone(struct kernel_clone_args *args)
 		get_task_struct(p);
 	}
=20
+	if (IS_ENABLED(CONFIG_LRU_GEN) && !(clone_flags & CLONE_VM)) {
+		/* lock the task to synchronize with memcg migration */
+		task_lock(p);
+		lru_gen_add_mm(p->mm);
+		task_unlock(p);
+	}
+
 	wake_up_new_task(p);
=20
 	/* forking complete and child started to run, tell ptracer */
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index bfa7452ca92e..92022c5d92c6 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5100,6 +5100,7 @@ context_switch(struct rq *rq, struct task_struct *pre=
v,
 		 * finish_task_switch()'s mmdrop().
 		 */
 		switch_mm_irqs_off(prev->active_mm, next->mm, next);
+		lru_gen_use_mm(next->mm);
=20
 		if (!prev->mm) {                        // from kernel
 			/* will mmdrop() in finish_task_switch(). */
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index dece7722ed85..c13610b25f52 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -6133,6 +6133,30 @@ static void mem_cgroup_move_task(void)
 }
 #endif
=20
+#ifdef CONFIG_LRU_GEN
+static void mem_cgroup_attach(struct cgroup_taskset *tset)
+{
+	struct task_struct *task;
+	struct cgroup_subsys_state *css;
+
+	/* find the first leader if there is any */
+	cgroup_taskset_for_each_leader(task, css, tset)
+		break;
+
+	if (!task)
+		return;
+
+	task_lock(task);
+	if (task->mm && task->mm->owner =3D=3D task)
+		lru_gen_migrate_mm(task->mm);
+	task_unlock(task);
+}
+#else
+static void mem_cgroup_attach(struct cgroup_taskset *tset)
+{
+}
+#endif /* CONFIG_LRU_GEN */
+
 static int seq_puts_memcg_tunable(struct seq_file *m, unsigned long value)
 {
 	if (value =3D=3D PAGE_COUNTER_MAX)
@@ -6536,6 +6560,7 @@ struct cgroup_subsys memory_cgrp_subsys =3D {
 	.css_reset =3D mem_cgroup_css_reset,
 	.css_rstat_flush =3D mem_cgroup_css_rstat_flush,
 	.can_attach =3D mem_cgroup_can_attach,
+	.attach =3D mem_cgroup_attach,
 	.cancel_attach =3D mem_cgroup_cancel_attach,
 	.post_attach =3D mem_cgroup_move_task,
 	.dfl_cftypes =3D memory_files,
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 95f14878da76..b086105d485d 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -50,6 +50,8 @@
 #include <linux/printk.h>
 #include <linux/dax.h>
 #include <linux/psi.h>
+#include <linux/pagewalk.h>
+#include <linux/shmem_fs.h>
=20
 #include <asm/tlbflush.h>
 #include <asm/div64.h>
@@ -3024,7 +3026,7 @@ static bool can_age_anon_pages(struct pglist_data *pg=
dat,
 		for ((type) =3D 0; (type) < ANON_AND_FILE; (type)++)	\
 			for ((zone) =3D 0; (zone) < MAX_NR_ZONES; (zone)++)
=20
-static struct lruvec __maybe_unused *get_lruvec(struct mem_cgroup *memcg, =
int nid)
+static struct lruvec *get_lruvec(struct mem_cgroup *memcg, int nid)
 {
 	struct pglist_data *pgdat =3D NODE_DATA(nid);
=20
@@ -3069,6 +3071,372 @@ static bool __maybe_unused seq_is_valid(struct lruv=
ec *lruvec)
 	       get_nr_gens(lruvec, LRU_GEN_ANON) <=3D MAX_NR_GENS;
 }
=20
+/*************************************************************************=
*****
+ *                          mm_struct list
+ *************************************************************************=
*****/
+
+static struct lru_gen_mm_list *get_mm_list(struct mem_cgroup *memcg)
+{
+	static struct lru_gen_mm_list mm_list =3D {
+		.fifo =3D LIST_HEAD_INIT(mm_list.fifo),
+		.lock =3D __SPIN_LOCK_UNLOCKED(mm_list.lock),
+	};
+
+#ifdef CONFIG_MEMCG
+	if (memcg)
+		return &memcg->mm_list;
+#endif
+	VM_WARN_ON_ONCE(!mem_cgroup_disabled());
+
+	return &mm_list;
+}
+
+void lru_gen_add_mm(struct mm_struct *mm)
+{
+	int nid;
+	struct mem_cgroup *memcg =3D get_mem_cgroup_from_mm(mm);
+	struct lru_gen_mm_list *mm_list =3D get_mm_list(memcg);
+
+	VM_WARN_ON_ONCE(!list_empty(&mm->lru_gen.list));
+#ifdef CONFIG_MEMCG
+	VM_WARN_ON_ONCE(mm->lru_gen.memcg);
+	mm->lru_gen.memcg =3D memcg;
+#endif
+	spin_lock(&mm_list->lock);
+
+	for_each_node_state(nid, N_MEMORY) {
+		struct lruvec *lruvec =3D get_lruvec(memcg, nid);
+
+		if (!lruvec)
+			continue;
+
+		/* the first addition since the last iteration */
+		if (lruvec->mm_state.tail =3D=3D &mm_list->fifo)
+			lruvec->mm_state.tail =3D &mm->lru_gen.list;
+	}
+
+	list_add_tail(&mm->lru_gen.list, &mm_list->fifo);
+
+	spin_unlock(&mm_list->lock);
+}
+
+void lru_gen_del_mm(struct mm_struct *mm)
+{
+	int nid;
+	struct lru_gen_mm_list *mm_list;
+	struct mem_cgroup *memcg =3D NULL;
+
+	if (list_empty(&mm->lru_gen.list))
+		return;
+
+#ifdef CONFIG_MEMCG
+	memcg =3D mm->lru_gen.memcg;
+#endif
+	mm_list =3D get_mm_list(memcg);
+
+	spin_lock(&mm_list->lock);
+
+	for_each_node(nid) {
+		struct lruvec *lruvec =3D get_lruvec(memcg, nid);
+
+		if (!lruvec)
+			continue;
+
+		/* where the last iteration ended (exclusive) */
+		if (lruvec->mm_state.tail =3D=3D &mm->lru_gen.list)
+			lruvec->mm_state.tail =3D lruvec->mm_state.tail->next;
+
+		/* where the current iteration continues (inclusive) */
+		if (lruvec->mm_state.head !=3D &mm->lru_gen.list)
+			continue;
+
+		lruvec->mm_state.head =3D lruvec->mm_state.head->next;
+		/* the deletion ends the current iteration */
+		if (lruvec->mm_state.head =3D=3D &mm_list->fifo)
+			WRITE_ONCE(lruvec->mm_state.seq, lruvec->mm_state.seq + 1);
+	}
+
+	list_del_init(&mm->lru_gen.list);
+
+	spin_unlock(&mm_list->lock);
+
+#ifdef CONFIG_MEMCG
+	mem_cgroup_put(mm->lru_gen.memcg);
+	mm->lru_gen.memcg =3D NULL;
+#endif
+}
+
+#ifdef CONFIG_MEMCG
+void lru_gen_migrate_mm(struct mm_struct *mm)
+{
+	struct mem_cgroup *memcg;
+
+	lockdep_assert_held(&mm->owner->alloc_lock);
+
+	/* for mm_update_next_owner() */
+	if (mem_cgroup_disabled())
+		return;
+
+	rcu_read_lock();
+	memcg =3D mem_cgroup_from_task(rcu_dereference(mm->owner));
+	rcu_read_unlock();
+	if (memcg =3D=3D mm->lru_gen.memcg)
+		return;
+
+	VM_WARN_ON_ONCE(!mm->lru_gen.memcg);
+	VM_WARN_ON_ONCE(list_empty(&mm->lru_gen.list));
+
+	lru_gen_del_mm(mm);
+	lru_gen_add_mm(mm);
+}
+#endif
+
+/*
+ * Bloom filters with m=3D1<<15, k=3D2 and the false positive rates of ~1/=
5 when
+ * n=3D10,000 and ~1/2 when n=3D20,000, where, conventionally, m is the nu=
mber of
+ * bits in a bitmap, k is the number of hash functions and n is the number=
 of
+ * inserted items.
+ *
+ * Page table walkers use one of the two filters to reduce their search sp=
ace.
+ * To get rid of non-leaf entries that no longer have enough leaf entries,=
 the
+ * aging uses the double-buffering technique to flip to the other filter e=
ach
+ * time it produces a new generation. For non-leaf entries that have enoug=
h
+ * leaf entries, the aging carries them over to the next generation in
+ * walk_pmd_range(); the eviction also report them when walking the rmap
+ * in lru_gen_look_around().
+ *
+ * For future optimizations:
+ * 1. It's not necessary to keep both filters all the time. The spare one =
can be
+ *    freed after the RCU grace period and reallocated if needed again.
+ * 2. And when reallocating, it's worth scaling its size according to the =
number
+ *    of inserted entries in the other filter, to reduce the memory overhe=
ad on
+ *    small systems and false positives on large systems.
+ * 3. Jenkins' hash function is an alternative to Knuth's.
+ */
+#define BLOOM_FILTER_SHIFT	15
+
+static inline int filter_gen_from_seq(unsigned long seq)
+{
+	return seq % NR_BLOOM_FILTERS;
+}
+
+static void get_item_key(void *item, int *key)
+{
+	u32 hash =3D hash_ptr(item, BLOOM_FILTER_SHIFT * 2);
+
+	BUILD_BUG_ON(BLOOM_FILTER_SHIFT * 2 > BITS_PER_TYPE(u32));
+
+	key[0] =3D hash & (BIT(BLOOM_FILTER_SHIFT) - 1);
+	key[1] =3D hash >> BLOOM_FILTER_SHIFT;
+}
+
+static void reset_bloom_filter(struct lruvec *lruvec, unsigned long seq)
+{
+	unsigned long *filter;
+	int gen =3D filter_gen_from_seq(seq);
+
+	filter =3D lruvec->mm_state.filters[gen];
+	if (filter) {
+		bitmap_clear(filter, 0, BIT(BLOOM_FILTER_SHIFT));
+		return;
+	}
+
+	filter =3D bitmap_zalloc(BIT(BLOOM_FILTER_SHIFT),
+			       __GFP_HIGH | __GFP_NOMEMALLOC | __GFP_NOWARN);
+	WRITE_ONCE(lruvec->mm_state.filters[gen], filter);
+}
+
+static void update_bloom_filter(struct lruvec *lruvec, unsigned long seq, =
void *item)
+{
+	int key[2];
+	unsigned long *filter;
+	int gen =3D filter_gen_from_seq(seq);
+
+	filter =3D READ_ONCE(lruvec->mm_state.filters[gen]);
+	if (!filter)
+		return;
+
+	get_item_key(item, key);
+
+	if (!test_bit(key[0], filter))
+		set_bit(key[0], filter);
+	if (!test_bit(key[1], filter))
+		set_bit(key[1], filter);
+}
+
+static bool test_bloom_filter(struct lruvec *lruvec, unsigned long seq, vo=
id *item)
+{
+	int key[2];
+	unsigned long *filter;
+	int gen =3D filter_gen_from_seq(seq);
+
+	filter =3D READ_ONCE(lruvec->mm_state.filters[gen]);
+	if (!filter)
+		return true;
+
+	get_item_key(item, key);
+
+	return test_bit(key[0], filter) && test_bit(key[1], filter);
+}
+
+static void reset_mm_stats(struct lruvec *lruvec, struct lru_gen_mm_walk *=
walk, bool last)
+{
+	int i;
+	int hist;
+
+	lockdep_assert_held(&get_mm_list(lruvec_memcg(lruvec))->lock);
+
+	if (walk) {
+		hist =3D lru_hist_from_seq(walk->max_seq);
+
+		for (i =3D 0; i < NR_MM_STATS; i++) {
+			WRITE_ONCE(lruvec->mm_state.stats[hist][i],
+				   lruvec->mm_state.stats[hist][i] + walk->mm_stats[i]);
+			walk->mm_stats[i] =3D 0;
+		}
+	}
+
+	if (NR_HIST_GENS > 1 && last) {
+		hist =3D lru_hist_from_seq(lruvec->mm_state.seq + 1);
+
+		for (i =3D 0; i < NR_MM_STATS; i++)
+			WRITE_ONCE(lruvec->mm_state.stats[hist][i], 0);
+	}
+}
+
+static bool should_skip_mm(struct mm_struct *mm, struct lru_gen_mm_walk *w=
alk)
+{
+	int type;
+	unsigned long size =3D 0;
+	struct pglist_data *pgdat =3D lruvec_pgdat(walk->lruvec);
+	int key =3D pgdat->node_id % BITS_PER_TYPE(mm->lru_gen.bitmap);
+
+	if (!walk->force_scan && !test_bit(key, &mm->lru_gen.bitmap))
+		return true;
+
+	clear_bit(key, &mm->lru_gen.bitmap);
+
+	for (type =3D !walk->can_swap; type < ANON_AND_FILE; type++) {
+		size +=3D type ? get_mm_counter(mm, MM_FILEPAGES) :
+			       get_mm_counter(mm, MM_ANONPAGES) +
+			       get_mm_counter(mm, MM_SHMEMPAGES);
+	}
+
+	if (size < MIN_LRU_BATCH)
+		return true;
+
+	if (test_bit(MMF_OOM_REAP_QUEUED, &mm->flags))
+		return true;
+
+	return !mmget_not_zero(mm);
+}
+
+static bool iterate_mm_list(struct lruvec *lruvec, struct lru_gen_mm_walk =
*walk,
+			    struct mm_struct **iter)
+{
+	bool first =3D false;
+	bool last =3D true;
+	struct mm_struct *mm =3D NULL;
+	struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
+	struct lru_gen_mm_list *mm_list =3D get_mm_list(memcg);
+	struct lru_gen_mm_state *mm_state =3D &lruvec->mm_state;
+
+	/*
+	 * There are four interesting cases for this page table walker:
+	 * 1. It tries to start a new iteration of mm_list with a stale max_seq;
+	 *    there is nothing left to do.
+	 * 2. It's the first of the current generation, and it needs to reset
+	 *    the Bloom filter for the next generation.
+	 * 3. It reaches the end of mm_list, and it needs to increment
+	 *    mm_state->seq; the iteration is done.
+	 * 4. It's the last of the current generation, and it needs to reset the
+	 *    mm stats counters for the next generation.
+	 */
+	spin_lock(&mm_list->lock);
+
+	VM_WARN_ON_ONCE(mm_state->seq + 1 < walk->max_seq);
+	VM_WARN_ON_ONCE(*iter && mm_state->seq > walk->max_seq);
+	VM_WARN_ON_ONCE(*iter && !mm_state->nr_walkers);
+
+	if (walk->max_seq <=3D mm_state->seq) {
+		if (!*iter)
+			last =3D false;
+		goto done;
+	}
+
+	if (!mm_state->nr_walkers) {
+		VM_WARN_ON_ONCE(mm_state->head && mm_state->head !=3D &mm_list->fifo);
+
+		mm_state->head =3D mm_list->fifo.next;
+		first =3D true;
+	}
+
+	while (!mm && mm_state->head !=3D &mm_list->fifo) {
+		mm =3D list_entry(mm_state->head, struct mm_struct, lru_gen.list);
+
+		mm_state->head =3D mm_state->head->next;
+
+		/* force scan for those added after the last iteration */
+		if (!mm_state->tail || mm_state->tail =3D=3D &mm->lru_gen.list) {
+			mm_state->tail =3D mm_state->head;
+			walk->force_scan =3D true;
+		}
+
+		if (should_skip_mm(mm, walk))
+			mm =3D NULL;
+	}
+
+	if (mm_state->head =3D=3D &mm_list->fifo)
+		WRITE_ONCE(mm_state->seq, mm_state->seq + 1);
+done:
+	if (*iter && !mm)
+		mm_state->nr_walkers--;
+	if (!*iter && mm)
+		mm_state->nr_walkers++;
+
+	if (mm_state->nr_walkers)
+		last =3D false;
+
+	if (*iter || last)
+		reset_mm_stats(lruvec, walk, last);
+
+	spin_unlock(&mm_list->lock);
+
+	if (mm && first)
+		reset_bloom_filter(lruvec, walk->max_seq + 1);
+
+	if (*iter)
+		mmput_async(*iter);
+
+	*iter =3D mm;
+
+	return last;
+}
+
+static bool iterate_mm_list_nowalk(struct lruvec *lruvec, unsigned long ma=
x_seq)
+{
+	bool success =3D false;
+	struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
+	struct lru_gen_mm_list *mm_list =3D get_mm_list(memcg);
+	struct lru_gen_mm_state *mm_state =3D &lruvec->mm_state;
+
+	spin_lock(&mm_list->lock);
+
+	VM_WARN_ON_ONCE(mm_state->seq + 1 < max_seq);
+
+	if (max_seq > mm_state->seq && !mm_state->nr_walkers) {
+		VM_WARN_ON_ONCE(mm_state->head && mm_state->head !=3D &mm_list->fifo);
+
+		WRITE_ONCE(mm_state->seq, mm_state->seq + 1);
+		reset_mm_stats(lruvec, NULL, true);
+		success =3D true;
+	}
+
+	spin_unlock(&mm_list->lock);
+
+	return success;
+}
+
 /*************************************************************************=
*****
  *                          refault feedback loop
  *************************************************************************=
*****/
@@ -3219,6 +3587,118 @@ static int folio_inc_gen(struct lruvec *lruvec, str=
uct folio *folio, bool reclai
 	return new_gen;
 }
=20
+static void update_batch_size(struct lru_gen_mm_walk *walk, struct folio *=
folio,
+			      int old_gen, int new_gen)
+{
+	int type =3D folio_is_file_lru(folio);
+	int zone =3D folio_zonenum(folio);
+	int delta =3D folio_nr_pages(folio);
+
+	VM_WARN_ON_ONCE(old_gen >=3D MAX_NR_GENS);
+	VM_WARN_ON_ONCE(new_gen >=3D MAX_NR_GENS);
+
+	walk->batched++;
+
+	walk->nr_pages[old_gen][type][zone] -=3D delta;
+	walk->nr_pages[new_gen][type][zone] +=3D delta;
+}
+
+static void reset_batch_size(struct lruvec *lruvec, struct lru_gen_mm_walk=
 *walk)
+{
+	int gen, type, zone;
+	struct lru_gen_struct *lrugen =3D &lruvec->lrugen;
+
+	walk->batched =3D 0;
+
+	for_each_gen_type_zone(gen, type, zone) {
+		enum lru_list lru =3D type * LRU_INACTIVE_FILE;
+		int delta =3D walk->nr_pages[gen][type][zone];
+
+		if (!delta)
+			continue;
+
+		walk->nr_pages[gen][type][zone] =3D 0;
+		WRITE_ONCE(lrugen->nr_pages[gen][type][zone],
+			   lrugen->nr_pages[gen][type][zone] + delta);
+
+		if (lru_gen_is_active(lruvec, gen))
+			lru +=3D LRU_ACTIVE;
+		__update_lru_size(lruvec, lru, zone, delta);
+	}
+}
+
+static int should_skip_vma(unsigned long start, unsigned long end, struct =
mm_walk *args)
+{
+	struct address_space *mapping;
+	struct vm_area_struct *vma =3D args->vma;
+	struct lru_gen_mm_walk *walk =3D args->private;
+
+	if (!vma_is_accessible(vma))
+		return true;
+
+	if (is_vm_hugetlb_page(vma))
+		return true;
+
+	if (vma->vm_flags & (VM_LOCKED | VM_SPECIAL | VM_SEQ_READ | VM_RAND_READ)=
)
+		return true;
+
+	if (vma =3D=3D get_gate_vma(vma->vm_mm))
+		return true;
+
+	if (vma_is_anonymous(vma))
+		return !walk->can_swap;
+
+	if (WARN_ON_ONCE(!vma->vm_file || !vma->vm_file->f_mapping))
+		return true;
+
+	mapping =3D vma->vm_file->f_mapping;
+	if (mapping_unevictable(mapping))
+		return true;
+
+	if (shmem_mapping(mapping))
+		return !walk->can_swap;
+
+	/* to exclude special mappings like dax, etc. */
+	return !mapping->a_ops->read_folio;
+}
+
+/*
+ * Some userspace memory allocators map many single-page VMAs. Instead of
+ * returning back to the PGD table for each of such VMAs, finish an entire=
 PMD
+ * table to reduce zigzags and improve cache performance.
+ */
+static bool get_next_vma(unsigned long mask, unsigned long size, struct mm=
_walk *args,
+			 unsigned long *vm_start, unsigned long *vm_end)
+{
+	unsigned long start =3D round_up(*vm_end, size);
+	unsigned long end =3D (start | ~mask) + 1;
+
+	VM_WARN_ON_ONCE(mask & size);
+	VM_WARN_ON_ONCE((start & mask) !=3D (*vm_start & mask));
+
+	while (args->vma) {
+		if (start >=3D args->vma->vm_end) {
+			args->vma =3D args->vma->vm_next;
+			continue;
+		}
+
+		if (end && end <=3D args->vma->vm_start)
+			return false;
+
+		if (should_skip_vma(args->vma->vm_start, args->vma->vm_end, args)) {
+			args->vma =3D args->vma->vm_next;
+			continue;
+		}
+
+		*vm_start =3D max(start, args->vma->vm_start);
+		*vm_end =3D min(end - 1, args->vma->vm_end - 1) + 1;
+
+		return true;
+	}
+
+	return false;
+}
+
 static unsigned long get_pte_pfn(pte_t pte, struct vm_area_struct *vma, un=
signed long addr)
 {
 	unsigned long pfn =3D pte_pfn(pte);
@@ -3237,8 +3717,26 @@ static unsigned long get_pte_pfn(pte_t pte, struct v=
m_area_struct *vma, unsigned
 	return pfn;
 }
=20
+static unsigned long get_pmd_pfn(pmd_t pmd, struct vm_area_struct *vma, un=
signed long addr)
+{
+	unsigned long pfn =3D pmd_pfn(pmd);
+
+	VM_WARN_ON_ONCE(addr < vma->vm_start || addr >=3D vma->vm_end);
+
+	if (!pmd_present(pmd) || is_huge_zero_pmd(pmd))
+		return -1;
+
+	if (WARN_ON_ONCE(pmd_devmap(pmd)))
+		return -1;
+
+	if (WARN_ON_ONCE(!pfn_valid(pfn)))
+		return -1;
+
+	return pfn;
+}
+
 static struct folio *get_pfn_folio(unsigned long pfn, struct mem_cgroup *m=
emcg,
-				   struct pglist_data *pgdat)
+				   struct pglist_data *pgdat, bool can_swap)
 {
 	struct folio *folio;
=20
@@ -3253,9 +3751,371 @@ static struct folio *get_pfn_folio(unsigned long pf=
n, struct mem_cgroup *memcg,
 	if (folio_memcg_rcu(folio) !=3D memcg)
 		return NULL;
=20
+	/* file VMAs can contain anon pages from COW */
+	if (!folio_is_file_lru(folio) && !can_swap)
+		return NULL;
+
 	return folio;
 }
=20
+static bool suitable_to_scan(int total, int young)
+{
+	int n =3D clamp_t(int, cache_line_size() / sizeof(pte_t), 2, 8);
+
+	/* suitable if the average number of young PTEs per cacheline is >=3D1 */
+	return young * n >=3D total;
+}
+
+static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long =
end,
+			   struct mm_walk *args)
+{
+	int i;
+	pte_t *pte;
+	spinlock_t *ptl;
+	unsigned long addr;
+	int total =3D 0;
+	int young =3D 0;
+	struct lru_gen_mm_walk *walk =3D args->private;
+	struct mem_cgroup *memcg =3D lruvec_memcg(walk->lruvec);
+	struct pglist_data *pgdat =3D lruvec_pgdat(walk->lruvec);
+	int old_gen, new_gen =3D lru_gen_from_seq(walk->max_seq);
+
+	VM_WARN_ON_ONCE(pmd_leaf(*pmd));
+
+	ptl =3D pte_lockptr(args->mm, pmd);
+	if (!spin_trylock(ptl))
+		return false;
+
+	arch_enter_lazy_mmu_mode();
+
+	pte =3D pte_offset_map(pmd, start & PMD_MASK);
+restart:
+	for (i =3D pte_index(start), addr =3D start; addr !=3D end; i++, addr +=
=3D PAGE_SIZE) {
+		unsigned long pfn;
+		struct folio *folio;
+
+		total++;
+		walk->mm_stats[MM_LEAF_TOTAL]++;
+
+		pfn =3D get_pte_pfn(pte[i], args->vma, addr);
+		if (pfn =3D=3D -1)
+			continue;
+
+		if (!pte_young(pte[i])) {
+			walk->mm_stats[MM_LEAF_OLD]++;
+			continue;
+		}
+
+		folio =3D get_pfn_folio(pfn, memcg, pgdat, walk->can_swap);
+		if (!folio)
+			continue;
+
+		if (!ptep_test_and_clear_young(args->vma, addr, pte + i))
+			continue;
+
+		young++;
+		walk->mm_stats[MM_LEAF_YOUNG]++;
+
+		if (pte_dirty(pte[i]) && !folio_test_dirty(folio) &&
+		    !(folio_test_anon(folio) && folio_test_swapbacked(folio) &&
+		      !folio_test_swapcache(folio)))
+			folio_mark_dirty(folio);
+
+		old_gen =3D folio_update_gen(folio, new_gen);
+		if (old_gen >=3D 0 && old_gen !=3D new_gen)
+			update_batch_size(walk, folio, old_gen, new_gen);
+	}
+
+	if (i < PTRS_PER_PTE && get_next_vma(PMD_MASK, PAGE_SIZE, args, &start, &=
end))
+		goto restart;
+
+	pte_unmap(pte);
+
+	arch_leave_lazy_mmu_mode();
+	spin_unlock(ptl);
+
+	return suitable_to_scan(total, young);
+}
+
+#if defined(CONFIG_TRANSPARENT_HUGEPAGE) || defined(CONFIG_ARCH_HAS_NONLEA=
F_PMD_YOUNG)
+static void walk_pmd_range_locked(pud_t *pud, unsigned long next, struct v=
m_area_struct *vma,
+				  struct mm_walk *args, unsigned long *bitmap, unsigned long *start)
+{
+	int i;
+	pmd_t *pmd;
+	spinlock_t *ptl;
+	struct lru_gen_mm_walk *walk =3D args->private;
+	struct mem_cgroup *memcg =3D lruvec_memcg(walk->lruvec);
+	struct pglist_data *pgdat =3D lruvec_pgdat(walk->lruvec);
+	int old_gen, new_gen =3D lru_gen_from_seq(walk->max_seq);
+
+	VM_WARN_ON_ONCE(pud_leaf(*pud));
+
+	/* try to batch at most 1+MIN_LRU_BATCH+1 entries */
+	if (*start =3D=3D -1) {
+		*start =3D next;
+		return;
+	}
+
+	i =3D next =3D=3D -1 ? 0 : pmd_index(next) - pmd_index(*start);
+	if (i && i <=3D MIN_LRU_BATCH) {
+		__set_bit(i - 1, bitmap);
+		return;
+	}
+
+	pmd =3D pmd_offset(pud, *start);
+
+	ptl =3D pmd_lockptr(args->mm, pmd);
+	if (!spin_trylock(ptl))
+		goto done;
+
+	arch_enter_lazy_mmu_mode();
+
+	do {
+		unsigned long pfn;
+		struct folio *folio;
+		unsigned long addr =3D i ? (*start & PMD_MASK) + i * PMD_SIZE : *start;
+
+		pfn =3D get_pmd_pfn(pmd[i], vma, addr);
+		if (pfn =3D=3D -1)
+			goto next;
+
+		if (!pmd_trans_huge(pmd[i])) {
+			if (IS_ENABLED(CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG))
+				pmdp_test_and_clear_young(vma, addr, pmd + i);
+			goto next;
+		}
+
+		folio =3D get_pfn_folio(pfn, memcg, pgdat, walk->can_swap);
+		if (!folio)
+			goto next;
+
+		if (!pmdp_test_and_clear_young(vma, addr, pmd + i))
+			goto next;
+
+		walk->mm_stats[MM_LEAF_YOUNG]++;
+
+		if (pmd_dirty(pmd[i]) && !folio_test_dirty(folio) &&
+		    !(folio_test_anon(folio) && folio_test_swapbacked(folio) &&
+		      !folio_test_swapcache(folio)))
+			folio_mark_dirty(folio);
+
+		old_gen =3D folio_update_gen(folio, new_gen);
+		if (old_gen >=3D 0 && old_gen !=3D new_gen)
+			update_batch_size(walk, folio, old_gen, new_gen);
+next:
+		i =3D i > MIN_LRU_BATCH ? 0 : find_next_bit(bitmap, MIN_LRU_BATCH, i) + =
1;
+	} while (i <=3D MIN_LRU_BATCH);
+
+	arch_leave_lazy_mmu_mode();
+	spin_unlock(ptl);
+done:
+	*start =3D -1;
+	bitmap_zero(bitmap, MIN_LRU_BATCH);
+}
+#else
+static void walk_pmd_range_locked(pud_t *pud, unsigned long next, struct v=
m_area_struct *vma,
+				  struct mm_walk *args, unsigned long *bitmap, unsigned long *start)
+{
+}
+#endif
+
+static void walk_pmd_range(pud_t *pud, unsigned long start, unsigned long =
end,
+			   struct mm_walk *args)
+{
+	int i;
+	pmd_t *pmd;
+	unsigned long next;
+	unsigned long addr;
+	struct vm_area_struct *vma;
+	unsigned long pos =3D -1;
+	struct lru_gen_mm_walk *walk =3D args->private;
+	unsigned long bitmap[BITS_TO_LONGS(MIN_LRU_BATCH)] =3D {};
+
+	VM_WARN_ON_ONCE(pud_leaf(*pud));
+
+	/*
+	 * Finish an entire PMD in two passes: the first only reaches to PTE
+	 * tables to avoid taking the PMD lock; the second, if necessary, takes
+	 * the PMD lock to clear the accessed bit in PMD entries.
+	 */
+	pmd =3D pmd_offset(pud, start & PUD_MASK);
+restart:
+	/* walk_pte_range() may call get_next_vma() */
+	vma =3D args->vma;
+	for (i =3D pmd_index(start), addr =3D start; addr !=3D end; i++, addr =3D=
 next) {
+		pmd_t val =3D pmd_read_atomic(pmd + i);
+
+		/* for pmd_read_atomic() */
+		barrier();
+
+		next =3D pmd_addr_end(addr, end);
+
+		if (!pmd_present(val) || is_huge_zero_pmd(val)) {
+			walk->mm_stats[MM_LEAF_TOTAL]++;
+			continue;
+		}
+
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+		if (pmd_trans_huge(val)) {
+			unsigned long pfn =3D pmd_pfn(val);
+			struct pglist_data *pgdat =3D lruvec_pgdat(walk->lruvec);
+
+			walk->mm_stats[MM_LEAF_TOTAL]++;
+
+			if (!pmd_young(val)) {
+				walk->mm_stats[MM_LEAF_OLD]++;
+				continue;
+			}
+
+			/* try to avoid unnecessary memory loads */
+			if (pfn < pgdat->node_start_pfn || pfn >=3D pgdat_end_pfn(pgdat))
+				continue;
+
+			walk_pmd_range_locked(pud, addr, vma, args, bitmap, &pos);
+			continue;
+		}
+#endif
+		walk->mm_stats[MM_NONLEAF_TOTAL]++;
+
+#ifdef CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG
+		if (!pmd_young(val))
+			continue;
+
+		walk_pmd_range_locked(pud, addr, vma, args, bitmap, &pos);
+#endif
+		if (!walk->force_scan && !test_bloom_filter(walk->lruvec, walk->max_seq,=
 pmd + i))
+			continue;
+
+		walk->mm_stats[MM_NONLEAF_FOUND]++;
+
+		if (!walk_pte_range(&val, addr, next, args))
+			continue;
+
+		walk->mm_stats[MM_NONLEAF_ADDED]++;
+
+		/* carry over to the next generation */
+		update_bloom_filter(walk->lruvec, walk->max_seq + 1, pmd + i);
+	}
+
+	walk_pmd_range_locked(pud, -1, vma, args, bitmap, &pos);
+
+	if (i < PTRS_PER_PMD && get_next_vma(PUD_MASK, PMD_SIZE, args, &start, &e=
nd))
+		goto restart;
+}
+
+static int walk_pud_range(p4d_t *p4d, unsigned long start, unsigned long e=
nd,
+			  struct mm_walk *args)
+{
+	int i;
+	pud_t *pud;
+	unsigned long addr;
+	unsigned long next;
+	struct lru_gen_mm_walk *walk =3D args->private;
+
+	VM_WARN_ON_ONCE(p4d_leaf(*p4d));
+
+	pud =3D pud_offset(p4d, start & P4D_MASK);
+restart:
+	for (i =3D pud_index(start), addr =3D start; addr !=3D end; i++, addr =3D=
 next) {
+		pud_t val =3D READ_ONCE(pud[i]);
+
+		next =3D pud_addr_end(addr, end);
+
+		if (!pud_present(val) || WARN_ON_ONCE(pud_leaf(val)))
+			continue;
+
+		walk_pmd_range(&val, addr, next, args);
+
+		if (walk->batched >=3D MAX_LRU_BATCH) {
+			end =3D (addr | ~PUD_MASK) + 1;
+			goto done;
+		}
+	}
+
+	if (i < PTRS_PER_PUD && get_next_vma(P4D_MASK, PUD_SIZE, args, &start, &e=
nd))
+		goto restart;
+
+	end =3D round_up(end, P4D_SIZE);
+done:
+	if (!end || !args->vma)
+		return 1;
+
+	walk->next_addr =3D max(end, args->vma->vm_start);
+
+	return -EAGAIN;
+}
+
+static void walk_mm(struct lruvec *lruvec, struct mm_struct *mm, struct lr=
u_gen_mm_walk *walk)
+{
+	static const struct mm_walk_ops mm_walk_ops =3D {
+		.test_walk =3D should_skip_vma,
+		.p4d_entry =3D walk_pud_range,
+	};
+
+	int err;
+	struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
+
+	walk->next_addr =3D FIRST_USER_ADDRESS;
+
+	do {
+		err =3D -EBUSY;
+
+		/* folio_update_gen() requires stable folio_memcg() */
+		if (!mem_cgroup_trylock_pages(memcg))
+			break;
+
+		/* the caller might be holding the lock for write */
+		if (mmap_read_trylock(mm)) {
+			err =3D walk_page_range(mm, walk->next_addr, ULONG_MAX, &mm_walk_ops, w=
alk);
+
+			mmap_read_unlock(mm);
+		}
+
+		mem_cgroup_unlock_pages();
+
+		if (walk->batched) {
+			spin_lock_irq(&lruvec->lru_lock);
+			reset_batch_size(lruvec, walk);
+			spin_unlock_irq(&lruvec->lru_lock);
+		}
+
+		cond_resched();
+	} while (err =3D=3D -EAGAIN);
+}
+
+static struct lru_gen_mm_walk *set_mm_walk(struct pglist_data *pgdat)
+{
+	struct lru_gen_mm_walk *walk =3D current->reclaim_state->mm_walk;
+
+	if (pgdat && current_is_kswapd()) {
+		VM_WARN_ON_ONCE(walk);
+
+		walk =3D &pgdat->mm_walk;
+	} else if (!pgdat && !walk) {
+		VM_WARN_ON_ONCE(current_is_kswapd());
+
+		walk =3D kzalloc(sizeof(*walk), __GFP_HIGH | __GFP_NOMEMALLOC | __GFP_NO=
WARN);
+	}
+
+	current->reclaim_state->mm_walk =3D walk;
+
+	return walk;
+}
+
+static void clear_mm_walk(void)
+{
+	struct lru_gen_mm_walk *walk =3D current->reclaim_state->mm_walk;
+
+	VM_WARN_ON_ONCE(walk && memchr_inv(walk->nr_pages, 0, sizeof(walk->nr_pag=
es)));
+	VM_WARN_ON_ONCE(walk && memchr_inv(walk->mm_stats, 0, sizeof(walk->mm_sta=
ts)));
+
+	current->reclaim_state->mm_walk =3D NULL;
+
+	if (!current_is_kswapd())
+		kfree(walk);
+}
+
 static void inc_min_seq(struct lruvec *lruvec, int type)
 {
 	struct lru_gen_struct *lrugen =3D &lruvec->lrugen;
@@ -3307,7 +4167,7 @@ static bool try_to_inc_min_seq(struct lruvec *lruvec,=
 bool can_swap)
 	return success;
 }
=20
-static void inc_max_seq(struct lruvec *lruvec, unsigned long max_seq, bool=
 can_swap)
+static void inc_max_seq(struct lruvec *lruvec, bool can_swap)
 {
 	int prev, next;
 	int type, zone;
@@ -3317,9 +4177,6 @@ static void inc_max_seq(struct lruvec *lruvec, unsign=
ed long max_seq, bool can_s
=20
 	VM_WARN_ON_ONCE(!seq_is_valid(lruvec));
=20
-	if (max_seq !=3D lrugen->max_seq)
-		goto unlock;
-
 	for (type =3D 0; type < ANON_AND_FILE; type++) {
 		if (get_nr_gens(lruvec, type) !=3D MAX_NR_GENS)
 			continue;
@@ -3357,10 +4214,76 @@ static void inc_max_seq(struct lruvec *lruvec, unsi=
gned long max_seq, bool can_s
=20
 	/* make sure preceding modifications appear */
 	smp_store_release(&lrugen->max_seq, lrugen->max_seq + 1);
-unlock:
+
 	spin_unlock_irq(&lruvec->lru_lock);
 }
=20
+static bool try_to_inc_max_seq(struct lruvec *lruvec, unsigned long max_se=
q,
+			       struct scan_control *sc, bool can_swap)
+{
+	bool success;
+	struct lru_gen_mm_walk *walk;
+	struct mm_struct *mm =3D NULL;
+	struct lru_gen_struct *lrugen =3D &lruvec->lrugen;
+
+	VM_WARN_ON_ONCE(max_seq > READ_ONCE(lrugen->max_seq));
+
+	/* see the comment in iterate_mm_list() */
+	if (max_seq <=3D READ_ONCE(lruvec->mm_state.seq)) {
+		success =3D false;
+		goto done;
+	}
+
+	/*
+	 * If the hardware doesn't automatically set the accessed bit, fallback
+	 * to lru_gen_look_around(), which only clears the accessed bit in a
+	 * handful of PTEs. Spreading the work out over a period of time usually
+	 * is less efficient, but it avoids bursty page faults.
+	 */
+	if (!arch_has_hw_pte_young()) {
+		success =3D iterate_mm_list_nowalk(lruvec, max_seq);
+		goto done;
+	}
+
+	walk =3D set_mm_walk(NULL);
+	if (!walk) {
+		success =3D iterate_mm_list_nowalk(lruvec, max_seq);
+		goto done;
+	}
+
+	walk->lruvec =3D lruvec;
+	walk->max_seq =3D max_seq;
+	walk->can_swap =3D can_swap;
+	walk->force_scan =3D false;
+
+	do {
+		success =3D iterate_mm_list(lruvec, walk, &mm);
+		if (mm)
+			walk_mm(lruvec, mm, walk);
+
+		cond_resched();
+	} while (mm);
+done:
+	if (!success) {
+		if (!current_is_kswapd() && !sc->priority)
+			wait_event_killable(lruvec->mm_state.wait,
+					    max_seq < READ_ONCE(lrugen->max_seq));
+
+		return max_seq < READ_ONCE(lrugen->max_seq);
+	}
+
+	VM_WARN_ON_ONCE(max_seq !=3D READ_ONCE(lrugen->max_seq));
+
+	inc_max_seq(lruvec, can_swap);
+	/* either this sees any waiters or they will see updated max_seq */
+	if (wq_has_sleeper(&lruvec->mm_state.wait))
+		wake_up_all(&lruvec->mm_state.wait);
+
+	wakeup_flusher_threads(WB_REASON_VMSCAN);
+
+	return true;
+}
+
 static unsigned long get_nr_evictable(struct lruvec *lruvec, unsigned long=
 max_seq,
 				      unsigned long *min_seq, bool can_swap, bool *need_aging)
 {
@@ -3438,7 +4361,7 @@ static void age_lruvec(struct lruvec *lruvec, struct =
scan_control *sc)
 	nr_to_scan >>=3D mem_cgroup_online(memcg) ? sc->priority : 0;
=20
 	if (nr_to_scan && need_aging)
-		inc_max_seq(lruvec, max_seq, swappiness);
+		try_to_inc_max_seq(lruvec, max_seq, sc, swappiness);
 }
=20
 static void lru_gen_age_node(struct pglist_data *pgdat, struct scan_contro=
l *sc)
@@ -3447,6 +4370,8 @@ static void lru_gen_age_node(struct pglist_data *pgda=
t, struct scan_control *sc)
=20
 	VM_WARN_ON_ONCE(!current_is_kswapd());
=20
+	set_mm_walk(pgdat);
+
 	memcg =3D mem_cgroup_iter(NULL, NULL, NULL);
 	do {
 		struct lruvec *lruvec =3D mem_cgroup_lruvec(memcg, pgdat);
@@ -3455,11 +4380,16 @@ static void lru_gen_age_node(struct pglist_data *pg=
dat, struct scan_control *sc)
=20
 		cond_resched();
 	} while ((memcg =3D mem_cgroup_iter(NULL, memcg, NULL)));
+
+	clear_mm_walk();
 }
=20
 /*
  * This function exploits spatial locality when shrink_page_list() walks t=
he
- * rmap. It scans the adjacent PTEs of a young PTE and promotes hot pages.
+ * rmap. It scans the adjacent PTEs of a young PTE and promotes hot pages.=
 If
+ * the scan was done cacheline efficiently, it adds the PMD entry pointing=
 to
+ * the PTE table to the Bloom filter. This forms a feedback loop between t=
he
+ * eviction and the aging.
  */
 void lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 {
@@ -3468,6 +4398,8 @@ void lru_gen_look_around(struct page_vma_mapped_walk =
*pvmw)
 	unsigned long start;
 	unsigned long end;
 	unsigned long addr;
+	struct lru_gen_mm_walk *walk;
+	int young =3D 0;
 	unsigned long bitmap[BITS_TO_LONGS(MIN_LRU_BATCH)] =3D {};
 	struct folio *folio =3D pfn_folio(pvmw->pfn);
 	struct mem_cgroup *memcg =3D folio_memcg(folio);
@@ -3497,6 +4429,7 @@ void lru_gen_look_around(struct page_vma_mapped_walk =
*pvmw)
 	}
=20
 	pte =3D pvmw->pte - (pvmw->address - start) / PAGE_SIZE;
+	walk =3D current->reclaim_state ? current->reclaim_state->mm_walk : NULL;
=20
 	rcu_read_lock();
 	arch_enter_lazy_mmu_mode();
@@ -3511,13 +4444,15 @@ void lru_gen_look_around(struct page_vma_mapped_wal=
k *pvmw)
 		if (!pte_young(pte[i]))
 			continue;
=20
-		folio =3D get_pfn_folio(pfn, memcg, pgdat);
+		folio =3D get_pfn_folio(pfn, memcg, pgdat, !walk || walk->can_swap);
 		if (!folio)
 			continue;
=20
 		if (!ptep_test_and_clear_young(pvmw->vma, addr, pte + i))
 			continue;
=20
+		young++;
+
 		if (pte_dirty(pte[i]) && !folio_test_dirty(folio) &&
 		    !(folio_test_anon(folio) && folio_test_swapbacked(folio) &&
 		      !folio_test_swapcache(folio)))
@@ -3533,7 +4468,11 @@ void lru_gen_look_around(struct page_vma_mapped_walk=
 *pvmw)
 	arch_leave_lazy_mmu_mode();
 	rcu_read_unlock();
=20
-	if (bitmap_weight(bitmap, MIN_LRU_BATCH) < PAGEVEC_SIZE) {
+	/* feedback from rmap walkers to page table walkers */
+	if (suitable_to_scan(i, young))
+		update_bloom_filter(lruvec, max_seq, pvmw->pmd);
+
+	if (!walk && bitmap_weight(bitmap, MIN_LRU_BATCH) < PAGEVEC_SIZE) {
 		for_each_set_bit(i, bitmap, MIN_LRU_BATCH) {
 			folio =3D pfn_folio(pte_pfn(pte[i]));
 			folio_activate(folio);
@@ -3545,8 +4484,10 @@ void lru_gen_look_around(struct page_vma_mapped_walk=
 *pvmw)
 	if (!mem_cgroup_trylock_pages(memcg))
 		return;
=20
-	spin_lock_irq(&lruvec->lru_lock);
-	new_gen =3D lru_gen_from_seq(lruvec->lrugen.max_seq);
+	if (!walk) {
+		spin_lock_irq(&lruvec->lru_lock);
+		new_gen =3D lru_gen_from_seq(lruvec->lrugen.max_seq);
+	}
=20
 	for_each_set_bit(i, bitmap, MIN_LRU_BATCH) {
 		folio =3D pfn_folio(pte_pfn(pte[i]));
@@ -3557,10 +4498,14 @@ void lru_gen_look_around(struct page_vma_mapped_wal=
k *pvmw)
 		if (old_gen < 0 || old_gen =3D=3D new_gen)
 			continue;
=20
-		lru_gen_update_size(lruvec, folio, old_gen, new_gen);
+		if (walk)
+			update_batch_size(walk, folio, old_gen, new_gen);
+		else
+			lru_gen_update_size(lruvec, folio, old_gen, new_gen);
 	}
=20
-	spin_unlock_irq(&lruvec->lru_lock);
+	if (!walk)
+		spin_unlock_irq(&lruvec->lru_lock);
=20
 	mem_cgroup_unlock_pages();
 }
@@ -3839,6 +4784,7 @@ static int evict_folios(struct lruvec *lruvec, struct=
 scan_control *sc, int swap
 	struct folio *folio;
 	enum vm_event_item item;
 	struct reclaim_stat stat;
+	struct lru_gen_mm_walk *walk;
 	struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
 	struct pglist_data *pgdat =3D lruvec_pgdat(lruvec);
=20
@@ -3874,6 +4820,10 @@ static int evict_folios(struct lruvec *lruvec, struc=
t scan_control *sc, int swap
=20
 	move_pages_to_lru(lruvec, &list);
=20
+	walk =3D current->reclaim_state->mm_walk;
+	if (walk && walk->batched)
+		reset_batch_size(lruvec, walk);
+
 	item =3D current_is_kswapd() ? PGSTEAL_KSWAPD : PGSTEAL_DIRECT;
 	if (!cgroup_reclaim(sc))
 		__count_vm_events(item, reclaimed);
@@ -3931,9 +4881,10 @@ static unsigned long get_nr_to_scan(struct lruvec *l=
ruvec, struct scan_control *
 	if (current_is_kswapd())
 		return 0;
=20
-	inc_max_seq(lruvec, max_seq, can_swap);
+	if (try_to_inc_max_seq(lruvec, max_seq, sc, can_swap))
+		return nr_to_scan;
=20
-	return nr_to_scan;
+	return min_seq[!can_swap] + MIN_NR_GENS <=3D max_seq ? nr_to_scan : 0;
 }
=20
 static void lru_gen_shrink_lruvec(struct lruvec *lruvec, struct scan_contr=
ol *sc)
@@ -3946,6 +4897,8 @@ static void lru_gen_shrink_lruvec(struct lruvec *lruv=
ec, struct scan_control *sc
=20
 	blk_start_plug(&plug);
=20
+	set_mm_walk(lruvec_pgdat(lruvec));
+
 	while (true) {
 		int delta;
 		int swappiness;
@@ -3973,6 +4926,8 @@ static void lru_gen_shrink_lruvec(struct lruvec *lruv=
ec, struct scan_control *sc
 		cond_resched();
 	}
=20
+	clear_mm_walk();
+
 	blk_finish_plug(&plug);
 }
=20
@@ -3989,15 +4944,21 @@ void lru_gen_init_lruvec(struct lruvec *lruvec)
=20
 	for_each_gen_type_zone(gen, type, zone)
 		INIT_LIST_HEAD(&lrugen->lists[gen][type][zone]);
+
+	lruvec->mm_state.seq =3D MIN_NR_GENS;
+	init_waitqueue_head(&lruvec->mm_state.wait);
 }
=20
 #ifdef CONFIG_MEMCG
 void lru_gen_init_memcg(struct mem_cgroup *memcg)
 {
+	INIT_LIST_HEAD(&memcg->mm_list.fifo);
+	spin_lock_init(&memcg->mm_list.lock);
 }
=20
 void lru_gen_exit_memcg(struct mem_cgroup *memcg)
 {
+	int i;
 	int nid;
=20
 	for_each_node(nid) {
@@ -4005,6 +4966,11 @@ void lru_gen_exit_memcg(struct mem_cgroup *memcg)
=20
 		VM_WARN_ON_ONCE(memchr_inv(lruvec->lrugen.nr_pages, 0,
 					   sizeof(lruvec->lrugen.nr_pages)));
+
+		for (i =3D 0; i < NR_BLOOM_FILTERS; i++) {
+			bitmap_free(lruvec->mm_state.filters[i]);
+			lruvec->mm_state.filters[i] =3D NULL;
+		}
 	}
 }
 #endif
--=20
2.36.1.476.g0c4daa206d-goog

