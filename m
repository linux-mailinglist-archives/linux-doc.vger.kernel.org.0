Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E81A2412EC3
	for <lists+linux-doc@lfdr.de>; Tue, 21 Sep 2021 08:44:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbhIUGpb (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 21 Sep 2021 02:45:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbhIUGpa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Sep 2021 02:45:30 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAC7BC061574
        for <linux-doc@vger.kernel.org>; Mon, 20 Sep 2021 23:44:02 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id n2so10099790plk.12
        for <linux-doc@vger.kernel.org>; Mon, 20 Sep 2021 23:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qeCXjIpYXsAnaU3oxGDbt64MrBlL7kjozPkuT7rdTbo=;
        b=z8sUMUbXBQB5gz7JBeFuGBuwWdyT/cHU6HdETGdu021UiSt9gbRTlheHerpAb+kVeQ
         IND1zux0JBXQPqSmoMiD2wf+bo4XOoXvOPLRBEvfgpn0Eq1MWEwa4HAZ4LCZur5i7cYb
         id8e3YP91xYJ4+slyeyRZ2+shnBUOfcbohwenmuQg7HHNP33AMStCOxF93lNjLPe61nM
         O9pRPpjPDzEw3EoVH42F9HmJvO2LiVUxjKEnInpvq6+InJwy7XPJbdY1g8JdKwW+PNmT
         EAFrWyBDpnbYkh1Mmvb7h81ZblFjXM9yBSQSetRBrFVBeUG4N4AWLBaexFX6rCiEDBA8
         4HoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qeCXjIpYXsAnaU3oxGDbt64MrBlL7kjozPkuT7rdTbo=;
        b=Av0HpGOhV6mNF85nR1nSFuD7PkY+6TjHRGxwwXBO7Z+PJU1CN8Fh341UPRfcVSbPmT
         hLodPmXWwJodDJ48UQhSFpmiTdPPFkZQ0cQMyFDFagvfvZoDW4VuQolLwpseMWU5rt4b
         QNlETmgeyDi5R02vrQo6EHH5gbliJsGQ+uXUBsgfmwqlhEqhRKOF3mqWtDN3CikM7Wwh
         VOwsHMAxUewo1eDppBVdxrq/xJ4hohdXJwLivVATaiLBufcMGt7jzhmgzhCP6O76DpHH
         /DN/r9vTHO154unXT0UfPkak1BNvNuKkzVw/UMO3/7U8xThKmdCZhPchrsEUyenU7yMF
         GT9A==
X-Gm-Message-State: AOAM532tGf1JgpYfpKknKuwjHHMnFiwwMbgIP3UVPM7nFu7GsOLaPedu
        DGjjN65GNBYPiAJIAaWgiqFqdbQ+6ZbSIIqOM/5TbA==
X-Google-Smtp-Source: ABdhPJzXk2k8y4lEGZiR4eKEM2G5e6sWT451zy4UiuYGJJintr+5EdqX9twlQpMlysUcMfhsPFNXzaTPFoBhERiF4qk=
X-Received: by 2002:a17:90b:4f8a:: with SMTP id qe10mr3495963pjb.5.1632206642403;
 Mon, 20 Sep 2021 23:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210917034815.80264-1-songmuchun@bytedance.com>
 <20210917034815.80264-2-songmuchun@bytedance.com> <CAGsJ_4y8mZh4RNaY-JQHa5Sr+Tv3HingV42jwK9KoJ+0m=w87A@mail.gmail.com>
 <CAMZfGtVmhHGNizHsdJXygigm84Z72B3wtUYxpT1XW3GpWh1AWQ@mail.gmail.com>
In-Reply-To: <CAMZfGtVmhHGNizHsdJXygigm84Z72B3wtUYxpT1XW3GpWh1AWQ@mail.gmail.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Tue, 21 Sep 2021 14:43:20 +0800
Message-ID: <CAMZfGtWpE+1Pap0X2RLHmrtjOze7iS8dYJF1k-9j2D8X7WtZ0Q@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 1/4] mm: hugetlb: free the 2nd vmemmap page
 associated with each HugeTLB page
