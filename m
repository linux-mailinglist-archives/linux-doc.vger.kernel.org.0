Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5673A4105E1
	for <lists+linux-doc@lfdr.de>; Sat, 18 Sep 2021 12:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234834AbhIRKIj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 18 Sep 2021 06:08:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234322AbhIRKIj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 18 Sep 2021 06:08:39 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9C4EC061757
        for <linux-doc@vger.kernel.org>; Sat, 18 Sep 2021 03:07:15 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so11774162pjc.3
        for <linux-doc@vger.kernel.org>; Sat, 18 Sep 2021 03:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UTVs5z4mdP0rZljYgyLzMfKwobKvVmMydUAvyWQOB+I=;
        b=rigfijvetNXGMca5GLAW5x1aC3L3dHQZtjIRPUyUkavsIBg1F1/O29jB+IneN5FhGO
         rRLlPgElnfbmeuPlU39dmjcyHTmA/fqo+vU4/1b4nkVyqSePQXxD2yLW1cTaIAQnkO+P
         4fE8xwChlu0lpp48CjfSAB9PEUEERoKd95sKfpOqHFx++q8B2rRO6QulX9sUNDif+x6s
         RlYDadJUrBFG6i+JlLjpoN89XOo4rBkva3+KxYwGS9Ex/rGU3VroZW5sZ42SrAY42RNp
         4leYFdsPX44xF4mt857r+V+HRmxq2WfY7ztAVbw3uqdx3b4DLPgFkdsrO7kaZu8dP8EZ
         xV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UTVs5z4mdP0rZljYgyLzMfKwobKvVmMydUAvyWQOB+I=;
        b=SAa3JXqiPH2hRhCt42VLHJ54DdcmpsaMMf3Yup0+3C9r9ygjcufqxfxpgz+jIb++0D
         /IMJKqx3AXQ7UdvE3VYYT0c3B2SWem1JMT2J6W3OodcmY0tjACP3ktBmLH3j/8+lad0r
         KAYrNMxFe72V3cqwNvfnhfjmRFeeEyKenYwlqumC021ZdhiHBMq1ynGih3TSt55HnRzX
         ctE4fKedzHMlCzbIME5hu63dB9b7/H4FzEsaYgYc2HU0JRE7yrFct9jEercA9jkbt1lm
         YtISyVRKyMCjs306evQcZN6alhj51rw7vnasXKoCp4ocFn33jIe7lv0VghFkhD3LY5Nb
         ha2g==
X-Gm-Message-State: AOAM532Vak4n/zJ98qh5RXcj3h8X/Mjh17CoMlPZW4+Q48yroeCJjMJw
        v2/mnlsCKzmyJtFyK+QIxvnQTWgmP6ZOsXN2/Uztpw==
X-Google-Smtp-Source: ABdhPJxoVsB9Ci6WuE10JjzpP1qZ4ZPAV9WU2qa1Tvo/PYjQ9XK8mxpjvORECMLmhZcRhTzP6wDRbMg9FQ3KEphH0F8=
X-Received: by 2002:a17:90b:4f8a:: with SMTP id qe10mr15977499pjb.5.1631959635279;
 Sat, 18 Sep 2021 03:07:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210917034815.80264-1-songmuchun@bytedance.com>
 <20210917034815.80264-2-songmuchun@bytedance.com> <CAGsJ_4y8mZh4RNaY-JQHa5Sr+Tv3HingV42jwK9KoJ+0m=w87A@mail.gmail.com>
In-Reply-To: <CAGsJ_4y8mZh4RNaY-JQHa5Sr+Tv3HingV42jwK9KoJ+0m=w87A@mail.gmail.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Sat, 18 Sep 2021 18:06:36 +0800
Message-ID: <CAMZfGtVmhHGNizHsdJXygigm84Z72B3wtUYxpT1XW3GpWh1AWQ@mail.gmail.com>
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

