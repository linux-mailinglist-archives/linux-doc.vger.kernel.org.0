Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5B2C514C70
	for <lists+linux-doc@lfdr.de>; Fri, 29 Apr 2022 16:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236194AbiD2OOH (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 29 Apr 2022 10:14:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238151AbiD2OOC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Apr 2022 10:14:02 -0400
Received: from out30-45.freemail.mail.aliyun.com (out30-45.freemail.mail.aliyun.com [115.124.30.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 215021A836;
        Fri, 29 Apr 2022 07:10:38 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04400;MF=zhongjiang-ali@linux.alibaba.com;NM=1;PH=DS;RN=41;SR=0;TI=SMTPD_---0VBi52YN_1651241427;
Received: from 30.225.24.120(mailfrom:zhongjiang-ali@linux.alibaba.com fp:SMTPD_---0VBi52YN_1651241427)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 29 Apr 2022 22:10:29 +0800
Message-ID: <ed714a8c-4f36-0b86-0b36-c6708d6f26fb@linux.alibaba.com>
Date:   Fri, 29 Apr 2022 22:10:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:100.0)
 Gecko/20100101 Thunderbird/100.0
Subject: Re: [PATCH v10 08/14] mm: multi-gen LRU: support page table walks
Content-Language: en-US
To:     Yu Zhao <yuzhao@google.com>, Stephen Rothwell <sfr@rothwell.id.au>,
        linux-mm@kvack.org
Cc:     Andi Kleen <ak@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Barry Song <21cnbao@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
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
        linux-kernel@vger.kernel.org, page-reclaim@google.com,
        x86@kernel.org, Brian Geffon <bgeffon@google.com>,
        Jan Alexander Steffens <heftig@archlinux.org>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Steven Barrett <steven@liquorix.net>,
        Suleiman Souhlal <suleiman@google.com>,
        Daniel Byrne <djbyrne@mtu.edu>,
        Donald Carr <d@chaos-reins.com>,
        =?UTF-8?Q?Holger_Hoffst=c3=a4tte?= <holger@applied-asynchrony.com>,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>,
        Shuang Zhai <szhai2@cs.rochester.edu>,
        Sofia Trinh <sofia.trinh@edi.works>,
        Vaibhav Jain <vaibhav@linux.ibm.com>
References: <20220407031525.2368067-1-yuzhao@google.com>
 <20220407031525.2368067-9-yuzhao@google.com>
From:   zhong jiang <zhongjiang-ali@linux.alibaba.com>
In-Reply-To: <20220407031525.2368067-9-yuzhao@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-12.8 required=5.0 tests=BAYES_00,
        ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 2022/4/7 11:15 上午, Yu Zhao wrote:
> To further exploit spatial locality, the aging prefers to walk page
> tables to search for young PTEs and promote hot pages. A kill switch
> will be added in the next patch to disable this behavior. When
> disabled, the aging relies on the rmap only.
>
> NB: this behavior has nothing similar with the page table scanning in
> the 2.4 kernel [1], which searches page tables for old PTEs, adds cold
> pages to swapcache and unmaps them.
>
> To avoid confusion, the term "iteration" specifically means the
> traversal of an entire mm_struct list; the term "walk" will be applied
> to page tables and the rmap, as usual.
>
> An mm_struct list is maintained for each memcg, and an mm_struct
> follows its owner task to the new memcg when this task is migrated.
> Given an lruvec, the aging iterates lruvec_memcg()->mm_list and calls
> walk_page_range() with each mm_struct on this list to promote hot
> pages before it increments max_seq.
>
> When multiple page table walkers iterate the same list, each of them
> gets a unique mm_struct; therefore they can run concurrently. Page
> table walkers ignore any misplaced pages, e.g., if an mm_struct was
> migrated, pages it left in the previous memcg will not be promoted
> when its current memcg is under reclaim. Similarly, page table walkers
> will not promote pages from nodes other than the one under reclaim.
>
> This patch uses the following optimizations when walking page tables:
> 1. It tracks the usage of mm_struct's between context switches so that
>     page table walkers can skip processes that have been sleeping since
>     the last iteration.
> 2. It uses generational Bloom filters to record populated branches so
>     that page table walkers can reduce their search space based on the
>     query results, e.g., to skip page tables containing mostly holes or
>     misplaced pages.
> 3. It takes advantage of the accessed bit in non-leaf PMD entries when
>     CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG=y.
> 4. It does not zigzag between a PGD table and the same PMD table
>     spanning multiple VMAs. IOW, it finishes all the VMAs within the
>     range of the same PMD table before it returns to a PGD table. This
>     improves the cache performance for workloads that have large
>     numbers of tiny VMAs [2], especially when CONFIG_PGTABLE_LEVELS=5.
>
> Server benchmark results:
>    Single workload:
>      fio (buffered I/O): no change
>
>    Single workload:
>      memcached (anon): +[8, 10]%
>                  Ops/sec      KB/sec
>        patch1-7: 1193918.93   46438.15
>        patch1-8: 1301954.44   50640.27
>
>    Configurations:
>      no change
>
> Client benchmark results:
>    kswapd profiles:
>      patch1-7
>        45.90%  lzo1x_1_do_compress (real work)
>         9.14%  page_vma_mapped_walk
>         6.81%  _raw_spin_unlock_irq
>         2.80%  ptep_clear_flush
>         2.34%  __zram_bvec_write
>         2.29%  do_raw_spin_lock
>         1.84%  lru_gen_look_around
>         1.78%  memmove
>         1.74%  obj_malloc
>         1.50%  free_unref_page_list
>
>      patch1-8
>        46.96%  lzo1x_1_do_compress (real work)
>         7.55%  page_vma_mapped_walk
>         5.89%  _raw_spin_unlock_irq
>         3.33%  walk_pte_range
>         2.65%  ptep_clear_flush
>         2.23%  __zram_bvec_write
>         2.08%  do_raw_spin_lock
>         1.83%  memmove
>         1.65%  obj_malloc
>         1.47%  free_unref_page_list
>
>    Configurations:
>      no change
>
> [1] https://lwn.net/Articles/23732/
> [2] https://source.android.com/devices/tech/debug/scudo
>
> Signed-off-by: Yu Zhao <yuzhao@google.com>
> Acked-by: Brian Geffon <bgeffon@google.com>
> Acked-by: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
> Acked-by: Oleksandr Natalenko <oleksandr@natalenko.name>
> Acked-by: Steven Barrett <steven@liquorix.net>
> Acked-by: Suleiman Souhlal <suleiman@google.com>
> Tested-by: Daniel Byrne <djbyrne@mtu.edu>
> Tested-by: Donald Carr <d@chaos-reins.com>
> Tested-by: Holger Hoffstätte <holger@applied-asynchrony.com>
> Tested-by: Konstantin Kharlamov <Hi-Angel@yandex.ru>
> Tested-by: Shuang Zhai <szhai2@cs.rochester.edu>
> Tested-by: Sofia Trinh <sofia.trinh@edi.works>
> Tested-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
>   fs/exec.c                  |   2 +
>   include/linux/memcontrol.h |   5 +
>   include/linux/mm_types.h   |  78 +++
>   include/linux/mmzone.h     |  59 +++
>   include/linux/swap.h       |   4 +
>   kernel/exit.c              |   1 +
>   kernel/fork.c              |   9 +
>   kernel/sched/core.c        |   1 +
>   mm/memcontrol.c            |  24 +
>   mm/vmscan.c                | 975 ++++++++++++++++++++++++++++++++++++-
>   10 files changed, 1144 insertions(+), 14 deletions(-)
>
> diff --git a/fs/exec.c b/fs/exec.c
> index e3e55d5e0be1..bba8fc44926f 100644
> --- a/fs/exec.c
> +++ b/fs/exec.c
> @@ -1011,6 +1011,7 @@ static int exec_mmap(struct mm_struct *mm)
>   	active_mm = tsk->active_mm;
>   	tsk->active_mm = mm;
>   	tsk->mm = mm;
> +	lru_gen_add_mm(mm);
>   	/*
>   	 * This prevents preemption while active_mm is being loaded and
>   	 * it and mm are being updated, which could cause problems for
> @@ -1023,6 +1024,7 @@ static int exec_mmap(struct mm_struct *mm)
>   	activate_mm(active_mm, mm);
>   	if (IS_ENABLED(CONFIG_ARCH_WANT_IRQS_OFF_ACTIVATE_MM))
>   		local_irq_enable();
> +	lru_gen_use_mm(mm);
>   	tsk->mm->vmacache_seqnum = 0;
>   	vmacache_flush(tsk);
>   	task_unlock(tsk);
> diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> index 463168fa1670..954c54652736 100644
> --- a/include/linux/memcontrol.h
> +++ b/include/linux/memcontrol.h
> @@ -344,6 +344,11 @@ struct mem_cgroup {
>   	struct deferred_split deferred_split_queue;
>   #endif
>   
> +#ifdef CONFIG_LRU_GEN
> +	/* per-memcg mm_struct list */
> +	struct lru_gen_mm_list mm_list;
> +#endif
> +
>   	struct mem_cgroup_per_node *nodeinfo[];
>   };
>   
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 8834e38c06a4..eee29f700fab 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -3,6 +3,7 @@
>   #define _LINUX_MM_TYPES_H
>   
>   #include <linux/mm_types_task.h>
> +#include <linux/sched.h>
>   
>   #include <linux/auxvec.h>
>   #include <linux/kref.h>
> @@ -17,6 +18,8 @@
>   #include <linux/page-flags-layout.h>
>   #include <linux/workqueue.h>
>   #include <linux/seqlock.h>
> +#include <linux/nodemask.h>
> +#include <linux/mmdebug.h>
>   
>   #include <asm/mmu.h>
>   
> @@ -655,6 +658,22 @@ struct mm_struct {
>   #ifdef CONFIG_IOMMU_SVA
>   		u32 pasid;
>   #endif
> +#ifdef CONFIG_LRU_GEN
> +		struct {
> +			/* this mm_struct is on lru_gen_mm_list */
> +			struct list_head list;
> +#ifdef CONFIG_MEMCG
> +			/* points to the memcg of "owner" above */
> +			struct mem_cgroup *memcg;
> +#endif
> +			/*
> +			 * Set when switching to this mm_struct, as a hint of
> +			 * whether it has been used since the last time per-node
> +			 * page table walkers cleared the corresponding bits.
> +			 */
> +			nodemask_t nodes;
> +		} lru_gen;
> +#endif /* CONFIG_LRU_GEN */
>   	} __randomize_layout;
>   
>   	/*
> @@ -681,6 +700,65 @@ static inline cpumask_t *mm_cpumask(struct mm_struct *mm)
>   	return (struct cpumask *)&mm->cpu_bitmap;
>   }
>   
> +#ifdef CONFIG_LRU_GEN
> +
> +struct lru_gen_mm_list {
> +	/* mm_struct list for page table walkers */
> +	struct list_head fifo;
> +	/* protects the list above */
> +	spinlock_t lock;
> +};
> +
> +void lru_gen_add_mm(struct mm_struct *mm);
> +void lru_gen_del_mm(struct mm_struct *mm);
> +#ifdef CONFIG_MEMCG
> +void lru_gen_migrate_mm(struct mm_struct *mm);
> +#endif
> +
> +static inline void lru_gen_init_mm(struct mm_struct *mm)
> +{
> +	INIT_LIST_HEAD(&mm->lru_gen.list);
> +#ifdef CONFIG_MEMCG
> +	mm->lru_gen.memcg = NULL;
> +#endif
> +	nodes_clear(mm->lru_gen.nodes);
> +}
> +
> +static inline void lru_gen_use_mm(struct mm_struct *mm)
> +{
> +	/* unlikely but not a bug when racing with lru_gen_migrate_mm() */
> +	VM_WARN_ON(list_empty(&mm->lru_gen.list));
> +
> +	if (!(current->flags & PF_KTHREAD) && !nodes_full(mm->lru_gen.nodes))
> +		nodes_setall(mm->lru_gen.nodes);
> +}
> +
> +#else /* !CONFIG_LRU_GEN */
> +
> +static inline void lru_gen_add_mm(struct mm_struct *mm)
> +{
> +}
> +
> +static inline void lru_gen_del_mm(struct mm_struct *mm)
> +{
> +}
> +
> +#ifdef CONFIG_MEMCG
> +static inline void lru_gen_migrate_mm(struct mm_struct *mm)
> +{
> +}
> +#endif
> +
> +static inline void lru_gen_init_mm(struct mm_struct *mm)
> +{
> +}
> +
> +static inline void lru_gen_use_mm(struct mm_struct *mm)
> +{
> +}
> +
> +#endif /* CONFIG_LRU_GEN */
> +
>   struct mmu_gather;
>   extern void tlb_gather_mmu(struct mmu_gather *tlb, struct mm_struct *mm);
>   extern void tlb_gather_mmu_fullmm(struct mmu_gather *tlb, struct mm_struct *mm);
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index c69589ad2b05..a1a99971ff9c 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -424,6 +424,58 @@ struct lru_gen_struct {
>   	atomic_long_t refaulted[NR_HIST_GENS][ANON_AND_FILE][MAX_NR_TIERS];
>   };
>   
> +enum {
> +	MM_PTE_TOTAL,	/* total leaf entries */
> +	MM_PTE_OLD,	/* old leaf entries */
> +	MM_PTE_YOUNG,	/* young leaf entries */
> +	MM_PMD_TOTAL,	/* total non-leaf entries */
> +	MM_PMD_FOUND,	/* non-leaf entries found in Bloom filters */
> +	MM_PMD_ADDED,	/* non-leaf entries added to Bloom filters */
> +	NR_MM_STATS
> +};
> +
> +/* mnemonic codes for the mm stats above */
> +#define MM_STAT_CODES		"toydfa"
> +
> +/* double-buffering Bloom filters */
> +#define NR_BLOOM_FILTERS	2
> +
> +struct lru_gen_mm_state {
> +	/* set to max_seq after each iteration */
> +	unsigned long seq;
> +	/* where the current iteration starts (inclusive) */
> +	struct list_head *head;
> +	/* where the last iteration ends (exclusive) */
> +	struct list_head *tail;
> +	/* to wait for the last page table walker to finish */
> +	struct wait_queue_head wait;
> +	/* Bloom filters flip after each iteration */
> +	unsigned long *filters[NR_BLOOM_FILTERS];
> +	/* the mm stats for debugging */
> +	unsigned long stats[NR_HIST_GENS][NR_MM_STATS];
> +	/* the number of concurrent page table walkers */
> +	int nr_walkers;
> +};
> +
> +struct lru_gen_mm_walk {
> +	/* the lruvec under reclaim */
> +	struct lruvec *lruvec;
> +	/* unstable max_seq from lru_gen_struct */
> +	unsigned long max_seq;
> +	/* the next address within an mm to scan */
> +	unsigned long next_addr;
> +	/* to batch page table entries */
> +	unsigned long bitmap[BITS_TO_LONGS(MIN_LRU_BATCH)];
> +	/* to batch promoted pages */
> +	int nr_pages[MAX_NR_GENS][ANON_AND_FILE][MAX_NR_ZONES];
> +	/* to batch the mm stats */
> +	int mm_stats[NR_MM_STATS];
> +	/* total batched items */
> +	int batched;
> +	bool can_swap;
> +	bool full_scan;
> +};
> +
>   void lru_gen_init_lruvec(struct lruvec *lruvec);
>   void lru_gen_look_around(struct page_vma_mapped_walk *pvmw);
>   
> @@ -474,6 +526,8 @@ struct lruvec {
>   #ifdef CONFIG_LRU_GEN
>   	/* evictable pages divided into generations */
>   	struct lru_gen_struct		lrugen;
> +	/* to concurrently iterate lru_gen_mm_list */
> +	struct lru_gen_mm_state		mm_state;
>   #endif
>   #ifdef CONFIG_MEMCG
>   	struct pglist_data *pgdat;
> @@ -1067,6 +1121,11 @@ typedef struct pglist_data {
>   
>   	unsigned long		flags;
>   
> +#ifdef CONFIG_LRU_GEN
> +	/* kswap mm walk data */
> +	struct lru_gen_mm_walk	mm_walk;
> +#endif
> +
>   	ZONE_PADDING(_pad2_)
>   
>   	/* Per-node vmstats */
> diff --git a/include/linux/swap.h b/include/linux/swap.h
> index 27093b477c5f..7bdd7bcb135d 100644
> --- a/include/linux/swap.h
> +++ b/include/linux/swap.h
> @@ -137,6 +137,10 @@ union swap_header {
>    */
>   struct reclaim_state {
>   	unsigned long reclaimed_slab;
> +#ifdef CONFIG_LRU_GEN
> +	/* per-thread mm walk data */
> +	struct lru_gen_mm_walk *mm_walk;
> +#endif
>   };
>   
>   #ifdef __KERNEL__
> diff --git a/kernel/exit.c b/kernel/exit.c
> index f072959fcab7..f2d4d48ea790 100644
> --- a/kernel/exit.c
> +++ b/kernel/exit.c
> @@ -466,6 +466,7 @@ void mm_update_next_owner(struct mm_struct *mm)
>   		goto retry;
>   	}
>   	WRITE_ONCE(mm->owner, c);
> +	lru_gen_migrate_mm(mm);
>   	task_unlock(c);
>   	put_task_struct(c);
>   }
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 9796897560ab..d14297ce1151 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -1148,6 +1148,7 @@ static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
>   		goto fail_nocontext;
>   
>   	mm->user_ns = get_user_ns(user_ns);
> +	lru_gen_init_mm(mm);
>   	return mm;
>   
>   fail_nocontext:
> @@ -1191,6 +1192,7 @@ static inline void __mmput(struct mm_struct *mm)
>   	if (mm->binfmt)
>   		module_put(mm->binfmt->module);
>   	mm_pasid_drop(mm);
> +	lru_gen_del_mm(mm);
>   	mmdrop(mm);
>   }
>   
> @@ -2660,6 +2662,13 @@ pid_t kernel_clone(struct kernel_clone_args *args)
>   		get_task_struct(p);
>   	}
>   
> +	if (IS_ENABLED(CONFIG_LRU_GEN) && !(clone_flags & CLONE_VM)) {
> +		/* lock the task to synchronize with memcg migration */
> +		task_lock(p);
> +		lru_gen_add_mm(p->mm);
> +		task_unlock(p);
> +	}
> +
>   	wake_up_new_task(p);
>   
>   	/* forking complete and child started to run, tell ptracer */
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index d575b4914925..88193a0f6d2b 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -5057,6 +5057,7 @@ context_switch(struct rq *rq, struct task_struct *prev,
>   		 * finish_task_switch()'s mmdrop().
>   		 */
>   		switch_mm_irqs_off(prev->active_mm, next->mm, next);
> +		lru_gen_use_mm(next->mm);
>   
>   		if (!prev->mm) {                        // from kernel
>   			/* will mmdrop() in finish_task_switch(). */
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 8069b58f2422..6a76152614c5 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -6083,6 +6083,29 @@ static void mem_cgroup_move_task(void)
>   }
>   #endif
>   
> +#ifdef CONFIG_LRU_GEN
> +static void mem_cgroup_attach(struct cgroup_taskset *tset)
> +{
> +	struct cgroup_subsys_state *css;
> +	struct task_struct *task = NULL;
> +
> +	cgroup_taskset_for_each_leader(task, css, tset)
> +		break;
> +
> +	if (!task)
> +		return;
> +
> +	task_lock(task);
> +	if (task->mm && task->mm->owner == task)
> +		lru_gen_migrate_mm(task->mm);
> +	task_unlock(task);
> +}
> +#else
> +static void mem_cgroup_attach(struct cgroup_taskset *tset)
> +{
> +}
> +#endif /* CONFIG_LRU_GEN */
> +
>   static int seq_puts_memcg_tunable(struct seq_file *m, unsigned long value)
>   {
>   	if (value == PAGE_COUNTER_MAX)
> @@ -6428,6 +6451,7 @@ struct cgroup_subsys memory_cgrp_subsys = {
>   	.css_reset = mem_cgroup_css_reset,
>   	.css_rstat_flush = mem_cgroup_css_rstat_flush,
>   	.can_attach = mem_cgroup_can_attach,
> +	.attach = mem_cgroup_attach,
>   	.cancel_attach = mem_cgroup_cancel_attach,
>   	.post_attach = mem_cgroup_move_task,
>   	.dfl_cftypes = memory_files,
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index f4dd3c3c589b..9e2810a230a4 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -50,6 +50,8 @@
>   #include <linux/printk.h>
>   #include <linux/dax.h>
>   #include <linux/psi.h>
> +#include <linux/pagewalk.h>
> +#include <linux/shmem_fs.h>
>   
>   #include <asm/tlbflush.h>
>   #include <asm/div64.h>
> @@ -3016,7 +3018,7 @@ static int folio_lru_tier(struct folio *folio)
>   	return lru_tier_from_refs(refs);
>   }
>   
> -static struct lruvec __maybe_unused *get_lruvec(struct mem_cgroup *memcg, int nid)
> +static struct lruvec *get_lruvec(struct mem_cgroup *memcg, int nid)
>   {
>   	struct pglist_data *pgdat = NODE_DATA(nid);
>   
> @@ -3061,6 +3063,374 @@ static bool __maybe_unused seq_is_valid(struct lruvec *lruvec)
>   	       get_nr_gens(lruvec, LRU_GEN_ANON) <= MAX_NR_GENS;
>   }
>   
> +/******************************************************************************
> + *                          mm_struct list
> + ******************************************************************************/
> +
> +static struct lru_gen_mm_list *get_mm_list(struct mem_cgroup *memcg)
> +{
> +	static struct lru_gen_mm_list mm_list = {
> +		.fifo = LIST_HEAD_INIT(mm_list.fifo),
> +		.lock = __SPIN_LOCK_UNLOCKED(mm_list.lock),
> +	};
> +
> +#ifdef CONFIG_MEMCG
> +	if (memcg)
> +		return &memcg->mm_list;
> +#endif
> +	VM_BUG_ON(!mem_cgroup_disabled());
> +
> +	return &mm_list;
> +}
> +
> +void lru_gen_add_mm(struct mm_struct *mm)
> +{
> +	int nid;
> +	struct mem_cgroup *memcg = get_mem_cgroup_from_mm(mm);
> +	struct lru_gen_mm_list *mm_list = get_mm_list(memcg);
> +
> +	VM_BUG_ON_MM(!list_empty(&mm->lru_gen.list), mm);
> +#ifdef CONFIG_MEMCG
> +	VM_BUG_ON_MM(mm->lru_gen.memcg, mm);
> +	mm->lru_gen.memcg = memcg;
> +#endif
> +	spin_lock(&mm_list->lock);
> +
> +	for_each_node_state(nid, N_MEMORY) {
> +		struct lruvec *lruvec = get_lruvec(memcg, nid);
> +
> +		if (!lruvec)
> +			continue;
> +
> +		if (lruvec->mm_state.tail == &mm_list->fifo)
> +			lruvec->mm_state.tail = &mm->lru_gen.list;
> +	}
> +
> +	list_add_tail(&mm->lru_gen.list, &mm_list->fifo);
> +
> +	spin_unlock(&mm_list->lock);
> +}
> +
> +void lru_gen_del_mm(struct mm_struct *mm)
> +{
> +	int nid;
> +	struct lru_gen_mm_list *mm_list;
> +	struct mem_cgroup *memcg = NULL;
> +
> +	if (list_empty(&mm->lru_gen.list))
> +		return;
> +
> +#ifdef CONFIG_MEMCG
> +	memcg = mm->lru_gen.memcg;
> +#endif
> +	mm_list = get_mm_list(memcg);
> +
> +	spin_lock(&mm_list->lock);
> +
> +	for_each_node(nid) {
> +		struct lruvec *lruvec = get_lruvec(memcg, nid);
> +
> +		if (!lruvec)
> +			continue;
> +
> +		if (lruvec->mm_state.tail == &mm->lru_gen.list)
> +			lruvec->mm_state.tail = lruvec->mm_state.tail->next;
> +
> +		if (lruvec->mm_state.head != &mm->lru_gen.list)
> +			continue;
> +
> +		lruvec->mm_state.head = lruvec->mm_state.head->next;
> +		if (lruvec->mm_state.head == &mm_list->fifo)
> +			WRITE_ONCE(lruvec->mm_state.seq, lruvec->mm_state.seq + 1);
> +	}
> +
> +	list_del_init(&mm->lru_gen.list);
> +
> +	spin_unlock(&mm_list->lock);
> +
> +#ifdef CONFIG_MEMCG
> +	mem_cgroup_put(mm->lru_gen.memcg);
> +	mm->lru_gen.memcg = NULL;
> +#endif
> +}
> +
> +#ifdef CONFIG_MEMCG
> +void lru_gen_migrate_mm(struct mm_struct *mm)
> +{
> +	struct mem_cgroup *memcg;
> +
> +	lockdep_assert_held(&mm->owner->alloc_lock);
> +
> +	/* for mm_update_next_owner() */
> +	if (mem_cgroup_disabled())
> +		return;
> +
> +	rcu_read_lock();
> +	memcg = mem_cgroup_from_task(mm->owner);
> +	rcu_read_unlock();
> +	if (memcg == mm->lru_gen.memcg)
> +		return;
> +
> +	VM_BUG_ON_MM(!mm->lru_gen.memcg, mm);
> +	VM_BUG_ON_MM(list_empty(&mm->lru_gen.list), mm);
> +
> +	lru_gen_del_mm(mm);
> +	lru_gen_add_mm(mm);
> +}
> +#endif
> +
> +/*
> + * Bloom filters with m=1<<15, k=2 and the false positive rates of ~1/5 when
> + * n=10,000 and ~1/2 when n=20,000, where, conventionally, m is the number of
> + * bits in a bitmap, k is the number of hash functions and n is the number of
> + * inserted items.
> + *
> + * Page table walkers use one of the two filters to reduce their search space.
> + * To get rid of non-leaf entries that no longer have enough leaf entries, the
> + * aging uses the double-buffering technique to flip to the other filter each
> + * time it produces a new generation. For non-leaf entries that have enough
> + * leaf entries, the aging carries them over to the next generation in
> + * walk_pmd_range(); the eviction also report them when walking the rmap
> + * in lru_gen_look_around().
> + *
> + * For future optimizations:
> + * 1. It's not necessary to keep both filters all the time. The spare one can be
> + *    freed after the RCU grace period and reallocated if needed again.
> + * 2. And when reallocating, it's worth scaling its size according to the number
> + *    of inserted entries in the other filter, to reduce the memory overhead on
> + *    small systems and false positives on large systems.
> + * 3. Jenkins' hash function is an alternative to Knuth's.
> + */
> +#define BLOOM_FILTER_SHIFT	15
> +
> +static inline int filter_gen_from_seq(unsigned long seq)
> +{
> +	return seq % NR_BLOOM_FILTERS;
> +}
> +
> +static void get_item_key(void *item, int *key)
> +{
> +	u32 hash = hash_ptr(item, BLOOM_FILTER_SHIFT * 2);
> +
> +	BUILD_BUG_ON(BLOOM_FILTER_SHIFT * 2 > BITS_PER_TYPE(u32));
> +
> +	key[0] = hash & (BIT(BLOOM_FILTER_SHIFT) - 1);
> +	key[1] = hash >> BLOOM_FILTER_SHIFT;
> +}
> +
> +static void reset_bloom_filter(struct lruvec *lruvec, unsigned long seq)
> +{
> +	unsigned long *filter;
> +	int gen = filter_gen_from_seq(seq);
> +
> +	lockdep_assert_held(&get_mm_list(lruvec_memcg(lruvec))->lock);
> +
> +	filter = lruvec->mm_state.filters[gen];
> +	if (filter) {
> +		bitmap_clear(filter, 0, BIT(BLOOM_FILTER_SHIFT));
> +		return;
> +	}
> +
> +	filter = bitmap_zalloc(BIT(BLOOM_FILTER_SHIFT), GFP_ATOMIC);
> +	WRITE_ONCE(lruvec->mm_state.filters[gen], filter);
> +}
> +
> +static void update_bloom_filter(struct lruvec *lruvec, unsigned long seq, void *item)
> +{
> +	int key[2];
> +	unsigned long *filter;
> +	int gen = filter_gen_from_seq(seq);
> +
> +	filter = READ_ONCE(lruvec->mm_state.filters[gen]);
> +	if (!filter)
> +		return;
> +
> +	get_item_key(item, key);
> +
> +	if (!test_bit(key[0], filter))
> +		set_bit(key[0], filter);
> +	if (!test_bit(key[1], filter))
> +		set_bit(key[1], filter);
> +}
> +
> +static bool test_bloom_filter(struct lruvec *lruvec, unsigned long seq, void *item)
> +{
> +	int key[2];
> +	unsigned long *filter;
> +	int gen = filter_gen_from_seq(seq);
> +
> +	filter = READ_ONCE(lruvec->mm_state.filters[gen]);
> +	if (!filter)
> +		return true;
> +
> +	get_item_key(item, key);
> +
> +	return test_bit(key[0], filter) && test_bit(key[1], filter);
> +}
> +
> +static void reset_mm_stats(struct lruvec *lruvec, struct lru_gen_mm_walk *walk, bool last)
> +{
> +	int i;
> +	int hist;
> +
> +	lockdep_assert_held(&get_mm_list(lruvec_memcg(lruvec))->lock);
> +
> +	if (walk) {
> +		hist = lru_hist_from_seq(walk->max_seq);
> +
> +		for (i = 0; i < NR_MM_STATS; i++) {
> +			WRITE_ONCE(lruvec->mm_state.stats[hist][i],
> +				   lruvec->mm_state.stats[hist][i] + walk->mm_stats[i]);
> +			walk->mm_stats[i] = 0;
> +		}
> +	}
> +
> +	if (NR_HIST_GENS > 1 && last) {
> +		hist = lru_hist_from_seq(lruvec->mm_state.seq + 1);
> +
> +		for (i = 0; i < NR_MM_STATS; i++)
> +			WRITE_ONCE(lruvec->mm_state.stats[hist][i], 0);
> +	}
> +}
> +
> +static bool should_skip_mm(struct mm_struct *mm, struct lru_gen_mm_walk *walk)
> +{
> +	int type;
> +	unsigned long size = 0;
> +	struct pglist_data *pgdat = lruvec_pgdat(walk->lruvec);
> +
> +	if (!walk->full_scan && cpumask_empty(mm_cpumask(mm)) &&
> +	    !node_isset(pgdat->node_id, mm->lru_gen.nodes))
> +		return true;
> +
> +	node_clear(pgdat->node_id, mm->lru_gen.nodes);
> +
> +	for (type = !walk->can_swap; type < ANON_AND_FILE; type++) {
> +		size += type ? get_mm_counter(mm, MM_FILEPAGES) :
> +			       get_mm_counter(mm, MM_ANONPAGES) +
> +			       get_mm_counter(mm, MM_SHMEMPAGES);
> +	}
> +
> +	if (size < MIN_LRU_BATCH)
> +		return true;
> +
> +	if (mm_is_oom_victim(mm))
> +		return true;
> +
> +	return !mmget_not_zero(mm);
> +}
> +
> +static bool iterate_mm_list(struct lruvec *lruvec, struct lru_gen_mm_walk *walk,
> +			    struct mm_struct **iter)
> +{
> +	bool first = false;
> +	bool last = true;
> +	struct mm_struct *mm = NULL;
> +	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
> +	struct lru_gen_mm_list *mm_list = get_mm_list(memcg);
> +	struct lru_gen_mm_state *mm_state = &lruvec->mm_state;
> +
> +	/*
> +	 * There are four interesting cases for this page table walker:
> +	 * 1. It tries to start a new iteration of mm_list with a stale max_seq;
> +	 *    there is nothing to be done.
> +	 * 2. It's the first of the current generation, and it needs to reset
> +	 *    the Bloom filter for the next generation.
> +	 * 3. It reaches the end of mm_list, and it needs to increment
> +	 *    mm_state->seq; the iteration is done.
> +	 * 4. It's the last of the current generation, and it needs to reset the
> +	 *    mm stats counters for the next generation.
> +	 */
> +	if (*iter)
> +		mmput_async(*iter);
> +	else if (walk->max_seq <= READ_ONCE(mm_state->seq))
> +		return false;
> +
> +	spin_lock(&mm_list->lock);
> +
> +	VM_BUG_ON(mm_state->seq + 1 < walk->max_seq);
> +	VM_BUG_ON(*iter && mm_state->seq > walk->max_seq);
> +	VM_BUG_ON(*iter && !mm_state->nr_walkers);
> +
> +	if (walk->max_seq <= mm_state->seq) {
> +		if (!*iter)
> +			last = false;
> +		goto done;
> +	}
> +
> +	if (!mm_state->nr_walkers) {
> +		VM_BUG_ON(mm_state->head && mm_state->head != &mm_list->fifo);
> +
> +		mm_state->head = mm_list->fifo.next;
> +		first = true;
> +	}
> +
> +	while (!mm && mm_state->head != &mm_list->fifo) {
> +		mm = list_entry(mm_state->head, struct mm_struct, lru_gen.list);
> +
> +		mm_state->head = mm_state->head->next;
> +
> +		/* full scan for those added after the last iteration */
> +		if (!mm_state->tail || mm_state->tail == &mm->lru_gen.list) {
> +			mm_state->tail = mm_state->head;
> +			walk->full_scan = true;
> +		}
> +

The full_scan seems to be alway true.   because mm_state->tail points to 
the first item in mm_list,  hence the walker's

condition mm_state->tail == &mm->lru_gen.list alway equal.  Am I missing 
something?


Thanks,

> +		if (should_skip_mm(mm, walk))
> +			mm = NULL;
> +	}
> +
> +	if (mm_state->head == &mm_list->fifo)
> +		WRITE_ONCE(mm_state->seq, mm_state->seq + 1);
> +done:
> +	if (*iter && !mm)
> +		mm_state->nr_walkers--;
> +	if (!*iter && mm)
> +		mm_state->nr_walkers++;
> +
> +	if (mm_state->nr_walkers)
> +		last = false;
> +
> +	if (mm && first)
> +		reset_bloom_filter(lruvec, walk->max_seq + 1);
> +
> +	if (*iter || last)
> +		reset_mm_stats(lruvec, walk, last);
> +
> +	spin_unlock(&mm_list->lock);
> +
> +	*iter = mm;
> +
> +	return last;
> +}
> +
> +static bool iterate_mm_list_nowalk(struct lruvec *lruvec, unsigned long max_seq)
> +{
> +	bool success = false;
> +	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
> +	struct lru_gen_mm_list *mm_list = get_mm_list(memcg);
> +	struct lru_gen_mm_state *mm_state = &lruvec->mm_state;
> +
> +	if (max_seq <= READ_ONCE(mm_state->seq))
> +		return false;
> +
> +	spin_lock(&mm_list->lock);
> +
> +	VM_BUG_ON(mm_state->seq + 1 < max_seq);
> +
> +	if (max_seq > mm_state->seq && !mm_state->nr_walkers) {
> +		VM_BUG_ON(mm_state->head && mm_state->head != &mm_list->fifo);
> +
> +		WRITE_ONCE(mm_state->seq, mm_state->seq + 1);
> +		reset_mm_stats(lruvec, NULL, true);
> +		success = true;
> +	}
> +
> +	spin_unlock(&mm_list->lock);
> +
> +	return success;
> +}
> +
>   /******************************************************************************
>    *                          refault feedback loop
>    ******************************************************************************/
> @@ -3214,6 +3584,476 @@ static int folio_inc_gen(struct lruvec *lruvec, struct folio *folio, bool reclai
>   	return new_gen;
>   }
>   
> +static void update_batch_size(struct lru_gen_mm_walk *walk, struct folio *folio,
> +			      int old_gen, int new_gen)
> +{
> +	int type = folio_is_file_lru(folio);
> +	int zone = folio_zonenum(folio);
> +	int delta = folio_nr_pages(folio);
> +
> +	VM_BUG_ON(old_gen >= MAX_NR_GENS);
> +	VM_BUG_ON(new_gen >= MAX_NR_GENS);
> +
> +	walk->batched++;
> +
> +	walk->nr_pages[old_gen][type][zone] -= delta;
> +	walk->nr_pages[new_gen][type][zone] += delta;
> +}
> +
> +static void reset_batch_size(struct lruvec *lruvec, struct lru_gen_mm_walk *walk)
> +{
> +	int gen, type, zone;
> +	struct lru_gen_struct *lrugen = &lruvec->lrugen;
> +
> +	walk->batched = 0;
> +
> +	for_each_gen_type_zone(gen, type, zone) {
> +		enum lru_list lru = type * LRU_INACTIVE_FILE;
> +		int delta = walk->nr_pages[gen][type][zone];
> +
> +		if (!delta)
> +			continue;
> +
> +		walk->nr_pages[gen][type][zone] = 0;
> +		WRITE_ONCE(lrugen->nr_pages[gen][type][zone],
> +			   lrugen->nr_pages[gen][type][zone] + delta);
> +
> +		if (lru_gen_is_active(lruvec, gen))
> +			lru += LRU_ACTIVE;
> +		__update_lru_size(lruvec, lru, zone, delta);
> +	}
> +}
> +
> +static int should_skip_vma(unsigned long start, unsigned long end, struct mm_walk *walk)
> +{
> +	struct address_space *mapping;
> +	struct vm_area_struct *vma = walk->vma;
> +	struct lru_gen_mm_walk *priv = walk->private;
> +
> +	if (!vma_is_accessible(vma) || is_vm_hugetlb_page(vma) ||
> +	    (vma->vm_flags & (VM_LOCKED | VM_SPECIAL | VM_SEQ_READ | VM_RAND_READ)) ||
> +	    vma == get_gate_vma(vma->vm_mm))
> +		return true;
> +
> +	if (vma_is_anonymous(vma))
> +		return !priv->can_swap;
> +
> +	if (WARN_ON_ONCE(!vma->vm_file || !vma->vm_file->f_mapping))
> +		return true;
> +
> +	mapping = vma->vm_file->f_mapping;
> +	if (mapping_unevictable(mapping))
> +		return true;
> +
> +	/* check readpage to exclude special mappings like dax, etc. */
> +	return shmem_mapping(mapping) ? !priv->can_swap : !mapping->a_ops->readpage;
> +}
> +
> +/*
> + * Some userspace memory allocators map many single-page VMAs. Instead of
> + * returning back to the PGD table for each of such VMAs, finish an entire PMD
> + * table to reduce zigzags and improve cache performance.
> + */
> +static bool get_next_vma(struct mm_walk *walk, unsigned long mask, unsigned long size,
> +			 unsigned long *start, unsigned long *end)
> +{
> +	unsigned long next = round_up(*end, size);
> +
> +	VM_BUG_ON(mask & size);
> +	VM_BUG_ON(*start >= *end);
> +	VM_BUG_ON((next & mask) != (*start & mask));
> +
> +	while (walk->vma) {
> +		if (next >= walk->vma->vm_end) {
> +			walk->vma = walk->vma->vm_next;
> +			continue;
> +		}
> +
> +		if ((next & mask) != (walk->vma->vm_start & mask))
> +			return false;
> +
> +		if (should_skip_vma(walk->vma->vm_start, walk->vma->vm_end, walk)) {
> +			walk->vma = walk->vma->vm_next;
> +			continue;
> +		}
> +
> +		*start = max(next, walk->vma->vm_start);
> +		next = (next | ~mask) + 1;
> +		/* rounded-up boundaries can wrap to 0 */
> +		*end = next && next < walk->vma->vm_end ? next : walk->vma->vm_end;
> +
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +static bool suitable_to_scan(int total, int young)
> +{
> +	int n = clamp_t(int, cache_line_size() / sizeof(pte_t), 2, 8);
> +
> +	/* suitable if the average number of young PTEs per cacheline is >=1 */
> +	return young * n >= total;
> +}
> +
> +static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
> +			   struct mm_walk *walk)
> +{
> +	int i;
> +	pte_t *pte;
> +	spinlock_t *ptl;
> +	unsigned long addr;
> +	int total = 0;
> +	int young = 0;
> +	struct lru_gen_mm_walk *priv = walk->private;
> +	struct mem_cgroup *memcg = lruvec_memcg(priv->lruvec);
> +	struct pglist_data *pgdat = lruvec_pgdat(priv->lruvec);
> +	int old_gen, new_gen = lru_gen_from_seq(priv->max_seq);
> +
> +	VM_BUG_ON(pmd_leaf(*pmd));
> +
> +	ptl = pte_lockptr(walk->mm, pmd);
> +	if (!spin_trylock(ptl))
> +		return false;
> +
> +	arch_enter_lazy_mmu_mode();
> +
> +	pte = pte_offset_map(pmd, start & PMD_MASK);
> +restart:
> +	for (i = pte_index(start), addr = start; addr != end; i++, addr += PAGE_SIZE) {
> +		struct folio *folio;
> +		unsigned long pfn = pte_pfn(pte[i]);
> +
> +		VM_BUG_ON(addr < walk->vma->vm_start || addr >= walk->vma->vm_end);
> +
> +		total++;
> +		priv->mm_stats[MM_PTE_TOTAL]++;
> +
> +		if (!pte_present(pte[i]) || is_zero_pfn(pfn))
> +			continue;
> +
> +		if (WARN_ON_ONCE(pte_devmap(pte[i]) || pte_special(pte[i])))
> +			continue;
> +
> +		if (!pte_young(pte[i])) {
> +			priv->mm_stats[MM_PTE_OLD]++;
> +			continue;
> +		}
> +
> +		VM_BUG_ON(!pfn_valid(pfn));
> +		if (pfn < pgdat->node_start_pfn || pfn >= pgdat_end_pfn(pgdat))
> +			continue;
> +
> +		folio = pfn_folio(pfn);
> +		if (folio_nid(folio) != pgdat->node_id)
> +			continue;
> +
> +		if (folio_memcg_rcu(folio) != memcg)
> +			continue;
> +
> +		if (!ptep_test_and_clear_young(walk->vma, addr, pte + i))
> +			continue;
> +
> +		young++;
> +		priv->mm_stats[MM_PTE_YOUNG]++;
> +
> +		if (pte_dirty(pte[i]) && !folio_test_dirty(folio) &&
> +		    !(folio_test_anon(folio) && folio_test_swapbacked(folio) &&
> +		      !folio_test_swapcache(folio)))
> +			folio_mark_dirty(folio);
> +
> +		old_gen = folio_update_gen(folio, new_gen);
> +		if (old_gen >= 0 && old_gen != new_gen)
> +			update_batch_size(priv, folio, old_gen, new_gen);
> +	}
> +
> +	if (i < PTRS_PER_PTE && get_next_vma(walk, PMD_MASK, PAGE_SIZE, &start, &end))
> +		goto restart;
> +
> +	pte_unmap(pte);
> +
> +	arch_leave_lazy_mmu_mode();
> +	spin_unlock(ptl);
> +
> +	return suitable_to_scan(total, young);
> +}
> +
> +#if defined(CONFIG_TRANSPARENT_HUGEPAGE) || defined(CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG)
> +static void walk_pmd_range_locked(pud_t *pud, unsigned long next, struct vm_area_struct *vma,
> +				  struct mm_walk *walk, unsigned long *start)
> +{
> +	int i;
> +	pmd_t *pmd;
> +	spinlock_t *ptl;
> +	struct lru_gen_mm_walk *priv = walk->private;
> +	struct mem_cgroup *memcg = lruvec_memcg(priv->lruvec);
> +	struct pglist_data *pgdat = lruvec_pgdat(priv->lruvec);
> +	int old_gen, new_gen = lru_gen_from_seq(priv->max_seq);
> +
> +	VM_BUG_ON(pud_leaf(*pud));
> +
> +	/* try to batch at most 1+MIN_LRU_BATCH+1 entries */
> +	if (*start == -1) {
> +		*start = next;
> +		return;
> +	}
> +
> +	i = next == -1 ? 0 : pmd_index(next) - pmd_index(*start);
> +	if (i && i <= MIN_LRU_BATCH) {
> +		__set_bit(i - 1, priv->bitmap);
> +		return;
> +	}
> +
> +	pmd = pmd_offset(pud, *start);
> +
> +	ptl = pmd_lockptr(walk->mm, pmd);
> +	if (!spin_trylock(ptl))
> +		goto done;
> +
> +	arch_enter_lazy_mmu_mode();
> +
> +	do {
> +		struct folio *folio;
> +		unsigned long pfn = pmd_pfn(pmd[i]);
> +		unsigned long addr = i ? (*start & PMD_MASK) + i * PMD_SIZE : *start;
> +
> +		VM_BUG_ON(addr < vma->vm_start || addr >= vma->vm_end);
> +
> +		if (!pmd_present(pmd[i]) || is_huge_zero_pmd(pmd[i]))
> +			goto next;
> +
> +		if (WARN_ON_ONCE(pmd_devmap(pmd[i])))
> +			goto next;
> +
> +		if (!pmd_trans_huge(pmd[i])) {
> +			if (IS_ENABLED(CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG))
> +				pmdp_test_and_clear_young(vma, addr, pmd + i);
> +			goto next;
> +		}
> +
> +		VM_BUG_ON(!pfn_valid(pfn));
> +		if (pfn < pgdat->node_start_pfn || pfn >= pgdat_end_pfn(pgdat))
> +			goto next;
> +
> +		folio = pfn_folio(pfn);
> +		if (folio_nid(folio) != pgdat->node_id)
> +			goto next;
> +
> +		if (folio_memcg_rcu(folio) != memcg)
> +			goto next;
> +
> +		if (!pmdp_test_and_clear_young(vma, addr, pmd + i))
> +			goto next;
> +
> +		priv->mm_stats[MM_PTE_YOUNG]++;
> +
> +		if (pmd_dirty(pmd[i]) && !folio_test_dirty(folio) &&
> +		    !(folio_test_anon(folio) && folio_test_swapbacked(folio) &&
> +		      !folio_test_swapcache(folio)))
> +			folio_mark_dirty(folio);
> +
> +		old_gen = folio_update_gen(folio, new_gen);
> +		if (old_gen >= 0 && old_gen != new_gen)
> +			update_batch_size(priv, folio, old_gen, new_gen);
> +next:
> +		i = i > MIN_LRU_BATCH ? 0 :
> +		    find_next_bit(priv->bitmap, MIN_LRU_BATCH, i) + 1;
> +	} while (i <= MIN_LRU_BATCH);
> +
> +	arch_leave_lazy_mmu_mode();
> +	spin_unlock(ptl);
> +done:
> +	*start = -1;
> +	bitmap_zero(priv->bitmap, MIN_LRU_BATCH);
> +}
> +#else
> +static void walk_pmd_range_locked(pud_t *pud, unsigned long next, struct vm_area_struct *vma,
> +				  struct mm_walk *walk, unsigned long *start)
> +{
> +}
> +#endif
> +
> +static void walk_pmd_range(pud_t *pud, unsigned long start, unsigned long end,
> +			   struct mm_walk *walk)
> +{
> +	int i;
> +	pmd_t *pmd;
> +	unsigned long next;
> +	unsigned long addr;
> +	struct vm_area_struct *vma;
> +	unsigned long pos = -1;
> +	struct lru_gen_mm_walk *priv = walk->private;
> +
> +	VM_BUG_ON(pud_leaf(*pud));
> +
> +	/*
> +	 * Finish an entire PMD in two passes: the first only reaches to PTE
> +	 * tables to avoid taking the PMD lock; the second, if necessary, takes
> +	 * the PMD lock to clear the accessed bit in PMD entries.
> +	 */
> +	pmd = pmd_offset(pud, start & PUD_MASK);
> +restart:
> +	/* walk_pte_range() may call get_next_vma() */
> +	vma = walk->vma;
> +	for (i = pmd_index(start), addr = start; addr != end; i++, addr = next) {
> +		pmd_t val = pmd_read_atomic(pmd + i);
> +
> +		/* for pmd_read_atomic() */
> +		barrier();
> +
> +		next = pmd_addr_end(addr, end);
> +
> +		if (!pmd_present(val)) {
> +			priv->mm_stats[MM_PTE_TOTAL]++;
> +			continue;
> +		}
> +
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +		if (pmd_trans_huge(val)) {
> +			unsigned long pfn = pmd_pfn(val);
> +			struct pglist_data *pgdat = lruvec_pgdat(priv->lruvec);
> +
> +			priv->mm_stats[MM_PTE_TOTAL]++;
> +
> +			if (is_huge_zero_pmd(val))
> +				continue;
> +
> +			if (!pmd_young(val)) {
> +				priv->mm_stats[MM_PTE_OLD]++;
> +				continue;
> +			}
> +
> +			if (pfn < pgdat->node_start_pfn || pfn >= pgdat_end_pfn(pgdat))
> +				continue;
> +
> +			walk_pmd_range_locked(pud, addr, vma, walk, &pos);
> +			continue;
> +		}
> +#endif
> +		priv->mm_stats[MM_PMD_TOTAL]++;
> +
> +#ifdef CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG
> +		if (!pmd_young(val))
> +			continue;
> +
> +		walk_pmd_range_locked(pud, addr, vma, walk, &pos);
> +#endif
> +		if (!priv->full_scan && !test_bloom_filter(priv->lruvec, priv->max_seq, pmd + i))
> +			continue;
> +
> +		priv->mm_stats[MM_PMD_FOUND]++;
> +
> +		if (!walk_pte_range(&val, addr, next, walk))
> +			continue;
> +
> +		priv->mm_stats[MM_PMD_ADDED]++;
> +
> +		/* carry over to the next generation */
> +		update_bloom_filter(priv->lruvec, priv->max_seq + 1, pmd + i);
> +	}
> +
> +	walk_pmd_range_locked(pud, -1, vma, walk, &pos);
> +
> +	if (i < PTRS_PER_PMD && get_next_vma(walk, PUD_MASK, PMD_SIZE, &start, &end))
> +		goto restart;
> +}
> +
> +static int walk_pud_range(p4d_t *p4d, unsigned long start, unsigned long end,
> +			  struct mm_walk *walk)
> +{
> +	int i;
> +	pud_t *pud;
> +	unsigned long addr;
> +	unsigned long next;
> +	struct lru_gen_mm_walk *priv = walk->private;
> +
> +	VM_BUG_ON(p4d_leaf(*p4d));
> +
> +	pud = pud_offset(p4d, start & P4D_MASK);
> +restart:
> +	for (i = pud_index(start), addr = start; addr != end; i++, addr = next) {
> +		pud_t val = READ_ONCE(pud[i]);
> +
> +		next = pud_addr_end(addr, end);
> +
> +		if (!pud_present(val) || WARN_ON_ONCE(pud_leaf(val)))
> +			continue;
> +
> +		walk_pmd_range(&val, addr, next, walk);
> +
> +		if (priv->batched >= MAX_LRU_BATCH) {
> +			end = (addr | ~PUD_MASK) + 1;
> +			goto done;
> +		}
> +	}
> +
> +	if (i < PTRS_PER_PUD && get_next_vma(walk, P4D_MASK, PUD_SIZE, &start, &end))
> +		goto restart;
> +
> +	end = round_up(end, P4D_SIZE);
> +done:
> +	/* rounded-up boundaries can wrap to 0 */
> +	priv->next_addr = end && walk->vma ? max(end, walk->vma->vm_start) : 0;
> +
> +	return -EAGAIN;
> +}
> +
> +static void walk_mm(struct lruvec *lruvec, struct mm_struct *mm, struct lru_gen_mm_walk *walk)
> +{
> +	static const struct mm_walk_ops mm_walk_ops = {
> +		.test_walk = should_skip_vma,
> +		.p4d_entry = walk_pud_range,
> +	};
> +
> +	int err;
> +	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
> +
> +	walk->next_addr = FIRST_USER_ADDRESS;
> +
> +	do {
> +		err = -EBUSY;
> +
> +		/* folio_update_gen() requires stable folio_memcg() */
> +		if (!mem_cgroup_trylock_pages(memcg))
> +			break;
> +
> +		/* the caller might be holding the lock for write */
> +		if (mmap_read_trylock(mm)) {
> +			unsigned long start = walk->next_addr;
> +			unsigned long end = mm->highest_vm_end;
> +
> +			err = walk_page_range(mm, start, end, &mm_walk_ops, walk);
> +
> +			mmap_read_unlock(mm);
> +
> +			if (walk->batched) {
> +				spin_lock_irq(&lruvec->lru_lock);
> +				reset_batch_size(lruvec, walk);
> +				spin_unlock_irq(&lruvec->lru_lock);
> +			}
> +		}
> +
> +		mem_cgroup_unlock_pages();
> +
> +		cond_resched();
> +	} while (err == -EAGAIN && walk->next_addr && !mm_is_oom_victim(mm));
> +}
> +
> +static struct lru_gen_mm_walk *alloc_mm_walk(void)
> +{
> +	if (current->reclaim_state && current->reclaim_state->mm_walk)
> +		return current->reclaim_state->mm_walk;
> +
> +	return kzalloc(sizeof(struct lru_gen_mm_walk),
> +		       __GFP_HIGH | __GFP_NOMEMALLOC | __GFP_NOWARN);
> +}
> +
> +static void free_mm_walk(struct lru_gen_mm_walk *walk)
> +{
> +	if (!current->reclaim_state || !current->reclaim_state->mm_walk)
> +		kfree(walk);
> +}
> +
>   static void inc_min_seq(struct lruvec *lruvec)
>   {
>   	int type;
> @@ -3272,7 +4112,7 @@ static bool try_to_inc_min_seq(struct lruvec *lruvec, bool can_swap)
>   	return success;
>   }
>   
> -static void inc_max_seq(struct lruvec *lruvec, unsigned long max_seq)
> +static void inc_max_seq(struct lruvec *lruvec)
>   {
>   	int prev, next;
>   	int type, zone;
> @@ -3282,9 +4122,6 @@ static void inc_max_seq(struct lruvec *lruvec, unsigned long max_seq)
>   
>   	VM_BUG_ON(!seq_is_valid(lruvec));
>   
> -	if (max_seq != lrugen->max_seq)
> -		goto unlock;
> -
>   	inc_min_seq(lruvec);
>   
>   	/*
> @@ -3316,10 +4153,72 @@ static void inc_max_seq(struct lruvec *lruvec, unsigned long max_seq)
>   
>   	/* make sure preceding modifications appear */
>   	smp_store_release(&lrugen->max_seq, lrugen->max_seq + 1);
> -unlock:
> +
>   	spin_unlock_irq(&lruvec->lru_lock);
>   }
>   
> +static bool try_to_inc_max_seq(struct lruvec *lruvec, unsigned long max_seq,
> +			       struct scan_control *sc, bool can_swap, bool full_scan)
> +{
> +	bool success;
> +	struct lru_gen_mm_walk *walk;
> +	struct mm_struct *mm = NULL;
> +	struct lru_gen_struct *lrugen = &lruvec->lrugen;
> +
> +	VM_BUG_ON(max_seq > READ_ONCE(lrugen->max_seq));
> +
> +	/*
> +	 * If the hardware doesn't automatically set the accessed bit, fallback
> +	 * to lru_gen_look_around(), which only clears the accessed bit in a
> +	 * handful of PTEs. Spreading the work out over a period of time usually
> +	 * is less efficient, but it avoids bursty page faults.
> +	 */
> +	if (!full_scan && !arch_has_hw_pte_young()) {
> +		success = iterate_mm_list_nowalk(lruvec, max_seq);
> +		goto done;
> +	}
> +
> +	walk = alloc_mm_walk();
> +	if (!walk) {
> +		success = iterate_mm_list_nowalk(lruvec, max_seq);
> +		goto done;
> +	}
> +
> +	walk->lruvec = lruvec;
> +	walk->max_seq = max_seq;
> +	walk->can_swap = can_swap;
> +	walk->full_scan = full_scan;
> +
> +	do {
> +		success = iterate_mm_list(lruvec, walk, &mm);
> +		if (mm)
> +			walk_mm(lruvec, mm, walk);
> +
> +		cond_resched();
> +	} while (mm);
> +
> +	free_mm_walk(walk);
> +done:
> +	if (!success) {
> +		if (!current_is_kswapd() && !sc->priority)
> +			wait_event_killable(lruvec->mm_state.wait,
> +					    max_seq < READ_ONCE(lrugen->max_seq));
> +
> +		return max_seq < READ_ONCE(lrugen->max_seq);
> +	}
> +
> +	VM_BUG_ON(max_seq != READ_ONCE(lrugen->max_seq));
> +
> +	inc_max_seq(lruvec);
> +	/* either this sees any waiters or they will see updated max_seq */
> +	if (wq_has_sleeper(&lruvec->mm_state.wait))
> +		wake_up_all(&lruvec->mm_state.wait);
> +
> +	wakeup_flusher_threads(WB_REASON_VMSCAN);
> +
> +	return true;
> +}
> +
>   static long get_nr_evictable(struct lruvec *lruvec, unsigned long max_seq,
>   			     unsigned long *min_seq, bool can_swap, bool *need_aging)
>   {
> @@ -3401,7 +4300,7 @@ static void age_lruvec(struct lruvec *lruvec, struct scan_control *sc)
>   		nr_to_scan++;
>   
>   	if (nr_to_scan && need_aging && (!mem_cgroup_below_low(memcg) || sc->memcg_low_reclaim))
> -		inc_max_seq(lruvec, max_seq);
> +		try_to_inc_max_seq(lruvec, max_seq, sc, swappiness, false);
>   }
>   
>   static void lru_gen_age_node(struct pglist_data *pgdat, struct scan_control *sc)
> @@ -3410,6 +4309,8 @@ static void lru_gen_age_node(struct pglist_data *pgdat, struct scan_control *sc)
>   
>   	VM_BUG_ON(!current_is_kswapd());
>   
> +	current->reclaim_state->mm_walk = &pgdat->mm_walk;
> +
>   	memcg = mem_cgroup_iter(NULL, NULL, NULL);
>   	do {
>   		struct lruvec *lruvec = mem_cgroup_lruvec(memcg, pgdat);
> @@ -3418,11 +4319,16 @@ static void lru_gen_age_node(struct pglist_data *pgdat, struct scan_control *sc)
>   
>   		cond_resched();
>   	} while ((memcg = mem_cgroup_iter(NULL, memcg, NULL)));
> +
> +	current->reclaim_state->mm_walk = NULL;
>   }
>   
>   /*
>    * This function exploits spatial locality when shrink_page_list() walks the
>    * rmap. It scans the adjacent PTEs of a young PTE and promotes hot pages.
> + * If the scan was done cacheline efficiently, it adds the PMD entry pointing
> + * to the PTE table to the Bloom filter. This process is a feedback loop from
> + * the eviction to the aging.
>    */
>   void lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
>   {
> @@ -3431,6 +4337,8 @@ void lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
>   	unsigned long start;
>   	unsigned long end;
>   	unsigned long addr;
> +	struct lru_gen_mm_walk *walk;
> +	int young = 0;
>   	unsigned long bitmap[BITS_TO_LONGS(MIN_LRU_BATCH)] = {};
>   	struct folio *folio = pfn_folio(pvmw->pfn);
>   	struct mem_cgroup *memcg = folio_memcg(folio);
> @@ -3492,6 +4400,8 @@ void lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
>   		if (!ptep_test_and_clear_young(pvmw->vma, addr, pte + i))
>   			continue;
>   
> +		young++;
> +
>   		if (pte_dirty(pte[i]) && !folio_test_dirty(folio) &&
>   		    !(folio_test_anon(folio) && folio_test_swapbacked(folio) &&
>   		      !folio_test_swapcache(folio)))
> @@ -3507,7 +4417,13 @@ void lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
>   	arch_leave_lazy_mmu_mode();
>   	rcu_read_unlock();
>   
> -	if (bitmap_weight(bitmap, MIN_LRU_BATCH) < PAGEVEC_SIZE) {
> +	/* feedback from rmap walkers to page table walkers */
> +	if (suitable_to_scan(i, young))
> +		update_bloom_filter(lruvec, max_seq, pvmw->pmd);
> +
> +	walk = current->reclaim_state ? current->reclaim_state->mm_walk : NULL;
> +
> +	if (!walk && bitmap_weight(bitmap, MIN_LRU_BATCH) < PAGEVEC_SIZE) {
>   		for_each_set_bit(i, bitmap, MIN_LRU_BATCH) {
>   			folio = pfn_folio(pte_pfn(pte[i]));
>   			folio_activate(folio);
> @@ -3519,8 +4435,10 @@ void lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
>   	if (!mem_cgroup_trylock_pages(memcg))
>   		return;
>   
> -	spin_lock_irq(&lruvec->lru_lock);
> -	new_gen = lru_gen_from_seq(lruvec->lrugen.max_seq);
> +	if (!walk) {
> +		spin_lock_irq(&lruvec->lru_lock);
> +		new_gen = lru_gen_from_seq(lruvec->lrugen.max_seq);
> +	}
>   
>   	for_each_set_bit(i, bitmap, MIN_LRU_BATCH) {
>   		folio = pfn_folio(pte_pfn(pte[i]));
> @@ -3531,10 +4449,14 @@ void lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
>   		if (old_gen < 0 || old_gen == new_gen)
>   			continue;
>   
> -		lru_gen_update_size(lruvec, folio, old_gen, new_gen);
> +		if (walk)
> +			update_batch_size(walk, folio, old_gen, new_gen);
> +		else
> +			lru_gen_update_size(lruvec, folio, old_gen, new_gen);
>   	}
>   
> -	spin_unlock_irq(&lruvec->lru_lock);
> +	if (!walk)
> +		spin_unlock_irq(&lruvec->lru_lock);
>   
>   	mem_cgroup_unlock_pages();
>   }
> @@ -3801,6 +4723,7 @@ static int evict_folios(struct lruvec *lruvec, struct scan_control *sc, int swap
>   	struct folio *folio;
>   	enum vm_event_item item;
>   	struct reclaim_stat stat;
> +	struct lru_gen_mm_walk *walk;
>   	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
>   	struct pglist_data *pgdat = lruvec_pgdat(lruvec);
>   
> @@ -3840,6 +4763,10 @@ static int evict_folios(struct lruvec *lruvec, struct scan_control *sc, int swap
>   
>   	move_pages_to_lru(lruvec, &list);
>   
> +	walk = current->reclaim_state ? current->reclaim_state->mm_walk : NULL;
> +	if (walk && walk->batched)
> +		reset_batch_size(lruvec, walk);
> +
>   	item = current_is_kswapd() ? PGSTEAL_KSWAPD : PGSTEAL_DIRECT;
>   	if (!cgroup_reclaim(sc))
>   		__count_vm_events(item, reclaimed);
> @@ -3894,20 +4821,25 @@ static long get_nr_to_scan(struct lruvec *lruvec, struct scan_control *sc, bool
>   		return 0;
>   	}
>   
> -	inc_max_seq(lruvec, max_seq);
> +	if (try_to_inc_max_seq(lruvec, max_seq, sc, can_swap, false))
> +		return nr_to_scan;
>   
> -	return nr_to_scan;
> +	return min_seq[LRU_GEN_FILE] + MIN_NR_GENS <= max_seq ? nr_to_scan : 0;
>   }
>   
>   static void lru_gen_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
>   {
>   	struct blk_plug plug;
>   	long scanned = 0;
> +	struct pglist_data *pgdat = lruvec_pgdat(lruvec);
>   
>   	lru_add_drain();
>   
>   	blk_start_plug(&plug);
>   
> +	if (current_is_kswapd())
> +		current->reclaim_state->mm_walk = &pgdat->mm_walk;
> +
>   	while (true) {
>   		int delta;
>   		int swappiness;
> @@ -3935,6 +4867,9 @@ static void lru_gen_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc
>   		cond_resched();
>   	}
>   
> +	if (current_is_kswapd())
> +		current->reclaim_state->mm_walk = NULL;
> +
>   	blk_finish_plug(&plug);
>   }
>   
> @@ -3951,15 +4886,21 @@ void lru_gen_init_lruvec(struct lruvec *lruvec)
>   
>   	for_each_gen_type_zone(gen, type, zone)
>   		INIT_LIST_HEAD(&lrugen->lists[gen][type][zone]);
> +
> +	lruvec->mm_state.seq = MIN_NR_GENS;
> +	init_waitqueue_head(&lruvec->mm_state.wait);
>   }
>   
>   #ifdef CONFIG_MEMCG
>   void lru_gen_init_memcg(struct mem_cgroup *memcg)
>   {
> +	INIT_LIST_HEAD(&memcg->mm_list.fifo);
> +	spin_lock_init(&memcg->mm_list.lock);
>   }
>   
>   void lru_gen_exit_memcg(struct mem_cgroup *memcg)
>   {
> +	int i;
>   	int nid;
>   
>   	for_each_node(nid) {
> @@ -3967,6 +4908,11 @@ void lru_gen_exit_memcg(struct mem_cgroup *memcg)
>   
>   		VM_BUG_ON(memchr_inv(lruvec->lrugen.nr_pages, 0,
>   				     sizeof(lruvec->lrugen.nr_pages)));
> +
> +		for (i = 0; i < NR_BLOOM_FILTERS; i++) {
> +			bitmap_free(lruvec->mm_state.filters[i]);
> +			lruvec->mm_state.filters[i] = NULL;
> +		}
>   	}
>   }
>   #endif
> @@ -3975,6 +4921,7 @@ static int __init init_lru_gen(void)
>   {
>   	BUILD_BUG_ON(MIN_NR_GENS + 1 >= MAX_NR_GENS);
>   	BUILD_BUG_ON(BIT(LRU_GEN_WIDTH) <= MAX_NR_GENS);
> +	BUILD_BUG_ON(sizeof(MM_STAT_CODES) != NR_MM_STATS + 1);
>   
>   	return 0;
>   };
