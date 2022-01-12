Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69FE748BD01
	for <lists+linux-doc@lfdr.de>; Wed, 12 Jan 2022 03:16:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236214AbiALCQV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 11 Jan 2022 21:16:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235919AbiALCQV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Jan 2022 21:16:21 -0500
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BC19C061748
        for <linux-doc@vger.kernel.org>; Tue, 11 Jan 2022 18:16:21 -0800 (PST)
Received: by mail-il1-x12a.google.com with SMTP id d14so972598ila.1
        for <linux-doc@vger.kernel.org>; Tue, 11 Jan 2022 18:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gY3L/ohoJT+LGnrwf3WbcW3Sm7Rhragj/gK43AHxeKI=;
        b=R20ghVrn5UJ8eOBbViYvB+y95FXvSM8YsY4jkyuom2uoij7S7LrAgIeSEOGDRPA+oS
         iWVwWaRMk3A9koqyfHaYY9Y2G9eMU5QZyqz03157b2D11Afz7+CmJuQCQLYTiGBq4YkZ
         8bPsYi1DASShARCETRBXl8tVBmtAFMefDw0YuY6ENC+5x4YAaMpx3hUfuwvkEe9rYIN/
         P+l6g0Dk4LnR7DfjXPgHR2NNHq+1bFxFzcKyg4jxeZXEJi89+6bF/NNeVg/MKE2JY7W2
         7PdCn+yfRYn9hVjBeZoOQyiQs7xq7ZZiUTE6gkwtk5+674JvmqMN+QdjMmExYWGZAQu+
         5u7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gY3L/ohoJT+LGnrwf3WbcW3Sm7Rhragj/gK43AHxeKI=;
        b=gh5EFrBMlPWEDlc8BX0Kzhngmtom4NB84TcxJnAMYik75dD1fV0qsfkPnGEqEBueVz
         JDgzCUPHTuQjN8c0EL+D2tjgvz+8oGn1aiM+bhAJg3Ja7jOMkNimlYBxMP+NB4awJ3md
         WCB7P1Ok7PXKJB2aIiaaFBlz0firuB9DUbrF0ksaZdEubmyF3RYTS2hwPc6BeXZ/tm6G
         svql+v5m0rw1GTivFohlIYG7sNEJ+ZyFbQSttw5AHEiRlQIhS+d33J8Uasp6itYm62Bq
         4tW7QZge/d0fjcr+3O3lLuh6/h7qGgvvJ4rEEPFYtnDxko4IQAj1oK0nYiUh5yeV8UEQ
         Erhw==
X-Gm-Message-State: AOAM531+/J1QJCgRelhJbu8oNsCcnwcC/iqtWbdqkTtFGwgyZ4gwfUR9
        //AWDHltP5USUBOEtTNog5N8sg==
X-Google-Smtp-Source: ABdhPJy1/vlLDtXylu7HegiyqkVdh1jTeQZXKMC3AuUfrN9c+AdF/siL+FtwpT5W+sz9AGxGn8ptaQ==
X-Received: by 2002:a05:6e02:12e8:: with SMTP id l8mr3848743iln.111.1641953780261;
        Tue, 11 Jan 2022 18:16:20 -0800 (PST)
Received: from google.com ([2620:15c:183:200:b6b6:70f4:b540:6383])
        by smtp.gmail.com with ESMTPSA id o16sm972436ioo.36.2022.01.11.18.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 18:16:19 -0800 (PST)
Date:   Tue, 11 Jan 2022 19:16:15 -0700
From:   Yu Zhao <yuzhao@google.com>
To:     "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andi Kleen <ak@linux.intel.com>,
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
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        page-reclaim@google.com, x86@kernel.org,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>
Subject: Re: [PATCH v6 4/9] mm: multigenerational lru: groundwork
Message-ID: <Yd457900iUIzwpnc@google.com>
References: <20220104202227.2903605-1-yuzhao@google.com>
 <20220104202227.2903605-5-yuzhao@google.com>
 <878rvm661z.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878rvm661z.fsf@linux.ibm.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jan 11, 2022 at 01:46:24PM +0530, Aneesh Kumar K.V wrote:
> Yu Zhao <yuzhao@google.com> writes:
> 
> .....
> 
>  +
> > +/*
> > + * Evictable pages are divided into multiple generations. The youngest and the
> > + * oldest generation numbers, max_seq and min_seq, are monotonically increasing.
> > + * They form a sliding window of a variable size [MIN_NR_GENS, MAX_NR_GENS]. An
> > + * offset within MAX_NR_GENS, gen, indexes the lru list of the corresponding
> > + * generation. The gen counter in folio->flags stores gen+1 while a page is on
> > + * lrugen->lists[]. Otherwise, it stores 0.
> > + *
> > + * A page is added to the youngest generation on faulting. The aging needs to
> > + * check the accessed bit at least twice before handing this page over to the
> > + * eviction. The first check takes care of the accessed bit set on the initial
> > + * fault; the second check makes sure this page hasn't been used since then.
> > + * This process, AKA second chance, requires a minimum of two generations,
> > + * hence MIN_NR_GENS. And to be compatible with the active/inactive lru, these
> > + * two generations are mapped to the active; the rest of generations, if they
> > + * exist, are mapped to the inactive. PG_active is always cleared while a page
> > + * is on lrugen->lists[] so that demotion, which happens consequently when the
> > + * aging creates a new generation, needs not to worry about it.
> > + */
> 
> Where do we clear PG_active in the code? Is this the reason we endup
> with

