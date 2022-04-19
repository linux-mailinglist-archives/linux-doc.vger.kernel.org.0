Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B65AA507C7E
	for <lists+linux-doc@lfdr.de>; Wed, 20 Apr 2022 00:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231620AbiDSW2l (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 19 Apr 2022 18:28:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbiDSW2k (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Apr 2022 18:28:40 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FC201FA60
        for <linux-doc@vger.kernel.org>; Tue, 19 Apr 2022 15:25:56 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id a127so17040856vsa.3
        for <linux-doc@vger.kernel.org>; Tue, 19 Apr 2022 15:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1SSVHI315z/RBsosmoq+DUHmCLwLjqcBK/6yGPaqYLw=;
        b=bfljGrmwzt76fFNtfv1uodcdGEJ0apZDy0dCLzdgwQVYJ14sKe73b0wwu7HW5/Suzz
         7FtTSwmdPlDcPqbz8RTN50cse3FKAgGrsXS+C8bfQcOFqkeuYPEYglNqA/WPXSAGeWMM
         OdTJXW4BklnuiiObtv1xiIxaZ9zPXI2+BSwwXMFFDOVQjCxcNSmRx5aw071RWZyadwAl
         Rv4llSwvtBnDgWv/S/wa3Cdy/Vwtz7QPFBvQTJj6YQOwx89PofNFfsHxtRq+hlDGd/pV
         IiWaDbsqcOozuV7ZQvYdUBn2QhnmjvtGzuOHwxOUjBvhpllHCVDZylzBvTZ5g6E0A5mn
         MA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1SSVHI315z/RBsosmoq+DUHmCLwLjqcBK/6yGPaqYLw=;
        b=R/QEtbz79kazEFgrJ61LWorMKqKCjtTn0d2CfTzlMv5hb8QJh068KqzHZpjURSgcXc
         UM0j/cMxhH7np81fYUucr6Sbm29BPKM9u7+SeG4zNh+Z+97CpsMUOLFJ7fzuqbTNtxvI
         ueDFGxzwwt8It1amuA8+pa8X2OMknlMIEsiNmGONQFHhLQJWvdPDgqvZR96rCxJwh0sQ
         jjIhEihMY5XNA/40dI5VUWnOAcEDc77lD2fKB+Y+MBaEgY9hktMaRkNv1/78yjTgIDvp
         yP3vfKkn2iJOGSvnjd0fjFdwcNuAUoIwY6Rx5iH/pdImS06BYsEgvt/c3nR4cPazsO3d
         o7fQ==
X-Gm-Message-State: AOAM531/8y6/FUDJ9IMaLex72bR3pyFraNOdVAOAkAuvwOayt/Nbh5e+
        6yNNQdxvPQfkMsfnUkQ/Xcds8IpiYtf2tFCw7gYqCg==
X-Google-Smtp-Source: ABdhPJzh4FLwqXWhLNS9K4J6wbTJYY5R2UEC0it7lTqn+s/X/xkskvCzDFdlhwGQfxmpJaNgdaMiuJlDIp70EUjauDE=
X-Received: by 2002:a05:6102:5e1:b0:32a:6d68:171d with SMTP id
 w1-20020a05610205e100b0032a6d68171dmr1714816vsf.6.1650407154980; Tue, 19 Apr
 2022 15:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220407031525.2368067-1-yuzhao@google.com> <20220407031525.2368067-7-yuzhao@google.com>
 <CAGsJ_4x2wmR60GQO-jjd5UAvOMWMSi+kFpUa2DBm4e8KocH7jQ@mail.gmail.com>
 <CAOUHufY_DBk3R7a3=Zb1eofNyqq3VWOmffOR2LaWJQZPYUeCvA@mail.gmail.com>
 <CAGsJ_4wj2mbqSoT3sXHVU+ouCpTPyOXAu9wZS+2U_T5LtN97dA@mail.gmail.com> <CAGsJ_4ys6FmwvKkNVpD9Jv_DxG+82oRBc6y9FGGo+POfMEEaUw@mail.gmail.com>
In-Reply-To: <CAGsJ_4ys6FmwvKkNVpD9Jv_DxG+82oRBc6y9FGGo+POfMEEaUw@mail.gmail.com>
From:   Yu Zhao <yuzhao@google.com>
Date:   Tue, 19 Apr 2022 16:25:18 -0600
Message-ID: <CAOUHufbX7hsrAq7FzXCn2FVwLJDYWnP8hhpS5Q2KN3__i_GFiQ@mail.gmail.com>
Subject: Re: [PATCH v10 06/14] mm: multi-gen LRU: minimal implementation
To:     Barry Song <21cnbao@gmail.com>
Cc:     Stephen Rothwell <sfr@rothwell.id.au>,
        Linux-MM <linux-mm@kvack.org>, Andi Kleen <ak@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
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
        LAK <linux-arm-kernel@lists.infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Kernel Page Reclaim v2 <page-reclaim@google.com>,
        x86 <x86@kernel.org>, Brian Geffon <bgeffon@google.com>,
        Jan Alexander Steffens <heftig@archlinux.org>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Steven Barrett <steven@liquorix.net>,
        Suleiman Souhlal <suleiman@google.com>,
        Daniel Byrne <djbyrne@mtu.edu>,
        Donald Carr <d@chaos-reins.com>,
        =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>,
        Shuang Zhai <szhai2@cs.rochester.edu>,
        Sofia Trinh <sofia.trinh@edi.works>,
        Vaibhav Jain <vaibhav@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 18, 2022 at 10:36 PM Barry Song <21cnbao@gmail.com> wrote:
>
> On Tue, Apr 19, 2022 at 4:25 PM Barry Song <21cnbao@gmail.com> wrote:
> >
> > On Tue, Apr 19, 2022 at 12:54 PM Yu Zhao <yuzhao@google.com> wrote:
> > >
> > > On Mon, Apr 18, 2022 at 3:58 AM Barry Song <21cnbao@gmail.com> wrote:
> > > >
> > > > On Thu, Apr 7, 2022 at 3:16 PM Yu Zhao <yuzhao@google.com> wrote:
> > > > >
> > > > > To avoid confusion, the terms "promotion" and "demotion" will be
> > > > > applied to the multi-gen LRU, as a new convention; the terms
> > > > > "activation" and "deactivation" will be applied to the active/inactive
> > > > > LRU, as usual.
> > > > >
> > > > > The aging produces young generations. Given an lruvec, it increments
> > > > > max_seq when max_seq-min_seq+1 approaches MIN_NR_GENS. The aging
> > > > > promotes hot pages to the youngest generation when it finds them
> > > > > accessed through page tables; the demotion of cold pages happens
> > > > > consequently when it increments max_seq. The aging has the complexity
> > > > > O(nr_hot_pages), since it is only interested in hot pages. Promotion
> > > > > in the aging path does not require any LRU list operations, only the
> > > > > updates of the gen counter and lrugen->nr_pages[]; demotion, unless as
> > > > > the result of the increment of max_seq, requires LRU list operations,
> > > > > e.g., lru_deactivate_fn().
> > > > >
> > > > > The eviction consumes old generations. Given an lruvec, it increments
> > > > > min_seq when the lists indexed by min_seq%MAX_NR_GENS become empty. A
> > > > > feedback loop modeled after the PID controller monitors refaults over
> > > > > anon and file types and decides which type to evict when both types
> > > > > are available from the same generation.
> > > > >
> > > > > Each generation is divided into multiple tiers. Tiers represent
> > > > > different ranges of numbers of accesses through file descriptors. A
> > > > > page accessed N times through file descriptors is in tier
> > > > > order_base_2(N). Tiers do not have dedicated lrugen->lists[], only
> > > > > bits in folio->flags. In contrast to moving across generations, which
> > > > > requires the LRU lock, moving across tiers only involves operations on
> > > > > folio->flags. The feedback loop also monitors refaults over all tiers
> > > > > and decides when to protect pages in which tiers (N>1), using the
> > > > > first tier (N=0,1) as a baseline. The first tier contains single-use
> > > > > unmapped clean pages, which are most likely the best choices. The
> > > > > eviction moves a page to the next generation, i.e., min_seq+1, if the
> > > > > feedback loop decides so. This approach has the following advantages:
> > > > > 1. It removes the cost of activation in the buffered access path by
> > > > >    inferring whether pages accessed multiple times through file
> > > > >    descriptors are statistically hot and thus worth protecting in the
> > > > >    eviction path.
> > > > > 2. It takes pages accessed through page tables into account and avoids
> > > > >    overprotecting pages accessed multiple times through file
> > > > >    descriptors. (Pages accessed through page tables are in the first
> > > > >    tier, since N=0.)
> > > > > 3. More tiers provide better protection for pages accessed more than
> > > > >    twice through file descriptors, when under heavy buffered I/O
> > > > >    workloads.
> > > > >
> > > >
> > > > Hi Yu,
> > > > As I told you before,  I tried to change the current LRU (not MGLRU) by only
> > > > promoting unmapped file pages to the head of the inactive head rather than
> > > > the active head on its second access:
> > > > https://lore.kernel.org/lkml/CAGsJ_4y=TkCGoWWtWSAptW4RDFUEBeYXwfwu=fUFvV4Sa4VA4A@mail.gmail.com/
> > > > I have already seen some very good results by the decease of cpu consumption of
> > > > kswapd and direct reclamation in the testing.
> > >
> > > Glad to hear. I suspected you'd see some good results with that change :)
> > >
> > > > in mglru, it seems "twice" isn't a concern at all, one unmapped file
> > > > page accessed
> > > > twice has no much difference with those ones which are accessed once as you
> > > > only begin to increase refs from the third time:
> > >
> > > refs are *additional* accesses:
> > > PG_referenced: N=1
> > > PG_referenced+PG_workingset: N=2
> > > PG_referenced+PG_workingset+refs: N=3,4,5
> > >
> > > When N=2, order_base_2(N)=1. So pages accessed twice are in the second
> > > tier. Therefore they are "different".
> > >
> > > More details [1]:
> > >
> > > +/*
> > > + * Each generation is divided into multiple tiers. Tiers represent different
> > > + * ranges of numbers of accesses through file descriptors. A page accessed N
> > > + * times through file descriptors is in tier order_base_2(N). A page in the
> > > + * first tier (N=0,1) is marked by PG_referenced unless it was faulted in
> > > + * though page tables or read ahead. A page in any other tier (N>1) is marked
> > > + * by PG_referenced and PG_workingset.
> > > + *
> > > + * In contrast to moving across generations which requires the LRU lock, moving
> > > + * across tiers only requires operations on folio->flags and therefore has a
> > > + * negligible cost in the buffered access path. In the eviction path,
> > > + * comparisons of refaulted/(evicted+protected) from the first tier and the
> > > + * rest infer whether pages accessed multiple times through file descriptors
> > > + * are statistically hot and thus worth protecting.
> > > + *
> > > + * MAX_NR_TIERS is set to 4 so that the multi-gen LRU can support twice of the
> > > + * categories of the active/inactive LRU when keeping track of accesses through
> > > + * file descriptors. It requires MAX_NR_TIERS-2 additional bits in
> > > folio->flags.
> > > + */
> > > +#define MAX_NR_TIERS 4U
> > >
> > > [1] https://lore.kernel.org/linux-mm/20220407031525.2368067-7-yuzhao@google.com/
> > >
> > > > +static void folio_inc_refs(struct folio *folio)
> > > > +{
> > > > +       unsigned long refs;
> > > > +       unsigned long old_flags, new_flags;
> > > > +
> > > > +       if (folio_test_unevictable(folio))
> > > > +               return;
> > > > +
> > > > +       /* see the comment on MAX_NR_TIERS */
> > > > +       do {
> > > > +               new_flags = old_flags = READ_ONCE(folio->flags);
> > > > +
> > > > +               if (!(new_flags & BIT(PG_referenced))) {
> > > > +                       new_flags |= BIT(PG_referenced);
> > > > +                       continue;
> > > > +               }
> > > > +
> > > > +               if (!(new_flags & BIT(PG_workingset))) {
> > > > +                       new_flags |= BIT(PG_workingset);
> > > > +                       continue;
> > > > +               }
> > > > +
> > > > +               refs = new_flags & LRU_REFS_MASK;
> > > > +               refs = min(refs + BIT(LRU_REFS_PGOFF), LRU_REFS_MASK);
> > > > +
> > > > +               new_flags &= ~LRU_REFS_MASK;
> > > > +               new_flags |= refs;
> > > > +       } while (new_flags != old_flags &&
> > > > +                cmpxchg(&folio->flags, old_flags, new_flags) != old_flags);
> > > > +}
> > > >
> > > > So my question is what makes you so confident that twice doesn't need
> > > > any special treatment while the vanilla kernel is upgrading this kind of page
> > > > to the head of the active instead? I am asking this because I am considering
> > > > reclaiming unmapped file pages which are only accessed twice when they
> > > > get to the tail of the inactive list.
> > >
> > > Per above, pages accessed twice are in their own tier. Hope this clarifies it.
> >
> > Yep, I found the trick here , "+1" is magic behind the code, haha.
> >
> > +static int folio_lru_tier(struct folio *folio)
> > +{
> > +    int refs;
> > +    unsigned long flags = READ_ONCE(folio->flags);
> > +
> > +    refs = (flags & LRU_REFS_FLAGS) == LRU_REFS_FLAGS ?
> > +          ((flags & LRU_REFS_MASK) >> LRU_REFS_PGOFF) + 1 : 0;
> > +
> > +    return lru_tier_from_refs(refs);
> > +}
> > +
> >
> > TBH, this might need some comments, otherwise, it is easy to misunderstand
> > we are beginning to have protection from 3rd access :-)
>
> as anyway, it would be much more straightforward to have the below if
> we can also
> increase refs for the 1st and 2nd access in folio_inc_refs():

It would if there were abundant spare bits in page->flags. On some
machines, we don't, so we have to reuse PG_referenced and
PG_workingset.

>  +static int folio_lru_tier(struct folio *folio)
>  +{
>  +    int refs;
>  +    unsigned long flags = READ_ONCE(folio->flags);
>  +
>  +    refs = (flags & LRU_REFS_MASK) >> LRU_REFS_PGOFF;
>  +
>  +    return lru_tier_from_refs(refs);
>  +}
