Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 880BF52B01D
	for <lists+linux-doc@lfdr.de>; Wed, 18 May 2022 03:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230220AbiERBrY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 17 May 2022 21:47:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233907AbiERBrT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 May 2022 21:47:19 -0400
Received: from mail-il1-x149.google.com (mail-il1-x149.google.com [IPv6:2607:f8b0:4864:20::149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACAE554BD5
        for <linux-doc@vger.kernel.org>; Tue, 17 May 2022 18:47:06 -0700 (PDT)
Received: by mail-il1-x149.google.com with SMTP id n2-20020a056e021ba200b002d12462a1d1so441738ili.15
        for <linux-doc@vger.kernel.org>; Tue, 17 May 2022 18:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc:content-transfer-encoding;
        bh=PTjd11WATlmfbdtQhfK897D7nFONbou6umNurqc2JZY=;
        b=k7gwiy9FkEGpQ2cJPTc0CqF7ZhNg9eIRssfySwAeqT/QU/pZu+xcBXpGXhY16eEC+g
         /9Y5TExpblTU8rZxzrfxyJ0Pyp63osrSRKn7w1RqllWPKoCfe0jyvnQj750nWh4yCSbe
         sUmYDTC4lVmOF8FJ0kxkgu+JYIGx8+6CNwahInKDUuJAwLGt5ZfxrR4Vj4Sx9x8x/sMe
         8TvShq4s8bgIUvnBrzYOcCAAtVrfihqujQxwPxxUkwhGmShdFsLP04seFDkfIXe96ojc
         otj7kBAULxcPC4x/i4YynKdyvxmVqOBb3oXTOb22VbGG2qfhystG6v09y15F+VCiEPxW
         qqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc:content-transfer-encoding;
        bh=PTjd11WATlmfbdtQhfK897D7nFONbou6umNurqc2JZY=;
        b=F+VA6dokESoEkhGlA7UKtj7bh5VEhu2wC2S3eVFliRvSTcMsOU38tPvfBLmAYpmae9
         12AEyynferpYJxPKN+Xnh37/j+nMr2iHgPde8sCr36vBZIXQN716w99OtUFz9ea4Bj3u
         wbb0LS1nbK3vAEl/9F/laNlYjAf2XxdTXQ9JyzuEUO8/oB2YtddK+MHgvedtrMgI71ky
         zZ6O3pDVnl60DCAdpVp2VMjhuX8pevJrs4sF3QuMHEk0858pFVW41MJ6x+wf12g2Hoxr
         fzIQT9Z7Tv1nudS4OOptYf1kwShUDPX/JJ62X4XgQarvGNU+xGEWjDzZKXibmBKOwrz1
         BzZQ==
X-Gm-Message-State: AOAM5329x6URsSqQx86PfbvidOggIMMinLC74Eikt7zqNijhtTohJA7B
        hQBTixn+be9szbHehvXUOs0BgUE8wN8=
X-Google-Smtp-Source: ABdhPJwk7Q4yUGqMOHyNREY9VJxifZTmzumohbyC4Q4FMtnQ2dLXH+B7ANRAGX4eThrtnxmA9J5/iIetGTw=
X-Received: from yuzhao.bld.corp.google.com ([2620:15c:183:200:f7bc:90c9:d86e:4ea8])
 (user=yuzhao job=sendgmr) by 2002:a05:6602:2f06:b0:65a:cfe5:1778 with SMTP id
 q6-20020a0566022f0600b0065acfe51778mr11310389iow.192.1652838425868; Tue, 17
 May 2022 18:47:05 -0700 (PDT)
Date:   Tue, 17 May 2022 19:46:27 -0600
In-Reply-To: <20220518014632.922072-1-yuzhao@google.com>
Message-Id: <20220518014632.922072-9-yuzhao@google.com>
Mime-Version: 1.0
References: <20220518014632.922072-1-yuzhao@google.com>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [PATCH v11 08/14] mm: multi-gen LRU: support page table walks
From:   Yu Zhao <yuzhao@google.com>
To:     Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
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
        linux-kernel@vger.kernel.org, x86@kernel.org,
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
      patch1-7: 1193918.93   46438.15
      patch1-8: 1301954.44   50640.27

  Configurations:
    no change

Client benchmark results:
  kswapd profiles:
    patch1-7
      45.90%  lzo1x_1_do_compress (real work)
       9.14%  page_vma_mapped_walk
       6.81%  _raw_spin_unlock_irq
       2.80%  ptep_clear_flush
       2.34%  __zram_bvec_write
       2.29%  do_raw_spin_lock
       1.84%  lru_gen_look_around
       1.78%  memmove
       1.74%  obj_malloc
       1.50%  free_unref_page_list

    patch1-8
      46.96%  lzo1x_1_do_compress (real work)
       7.55%  page_vma_mapped_walk
       5.89%  _raw_spin_unlock_irq
       3.33%  walk_pte_range
       2.65%  ptep_clear_flush
       2.23%  __zram_bvec_write
       2.08%  do_raw_spin_lock
       1.83%  memmove
       1.65%  obj_malloc
       1.47%  free_unref_page_list

  Configurations:
    no change

Thanks to the following developers for their efforts [3].
  kernel test robot <lkp@intel.com>

[1] https://lwn.net/Articles/23732/
[2] https://source.android.com/devices/tech/debug/scudo
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
 fs/exec.c                  |   2 +
 include/linux/memcontrol.h |   5 +
 include/linux/mm_types.h   |  77 +++
 include/linux/mmzone.h     |  61 ++-
 include/linux/swap.h       |   4 +
 kernel/exit.c              |   1 +
 kernel/fork.c              |   9 +
 kernel/sched/core.c        |   1 +
 mm/memcontrol.c            |  25 +
 mm/vmscan.c                | 981 ++++++++++++++++++++++++++++++++++++-
 10 files changed, 1150 insertions(+), 16 deletions(-)

diff --git a/fs/exec.c b/fs/exec.c
index e3e55d5e0be1..bba8fc44926f 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1011,6 +1011,7 @@ static int exec_mmap(struct mm_struct *mm)
 	active_mm =3D tsk->active_mm;
 	tsk->active_mm =3D mm;
 	tsk->mm =3D mm;
+	lru_gen_add_mm(mm);
 	/*
 	 * This prevents preemption while active_mm is being loaded and
 	 * it and mm are being updated, which could cause problems for
@@ -1023,6 +1024,7 @@ static int exec_mmap(struct mm_struct *mm)
 	activate_mm(active_mm, mm);
 	if (IS_ENABLED(CONFIG_ARCH_WANT_IRQS_OFF_ACTIVATE_MM))
 		local_irq_enable();
+	lru_gen_use_mm(mm);
 	tsk->mm->vmacache_seqnum =3D 0;
 	vmacache_flush(tsk);
 	task_unlock(tsk);
diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 2bfdcc77648a..cc16ba262464 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -344,6 +344,11 @@ struct mem_cgroup {
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
index 8834e38c06a4..ef46d5b3da9b 100644
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
@@ -655,6 +657,22 @@ struct mm_struct {
 #ifdef CONFIG_IOMMU_SVA
 		u32 pasid;
 #endif
+#ifdef CONFIG_LRU_GEN
+		struct {
+			/* this mm_struct is on lru_gen_mm_list */
+			struct list_head list;
+#ifdef CONFIG_MEMCG
+			/* points to the memcg of "owner" above */
+			struct mem_cgroup *memcg;
+#endif
+			/*
+			 * Set when switching to this mm_struct, as a hint of
+			 * whether it has been used since the last time per-node
+			 * page table walkers cleared the corresponding bits.
+			 */
+			unsigned long bitmap;
+		} lru_gen;
+#endif /* CONFIG_LRU_GEN */
 	} __randomize_layout;