To:     Barry Song <21cnbao@gmail.com>
Cc:     Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Oscar Salvador <osalvador@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        Barry Song <song.bao.hua@hisilicon.com>,
        David Hildenbrand <david@redhat.com>,
        Chen Huang <chenhuang5@huawei.com>,
        "Bodeddula, Balasubramaniam" <bodeddub@amazon.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <willy@infradead.org>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        fam.zheng@bytedance.com, Muchun Song <smuchun@gmail.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Sep 18, 2021 at 6:06 PM Muchun Song <songmuchun@bytedance.com> wrote:
>
> On Sat, Sep 18, 2021 at 12:39 PM Barry Song <21cnbao@gmail.com> wrote:
> >
> > On Sat, Sep 18, 2021 at 12:08 AM Muchun Song <songmuchun@bytedance.com> wrote:
> > >
> > > Currently, we only free 6 vmemmap pages associated with a 2MB HugeTLB
> > > page. However, we can remap all tail vmemmap pages to the page frame
> > > mapped to with the head vmemmap page. Finally, we can free 7 vmemmap
> > > pages for a 2MB HugeTLB page. It is a fine gain (e.g. we can save
> > > extra 2GB memory when there is 1TB HugeTLB pages in the system
> > > compared with the current implementation).
> > >
> > > But the head vmemmap page is not freed to the buddy allocator and all
> > > tail vmemmap pages are mapped to the head vmemmap page frame. So we
> > > can see more than one struct page struct with PG_head (e.g. 8 per 2 MB
> > > HugeTLB page) associated with each HugeTLB page. We should adjust
> > > compound_head() to make it returns the real head struct page when the
> > > parameter is the tail struct page but with PG_head flag.
> > >
> > > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> > > ---
> > >  Documentation/admin-guide/kernel-parameters.txt |  2 +-
> > >  include/linux/page-flags.h                      | 75 +++++++++++++++++++++++--
> > >  mm/hugetlb_vmemmap.c                            | 60 +++++++++++---------
> > >  mm/sparse-vmemmap.c                             | 21 +++++++
> > >  4 files changed, 126 insertions(+), 32 deletions(-)
> > >
> > > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > > index bdb22006f713..a154a7b3b9a5 100644
> > > --- a/Documentation/admin-guide/kernel-parameters.txt
> > > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > > @@ -1606,7 +1606,7 @@
> > >                         [KNL] Reguires CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
> > >                         enabled.
> > >                         Allows heavy hugetlb users to free up some more
> > > -                       memory (6 * PAGE_SIZE for each 2MB hugetlb page).
> > > +                       memory (7 * PAGE_SIZE for each 2MB hugetlb page).
> > >                         Format: { on | off (default) }
> > >
> > >                         on:  enable the feature
> > > diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> > > index 8e1d97d8f3bd..7b1a918ebd43 100644
> > > --- a/include/linux/page-flags.h
> > > +++ b/include/linux/page-flags.h
> > > @@ -184,13 +184,64 @@ enum pageflags {
> > >
> > >  #ifndef __GENERATING_BOUNDS_H
> > >
> > > +#ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
> > > +extern bool hugetlb_free_vmemmap_enabled;
> > > +
> > > +/*
> > > + * If the feature of freeing some vmemmap pages associated with each HugeTLB
> > > + * page is enabled, the head vmemmap page frame is reused and all of the tail
> > > + * vmemmap addresses map to the head vmemmap page frame (furture details can
> > > + * refer to the figure at the head of the mm/hugetlb_vmemmap.c).  In other
> > > + * word, there are more than one page struct with PG_head associated with each
> > > + * HugeTLB page.  We __know__ that there is only one head page struct, the tail
> > > + * page structs with PG_head are fake head page structs.  We need an approach
> > > + * to distinguish between those two different types of page structs so that
> > > + * compound_head() can return the real head page struct when the parameter is
> > > + * the tail page struct but with PG_head.
> > > + *
> > > + * The page_head_if_fake() returns the real head page struct iff the @page may
> > > + * be fake, otherwise, returns the @page if it cannot be a fake page struct.
> > > + */
> > > +static __always_inline const struct page *page_head_if_fake(const struct page *page)
> > > +{
> > > +       if (!hugetlb_free_vmemmap_enabled)
> > > +               return page;
> > > +
> > > +       /*
> > > +        * Only addresses aligned with PAGE_SIZE of struct page may be fake head
> > > +        * struct page. The alignment check aims to avoid access the fields (
> > > +        * e.g. compound_head) of the @page[1]. It can avoid touch a (possibly)
> > > +        * cold cacheline in some cases.
> > > +        */
> > > +       if (IS_ALIGNED((unsigned long)page, PAGE_SIZE) &&
> > > +           test_bit(PG_head, &page->flags)) {
> > > +               /*
> > > +                * We can safely access the field of the @page[1] with PG_head
> > > +                * because the @page is a compound page composed with at least
> > > +                * two contiguous pages.
> > > +                */
> > > +               unsigned long head = READ_ONCE(page[1].compound_head);
> > > +
> > > +               if (likely(head & 1))
> > > +                       return (const struct page *)(head - 1);
> > > +       }
> > > +
> > > +       return page;
> > > +}
> > > +#else
> > > +static __always_inline const struct page *page_head_if_fake(const struct page *page)
> > > +{
> > > +       return page;
> > > +}
> > > +#endif
> > > +
> > >  static inline unsigned long _compound_head(const struct page *page)
> > >  {
> > >         unsigned long head = READ_ONCE(page->compound_head);
> > >
> > >         if (unlikely(head & 1))
> > >                 return head - 1;
> > > -       return (unsigned long)page;
> > > +       return (unsigned long)page_head_if_fake(page);
> >
> > hard to read. page_head_if_fake,  what is the other side of
> > page_head_if_not_fake?
>
> 1) return itself if the @page is not a fake head page.
> 2) return head page if @page is a fake head page.
>
> So I want to express that page_head_if_fake returns a
> head page only and only if the parameter of @page is a
> fake head page. Otherwise, it returns itself.
>
> > I would expect something like
> > page_to_page_head()
> > or
> > get_page_head()
> >
>
> Those names seem to be not appropriate as well, because
> its functionality does not make sure it can return a head
> page. If the parameter is a head page, it definitely
> returns a head page, otherwise, it may return itself which
> may be a tail page.
>
> From this point of view, I still prefer page_head_if_fake.

