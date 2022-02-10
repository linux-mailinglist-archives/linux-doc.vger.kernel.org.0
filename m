Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 512774B170C
	for <lists+linux-doc@lfdr.de>; Thu, 10 Feb 2022 21:42:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344280AbiBJUmB (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 10 Feb 2022 15:42:01 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230430AbiBJUmA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Feb 2022 15:42:00 -0500
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D0721034
        for <linux-doc@vger.kernel.org>; Thu, 10 Feb 2022 12:41:59 -0800 (PST)
Received: by mail-qv1-xf29.google.com with SMTP id c14so6281542qvl.12
        for <linux-doc@vger.kernel.org>; Thu, 10 Feb 2022 12:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zMCyMjn5wNyD/PEScuAZavGsBtBHaIhf5nWutf1hESw=;
        b=Ll6uyIhI4CeUzl37pUmXKy+1nkOSrXklXX9a4yWROdEynaTH2IDaeNzetsnh5lU4fk
         N8ZPS/908XJPfNHUPxLV1Dcbm8gjYO/ruU717maLtl/4daHElmqhBH88bWm9wCnCi/aQ
         roUen5hfef04i2LoKzRJzxcJqfBEwOId+qygzwnqfyR46VkULQWNcPayIi0Yhi2avODM
         WbkWliFn67Ek5VcuMg37jwfPVNKLPmEV71XFmumgnbbNXbVyTiS3mngOU7wNDGV+RLOa
         NzgChm+p+e+KhmtSFzM/lKe6r7K4g9aaZ3sf1fnKAZpSlF7bhxLNJL/EuHSy885M8UNq
         xudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zMCyMjn5wNyD/PEScuAZavGsBtBHaIhf5nWutf1hESw=;
        b=AYQNc/Fsc+S+7FzcjP0GMCJclX+vhfl1qXlXD76EXcS0KN6YIPz3nQjgiVfYX+GTqF
         rmiJmi38BxlDxzG1Qdaf8fNjfVeHCCfq/Ri2VvHe37YYsex9WBjVHuRxd6oYD2R4ZEPJ
         Ny+564wyRi7eCpnxWzbeFzEZoeyzVu43EFcrq5mEQxlwLe6hLwpgn8NjLxI9x3K0BelK
         3z3+xU80s7BjZJSXLPD6L+mgXrw+8US2dzpuIz1BgSbDRiBYkJPMTXI0/F01a1MjvWzX
         P54pqCCe5gWqa1pZxWn2ciS6YlP/3jC50OxybT704lNPyNY7pVLfg7Twlih9xYWL13Vg
         fhaA==
X-Gm-Message-State: AOAM533BeX9yA/X39gwgkL8dWDZUfpj6yirzSaKOXjkeUL49xUccX1P0
        empwTsVYEsdn5I2KBtsfkr2zHw==
X-Google-Smtp-Source: ABdhPJxAc9cvXLrhH0mFAMf0E9GXMv50fFqsphxdJKP0FfBsVZ3HNNkdNoNie/zhp4e3PIUUj2Q67A==
X-Received: by 2002:a05:6214:e67:: with SMTP id jz7mr6162574qvb.41.1644525718634;
        Thu, 10 Feb 2022 12:41:58 -0800 (PST)
Received: from localhost (cpe-98-15-154-102.hvc.res.rr.com. [98.15.154.102])
        by smtp.gmail.com with ESMTPSA id i4sm11201612qkn.13.2022.02.10.12.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 12:41:58 -0800 (PST)
Date:   Thu, 10 Feb 2022 15:41:57 -0500
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Yu Zhao <yuzhao@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Mel Gorman <mgorman@suse.de>, Michal Hocko <mhocko@kernel.org>,
        Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Barry Song <21cnbao@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Michael Larabel <Michael@michaellarabel.com>,
        Mike Rapoport <rppt@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        page-reclaim@google.com, x86@kernel.org,
        Brian Geffon <bgeffon@google.com>,
        Jan Alexander Steffens <heftig@archlinux.org>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Steven Barrett <steven@liquorix.net>,
        Suleiman Souhlal <suleiman@google.com>,
        Daniel Byrne <djbyrne@mtu.edu>,
        Donald Carr <d@chaos-reins.com>,
        Holger =?iso-8859-1?Q?Hoffst=E4tte?= 
        <holger@applied-asynchrony.com>,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>,
        Shuang Zhai <szhai2@cs.rochester.edu>,
        Sofia Trinh <sofia.trinh@edi.works>
Subject: Re: [PATCH v7 04/12] mm: multigenerational LRU: groundwork
Message-ID: <YgV4lZXc6+jhUdsR@cmpxchg.org>
References: <20220208081902.3550911-1-yuzhao@google.com>
 <20220208081902.3550911-5-yuzhao@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220208081902.3550911-5-yuzhao@google.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello Yu,

On Tue, Feb 08, 2022 at 01:18:54AM -0700, Yu Zhao wrote:
> @@ -92,11 +92,196 @@ static __always_inline enum lru_list folio_lru_list(struct folio *folio)
>  	return lru;
>  }
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
> +static inline bool lru_gen_is_active(struct lruvec *lruvec, int gen)
> +{
> +	unsigned long max_seq = lruvec->lrugen.max_seq;
> +
> +	VM_BUG_ON(gen >= MAX_NR_GENS);
> +
> +	/* see the comment on MIN_NR_GENS */
> +	return gen == lru_gen_from_seq(max_seq) || gen == lru_gen_from_seq(max_seq - 1);
> +}

