Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBAA43D95D2
	for <lists+linux-doc@lfdr.de>; Wed, 28 Jul 2021 21:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231521AbhG1TDZ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 28 Jul 2021 15:03:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231701AbhG1TDW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Jul 2021 15:03:22 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF4AFC06179A
        for <linux-doc@vger.kernel.org>; Wed, 28 Jul 2021 12:03:18 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id j18-20020a17090aeb12b029017737e6c349so3526969pjz.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Jul 2021 12:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D09k/udZzMUApTlrkXnqjrikpFnOE7fyiukk2PXvDy0=;
        b=s9HiC6tPraYvdos2gWW7j/Hb62sMW6rzQnjZs/GKe3z19p4HRDKZioJyHfvH1ZcWG7
         qf7YgpBMLtEKx6JABTpeMgd5F5lcCWe65oeqTNqi4DZILAzKJYrCdVt9l/MeXdu3jS/X
         VCM7QEK47oh/TMvmUq9GVEQL9tFg0dSQa0p1jnmPh3AddvpMQtI2oWZJhVUVJW9ectf7
         GOvi5NkI+S5IW8helEGgw1i1c1S0RHMBRD3z/GdGXjQlY6/yCmYOoqB/k7DNdryDH6fd
         4J/rggL384wtHZ6C3omTgWHa0UROCw1rBVsUNYYwWlKvlxCrLyRpem7usEvxq+jdUGs3
         rWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D09k/udZzMUApTlrkXnqjrikpFnOE7fyiukk2PXvDy0=;
        b=DsiW+lByT1WHG3r25ytolvuXuHxakQXNTnYnKHqUvsy6ArZEv4t15D2Lbkn0Ei+D9V
         3uHpgSd8nmnJRNpG/SHCMHWjc90OfX8R68i+VZqoFJDZYRjySmZ7dvM0vLtNTRB58jvn
         Wiuty2QNlpb0I21zHoJo3/XnK2ZSSHwKW/EADG8gdvGeamNea+febFHW/xp16QLDnw72
         IO2jX9dpQH7/I9dDDbp8K+BGTaEeqKJpByzkPFMjAcD9BOQygXQNQABHgddA7JJ74+Vn
         M08u3LBPfqLMh4flfUNl/wjcCxsln5YtHlmb4j3Krz5OpTZ7/+iH87AmnmSdaeM0TBLI
         U0DA==
X-Gm-Message-State: AOAM532u+o9CWt9dTLgu8dw6iTiYlFtptLMxfexV0ZhQfdKvv30lwhbk
        MqrK9MPN8kn90TjTIgBs2WyDM2PD4kguH7GJKQNXqg==
X-Google-Smtp-Source: ABdhPJxrZ0UlTsxwVvgI1SC8FXddx7YeCH0Fhfco+z6XiLx1P52Oy12HxjSfu8GvoH5TyVqyNIT2qcJlRFKnJ8H88nk=
X-Received: by 2002:a63:d54b:: with SMTP id v11mr325711pgi.450.1627498998244;
 Wed, 28 Jul 2021 12:03:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210714193542.21857-1-joao.m.martins@oracle.com>
 <20210714193542.21857-13-joao.m.martins@oracle.com> <CAPcyv4h5c9afuxXy=UhrRr_tTwHB62RODyCKWNFU5TumXHc76A@mail.gmail.com>
 <f7217b61-c845-eaed-501e-c9e7067a6b87@oracle.com> <CAPcyv4hRQhG+0ika-wbxSFYrpmMJHxxX456qE64PMxDoxS+Fwg@mail.gmail.com>
 <156c4fb8-46c5-d8ae-b953-837b86516ded@oracle.com> <CAPcyv4hmoS8QSfBY6z07w9Ywjdq8WkROFVn3b_1bsE9i9_j3UA@mail.gmail.com>
 <e07e82d1-9310-6ee4-2336-79973cf460f7@oracle.com>
In-Reply-To: <e07e82d1-9310-6ee4-2336-79973cf460f7@oracle.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Wed, 28 Jul 2021 12:03:07 -0700
Message-ID: <CAPcyv4jJRxw8jJNCBOGLg8HJpTtmbrqqJF8BjUWCUmm65ZGOmQ@mail.gmail.com>
Subject: Re: [PATCH v3 12/14] device-dax: compound pagemap support
To:     Joao Martins <joao.m.martins@oracle.com>
Cc:     Linux MM <linux-mm@kvack.org>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Matthew Wilcox <willy@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        John Hubbard <jhubbard@nvidia.com>,
        Jane Chu <jane.chu@oracle.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux NVDIMM <nvdimm@lists.linux.dev>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 28, 2021 at 11:59 AM Joao Martins <joao.m.martins@oracle.com> wrote:
>
>
>
> On 7/28/21 7:51 PM, Dan Williams wrote:
> > On Wed, Jul 28, 2021 at 2:36 AM Joao Martins <joao.m.martins@oracle.com> wrote:
> >>
> >> On 7/28/21 12:51 AM, Dan Williams wrote:
> >>> On Thu, Jul 15, 2021 at 5:01 AM Joao Martins <joao.m.martins@oracle.com> wrote:
> >>>> On 7/15/21 12:36 AM, Dan Williams wrote:
> >>>>> On Wed, Jul 14, 2021 at 12:36 PM Joao Martins <joao.m.martins@oracle.com> wrote:
> >>>> This patch is not the culprit, the flaw is early in the series, specifically the fourth patch.
> >>>>
> >>>> It needs this chunk below change on the fourth patch due to the existing elevated page ref
> >>>> count at zone device memmap init. put_page() called here in memunmap_pages():
> >>>>
> >>>> for (i = 0; i < pgmap->nr_ranges; i++)
> >>>>         for_each_device_pfn(pfn, pgmap, i)
> >>>>                 put_page(pfn_to_page(pfn));
> >>>>
> >>>> ... on a zone_device compound memmap would otherwise always decrease head page refcount by
> >>>> @geometry pfn amount (leading to the aforementioned splat you reported).
> >>>>
> >>>> diff --git a/mm/memremap.c b/mm/memremap.c
> >>>> index b0e7b8cf3047..79a883af788e 100644
> >>>> --- a/mm/memremap.c
> >>>> +++ b/mm/memremap.c
> >>>> @@ -102,15 +102,15 @@ static unsigned long pfn_end(struct dev_pagemap *pgmap, int range_id)
> >>>>         return (range->start + range_len(range)) >> PAGE_SHIFT;
> >>>>  }
> >>>>
> >>>> -static unsigned long pfn_next(unsigned long pfn)
> >>>> +static unsigned long pfn_next(struct dev_pagemap *pgmap, unsigned long pfn)
> >>>>  {
> >>>>         if (pfn % 1024 == 0)
> >>>>                 cond_resched();
> >>>> -       return pfn + 1;
> >>>> +       return pfn + pgmap_pfn_geometry(pgmap);
> >>>
> >>> The cond_resched() would need to be fixed up too to something like:
> >>>
> >>> if (pfn % (1024 << pgmap_geometry_order(pgmap)))
> >>>     cond_resched();
> >>>
> >>> ...because the goal is to take a break every 1024 iterations, not
> >>> every 1024 pfns.
> >>>
> >>
> >> Ah, good point.
> >>
> >>>>  }
> >>>>
> >>>>  #define for_each_device_pfn(pfn, map, i) \
> >>>> -       for (pfn = pfn_first(map, i); pfn < pfn_end(map, i); pfn = pfn_next(pfn))
> >>>> +       for (pfn = pfn_first(map, i); pfn < pfn_end(map, i); pfn = pfn_next(map, pfn))
> >>>>
> >>>>  static void dev_pagemap_kill(struct dev_pagemap *pgmap)
> >>>>  {
> >>>>
> >>>> It could also get this hunk below, but it is sort of redundant provided we won't touch
> >>>> tail page refcount through out the devmap pages lifetime. This setting of tail pages
> >>>> refcount to zero was in pre-v5.14 series, but it got removed under the assumption it comes
> >>>> from the page allocator (where tail pages are already zeroed in refcount).
> >>>
> >>> Wait, devmap pages never see the page allocator?
> >>>
> >> "where tail pages are already zeroed in refcount" this actually meant 'freshly allocated
> >> pages' and I was referring to commit 7118fc2906e2 ("hugetlb: address ref count racing in
> >> prep_compound_gigantic_page") that removed set_page_count() because the setting of page
> >> ref count to zero was redundant.
> >
> > Ah, maybe include that reference in the changelog?
> >
> Yeap, will do.
>
> >>
> >> Albeit devmap pages don't come from page allocator, you know separate zone and these pages
> >> aren't part of the regular page pools (e.g. accessible via alloc_pages()), as you are
> >> aware. Unless of course, we reassign them via dax_kmem, but then the way we map the struct
> >> pages would be regular without any devmap stuff.
> >
> > Got it. I think with the back reference to that commit (7118fc2906e2)
> > it resolves my confusion.
> >
> >>
> >>>>
> >>>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> >>>> index 96975edac0a8..469a7aa5cf38 100644
> >>>> --- a/mm/page_alloc.c
> >>>> +++ b/mm/page_alloc.c
> >>>> @@ -6623,6 +6623,7 @@ static void __ref memmap_init_compound(struct page *page, unsigned
> >>>> long pfn,
> >>>>                 __init_zone_device_page(page + i, pfn + i, zone_idx,
> >>>>                                         nid, pgmap);
> >>>>                 prep_compound_tail(page, i);
> >>>> +               set_page_count(page + i, 0);
> >>>
> >>> Looks good to me and perhaps a for elevated tail page refcount at
> >>> teardown as a sanity check that the tail pages was never pinned
> >>> directly?
> >>>
> >> Sorry didn't follow completely.
> >>
> >> You meant to set tail page refcount back to 1 at teardown if it was kept to 0 (e.g.
> >> memunmap_pages() after put_page()) or that the refcount is indeed kept to zero after the
> >> put_page() in memunmap_pages() ?
> >
> > The latter, i.e. would it be worth it to check that a tail page did
> > not get accidentally pinned instead of a head page? I'm also ok to
> > leave out that sanity checking for now.
> >
> What makes me not worry too much about the sanity checking is that this put_page is
> supposed to disappear here:
>
> https://lore.kernel.org/linux-mm/20210717192135.9030-3-alex.sierra@amd.com/
>
> .. in fact none the hunks here:
>
> https://lore.kernel.org/linux-mm/f7217b61-c845-eaed-501e-c9e7067a6b87@oracle.com/
>
> None of them would matter, as there would no longer exist an elevated page refcount to
> deal with.

Ah good point. It's past time to take care of that... if only that
patch kit had been Cc'd to the DAX maintainer...