After some thinking, I figured out 2 names.

page_head_if_fake() always returns a head page if the parameter
of @page is not a compound page or its ->flags has PG_head set
(you can think the head page is itself if the page is not a compound
page). All the callers of it already guarantee this. It means it has to
return a head page unless the @page is a tail page (except fake
head page). So I propose two names as follows.

1) page_head_unless_tail
2) page_head_filter_fake

The former means it always returns a head page unless the
caller passes a tail page as a parameter. The latter means
it always returns a head page but filtering out the fake head
page. The former is inspired by get_page_unless_zero.

What do you think?

Thanks.

>
> > Anyway, I am not quite sure what is the best name. but page_head_if_fake(page)
> > sounds odd to me. just like the things have two sides, but if_fake  presents
> > one side only.
>
> If others have any ideas, comments are welcome.
>
> >
> > >  }
> > >
> > >  #define compound_head(page)    ((typeof(page))_compound_head(page))
> > > @@ -225,12 +276,14 @@ static inline unsigned long _compound_head(const struct page *page)
> > >
> > >  static __always_inline int PageTail(struct page *page)
> > >  {
> > > -       return READ_ONCE(page->compound_head) & 1;
> > > +       return READ_ONCE(page->compound_head) & 1 ||
> > > +              page_head_if_fake(page) != page;
> >
> > i would expect a wrapper like:
> > page_is_fake_head()
>
> Good point. Will do.
>
> >
> > and the above page_to_page_head() can leverage the wrapper.
> > here too.
> >
> > >  }
> > >
> > >  static __always_inline int PageCompound(struct page *page)
> > >  {
> > > -       return test_bit(PG_head, &page->flags) || PageTail(page);
> > > +       return test_bit(PG_head, &page->flags) ||
> > > +              READ_ONCE(page->compound_head) & 1;
> >
> > hard to read. could it be something like the below?
> > return PageHead(page) || PageTail(page);
> >
> > or do we really need to change this function? even a fake head still has
> > the true test_bit(PG_head, &page->flags), though it is not a real head, it
> > is still a pagecompound, right?
>
> Right. PageCompound() can not be changed.  It is odd but
> efficient because calling page_head_if_fake is eliminated.
> So I select performance not readability. I'm not sure if it's
> worth it.
>
> Thanks.