I'm still reading the series, so correct me if I'm wrong: the "active"
set is split into two generations for the sole purpose of the
second-chance policy for fresh faults, right?

If so, it'd be better to have the comment here instead of down by
MIN_NR_GENS. This is the place that defines what "active" is, so this
is where the reader asks what it means and what it implies. The
definition of MIN_NR_GENS can be briefer: "need at least two for
second chance, see lru_gen_is_active() for details".

> +static inline void lru_gen_update_size(struct lruvec *lruvec, enum lru_list lru,
> +				       int zone, long delta)
> +{
> +	struct pglist_data *pgdat = lruvec_pgdat(lruvec);
> +
> +	lockdep_assert_held(&lruvec->lru_lock);
> +	WARN_ON_ONCE(delta != (int)delta);
> +
> +	__mod_lruvec_state(lruvec, NR_LRU_BASE + lru, delta);
> +	__mod_zone_page_state(&pgdat->node_zones[zone], NR_ZONE_LRU_BASE + lru, delta);
> +}

This is a duplicate of update_lru_size(), please use that instead.

Yeah technically you don't need the mem_cgroup_update_lru_size() but
that's not worth sweating over, better to keep it simple.

> +static inline void lru_gen_balance_size(struct lruvec *lruvec, struct folio *folio,
> +					int old_gen, int new_gen)

lru_gen_update_lru_sizes() for this one would be more descriptive imo
and in line with update_lru_size() that it's built on.

> +{
> +	int type = folio_is_file_lru(folio);
> +	int zone = folio_zonenum(folio);
> +	int delta = folio_nr_pages(folio);
> +	enum lru_list lru = type * LRU_INACTIVE_FILE;
> +	struct lru_gen_struct *lrugen = &lruvec->lrugen;
> +
> +	VM_BUG_ON(old_gen != -1 && old_gen >= MAX_NR_GENS);
> +	VM_BUG_ON(new_gen != -1 && new_gen >= MAX_NR_GENS);
> +	VM_BUG_ON(old_gen == -1 && new_gen == -1);

Could be a bit easier to read quickly with high-level descriptions:

> +	if (old_gen >= 0)
> +		WRITE_ONCE(lrugen->nr_pages[old_gen][type][zone],
> +			   lrugen->nr_pages[old_gen][type][zone] - delta);
> +	if (new_gen >= 0)
> +		WRITE_ONCE(lrugen->nr_pages[new_gen][type][zone],
> +			   lrugen->nr_pages[new_gen][type][zone] + delta);
> +
	/* Addition */
> +	if (old_gen < 0) {
> +		if (lru_gen_is_active(lruvec, new_gen))
> +			lru += LRU_ACTIVE;
> +		lru_gen_update_size(lruvec, lru, zone, delta);
> +		return;
> +	}
> +
	/* Removal */
> +	if (new_gen < 0) {
> +		if (lru_gen_is_active(lruvec, old_gen))
> +			lru += LRU_ACTIVE;
> +		lru_gen_update_size(lruvec, lru, zone, -delta);
> +		return;
> +	}
> +
	/* Promotion */
> +	if (!lru_gen_is_active(lruvec, old_gen) && lru_gen_is_active(lruvec, new_gen)) {
> +		lru_gen_update_size(lruvec, lru, zone, -delta);
> +		lru_gen_update_size(lruvec, lru + LRU_ACTIVE, zone, delta);
> +	}
> +
> +	/* Promotion is legit while a page is on an LRU list, but demotion isn't. */

	/* Demotion happens during aging when pages are isolated, never on-LRU */
> +	VM_BUG_ON(lru_gen_is_active(lruvec, old_gen) && !lru_gen_is_active(lruvec, new_gen));
> +}