We clear PG_active when we add a page (folio) to MGLRU lists:
  include/linux/mm_inline.h
    lru_gen_add_folio()
	do {
		new_flags = old_flags = READ_ONCE(folio->flags);

		...

		new_flags &= ~(LRU_GEN_MASK | BIT(PG_active));
                                                  ^^^^^^^^^
		...

	} while (cmpxchg(&folio->flags, old_flags, new_flags) != old_flags);

We also set it when we isolate a page (for page migration):
  include/linux/mm_inline.h
    lru_gen_del_folio()
	do {
		new_flags = old_flags = READ_ONCE(folio->flags);

		...

		else if (lru_gen_is_active(lruvec, gen))
			new_flags |= BIT(PG_active);
                                         ^^^^^^^^^
	} while (cmpxchg(&folio->flags, old_flags, new_flags) != old_flags);

> 
>   void deactivate_page(struct page *page)
>   {
>  -	if (PageLRU(page) && PageActive(page) && !PageUnevictable(page)) {
>  +	if (PageLRU(page) && !PageUnevictable(page) && (PageActive(page) || lru_gen_enabled())) {

That's correct.

> > +#define MIN_NR_GENS		2U
> > +#define MAX_NR_GENS		((unsigned int)CONFIG_NR_LRU_GENS)
> > +
> > +struct lru_gen_struct {
> > +	/* the aging increments the youngest generation number */
> > +	unsigned long max_seq;
> > +	/* the eviction increments the oldest generation numbers */
> > +	unsigned long min_seq[ANON_AND_FILE];
> > +	/* the birth time of each generation in jiffies */
> > +	unsigned long timestamps[MAX_NR_GENS];
> > +	/* the multigenerational lru lists */
> > +	struct list_head lists[MAX_NR_GENS][ANON_AND_FILE][MAX_NR_ZONES];
> > +	/* the sizes of the above lists */
> > +	unsigned long nr_pages[MAX_NR_GENS][ANON_AND_FILE][MAX_NR_ZONES];
> > +	/* whether the multigenerational lru is enabled */
> > +	bool enabled;
> > +};
> > +
> 
> ....
> 
> >  static void __meminit zone_init_internals(struct zone *zone, enum zone_type idx, int nid,
> > diff --git a/mm/swap.c b/mm/swap.c
> > index e8c9dc6d0377..d7dde3b7d4b5 100644
> > --- a/mm/swap.c
> > +++ b/mm/swap.c
> > @@ -462,6 +462,11 @@ void folio_add_lru(struct folio *folio)
> >  	VM_BUG_ON_FOLIO(folio_test_active(folio) && folio_test_unevictable(folio), folio);
> >  	VM_BUG_ON_FOLIO(folio_test_lru(folio), folio);
> >  
> > +	/* see the comment in lru_gen_add_folio() */
> > +	if (lru_gen_enabled() && !folio_test_unevictable(folio) &&
> > +	    task_in_lru_fault() && !(current->flags & PF_MEMALLOC))
> > +		folio_set_active(folio);
> > +
> 
> 
> Can you explain this better? What is the significance of marking the
> folio active here. Do we need to differentiate parallel page faults (across
> different vmas) w.r.t task_in_lru_fault()?

All pages faulted in need to be added to the youngest generation. But
without PG_active, lru_gen_add_folio() doesn't know whether a page was
faulted in, or something else, e.g., page cache readahead. This is
because pages aren't immediately sent to lru_gen_add_folio(). They are
batched by lru_pvecs:

/**
 * folio_add_lru - Add a folio to an LRU list.
 * @folio: The folio to be added to the LRU.
 *
 * Queue the folio for addition to the LRU. The decision on whether
 * to add the page to the [in]active [file|anon] list is deferred until the
 * pagevec is drained. This gives a chance for the caller of folio_add_lru()
 * have the folio added to the active list using folio_mark_accessed().
 */
void folio_add_lru(struct folio *folio)
{
	struct pagevec *pvec;

	VM_BUG_ON_FOLIO(folio_test_active(folio) && folio_test_unevictable(folio), folio);
	VM_BUG_ON_FOLIO(folio_test_lru(folio), folio);

	/* see the comment in lru_gen_add_folio() */
	if (lru_gen_enabled() && !folio_test_unevictable(folio) &&
	    lru_gen_in_pgfault() && !(current->flags & PF_MEMALLOC))
		folio_set_active(folio);

	folio_get(folio);
	local_lock(&lru_pvecs.lock);
	pvec = this_cpu_ptr(&lru_pvecs.lru_add);
	if (pagevec_add_and_need_flush(pvec, &folio->page))
		__pagevec_lru_add(pvec);
	local_unlock(&lru_pvecs.lock);
}