On Sat, Sep 18, 2021 at 12:39 PM Barry Song <21cnbao@gmail.com> wrote:
>
> On Sat, Sep 18, 2021 at 12:08 AM Muchun Song <songmuchun@bytedance.com> wrote:
> >
> > Currently, we only free 6 vmemmap pages associated with a 2MB HugeTLB
> > page. However, we can remap all tail vmemmap pages to the page frame
> > mapped to with the head vmemmap page. Finally, we can free 7 vmemmap
> > pages for a 2MB HugeTLB page. It is a fine gain (e.g. we can save
> > extra 2GB memory when there is 1TB HugeTLB pages in the system
> > compared with the current implementation).
> >
> > But the head vmemmap page is not freed to the buddy allocator and all
> > tail vmemmap pages are mapped to the head vmemmap page frame. So we
> > can see more than one struct page struct with PG_head (e.g. 8 per 2 MB
> > HugeTLB page) associated with each HugeTLB page. We should adjust
> > compound_head() to make it returns the real head struct page when the
> > parameter is the tail struct page but with PG_head flag.
> >
> > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> > ---
> >  Documentation/admin-guide/kernel-parameters.txt |  2 +-
> >  include/linux/page-flags.h                      | 75 +++++++++++++++++++++++--
> >  mm/hugetlb_vmemmap.c                            | 60 +++++++++++---------
> >  mm/sparse-vmemmap.c                             | 21 +++++++
> >  4 files changed, 126 insertions(+), 32 deletions(-)
> >
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > index bdb22006f713..a154a7b3b9a5 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -1606,7 +1606,7 @@
> >                         [KNL] Reguires CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
> >                         enabled.
> >                         Allows heavy hugetlb users to free up some more
> > -                       memory (6 * PAGE_SIZE for each 2MB hugetlb page).
> > +                       memory (7 * PAGE_SIZE for each 2MB hugetlb page).
> >                         Format: { on | off (default) }
> >
> >                         on:  enable the feature
> > diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> > index 8e1d97d8f3bd..7b1a918ebd43 100644
> > --- a/include/linux/page-flags.h
> > +++ b/include/linux/page-flags.h
> > @@ -184,13 +184,64 @@ enum pageflags {
> >
> >  #ifndef __GENERATING_BOUNDS_H
> >
> > +#ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
> > +extern bool hugetlb_free_vmemmap_enabled;
> > +
> > +/*
> > + * If the feature of freeing some vmemmap pages associated with each HugeTLB
> > + * page is enabled, the head vmemmap page frame is reused and all of the tail
> > + * vmemmap addresses map to the head vmemmap page frame (furture details can
> > + * refer to the figure at the head of the mm/hugetlb_vmemmap.c).  In other
> > + * word, there are more than one page struct with PG_head associated with each
> > + * HugeTLB page.  We __know__ that there is only one head page struct, the tail
> > + * page structs with PG_head are fake head page structs.  We need an approach
> > + * to distinguish between those two different types of page structs so that
> > + * compound_head() can return the real head page struct when the parameter is
> > + * the tail page struct but with PG_head.
> > + *
> > + * The page_head_if_fake() returns the real head page struct iff the @page may
> > + * be fake, otherwise, returns the @page if it cannot be a fake page struct.
> > + */
> > +static __always_inline const struct page *page_head_if_fake(const struct page *page)
> > +{
> > +       if (!hugetlb_free_vmemmap_enabled)
> > +               return page;
> > +
> > +       /*
> > +        * Only addresses aligned with PAGE_SIZE of struct page may be fake head
> > +        * struct page. The alignment check aims to avoid access the fields (
> > +        * e.g. compound_head) of the @page[1]. It can avoid touch a (possibly)
> > +        * cold cacheline in some cases.
> > +        */
> > +       if (IS_ALIGNED((unsigned long)page, PAGE_SIZE) &&
> > +           test_bit(PG_head, &page->flags)) {
> > +               /*
> > +                * We can safely access the field of the @page[1] with PG_head
> > +                * because the @page is a compound page composed with at least
> > +                * two contiguous pages.
> > +                */
> > +               unsigned long head = READ_ONCE(page[1].compound_head);
> > +
> > +               if (likely(head & 1))
> > +                       return (const struct page *)(head - 1);
> > +       }
> > +
> > +       return page;
> > +}
> > +#else
> > +static __always_inline const struct page *page_head_if_fake(const struct page *page)
> > +{
> > +       return page;
> > +}
> > +#endif
> > +
> >  static inline unsigned long _compound_head(const struct page *page)
> >  {
> >         unsigned long head = READ_ONCE(page->compound_head);
> >
> >         if (unlikely(head & 1))
> >                 return head - 1;
> > -       return (unsigned long)page;
> > +       return (unsigned long)page_head_if_fake(page);
>
> hard to read. page_head_if_fake,  what is the other side of
> page_head_if_not_fake?

1) return itself if the @page is not a fake head page.
2) return head page if @page is a fake head page.

So I want to express that page_head_if_fake returns a
head page only and only if the parameter of @page is a
fake head page. Otherwise, it returns itself.

> I would expect something like
> page_to_page_head()
> or
> get_page_head()
>

Those names seem to be not appropriate as well, because
its functionality does not make sure it can return a head
page. If the parameter is a head page, it definitely
returns a head page, otherwise, it may return itself which
may be a tail page.

From this point of view, I still prefer page_head_if_fake.

> Anyway, I am not quite sure what is the best name. but page_head_if_fake(page)
> sounds odd to me. just like the things have two sides, but if_fake  presents
> one side only.

If others have any ideas, comments are welcome.

>
> >  }
> >
> >  #define compound_head(page)    ((typeof(page))_compound_head(page))
> > @@ -225,12 +276,14 @@ static inline unsigned long _compound_head(const struct page *page)
> >
> >  static __always_inline int PageTail(struct page *page)
> >  {
> > -       return READ_ONCE(page->compound_head) & 1;
> > +       return READ_ONCE(page->compound_head) & 1 ||
> > +              page_head_if_fake(page) != page;
>
> i would expect a wrapper like:
> page_is_fake_head()

Good point. Will do.

>
> and the above page_to_page_head() can leverage the wrapper.
> here too.
>
> >  }
> >
> >  static __always_inline int PageCompound(struct page *page)
> >  {
> > -       return test_bit(PG_head, &page->flags) || PageTail(page);
> > +       return test_bit(PG_head, &page->flags) ||
> > +              READ_ONCE(page->compound_head) & 1;
>
> hard to read. could it be something like the below?
> return PageHead(page) || PageTail(page);
>
> or do we really need to change this function? even a fake head still has
> the true test_bit(PG_head, &page->flags), though it is not a real head, it
> is still a pagecompound, right?

Right. PageCompound() can not be changed.  It is odd but
efficient because calling page_head_if_fake is eliminated.
So I select performance not readability. I'm not sure if it's
worth it.

Thanks.