On that note, please move introduction of the promotion and demotion
bits to the next patch. They aren't used here yet, and I spent some
time jumping around patches to verify the promotion callers and
confirm the validy of the BUG_ON.

> +static inline bool lru_gen_add_folio(struct lruvec *lruvec, struct folio *folio, bool reclaiming)
> +{
> +	int gen;
> +	unsigned long old_flags, new_flags;
> +	int type = folio_is_file_lru(folio);
> +	int zone = folio_zonenum(folio);
> +	struct lru_gen_struct *lrugen = &lruvec->lrugen;
> +
> +	if (folio_test_unevictable(folio) || !lrugen->enabled)
> +		return false;

These two checks should be in the callsite and the function should
return void. Otherwise you can't understand the callsite without
drilling down into lrugen code, even if lrugen is disabled.

folio_add_lru() gets it right.

> +	/*
> +	 * There are three common cases for this page:
> +	 * 1) If it shouldn't be evicted, e.g., it was just faulted in, add it
> +	 *    to the youngest generation.

"shouldn't be evicted" makes it sound like mlock. But they should just
be evicted last, right? Maybe:

	/*
	 * Pages start in different generations depending on
	 * advance knowledge we have about their hotness and
	 * evictability:
	 * 
	 * 1. Already active pages start out youngest. This can be
	 *    fresh faults, or refaults of previously hot pages.
	 * 2. Cold pages that require writeback before becoming
	 *    evictable start on the second oldest generation.
	 * 3. Everything else (clean, cold) starts old.
	 */

On that note, I think #1 is reintroducing a problem we have fixed
before, which is trashing the workingset with a flood of use-once
mmapped pages. It's the classic scenario where LFU beats LRU.

Mapped streaming IO isn't very common, but it does happen. See these
commits:

dfc8d636cdb95f7b792d5ba8c9f3b295809c125d
31c0569c3b0b6cc8a867ac6665ca081553f7984c
645747462435d84c6c6a64269ed49cc3015f753d

From the changelog:

    The used-once mapped file page detection patchset.
    
    It is meant to help workloads with large amounts of shortly used file
    mappings, like rtorrent hashing a file or git when dealing with loose
    objects (git gc on a bigger site?).
    
    Right now, the VM activates referenced mapped file pages on first
    encounter on the inactive list and it takes a full memory cycle to
    reclaim them again.  When those pages dominate memory, the system
    no longer has a meaningful notion of 'working set' and is required
    to give up the active list to make reclaim progress.  Obviously,
    this results in rather bad scanning latencies and the wrong pages
    being reclaimed.
    
    This patch makes the VM be more careful about activating mapped file
    pages in the first place.  The minimum granted lifetime without
    another memory access becomes an inactive list cycle instead of the
    full memory cycle, which is more natural given the mentioned loads.

Translating this to multigen, it seems fresh faults should really
start on the second oldest rather than on the youngest generation, to
get a second chance but without jeopardizing the workingset if they
don't take it.

> +	 * 2) If it can't be evicted immediately, i.e., it's an anon page and
> +	 *    not in swapcache, or a dirty page pending writeback, add it to the
> +	 *    second oldest generation.
> +	 * 3) If it may be evicted immediately, e.g., it's a clean page, add it
> +	 *    to the oldest generation.
> +	 */
> +	if (folio_test_active(folio))
> +		gen = lru_gen_from_seq(lrugen->max_seq);
> +	else if ((!type && !folio_test_swapcache(folio)) ||
> +		 (folio_test_reclaim(folio) &&
> +		  (folio_test_dirty(folio) || folio_test_writeback(folio))))
> +		gen = lru_gen_from_seq(lrugen->min_seq[type] + 1);
> +	else
> +		gen = lru_gen_from_seq(lrugen->min_seq[type]);

Condition #2 is not quite clear to me, and the comment is incomplete:
The code does put dirty/writeback pages on the oldest gen as long as
they haven't been marked for immediate reclaim by the scanner
yet. HOWEVER, once the scanner does see those pages and sets
PG_reclaim, it will also activate them to move them out of the way
until writeback finishes (see shrink_page_list()) - at which point
we'll trigger #1. So that second part of #2 appears unreachable.

It could be a good exercise to describe how cache pages move through
the generations, similar to the comment on lru_deactivate_file_fn().
It's a good example of intent vs implementation.

On another note, "!type" meaning "anon" is a bit rough. Please follow
the "bool file" convention used elsewhere.