=20
 	/*
@@ -681,6 +699,65 @@ static inline cpumask_t *mm_cpumask(struct mm_struct *=
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
+#ifdef CONFIG_MEMCG
+	mm->lru_gen.memcg =3D NULL;
+#endif
+	mm->lru_gen.bitmap =3D 0;
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
index f0b980362186..6aa715a2fea1 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -407,7 +407,7 @@ enum {
  * min_seq behind.
  *
  * nr_pages[] are eventually consistent and therefore can be transiently
- * negative.
+ * negative when reset_batch_size() is pending.
  */
 struct lru_gen_struct {
 	/* the aging increments the youngest generation number */
@@ -429,6 +429,58 @@ struct lru_gen_struct {
 	atomic_long_t refaulted[NR_HIST_GENS][ANON_AND_FILE][MAX_NR_TIERS];
 };
=20
+enum {
+	MM_PTE_TOTAL,	/* total leaf entries */
+	MM_PTE_OLD,	/* old leaf entries */
+	MM_PTE_YOUNG,	/* young leaf entries */
+	MM_PMD_TOTAL,	/* total non-leaf entries */
+	MM_PMD_FOUND,	/* non-leaf entries found in Bloom filters */
+	MM_PMD_ADDED,	/* non-leaf entries added to Bloom filters */
+	NR_MM_STATS
+};
+
+/* mnemonic codes for the mm stats above */
+#define MM_STAT_CODES		"toydfa"
+
+/* double-buffering Bloom filters */
+#define NR_BLOOM_FILTERS	2
+
+struct lru_gen_mm_state {
+	/* set to max_seq after each iteration */
+	unsigned long seq;
+	/* where the current iteration starts (inclusive) */
+	struct list_head *head;
+	/* where the last iteration ends (exclusive) */
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
+	/* to batch page table entries */
+	unsigned long bitmap[BITS_TO_LONGS(MIN_LRU_BATCH)];
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
@@ -479,6 +531,8 @@ struct lruvec {
 #ifdef CONFIG_LRU_GEN
 	/* evictable pages divided into generations */
 	struct lru_gen_struct		lrugen;
+	/* to concurrently iterate lru_gen_mm_list */
+	struct lru_gen_mm_state		mm_state;
 #endif
 #ifdef CONFIG_MEMCG
 	struct pglist_data *pgdat;
@@ -1072,6 +1126,11 @@ typedef struct pglist_data {
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
index 27093b477c5f..7bdd7bcb135d 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -137,6 +137,10 @@ union swap_header {
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
index 35a3beff140b..3e3cab26e66c 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1149,6 +1149,7 @@ static struct mm_struct *mm_init(struct mm_struct *mm=
, struct task_struct *p,
 		goto fail_nocontext;
=20
 	mm->user_ns =3D get_user_ns(user_ns);
+	lru_gen_init_mm(mm);
 	return mm;
=20
 fail_nocontext:
@@ -1191,6 +1192,7 @@ static inline void __mmput(struct mm_struct *mm)
 	}
 	if (mm->binfmt)
 		module_put(mm->binfmt->module);
+	lru_gen_del_mm(mm);
 	mmdrop(mm);
 }
=20
@@ -2660,6 +2662,13 @@ pid_t kernel_clone(struct kernel_clone_args *args)
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
index d58c0389eb23..a8f9e5ebb5dd 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5057,6 +5057,7 @@ context_switch(struct rq *rq, struct task_struct *pre=
v,
 		 * finish_task_switch()'s mmdrop().
 		 */
 		switch_mm_irqs_off(prev->active_mm, next->mm, next);
+		lru_gen_use_mm(next->mm);
=20
 		if (!prev->mm) {                        // from kernel
 			/* will mmdrop() in finish_task_switch(). */
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 98aa720ac639..ff2b0a09e6c8 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -6093,6 +6093,30 @@ static void mem_cgroup_move_task(void)
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
@@ -6438,6 +6462,7 @@ struct cgroup_subsys memory_cgrp_subsys =3D {
 	.css_reset =3D mem_cgroup_css_reset,
 	.css_rstat_flush =3D mem_cgroup_css_rstat_flush,
 	.can_attach =3D mem_cgroup_can_attach,
+	.attach =3D mem_cgroup_attach,
 	.cancel_attach =3D mem_cgroup_cancel_attach,
 	.post_attach =3D mem_cgroup_move_task,
 	.dfl_cftypes =3D memory_files,
diff --git a/mm/vmscan.c b/mm/vmscan.c
index cf89a28c3b0e..f292e7e761b1 100644
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
@@ -3000,7 +3002,7 @@ static bool can_age_anon_pages(struct pglist_data *pg=
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
@@ -3045,6 +3047,375 @@ static bool __maybe_unused seq_is_valid(struct lruv=
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
+		if (lruvec->mm_state.tail =3D=3D &mm->lru_gen.list)
+			lruvec->mm_state.tail =3D lruvec->mm_state.tail->next;
+
+		if (lruvec->mm_state.head !=3D &mm->lru_gen.list)
+			continue;
+
+		lruvec->mm_state.head =3D lruvec->mm_state.head->next;
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
+	lockdep_assert_held(&get_mm_list(lruvec_memcg(lruvec))->lock);
+
+	filter =3D lruvec->mm_state.filters[gen];
+	if (filter) {
+		bitmap_clear(filter, 0, BIT(BLOOM_FILTER_SHIFT));
+		return;
+	}
+
+	filter =3D bitmap_zalloc(BIT(BLOOM_FILTER_SHIFT), GFP_ATOMIC);
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
+	if (!walk->force_scan && cpumask_empty(mm_cpumask(mm)) &&
+	    !test_bit(key, &mm->lru_gen.bitmap))
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
+	if (mm_is_oom_victim(mm))
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
+	 *    there is nothing to be done.
+	 * 2. It's the first of the current generation, and it needs to reset
+	 *    the Bloom filter for the next generation.
+	 * 3. It reaches the end of mm_list, and it needs to increment
+	 *    mm_state->seq; the iteration is done.
+	 * 4. It's the last of the current generation, and it needs to reset the
+	 *    mm stats counters for the next generation.
+	 */
+	if (*iter)
+		mmput_async(*iter);
+	else if (walk->max_seq <=3D READ_ONCE(mm_state->seq))
+		return false;
+
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
+	if (mm && first)
+		reset_bloom_filter(lruvec, walk->max_seq + 1);
+
+	if (*iter || last)
+		reset_mm_stats(lruvec, walk, last);
+
+	spin_unlock(&mm_list->lock);
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
+	if (max_seq <=3D READ_ONCE(mm_state->seq))
+		return false;
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
@@ -3193,6 +3564,479 @@ static int folio_inc_gen(struct lruvec *lruvec, str=
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
+	if (!vma_is_accessible(vma) || is_vm_hugetlb_page(vma) ||
+	    (vma->vm_flags & (VM_LOCKED | VM_SPECIAL | VM_SEQ_READ | VM_RAND_READ=
)) ||
+	    vma =3D=3D get_gate_vma(vma->vm_mm))
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
+	/* check readpage to exclude special mappings like dax, etc. */
+	return shmem_mapping(mapping) ? !walk->can_swap : !mapping->a_ops->readpa=
ge;
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
+			 unsigned long *start, unsigned long *end)
+{
+	unsigned long next =3D round_up(*end, size);
+
+	VM_WARN_ON_ONCE(mask & size);
+	VM_WARN_ON_ONCE(*start >=3D *end);
+	VM_WARN_ON_ONCE((next & mask) !=3D (*start & mask));
+
+	while (args->vma) {
+		if (next >=3D args->vma->vm_end) {
+			args->vma =3D args->vma->vm_next;
+			continue;
+		}
+
+		if ((next & mask) !=3D (args->vma->vm_start & mask))
+			return false;
+
+		if (should_skip_vma(args->vma->vm_start, args->vma->vm_end, args)) {
+			args->vma =3D args->vma->vm_next;
+			continue;
+		}
+
+		*start =3D max(next, args->vma->vm_start);
+		next =3D (next | ~mask) + 1;
+		/* rounded-up boundaries can wrap to 0 */
+		*end =3D next && next < args->vma->vm_end ? next : args->vma->vm_end;
+
+		return true;
+	}
+
+	return false;
+}
+
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
+		struct folio *folio;
+		unsigned long pfn =3D pte_pfn(pte[i]);
+
+		VM_WARN_ON_ONCE(addr < args->vma->vm_start || addr >=3D args->vma->vm_en=
d);
+
+		total++;
+		walk->mm_stats[MM_PTE_TOTAL]++;
+
+		if (!pte_present(pte[i]) || is_zero_pfn(pfn))
+			continue;
+
+		if (WARN_ON_ONCE(pte_devmap(pte[i]) || pte_special(pte[i])))
+			continue;
+
+		if (!pte_young(pte[i])) {
+			walk->mm_stats[MM_PTE_OLD]++;
+			continue;
+		}
+
+		VM_WARN_ON_ONCE(!pfn_valid(pfn));
+		if (pfn < pgdat->node_start_pfn || pfn >=3D pgdat_end_pfn(pgdat))
+			continue;
+
+		folio =3D pfn_folio(pfn);
+		if (folio_nid(folio) !=3D pgdat->node_id)
+			continue;
+
+		if (folio_memcg_rcu(folio) !=3D memcg)
+			continue;
+
+		if (!folio_is_file_lru(folio) && !walk->can_swap)
+			continue;
+
+		if (!ptep_test_and_clear_young(args->vma, addr, pte + i))
+			continue;
+
+		young++;
+		walk->mm_stats[MM_PTE_YOUNG]++;
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
+				  struct mm_walk *args, unsigned long *start)
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
+		__set_bit(i - 1, walk->bitmap);
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
+		struct folio *folio;
+		unsigned long pfn =3D pmd_pfn(pmd[i]);
+		unsigned long addr =3D i ? (*start & PMD_MASK) + i * PMD_SIZE : *start;
+
+		VM_WARN_ON_ONCE(addr < vma->vm_start || addr >=3D vma->vm_end);
+
+		if (!pmd_present(pmd[i]) || is_huge_zero_pmd(pmd[i]))
+			goto next;
+
+		if (WARN_ON_ONCE(pmd_devmap(pmd[i])))
+			goto next;
+
+		if (!pmd_trans_huge(pmd[i])) {
+			if (IS_ENABLED(CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG))
+				pmdp_test_and_clear_young(vma, addr, pmd + i);
+			goto next;
+		}
+
+		VM_WARN_ON_ONCE(!pfn_valid(pfn));
+		if (pfn < pgdat->node_start_pfn || pfn >=3D pgdat_end_pfn(pgdat))
+			goto next;
+
+		folio =3D pfn_folio(pfn);
+		if (folio_nid(folio) !=3D pgdat->node_id)
+			goto next;
+
+		if (folio_memcg_rcu(folio) !=3D memcg)
+			goto next;
+
+		if (!folio_is_file_lru(folio) && !walk->can_swap)
+			goto next;
+
+		if (!pmdp_test_and_clear_young(vma, addr, pmd + i))
+			goto next;
+
+		walk->mm_stats[MM_PTE_YOUNG]++;
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
+		i =3D i > MIN_LRU_BATCH ? 0 :
+		    find_next_bit(walk->bitmap, MIN_LRU_BATCH, i) + 1;
+	} while (i <=3D MIN_LRU_BATCH);
+
+	arch_leave_lazy_mmu_mode();
+	spin_unlock(ptl);
+done:
+	*start =3D -1;
+	bitmap_zero(walk->bitmap, MIN_LRU_BATCH);
+}
+#else
+static void walk_pmd_range_locked(pud_t *pud, unsigned long next, struct v=
m_area_struct *vma,
+				  struct mm_walk *args, unsigned long *start)
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
+		if (!pmd_present(val)) {
+			walk->mm_stats[MM_PTE_TOTAL]++;
+			continue;
+		}
+
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+		if (pmd_trans_huge(val)) {
+			unsigned long pfn =3D pmd_pfn(val);
+			struct pglist_data *pgdat =3D lruvec_pgdat(walk->lruvec);
+
+			walk->mm_stats[MM_PTE_TOTAL]++;
+
+			if (is_huge_zero_pmd(val))
+				continue;
+
+			if (!pmd_young(val)) {
+				walk->mm_stats[MM_PTE_OLD]++;
+				continue;
+			}
+
+			if (pfn < pgdat->node_start_pfn || pfn >=3D pgdat_end_pfn(pgdat))
+				continue;
+
+			walk_pmd_range_locked(pud, addr, vma, args, &pos);
+			continue;
+		}
+#endif
+		walk->mm_stats[MM_PMD_TOTAL]++;
+
+#ifdef CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG
+		if (!pmd_young(val))
+			continue;
+
+		walk_pmd_range_locked(pud, addr, vma, args, &pos);
+#endif
+		if (!walk->force_scan && !test_bloom_filter(walk->lruvec, walk->max_seq,=
 pmd + i))
+			continue;
+
+		walk->mm_stats[MM_PMD_FOUND]++;
+
+		if (!walk_pte_range(&val, addr, next, args))
+			continue;
+
+		walk->mm_stats[MM_PMD_ADDED]++;
+
+		/* carry over to the next generation */
+		update_bloom_filter(walk->lruvec, walk->max_seq + 1, pmd + i);
+	}
+
+	walk_pmd_range_locked(pud, -1, vma, args, &pos);
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
+	/* rounded-up boundaries can wrap to 0 */
+	walk->next_addr =3D end && args->vma ? max(end, args->vma->vm_start) : 0;
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
+
+			if (walk->batched) {
+				spin_lock_irq(&lruvec->lru_lock);
+				reset_batch_size(lruvec, walk);
+				spin_unlock_irq(&lruvec->lru_lock);
+			}
+		}
+
+		mem_cgroup_unlock_pages();
+
+		cond_resched();
+	} while (err =3D=3D -EAGAIN && walk->next_addr && !mm_is_oom_victim(mm));
+}
+
+static struct lru_gen_mm_walk *alloc_mm_walk(void)
+{
+	if (current->reclaim_state && current->reclaim_state->mm_walk)
+		return current->reclaim_state->mm_walk;
+
+	return kzalloc(sizeof(struct lru_gen_mm_walk),
+		       __GFP_HIGH | __GFP_NOMEMALLOC | __GFP_NOWARN);
+}
+
+static void free_mm_walk(struct lru_gen_mm_walk *walk)
+{
+	if (!current->reclaim_state || !current->reclaim_state->mm_walk)
+		kfree(walk);
+}
+
 static void inc_min_seq(struct lruvec *lruvec, int type)
 {
 	struct lru_gen_struct *lrugen =3D &lruvec->lrugen;
@@ -3244,7 +4088,7 @@ static bool try_to_inc_min_seq(struct lruvec *lruvec,=
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
@@ -3254,9 +4098,6 @@ static void inc_max_seq(struct lruvec *lruvec, unsign=
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
@@ -3294,10 +4135,72 @@ static void inc_max_seq(struct lruvec *lruvec, unsi=
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
+	walk =3D alloc_mm_walk();
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
+
+	free_mm_walk(walk);
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
 static long get_nr_evictable(struct lruvec *lruvec, unsigned long max_seq,
 			     unsigned long *min_seq, bool can_swap, bool *need_aging)
 {
@@ -3378,7 +4281,7 @@ static void age_lruvec(struct lruvec *lruvec, struct =
scan_control *sc)
 		nr_to_scan++;
=20
 	if (nr_to_scan && need_aging)
-		inc_max_seq(lruvec, max_seq, swappiness);
+		try_to_inc_max_seq(lruvec, max_seq, sc, swappiness);
 }
=20
 static void lru_gen_age_node(struct pglist_data *pgdat, struct scan_contro=
l *sc)
@@ -3387,6 +4290,8 @@ static void lru_gen_age_node(struct pglist_data *pgda=
t, struct scan_control *sc)
=20
 	VM_WARN_ON_ONCE(!current_is_kswapd());
=20
+	current->reclaim_state->mm_walk =3D &pgdat->mm_walk;
+
 	memcg =3D mem_cgroup_iter(NULL, NULL, NULL);
 	do {
 		struct lruvec *lruvec =3D mem_cgroup_lruvec(memcg, pgdat);
@@ -3395,11 +4300,16 @@ static void lru_gen_age_node(struct pglist_data *pg=
dat, struct scan_control *sc)
=20
 		cond_resched();
 	} while ((memcg =3D mem_cgroup_iter(NULL, memcg, NULL)));
+
+	current->reclaim_state->mm_walk =3D NULL;
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
@@ -3408,6 +4318,8 @@ void lru_gen_look_around(struct page_vma_mapped_walk =
*pvmw)
 	unsigned long start;
 	unsigned long end;
 	unsigned long addr;
+	struct lru_gen_mm_walk *walk;
+	int young =3D 0;
 	unsigned long bitmap[BITS_TO_LONGS(MIN_LRU_BATCH)] =3D {};
 	struct folio *folio =3D pfn_folio(pvmw->pfn);
 	struct mem_cgroup *memcg =3D folio_memcg(folio);
@@ -3469,6 +4381,8 @@ void lru_gen_look_around(struct page_vma_mapped_walk =
*pvmw)
 		if (!ptep_test_and_clear_young(pvmw->vma, addr, pte + i))
 			continue;
=20
+		young++;
+
 		if (pte_dirty(pte[i]) && !folio_test_dirty(folio) &&
 		    !(folio_test_anon(folio) && folio_test_swapbacked(folio) &&
 		      !folio_test_swapcache(folio)))
@@ -3484,7 +4398,13 @@ void lru_gen_look_around(struct page_vma_mapped_walk=
 *pvmw)
 	arch_leave_lazy_mmu_mode();
 	rcu_read_unlock();
=20
-	if (bitmap_weight(bitmap, MIN_LRU_BATCH) < PAGEVEC_SIZE) {
+	/* feedback from rmap walkers to page table walkers */
+	if (suitable_to_scan(i, young))
+		update_bloom_filter(lruvec, max_seq, pvmw->pmd);
+
+	walk =3D current->reclaim_state ? current->reclaim_state->mm_walk : NULL;
+
+	if (!walk && bitmap_weight(bitmap, MIN_LRU_BATCH) < PAGEVEC_SIZE) {
 		for_each_set_bit(i, bitmap, MIN_LRU_BATCH) {
 			folio =3D pfn_folio(pte_pfn(pte[i]));
 			folio_activate(folio);
@@ -3496,8 +4416,10 @@ void lru_gen_look_around(struct page_vma_mapped_walk=
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
@@ -3508,10 +4430,14 @@ void lru_gen_look_around(struct page_vma_mapped_wal=
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
@@ -3782,6 +4708,7 @@ static int evict_folios(struct lruvec *lruvec, struct=
 scan_control *sc, int swap
 	struct folio *folio;
 	enum vm_event_item item;
 	struct reclaim_stat stat;
+	struct lru_gen_mm_walk *walk;
 	struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
 	struct pglist_data *pgdat =3D lruvec_pgdat(lruvec);
=20
@@ -3821,6 +4748,10 @@ static int evict_folios(struct lruvec *lruvec, struc=
t scan_control *sc, int swap
=20
 	move_pages_to_lru(lruvec, &list);
=20
+	walk =3D current->reclaim_state ? current->reclaim_state->mm_walk : NULL;
+	if (walk && walk->batched)
+		reset_batch_size(lruvec, walk);
+
 	item =3D current_is_kswapd() ? PGSTEAL_KSWAPD : PGSTEAL_DIRECT;
 	if (!cgroup_reclaim(sc))
 		__count_vm_events(item, reclaimed);
@@ -3875,20 +4806,25 @@ static long get_nr_to_scan(struct lruvec *lruvec, s=
truct scan_control *sc, bool
 		return 0;
 	}
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
 {
 	struct blk_plug plug;
 	long scanned =3D 0;
+	struct pglist_data *pgdat =3D lruvec_pgdat(lruvec);
=20
 	lru_add_drain();
=20
 	blk_start_plug(&plug);
=20
+	if (current_is_kswapd())
+		current->reclaim_state->mm_walk =3D &pgdat->mm_walk;
+
 	while (true) {
 		int delta;
 		int swappiness;
@@ -3916,6 +4852,9 @@ static void lru_gen_shrink_lruvec(struct lruvec *lruv=
ec, struct scan_control *sc
 		cond_resched();
 	}
=20
+	if (current_is_kswapd())
+		current->reclaim_state->mm_walk =3D NULL;
+
 	blk_finish_plug(&plug);
 }
=20
@@ -3932,15 +4871,21 @@ void lru_gen_init_lruvec(struct lruvec *lruvec)
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
@@ -3948,6 +4893,11 @@ void lru_gen_exit_memcg(struct mem_cgroup *memcg)
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
@@ -3956,6 +4906,7 @@ static int __init init_lru_gen(void)
 {
 	BUILD_BUG_ON(MIN_NR_GENS + 1 >=3D MAX_NR_GENS);
 	BUILD_BUG_ON(BIT(LRU_GEN_WIDTH) <=3D MAX_NR_GENS);
+	BUILD_BUG_ON(sizeof(MM_STAT_CODES) !=3D NR_MM_STATS + 1);
=20
 	return 0;
 };
--=20
2.36.0.550.gb090851708-goog

