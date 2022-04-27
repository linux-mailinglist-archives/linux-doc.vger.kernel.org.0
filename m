Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA81C510DD6
	for <lists+linux-doc@lfdr.de>; Wed, 27 Apr 2022 03:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356634AbiD0BWK (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 26 Apr 2022 21:22:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344391AbiD0BWI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Apr 2022 21:22:08 -0400
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 285BB174433
        for <linux-doc@vger.kernel.org>; Tue, 26 Apr 2022 18:18:59 -0700 (PDT)
Received: by mail-ua1-x92f.google.com with SMTP id z15so87918uad.7
        for <linux-doc@vger.kernel.org>; Tue, 26 Apr 2022 18:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dkaom6jGHiqXJJvzANNgQPiwnUpwsfzq/QVSUZefRFM=;
        b=CNABcSddX5b6n+TQdqiZuhToeSYgN8qqRcrhLTf2cbtNpqOpITOw0HoUW1VxeheSqr
         +kIHNlxEm7JA7PbBw9bvynk3vAS1zjmQEequdqIu7eonYeGOKX1RbYd4eXS4EL7Cnlm7
         Wi8acyLCuqs+uqGQDo0rBN9uQkgZ45oK5xeF1xKHiAeYfZZu4409vPwkLv8mkEOmuhRN
         gxvSR+Fa/kK898TJTUuGLY5PaLuM7wYYzf5ZxA16B0IMmvu8tPBoxRFky8sOUqW9+Xyz
         04/FOMsq62xn0mP4AjRhUQRea/OIEEJpkItR6Q3DMQikK/BMkmfkfFRsGadzVE77x5+x
         1sIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dkaom6jGHiqXJJvzANNgQPiwnUpwsfzq/QVSUZefRFM=;
        b=VhDpFH9Ql3kSQX4TN9Y8bm6otbwFAh4Jelmhtpr1lSAAp1RkoIf6WKmCeliwKydSLG
         uTHjXIBT4d/HiY6Lpx+6R0iFtkXRioActlbCLoUUgZxHYPC5SCXuagXadIWCaHKLDoj2
         HCdQJmRO8PNKEaA3XOIb9zCdwL2rYUJhCSRcXi7rHAp7aUe91MfWWU8rMiga14rXapcJ
         ahgX2eerrIpyI9f9XhW89KHf305dM2nSyXR6iZGxYV3di3ZJVvnqlToC9qaew8hHyqdW
         IrOrD7Hk5Q3joqa8RE/vBxtTA1/2YMWoRe6Smk48KAOWc1mtfizQq1wsmG/5xM+Brd29
         N06A==
X-Gm-Message-State: AOAM533gHWWoWrn2YSfx4Lzpf4unB7IQ8QjvciHtx7mLXS2TFdQfGfYG
        AyQMxY/vz5OxU7el0hyZ5lb5N+jaIOSsy2DO5msBmQ==
X-Google-Smtp-Source: ABdhPJwdvDGouIH2ciLL1gxZrezu13HylZKO7y/rVDTnJd8+6pCaQT17EsqSX68jOcxM2tD03lALxOCQHXmVvOnDW5M=
X-Received: by 2002:ab0:2695:0:b0:352:5fc9:4132 with SMTP id
 t21-20020ab02695000000b003525fc94132mr7877586uao.29.1651022338107; Tue, 26
 Apr 2022 18:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220407031525.2368067-1-yuzhao@google.com> <20220407031525.2368067-6-yuzhao@google.com>
 <20220411191615.a34959bdcc25ef3f9c16a7ce@linux-foundation.org>
 <CAOUHufaeNzDJnDqatHe0MwsN-D6M_tw6JX2UBJFc+JpZNP86hQ@mail.gmail.com> <20220426164241.99e6a283c371ed75fa5c12a0@linux-foundation.org>
In-Reply-To: <20220426164241.99e6a283c371ed75fa5c12a0@linux-foundation.org>
From:   Yu Zhao <yuzhao@google.com>
Date:   Tue, 26 Apr 2022 19:18:21 -0600
Message-ID: <CAOUHufbMA7VutATpDYZ15JT_WuP9MGL_Vp6q5KFk72OjzRV+qQ@mail.gmail.com>
Subject: Re: [PATCH v10 05/14] mm: multi-gen LRU: groundwork
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Stephen Rothwell <sfr@rothwell.id.au>,
        Linux-MM <linux-mm@kvack.org>, Andi Kleen <ak@linux.intel.com>,
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
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Kernel Page Reclaim v2 <page-reclaim@google.com>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Brian Geffon <bgeffon@google.com>,
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
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 26, 2022 at 5:42 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Tue, 26 Apr 2022 16:39:07 -0600 Yu Zhao <yuzhao@google.com> wrote:
>
> > On Mon, Apr 11, 2022 at 8:16 PM Andrew Morton <akpm@linux-foundation.org> wrote:
> > >
> > > On Wed,  6 Apr 2022 21:15:17 -0600 Yu Zhao <yuzhao@google.com> wrote:
> > >
> > > > Evictable pages are divided into multiple generations for each lruvec.
> > > > The youngest generation number is stored in lrugen->max_seq for both
> > > > anon and file types as they are aged on an equal footing. The oldest
> > > > generation numbers are stored in lrugen->min_seq[] separately for anon
> > > > and file types as clean file pages can be evicted regardless of swap
> > > > constraints. These three variables are monotonically increasing.
> > > >
> > > > ...
> > > >
> > > > +static inline bool lru_gen_del_folio(struct lruvec *lruvec, struct folio *folio, bool reclaiming)
> > >
> > > There's a lot of function inlining here.  Fortunately the compiler will
> > > ignore it all, because some of it looks wrong.  Please review (and
> > > remeasure!).  If inlining is reqlly justified, use __always_inline, and
> > > document the reasons for doing so.
> >
> > I totally expect modern compilers to make better decisions than I do.
> > And personally, I'd never use __always_inline; instead, I'd strongly
> > recommend FDO/LTO.
>
> My (badly expressed) point is that there's a lot of inlining of large
> functions here.
>
> For example, lru_gen_add_folio() is huge and has 4(?) call sites.  This
> may well produce slower code due to the icache footprint.
>
> Experiment: moving lru_gen_del_folio() into mm/vmscan.c shrinks that
> file's .text from 80612 bytes to 78956.
>
> I tend to think that out-of-line regular old C functions should be the
> default and that the code should be inlined only when a clear benefit
> is demonstrable, or has at least been seriously thought about.

I can move those functions to vmscan.c if you think it would improve
performance. I don't have a strong opinion here -- I was able to
measure the bloat but not the performance impact.

> > > > --- a/mm/Kconfig
> > > > +++ b/mm/Kconfig
> > > > @@ -909,6 +909,14 @@ config ANON_VMA_NAME
> > > >         area from being merged with adjacent virtual memory areas due to the
> > > >         difference in their name.
> > > >
> > > > +config LRU_GEN
> > > > +     bool "Multi-Gen LRU"
> > > > +     depends on MMU
> > > > +     # the following options can use up the spare bits in page flags
> > > > +     depends on !MAXSMP && (64BIT || !SPARSEMEM || SPARSEMEM_VMEMMAP)
> > > > +     help
> > > > +       A high performance LRU implementation to overcommit memory.
> > > > +
> > > >  source "mm/damon/Kconfig"
> > >
> > > This is a problem.  I had to jump through hoops just to be able to
> > > compile-test this.  Turns out I had to figure out how to disable
> > > MAXSMP.
> > >
> > > Can we please figure out a way to ensure that more testers are at least
> > > compile testing this?  Allnoconfig, defconfig, allyesconfig, allmodconfig.
> > >
> > > Also, I suggest that we actually make MGLRU the default while in linux-next.
> >
> > The !MAXSMP is to work around [1], which I haven't had the time to
> > fix. That BUILD_BUG_ON() shouldn't assert sizeof(struct page) == 64
> > since the true size depends on WANT_PAGE_VIRTUAL as well as
> > LAST_CPUPID_NOT_IN_PAGE_FLAGS. My plan is here [2].
> >
> > [1] https://lore.kernel.org/r/20190905154603.10349-4-aneesh.kumar@linux.ibm.com/
> > [2] https://lore.kernel.org/r/Ygl1Gf+ATBuI%2Fm2q@google.com/
>
> OK, thanks.  This is fairly urgent for -next and -rc inclusion.  If
> practically nobody is compiling the feature then practically nobody is
> testing it.  Let's come up with a way to improves the expected coverage
> by a lot.

Let me just remove !MAXSMP, since I wasn't able to reproduce this
build error [1] anymore.

[1] https://lore.kernel.org/r/1792f0b2e29.d72f70c9807100.8179330337708563324@xanmod.org/
