Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF5F54432F
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jun 2022 07:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234804AbiFIFdg (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 9 Jun 2022 01:33:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238450AbiFIFda (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Jun 2022 01:33:30 -0400
Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D84A75A145;
        Wed,  8 Jun 2022 22:33:25 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R721e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=zhongjiang-ali@linux.alibaba.com;NM=1;PH=DS;RN=38;SR=0;TI=SMTPD_---0VFrC0JA_1654752794;
Received: from 30.225.24.138(mailfrom:zhongjiang-ali@linux.alibaba.com fp:SMTPD_---0VFrC0JA_1654752794)
          by smtp.aliyun-inc.com;
          Thu, 09 Jun 2022 13:33:17 +0800
Message-ID: <0f0bbb29-868d-1548-35f1-f446b65113ad@linux.alibaba.com>
Date:   Thu, 9 Jun 2022 13:33:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:101.0)
 Gecko/20100101 Thunderbird/101.0
Subject: Re: [PATCH v11 05/14] mm: multi-gen LRU: groundwork
Content-Language: en-US
To:     Yu Zhao <yuzhao@google.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
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
        page-reclaim@google.com, Brian Geffon <bgeffon@google.com>,
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
References: <20220518014632.922072-1-yuzhao@google.com>
 <20220518014632.922072-6-yuzhao@google.com>
From:   zhong jiang <zhongjiang-ali@linux.alibaba.com>
In-Reply-To: <20220518014632.922072-6-yuzhao@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-11.1 required=5.0 tests=BAYES_00,
        ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED,
        USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 2022/5/18 9:46 上午, Yu Zhao wrote:
> Evictable pages are divided into multiple generations for each lruvec.
> The youngest generation number is stored in lrugen->max_seq for both
> anon and file types as they are aged on an equal footing. The oldest
> generation numbers are stored in lrugen->min_seq[] separately for anon
> and file types as clean file pages can be evicted regardless of swap
> constraints. These three variables are monotonically increasing.
>
> Generation numbers are truncated into order_base_2(MAX_NR_GENS+1) bits
> in order to fit into the gen counter in folio->flags. Each truncated
> generation number is an index to lrugen->lists[]. The sliding window
> technique is used to track at least MIN_NR_GENS and at most
> MAX_NR_GENS generations. The gen counter stores a value within [1,
> MAX_NR_GENS] while a page is on one of lrugen->lists[]. Otherwise it
> stores 0.
>
> There are two conceptually independent procedures: "the aging", which
> produces young generations, and "the eviction", which consumes old
> generations. They form a closed-loop system, i.e., "the page reclaim".
> Both procedures can be invoked from userspace for the purposes of
> working set estimation and proactive reclaim. These techniques are
> commonly used to optimize job scheduling (bin packing) in data
> centers [1][2].
>
> To avoid confusion, the terms "hot" and "cold" will be applied to the
> multi-gen LRU, as a new convention; the terms "active" and "inactive"
> will be applied to the active/inactive LRU, as usual.
>
> The protection of hot pages and the selection of cold pages are based
> on page access channels and patterns. There are two access channels:
> one through page tables and the other through file descriptors. The
> protection of the former channel is by design stronger because:
> 1. The uncertainty in determining the access patterns of the former
>     channel is higher due to the approximation of the accessed bit.
> 2. The cost of evicting the former channel is higher due to the TLB
>     flushes required and the likelihood of encountering the dirty bit.
> 3. The penalty of underprotecting the former channel is higher because
>     applications usually do not prepare themselves for major page
>     faults like they do for blocked I/O. E.g., GUI applications
>     commonly use dedicated I/O threads to avoid blocking the rendering
>     threads.
> There are also two access patterns: one with temporal locality and the
> other without. For the reasons listed above, the former channel is
> assumed to follow the former pattern unless VM_SEQ_READ or
> VM_RAND_READ is present; the latter channel is assumed to follow the
> latter pattern unless outlying refaults have been observed [3][4].
>
> The next patch will address the "outlying refaults". Three macros,
> i.e., LRU_REFS_WIDTH, LRU_REFS_PGOFF and LRU_REFS_MASK, used later are
> added in this patch to make the entire patchset less diffy.
>
> A page is added to the youngest generation on faulting. The aging
> needs to check the accessed bit at least twice before handing this
> page over to the eviction. The first check takes care of the accessed
> bit set on the initial fault; the second check makes sure this page
> has not been used since then. This protocol, AKA second chance,
> requires a minimum of two generations, hence MIN_NR_GENS.
>
> [1] https://dl.acm.org/doi/10.1145/3297858.3304053
> [2] https://dl.acm.org/doi/10.1145/3503222.3507731
> [3] https://lwn.net/Articles/495543/
> [4] https://lwn.net/Articles/815342/
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
>   fs/fuse/dev.c                     |   3 +-
>   include/linux/mm.h                |   2 +
>   include/linux/mm_inline.h         | 180 ++++++++++++++++++++++++++++++
>   include/linux/mmzone.h            |  98 ++++++++++++++++
>   include/linux/page-flags-layout.h |  13 ++-
>   include/linux/page-flags.h        |   4 +-
>   include/linux/sched.h             |   4 +
>   kernel/bounds.c                   |   5 +
>   mm/Kconfig                        |   8 ++
>   mm/huge_memory.c                  |   3 +-
>   mm/memcontrol.c                   |   2 +
>   mm/memory.c                       |  25 +++++
>   mm/mm_init.c                      |   6 +-
>   mm/mmzone.c                       |   2 +
>   mm/swap.c                         |   9 +-
>   mm/vmscan.c                       |  75 +++++++++++++
>   16 files changed, 426 insertions(+), 13 deletions(-)
>
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index 0e537e580dc1..5d36015071d2 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -777,7 +777,8 @@ static int fuse_check_page(struct page *page)
>   	       1 << PG_active |
>   	       1 << PG_workingset |
>   	       1 << PG_reclaim |
> -	       1 << PG_waiters))) {
> +	       1 << PG_waiters |
> +	       LRU_GEN_MASK | LRU_REFS_MASK))) {
>   		dump_page(page, "fuse: trying to steal weird page");
>   		return 1;
>   	}
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 9f44254af8ce..894c289c2c06 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1060,6 +1060,8 @@ vm_fault_t finish_mkwrite_fault(struct vm_fault *vmf);
>   #define ZONES_PGOFF		(NODES_PGOFF - ZONES_WIDTH)
>   #define LAST_CPUPID_PGOFF	(ZONES_PGOFF - LAST_CPUPID_WIDTH)
>   #define KASAN_TAG_PGOFF		(LAST_CPUPID_PGOFF - KASAN_TAG_WIDTH)
> +#define LRU_GEN_PGOFF		(KASAN_TAG_PGOFF - LRU_GEN_WIDTH)
> +#define LRU_REFS_PGOFF		(LRU_GEN_PGOFF - LRU_REFS_WIDTH)
>   
>   /*
>    * Define the bit shifts to access each section.  For non-existent
> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> index 7c9c2157e9a8..98ae22bfaf12 100644
> --- a/include/linux/mm_inline.h
> +++ b/include/linux/mm_inline.h
> @@ -38,6 +38,9 @@ static __always_inline void __update_lru_size(struct lruvec *lruvec,
>   {
>   	struct pglist_data *pgdat = lruvec_pgdat(lruvec);
>   
> +	lockdep_assert_held(&lruvec->lru_lock);
> +	WARN_ON_ONCE(nr_pages != (int)nr_pages);
> +
>   	__mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
>   	__mod_zone_page_state(&pgdat->node_zones[zid],
>   				NR_ZONE_LRU_BASE + lru, nr_pages);
> @@ -99,11 +102,182 @@ static __always_inline enum lru_list folio_lru_list(struct folio *folio)
>   	return lru;
>   }
>   
> +#ifdef CONFIG_LRU_GEN
> +
> +static inline bool lru_gen_enabled(void)
> +{
> +	return true;
> +}
> +
> +static inline bool lru_gen_in_fault(void)
> +{
> +	return current->in_lru_fault;
> +}
> +
> +static inline int lru_gen_from_seq(unsigned long seq)
> +{
> +	return seq % MAX_NR_GENS;
> +}
> +
> +static inline int folio_lru_gen(struct folio *folio)
> +{
> +	unsigned long flags = READ_ONCE(folio->flags);
> +
> +	return ((flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF) - 1;
> +}
> +
> +static inline bool lru_gen_is_active(struct lruvec *lruvec, int gen)
> +{
> +	unsigned long max_seq = lruvec->lrugen.max_seq;
> +
> +	VM_WARN_ON_ONCE(gen >= MAX_NR_GENS);
> +
> +	/* see the comment on MIN_NR_GENS */
> +	return gen == lru_gen_from_seq(max_seq) || gen == lru_gen_from_seq(max_seq - 1);
> +}
> +
> +static inline void lru_gen_update_size(struct lruvec *lruvec, struct folio *folio,
> +				       int old_gen, int new_gen)
> +{
> +	int type = folio_is_file_lru(folio);
> +	int zone = folio_zonenum(folio);
> +	int delta = folio_nr_pages(folio);
> +	enum lru_list lru = type * LRU_INACTIVE_FILE;
> +	struct lru_gen_struct *lrugen = &lruvec->lrugen;
> +
> +	VM_WARN_ON_ONCE(old_gen != -1 && old_gen >= MAX_NR_GENS);
> +	VM_WARN_ON_ONCE(new_gen != -1 && new_gen >= MAX_NR_GENS);
> +	VM_WARN_ON_ONCE(old_gen == -1 && new_gen == -1);
> +
> +	if (old_gen >= 0)
> +		WRITE_ONCE(lrugen->nr_pages[old_gen][type][zone],
> +			   lrugen->nr_pages[old_gen][type][zone] - delta);
> +	if (new_gen >= 0)
> +		WRITE_ONCE(lrugen->nr_pages[new_gen][type][zone],
> +			   lrugen->nr_pages[new_gen][type][zone] + delta);
> +
> +	/* addition */
> +	if (old_gen < 0) {
> +		if (lru_gen_is_active(lruvec, new_gen))
> +			lru += LRU_ACTIVE;
> +		__update_lru_size(lruvec, lru, zone, delta);
> +		return;
> +	}
> +
> +	/* deletion */
> +	if (new_gen < 0) {
> +		if (lru_gen_is_active(lruvec, old_gen))
> +			lru += LRU_ACTIVE;
> +		__update_lru_size(lruvec, lru, zone, -delta);
> +		return;
> +	}
> +}
> +
> +static inline bool lru_gen_add_folio(struct lruvec *lruvec, struct folio *folio, bool reclaiming)
> +{
> +	unsigned long mask, flags;
> +	int gen = folio_lru_gen(folio);
> +	int type = folio_is_file_lru(folio);
> +	int zone = folio_zonenum(folio);
> +	struct lru_gen_struct *lrugen = &lruvec->lrugen;
> +
> +	VM_WARN_ON_ONCE_FOLIO(gen != -1, folio);
> +
> +	if (folio_test_unevictable(folio))
> +		return false;
> +	/*
> +	 * There are three common cases for this page:
> +	 * 1. If it's hot, e.g., freshly faulted in or previously hot and
> +	 *    migrated, add it to the youngest generation.
> +	 * 2. If it's cold but can't be evicted immediately, i.e., an anon page
> +	 *    not in swapcache or a dirty page pending writeback, add it to the
> +	 *    second oldest generation.
> +	 * 3. Everything else (clean, cold) is added to the oldest generation.
> +	 */
> +	if (folio_test_active(folio))
> +		gen = lru_gen_from_seq(lrugen->max_seq);
> +	else if ((type == LRU_GEN_ANON && !folio_test_swapcache(folio)) ||
> +		 (folio_test_reclaim(folio) &&
> +		  (folio_test_dirty(folio) || folio_test_writeback(folio))))
> +		gen = lru_gen_from_seq(lrugen->min_seq[type] + 1);
> +	else
> +		gen = lru_gen_from_seq(lrugen->min_seq[type]);
> +
> +	/* see the comment on MIN_NR_GENS */
> +	mask = LRU_GEN_MASK | BIT(PG_active);
> +	flags = (gen + 1UL) << LRU_GEN_PGOFF;
> +	set_mask_bits(&folio->flags, mask, flags);
> +
> +	lru_gen_update_size(lruvec, folio, -1, gen);
> +	/* for folio_rotate_reclaimable() */
> +	if (reclaiming)
> +		list_add_tail(&folio->lru, &lrugen->lists[gen][type][zone]);
> +	else
> +		list_add(&folio->lru, &lrugen->lists[gen][type][zone]);
> +
> +	return true;
> +}
> +
> +static inline bool lru_gen_del_folio(struct lruvec *lruvec, struct folio *folio, bool reclaiming)
> +{
> +	unsigned long mask, flags;
> +	int gen = folio_lru_gen(folio);
> +
> +	if (gen < 0)
> +		return false;
> +
> +	VM_WARN_ON_ONCE_FOLIO(folio_test_active(folio), folio);
> +	VM_WARN_ON_ONCE_FOLIO(folio_test_unevictable(folio), folio);
> +
> +	mask = LRU_GEN_MASK;
> +	flags = 0;

It always to keep the reference of page unless folios update the gen,  
which is the difference between v10 and v11.

I agree that.

>   
> +	/* for shrink_page_list() or folio_migrate_flags() */
> +	if (reclaiming)
> +		mask |= BIT(PG_referenced) | BIT(PG_reclaim);
> +	else if (lru_gen_is_active(lruvec, gen))
> +		flags |= BIT(PG_active);
> +
> +	flags = set_mask_bits(&folio->flags, mask, flags);
> +	gen = ((flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF) - 1;
> +

the flags has remove the LRU_GEN_MASK by set_mask_bits,  hence the gen 
will always be -1,  it will fails

to decrease the specified lru size.  Am I missing something?

> +	lru_gen_update_size(lruvec, folio, gen, -1);
> +	list_del(&folio->lru);
> +
> +	return true;
> +}
> +
> +#else
> +
> +static inline bool lru_gen_enabled(void)
> +{
> +	return false;
> +}
> +
> +static inline bool lru_gen_in_fault(void)
> +{
> +	return false;
> +}
> +
> +static inline bool lru_gen_add_folio(struct lruvec *lruvec, struct folio *folio, bool reclaiming)
> +{
> +	return false;
> +}
> +
> +static inline bool lru_gen_del_folio(struct lruvec *lruvec, struct folio *folio, bool reclaiming)
> +{
> +	return false;
> +}
> +
> +#endif /* CONFIG_LRU_GEN */
> +
>   static __always_inline
>   void lruvec_add_folio(struct lruvec *lruvec, struct folio *folio)
>   {
>   	enum lru_list lru = folio_lru_list(folio);
>   
> +	if (lru_gen_add_folio(lruvec, folio, false))
> +		return;
> +
>   	update_lru_size(lruvec, lru, folio_zonenum(folio),
>   			folio_nr_pages(folio));
>   	if (lru != LRU_UNEVICTABLE)
> @@ -121,6 +295,9 @@ void lruvec_add_folio_tail(struct lruvec *lruvec, struct folio *folio)
>   {
>   	enum lru_list lru = folio_lru_list(folio);
>   
> +	if (lru_gen_add_folio(lruvec, folio, true))
> +		return;
> +
>   	update_lru_size(lruvec, lru, folio_zonenum(folio),
>   			folio_nr_pages(folio));
>   	/* This is not expected to be used on LRU_UNEVICTABLE */
> @@ -138,6 +315,9 @@ void lruvec_del_folio(struct lruvec *lruvec, struct folio *folio)
>   {
>   	enum lru_list lru = folio_lru_list(folio);
>   
> +	if (lru_gen_del_folio(lruvec, folio, false))
> +		return;
> +
>   	if (lru != LRU_UNEVICTABLE)
>   		list_del(&folio->lru);
>   	update_lru_size(lruvec, lru, folio_zonenum(folio),
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 46ffab808f03..6994acef63cb 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -317,6 +317,100 @@ enum lruvec_flags {
>   					 */
>   };
>   
> +#endif /* !__GENERATING_BOUNDS_H */
> +
> +/*
> + * Evictable pages are divided into multiple generations. The youngest and the
> + * oldest generation numbers, max_seq and min_seq, are monotonically increasing.
> + * They form a sliding window of a variable size [MIN_NR_GENS, MAX_NR_GENS]. An
> + * offset within MAX_NR_GENS, i.e., gen, indexes the LRU list of the
> + * corresponding generation. The gen counter in folio->flags stores gen+1 while
> + * a page is on one of lrugen->lists[]. Otherwise it stores 0.
> + *
> + * A page is added to the youngest generation on faulting. The aging needs to
> + * check the accessed bit at least twice before handing this page over to the
> + * eviction. The first check takes care of the accessed bit set on the initial
> + * fault; the second check makes sure this page hasn't been used since then.
> + * This process, AKA second chance, requires a minimum of two generations,
> + * hence MIN_NR_GENS. And to maintain ABI compatibility with the active/inactive
> + * LRU, e.g., /proc/vmstat, these two generations are considered active; the
> + * rest of generations, if they exist, are considered inactive. See
> + * lru_gen_is_active(). PG_active is always cleared while a page is on one of
> + * lrugen->lists[] so that the aging needs not to worry about it. And it's set
> + * again when a page considered active is isolated for non-reclaiming purposes,
> + * e.g., migration. See lru_gen_add_folio() and lru_gen_del_folio().
> + *
> + * MAX_NR_GENS is set to 4 so that the multi-gen LRU can support twice the
> + * number of categories of the active/inactive LRU when keeping track of
> + * accesses through page tables. It requires order_base_2(MAX_NR_GENS+1) bits in
> + * folio->flags (LRU_GEN_MASK).
> + */
> +#define MIN_NR_GENS		2U
> +#define MAX_NR_GENS		4U
> +
> +#ifndef __GENERATING_BOUNDS_H
> +
> +struct lruvec;
> +
> +#define LRU_GEN_MASK		((BIT(LRU_GEN_WIDTH) - 1) << LRU_GEN_PGOFF)
> +#define LRU_REFS_MASK		((BIT(LRU_REFS_WIDTH) - 1) << LRU_REFS_PGOFF)
> +
> +#ifdef CONFIG_LRU_GEN
> +
> +enum {
> +	LRU_GEN_ANON,
> +	LRU_GEN_FILE,
> +};
> +
> +/*
> + * The youngest generation number is stored in max_seq for both anon and file
> + * types as they are aged on an equal footing. The oldest generation numbers are
> + * stored in min_seq[] separately for anon and file types as clean file pages
> + * can be evicted regardless of swap constraints.
> + *
> + * Normally anon and file min_seq are in sync. But if swapping is constrained,
> + * e.g., out of swap space, file min_seq is allowed to advance and leave anon
> + * min_seq behind.
> + *
> + * nr_pages[] are eventually consistent and therefore can be transiently
> + * negative.
> + */
> +struct lru_gen_struct {
> +	/* the aging increments the youngest generation number */
> +	unsigned long max_seq;
> +	/* the eviction increments the oldest generation numbers */
> +	unsigned long min_seq[ANON_AND_FILE];
> +	/* the multi-gen LRU lists */
> +	struct list_head lists[MAX_NR_GENS][ANON_AND_FILE][MAX_NR_ZONES];
> +	/* the sizes of the above lists */
> +	long nr_pages[MAX_NR_GENS][ANON_AND_FILE][MAX_NR_ZONES];
> +};
> +
> +void lru_gen_init_lruvec(struct lruvec *lruvec);
> +
> +#ifdef CONFIG_MEMCG
> +void lru_gen_init_memcg(struct mem_cgroup *memcg);
> +void lru_gen_exit_memcg(struct mem_cgroup *memcg);
> +#endif
> +
> +#else /* !CONFIG_LRU_GEN */
> +
> +static inline void lru_gen_init_lruvec(struct lruvec *lruvec)
> +{
> +}
> +
> +#ifdef CONFIG_MEMCG
> +static inline void lru_gen_init_memcg(struct mem_cgroup *memcg)
> +{
> +}
> +
> +static inline void lru_gen_exit_memcg(struct mem_cgroup *memcg)
> +{
> +}
> +#endif
> +
> +#endif /* CONFIG_LRU_GEN */
> +
>   struct lruvec {
>   	struct list_head		lists[NR_LRU_LISTS];
>   	/* per lruvec lru_lock for memcg */
> @@ -334,6 +428,10 @@ struct lruvec {
>   	unsigned long			refaults[ANON_AND_FILE];
>   	/* Various lruvec state flags (enum lruvec_flags) */
>   	unsigned long			flags;
> +#ifdef CONFIG_LRU_GEN
> +	/* evictable pages divided into generations */
> +	struct lru_gen_struct		lrugen;
> +#endif
>   #ifdef CONFIG_MEMCG
>   	struct pglist_data *pgdat;
>   #endif
> diff --git a/include/linux/page-flags-layout.h b/include/linux/page-flags-layout.h
> index ef1e3e736e14..240905407a18 100644
> --- a/include/linux/page-flags-layout.h
> +++ b/include/linux/page-flags-layout.h
> @@ -55,7 +55,8 @@
>   #define SECTIONS_WIDTH		0
>   #endif
>   
> -#if ZONES_WIDTH + SECTIONS_WIDTH + NODES_SHIFT <= BITS_PER_LONG - NR_PAGEFLAGS
> +#if ZONES_WIDTH + LRU_GEN_WIDTH + SECTIONS_WIDTH + NODES_SHIFT \
> +	<= BITS_PER_LONG - NR_PAGEFLAGS
>   #define NODES_WIDTH		NODES_SHIFT
>   #elif defined(CONFIG_SPARSEMEM_VMEMMAP)
>   #error "Vmemmap: No space for nodes field in page flags"
> @@ -89,8 +90,8 @@
>   #define LAST_CPUPID_SHIFT 0
>   #endif
>   
> -#if ZONES_WIDTH + SECTIONS_WIDTH + NODES_WIDTH + KASAN_TAG_WIDTH + LAST_CPUPID_SHIFT \
> -	<= BITS_PER_LONG - NR_PAGEFLAGS
> +#if ZONES_WIDTH + LRU_GEN_WIDTH + SECTIONS_WIDTH + NODES_WIDTH + \
> +	KASAN_TAG_WIDTH + LAST_CPUPID_SHIFT <= BITS_PER_LONG - NR_PAGEFLAGS
>   #define LAST_CPUPID_WIDTH LAST_CPUPID_SHIFT
>   #else
>   #define LAST_CPUPID_WIDTH 0
> @@ -100,10 +101,12 @@
>   #define LAST_CPUPID_NOT_IN_PAGE_FLAGS
>   #endif
>   
> -#if ZONES_WIDTH + SECTIONS_WIDTH + NODES_WIDTH + KASAN_TAG_WIDTH + LAST_CPUPID_WIDTH \
> -	> BITS_PER_LONG - NR_PAGEFLAGS
> +#if ZONES_WIDTH + LRU_GEN_WIDTH + SECTIONS_WIDTH + NODES_WIDTH + \
> +	KASAN_TAG_WIDTH + LAST_CPUPID_WIDTH > BITS_PER_LONG - NR_PAGEFLAGS
>   #error "Not enough bits in page flags"
>   #endif
>   
> +#define LRU_REFS_WIDTH	0
> +
>   #endif
>   #endif /* _LINUX_PAGE_FLAGS_LAYOUT */
> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> index 9d8eeaa67d05..5cbde013ce66 100644
> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -1017,7 +1017,7 @@ PAGEFLAG(Isolated, isolated, PF_ANY);
>   	 1UL << PG_private	| 1UL << PG_private_2	|	\
>   	 1UL << PG_writeback	| 1UL << PG_reserved	|	\
>   	 1UL << PG_slab		| 1UL << PG_active 	|	\
> -	 1UL << PG_unevictable	| __PG_MLOCKED)
> +	 1UL << PG_unevictable	| __PG_MLOCKED | LRU_GEN_MASK)
>   
>   /*
>    * Flags checked when a page is prepped for return by the page allocator.
> @@ -1028,7 +1028,7 @@ PAGEFLAG(Isolated, isolated, PF_ANY);
>    * alloc-free cycle to prevent from reusing the page.
>    */
>   #define PAGE_FLAGS_CHECK_AT_PREP	\
> -	(PAGEFLAGS_MASK & ~__PG_HWPOISON)
> +	((PAGEFLAGS_MASK & ~__PG_HWPOISON) | LRU_GEN_MASK | LRU_REFS_MASK)
>   
>   #define PAGE_FLAGS_PRIVATE				\
>   	(1UL << PG_private | 1UL << PG_private_2)
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index a8911b1f35aa..448e75a5acc5 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -914,6 +914,10 @@ struct task_struct {
>   #ifdef CONFIG_MEMCG
>   	unsigned			in_user_fault:1;
>   #endif
> +#ifdef CONFIG_LRU_GEN
> +	/* whether the LRU algorithm may apply to this access */
> +	unsigned			in_lru_fault:1;
> +#endif
>   #ifdef CONFIG_COMPAT_BRK
>   	unsigned			brk_randomized:1;
>   #endif
> diff --git a/kernel/bounds.c b/kernel/bounds.c
> index 9795d75b09b2..5ee60777d8e4 100644
> --- a/kernel/bounds.c
> +++ b/kernel/bounds.c
> @@ -22,6 +22,11 @@ int main(void)
>   	DEFINE(NR_CPUS_BITS, ilog2(CONFIG_NR_CPUS));
>   #endif
>   	DEFINE(SPINLOCK_SIZE, sizeof(spinlock_t));
> +#ifdef CONFIG_LRU_GEN
> +	DEFINE(LRU_GEN_WIDTH, order_base_2(MAX_NR_GENS + 1));
> +#else
> +	DEFINE(LRU_GEN_WIDTH, 0);
> +#endif
>   	/* End of constants */
>   
>   	return 0;
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 034d87953600..e62bd501082b 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -909,6 +909,14 @@ config ANON_VMA_NAME
>   	  area from being merged with adjacent virtual memory areas due to the
>   	  difference in their name.
>   
> +config LRU_GEN
> +	bool "Multi-Gen LRU"
> +	depends on MMU
> +	# make sure folio->flags has enough spare bits
> +	depends on 64BIT || !SPARSEMEM || SPARSEMEM_VMEMMAP
> +	help
> +	  A high performance LRU implementation to overcommit memory.
> +
>   source "mm/damon/Kconfig"
>   
>   endmenu
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 910a138e9859..a090514f2bf3 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -2320,7 +2320,8 @@ static void __split_huge_page_tail(struct page *head, int tail,
>   #ifdef CONFIG_64BIT
>   			 (1L << PG_arch_2) |
>   #endif
> -			 (1L << PG_dirty)));
> +			 (1L << PG_dirty) |
> +			 LRU_GEN_MASK | LRU_REFS_MASK));
>   
>   	/* ->mapping in first tail page is compound_mapcount */
>   	VM_BUG_ON_PAGE(tail > 2 && page_tail->mapping != TAIL_MAPPING,
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 598fece89e2b..2ee074f80e72 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -5072,6 +5072,7 @@ static void __mem_cgroup_free(struct mem_cgroup *memcg)
>   
>   static void mem_cgroup_free(struct mem_cgroup *memcg)
>   {
> +	lru_gen_exit_memcg(memcg);
>   	memcg_wb_domain_exit(memcg);
>   	__mem_cgroup_free(memcg);
>   }
> @@ -5130,6 +5131,7 @@ static struct mem_cgroup *mem_cgroup_alloc(void)
>   	memcg->deferred_split_queue.split_queue_len = 0;
>   #endif
>   	idr_replace(&mem_cgroup_idr, memcg, memcg->id.id);
> +	lru_gen_init_memcg(memcg);
>   	return memcg;
>   fail:
>   	mem_cgroup_id_remove(memcg);
> diff --git a/mm/memory.c b/mm/memory.c
> index 44a1ec7a2cac..6df27b84c5aa 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -4812,6 +4812,27 @@ static inline void mm_account_fault(struct pt_regs *regs,
>   		perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MIN, 1, regs, address);
>   }
>   
> +#ifdef CONFIG_LRU_GEN
> +static void lru_gen_enter_fault(struct vm_area_struct *vma)
> +{
> +	/* the LRU algorithm doesn't apply to sequential or random reads */
> +	current->in_lru_fault = !(vma->vm_flags & (VM_SEQ_READ | VM_RAND_READ));
> +}
> +
> +static void lru_gen_exit_fault(void)
> +{
> +	current->in_lru_fault = false;
> +}
> +#else
> +static void lru_gen_enter_fault(struct vm_area_struct *vma)
> +{
> +}
> +
> +static void lru_gen_exit_fault(void)
> +{
> +}
> +#endif /* CONFIG_LRU_GEN */
> +
>   /*
>    * By the time we get here, we already hold the mm semaphore
>    *
> @@ -4843,11 +4864,15 @@ vm_fault_t handle_mm_fault(struct vm_area_struct *vma, unsigned long address,
>   	if (flags & FAULT_FLAG_USER)
>   		mem_cgroup_enter_user_fault();
>   
> +	lru_gen_enter_fault(vma);
> +
>   	if (unlikely(is_vm_hugetlb_page(vma)))
>   		ret = hugetlb_fault(vma->vm_mm, vma, address, flags);
>   	else
>   		ret = __handle_mm_fault(vma, address, flags);
>   
> +	lru_gen_exit_fault();
> +
>   	if (flags & FAULT_FLAG_USER) {
>   		mem_cgroup_exit_user_fault();
>   		/*
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 9ddaf0e1b0ab..0d7b2bd2454a 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -65,14 +65,16 @@ void __init mminit_verify_pageflags_layout(void)
>   
>   	shift = 8 * sizeof(unsigned long);
>   	width = shift - SECTIONS_WIDTH - NODES_WIDTH - ZONES_WIDTH
> -		- LAST_CPUPID_SHIFT - KASAN_TAG_WIDTH;
> +		- LAST_CPUPID_SHIFT - KASAN_TAG_WIDTH - LRU_GEN_WIDTH - LRU_REFS_WIDTH;
>   	mminit_dprintk(MMINIT_TRACE, "pageflags_layout_widths",
> -		"Section %d Node %d Zone %d Lastcpupid %d Kasantag %d Flags %d\n",
> +		"Section %d Node %d Zone %d Lastcpupid %d Kasantag %d Gen %d Tier %d Flags %d\n",
>   		SECTIONS_WIDTH,
>   		NODES_WIDTH,
>   		ZONES_WIDTH,
>   		LAST_CPUPID_WIDTH,
>   		KASAN_TAG_WIDTH,
> +		LRU_GEN_WIDTH,
> +		LRU_REFS_WIDTH,
>   		NR_PAGEFLAGS);
>   	mminit_dprintk(MMINIT_TRACE, "pageflags_layout_shifts",
>   		"Section %d Node %d Zone %d Lastcpupid %d Kasantag %d\n",
> diff --git a/mm/mmzone.c b/mm/mmzone.c
> index 0ae7571e35ab..68e1511be12d 100644
> --- a/mm/mmzone.c
> +++ b/mm/mmzone.c
> @@ -88,6 +88,8 @@ void lruvec_init(struct lruvec *lruvec)
>   	 * Poison its list head, so that any operations on it would crash.
>   	 */
>   	list_del(&lruvec->lists[LRU_UNEVICTABLE]);
> +
> +	lru_gen_init_lruvec(lruvec);
>   }
>   
>   #if defined(CONFIG_NUMA_BALANCING) && !defined(LAST_CPUPID_NOT_IN_PAGE_FLAGS)
> diff --git a/mm/swap.c b/mm/swap.c
> index 7e320ec08c6a..a6870ba0bd83 100644
> --- a/mm/swap.c
> +++ b/mm/swap.c
> @@ -460,6 +460,11 @@ void folio_add_lru(struct folio *folio)
>   	VM_BUG_ON_FOLIO(folio_test_active(folio) && folio_test_unevictable(folio), folio);
>   	VM_BUG_ON_FOLIO(folio_test_lru(folio), folio);
>   
> +	/* see the comment in lru_gen_add_folio() */
> +	if (lru_gen_enabled() && !folio_test_unevictable(folio) &&
> +	    lru_gen_in_fault() && !(current->flags & PF_MEMALLOC))
> +		folio_set_active(folio);
> +
>   	folio_get(folio);
>   	local_lock(&lru_pvecs.lock);
>   	pvec = this_cpu_ptr(&lru_pvecs.lru_add);
> @@ -551,7 +556,7 @@ static void lru_deactivate_file_fn(struct page *page, struct lruvec *lruvec)
>   
>   static void lru_deactivate_fn(struct page *page, struct lruvec *lruvec)
>   {
> -	if (PageActive(page) && !PageUnevictable(page)) {
> +	if (!PageUnevictable(page) && (PageActive(page) || lru_gen_enabled())) {
>   		int nr_pages = thp_nr_pages(page);
>   
>   		del_page_from_lru_list(page, lruvec);
> @@ -666,7 +671,7 @@ void deactivate_file_folio(struct folio *folio)
>    */
>   void deactivate_page(struct page *page)
>   {
> -	if (PageLRU(page) && PageActive(page) && !PageUnevictable(page)) {
> +	if (PageLRU(page) && !PageUnevictable(page) && (PageActive(page) || lru_gen_enabled())) {
>   		struct pagevec *pvec;
>   
>   		local_lock(&lru_pvecs.lock);
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 2232cb55af41..b41ff9765cc7 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -2968,6 +2968,81 @@ static bool can_age_anon_pages(struct pglist_data *pgdat,
>   	return can_demote(pgdat->node_id, sc);
>   }
>   
> +#ifdef CONFIG_LRU_GEN
> +
> +/******************************************************************************
> + *                          shorthand helpers
> + ******************************************************************************/
> +
> +#define for_each_gen_type_zone(gen, type, zone)				\
> +	for ((gen) = 0; (gen) < MAX_NR_GENS; (gen)++)			\
> +		for ((type) = 0; (type) < ANON_AND_FILE; (type)++)	\
> +			for ((zone) = 0; (zone) < MAX_NR_ZONES; (zone)++)
> +
> +static struct lruvec __maybe_unused *get_lruvec(struct mem_cgroup *memcg, int nid)
> +{
> +	struct pglist_data *pgdat = NODE_DATA(nid);
> +
> +#ifdef CONFIG_MEMCG
> +	if (memcg) {
> +		struct lruvec *lruvec = &memcg->nodeinfo[nid]->lruvec;
> +
> +		/* for hotadd_new_pgdat() */
> +		if (!lruvec->pgdat)
> +			lruvec->pgdat = pgdat;
> +
> +		return lruvec;
> +	}
> +#endif
> +	VM_WARN_ON_ONCE(!mem_cgroup_disabled());
> +
> +	return pgdat ? &pgdat->__lruvec : NULL;
> +}
> +
> +/******************************************************************************
> + *                          initialization
> + ******************************************************************************/
> +
> +void lru_gen_init_lruvec(struct lruvec *lruvec)
> +{
> +	int gen, type, zone;
> +	struct lru_gen_struct *lrugen = &lruvec->lrugen;
> +
> +	lrugen->max_seq = MIN_NR_GENS + 1;
> +
> +	for_each_gen_type_zone(gen, type, zone)
> +		INIT_LIST_HEAD(&lrugen->lists[gen][type][zone]);
> +}
> +
> +#ifdef CONFIG_MEMCG
> +void lru_gen_init_memcg(struct mem_cgroup *memcg)
> +{
> +}
> +
> +void lru_gen_exit_memcg(struct mem_cgroup *memcg)
> +{
> +	int nid;
> +
> +	for_each_node(nid) {
> +		struct lruvec *lruvec = get_lruvec(memcg, nid);
> +
> +		VM_WARN_ON_ONCE(memchr_inv(lruvec->lrugen.nr_pages, 0,
> +					   sizeof(lruvec->lrugen.nr_pages)));
> +	}
> +}
> +#endif
> +
> +static int __init init_lru_gen(void)
> +{
> +	BUILD_BUG_ON(MIN_NR_GENS + 1 >= MAX_NR_GENS);
> +	BUILD_BUG_ON(BIT(LRU_GEN_WIDTH) <= MAX_NR_GENS);
> +
> +	return 0;
> +};
> +late_initcall(init_lru_gen);
> +
> +#endif /* CONFIG_LRU_GEN */
> +
>   static void shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
>   {
>   	unsigned long nr[NR_LRU_LISTS];