> @@ -113,6 +298,9 @@ void lruvec_add_folio_tail(struct lruvec *lruvec, struct folio *folio)
>  {
>  	enum lru_list lru = folio_lru_list(folio);
>  
> +	if (lru_gen_add_folio(lruvec, folio, true))
> +		return;
> +

bool parameters are notoriously hard to follow in the callsite. Can
you please add lru_gen_add_folio_tail() instead and have them use a
common helper?

> @@ -127,6 +315,9 @@ static __always_inline void add_page_to_lru_list_tail(struct page *page,
>  static __always_inline
>  void lruvec_del_folio(struct lruvec *lruvec, struct folio *folio)
>  {
> +	if (lru_gen_del_folio(lruvec, folio, false))
> +		return;
> +
>  	list_del(&folio->lru);
>  	update_lru_size(lruvec, folio_lru_list(folio), folio_zonenum(folio),
>  			-folio_nr_pages(folio));
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index aed44e9b5d89..0f5e8a995781 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -303,6 +303,78 @@ enum lruvec_flags {
>  					 */
>  };
>  
> +struct lruvec;
> +
> +#define LRU_GEN_MASK		((BIT(LRU_GEN_WIDTH) - 1) << LRU_GEN_PGOFF)
> +#define LRU_REFS_MASK		((BIT(LRU_REFS_WIDTH) - 1) << LRU_REFS_PGOFF)
> +
> +#ifdef CONFIG_LRU_GEN
> +
> +#define MIN_LRU_BATCH		BITS_PER_LONG
> +#define MAX_LRU_BATCH		(MIN_LRU_BATCH * 128)

Those two aren't used in this patch, so it's hard to say whether they
are chosen correctly.

> + * Evictable pages are divided into multiple generations. The youngest and the
> + * oldest generation numbers, max_seq and min_seq, are monotonically increasing.
> + * They form a sliding window of a variable size [MIN_NR_GENS, MAX_NR_GENS]. An
> + * offset within MAX_NR_GENS, gen, indexes the LRU list of the corresponding
> + * generation. The gen counter in folio->flags stores gen+1 while a page is on
> + * one of lrugen->lists[]. Otherwise it stores 0.
> + *
> + * A page is added to the youngest generation on faulting. The aging needs to
> + * check the accessed bit at least twice before handing this page over to the
> + * eviction. The first check takes care of the accessed bit set on the initial
> + * fault; the second check makes sure this page hasn't been used since then.
> + * This process, AKA second chance, requires a minimum of two generations,
> + * hence MIN_NR_GENS. And to be compatible with the active/inactive LRU, these
> + * two generations are mapped to the active; the rest of generations, if they
> + * exist, are mapped to the inactive. PG_active is always cleared while a page
> + * is on one of lrugen->lists[] so that demotion, which happens consequently
> + * when the aging produces a new generation, needs not to worry about it.
> + */
> +#define MIN_NR_GENS		2U
> +#define MAX_NR_GENS		((unsigned int)CONFIG_NR_LRU_GENS)
> +
> +struct lru_gen_struct {

struct lrugen?

In fact, "lrugen" for the general function and variable namespace
might be better, the _ doesn't seem to pull its weight.

CONFIG_LRUGEN
struct lrugen
lrugen_foo()
etc.

> +	/* the aging increments the youngest generation number */
> +	unsigned long max_seq;
> +	/* the eviction increments the oldest generation numbers */
> +	unsigned long min_seq[ANON_AND_FILE];

The singular max_seq vs the split min_seq raises questions. Please add
a comment that explains or points to an explanation.

> +	/* the birth time of each generation in jiffies */
> +	unsigned long timestamps[MAX_NR_GENS];

This isn't in use until the thrashing-based OOM killing patch.

> +	/* the multigenerational LRU lists */
> +	struct list_head lists[MAX_NR_GENS][ANON_AND_FILE][MAX_NR_ZONES];
> +	/* the sizes of the above lists */
> +	unsigned long nr_pages[MAX_NR_GENS][ANON_AND_FILE][MAX_NR_ZONES];
> +	/* whether the multigenerational LRU is enabled */
> +	bool enabled;

Not (really) in use until the runtime switch. Best to keep everybody
checking the global flag for now, and have the runtime switch patch
introduce this flag and switch necessary callsites over.

> +void lru_gen_init_state(struct mem_cgroup *memcg, struct lruvec *lruvec);

"state" is what we usually init :) How about lrugen_init_lruvec()?

You can drop the memcg parameter and use lruvec_memcg().

> +#ifdef CONFIG_MEMCG
> +void lru_gen_init_memcg(struct mem_cgroup *memcg);
> +void lru_gen_free_memcg(struct mem_cgroup *memcg);

This should be either init+exit, or alloc+free.

Thanks
