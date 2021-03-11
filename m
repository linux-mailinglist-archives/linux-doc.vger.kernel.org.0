Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F619336E32
	for <lists+linux-doc@lfdr.de>; Thu, 11 Mar 2021 09:50:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231440AbhCKIuT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 11 Mar 2021 03:50:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231757AbhCKIuB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Mar 2021 03:50:01 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 781E1C061574
        for <linux-doc@vger.kernel.org>; Thu, 11 Mar 2021 00:50:01 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id q5so595245pgk.5
        for <linux-doc@vger.kernel.org>; Thu, 11 Mar 2021 00:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LumJ6Q1wXFZBFikK5CldqzLK8H4AUjOU6TLuse65FxA=;
        b=HjGBVFvOV4KrzmLYJIkyax4nE8Fxra4DK5g8RQ+533/rNDRTJMlGtSBKsSyX/p190B
         2dOfrYUEzXKmZNc0OUqKwOZBU553rFRt3qeHFqJYJEeBsiOanNfvWaH4gri5ul6B4IPg
         tIvNcLGAIHKzOvEPIPMmtQXdBCti9XdYGkLkXrIYpGn2zn+Bk7Vo8S0tp6Qb/iw//AVK
         gRd57bUnFlXoafkGWKJQRCWGQv2//A6bp+sYfZd1PzwTRC+zWcXjT/qhKehpiGQj15oj
         YsTsJKxoWA3xpZ4TvMEjmTUkozW9fVJ1/bUKTxBs0gL5Je6ptpXtaGIsjw9v73RoeXKA
         jM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LumJ6Q1wXFZBFikK5CldqzLK8H4AUjOU6TLuse65FxA=;
        b=Pxs3b/lKsz/z+8ZZzgqb/le+LrEYuB3iiT2OgNkm8/oXEREaa9UmE3/PGVSXu04Uoa
         nT4iJ5350rVG7mz+Nf9YlSW+uWRR2OvUJyL2kFp5qpmJSEzvfKFMFEZ050dC5fHw7bRl
         aeiADcAjp91jOUCHbSUEkV0YNzK/ntp5B1N0IQ4SGMW7zs3SQB9XGNC3vL3CzWCg5psf
         u7d2JbAvjPVD0aXVbdekKrvXuSB4Hj4E+n+5XNbMfrlyYwGUmxAe5kcLefA3iXtjdbNA
         jWymbknXABiUDWwUWSbT/0ZjF0cQFieOvhckZ6PtWW8YyOYxzHFhacinaw4L1iKf4yOb
         vyqQ==
X-Gm-Message-State: AOAM533SZRmIr/MfhVG0YcrhnubMBiSFQuLP4eXtgvRe6h+xm72n/vQB
        q7EyxA1HPIioz8BZqlkxofjp2mLqZg+6J8bmA4Fyww==
X-Google-Smtp-Source: ABdhPJxceJjEqAKD1t/gxkQLylZF41D2M2U0liujlLCHHaLE8YBg4pzWREUBsMNlKzcLXiv2jCvoYLRE4DTN1sN48RA=
X-Received: by 2002:a63:141e:: with SMTP id u30mr6553172pgl.31.1615452601095;
 Thu, 11 Mar 2021 00:50:01 -0800 (PST)
MIME-Version: 1.0
References: <20210308102807.59745-1-songmuchun@bytedance.com>
 <20210308102807.59745-5-songmuchun@bytedance.com> <YEjji9oAwHuZaZEt@dhcp22.suse.cz>
 <CAMZfGtVjLOF27VMVJ5fF8CDJRpZ0t7fWpmMHB9D-ipMK6b=POg@mail.gmail.com> <YEnY0qXuBGYW6LHA@dhcp22.suse.cz>
In-Reply-To: <YEnY0qXuBGYW6LHA@dhcp22.suse.cz>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 11 Mar 2021 16:49:24 +0800
Message-ID: <CAMZfGtWgfhS=ZfmA1wyaGWC=9bMo01-i13OKmhofL0-CX0TLkQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v18 4/9] mm: hugetlb: alloc the vmemmap
 pages associated with each HugeTLB page
To:     Michal Hocko <mhocko@suse.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, bp@alien8.de, x86@kernel.org,
        hpa@zytor.com, dave.hansen@linux.intel.com, luto@kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>, paulmck@kernel.org,
        mchehab+huawei@kernel.org, pawan.kumar.gupta@linux.intel.com,
        Randy Dunlap <rdunlap@infradead.org>, oneukum@suse.com,
        anshuman.khandual@arm.com, jroedel@suse.de,
        Mina Almasry <almasrymina@google.com>,
        David Rientjes <rientjes@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        Oscar Salvador <osalvador@suse.de>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        David Hildenbrand <david@redhat.com>,
        =?UTF-8?B?SE9SSUdVQ0hJIE5BT1lBKOWggOWPoyDnm7TkuZ8p?= 
        <naoya.horiguchi@nec.com>,
        Joao Martins <joao.m.martins@oracle.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Chen Huang <chenhuang5@huawei.com>,
        Bodeddula Balasubramaniam <bodeddub@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 11, 2021 at 4:46 PM Michal Hocko <mhocko@suse.com> wrote:
>
> On Thu 11-03-21 12:26:32, Muchun Song wrote:
> > On Wed, Mar 10, 2021 at 11:19 PM Michal Hocko <mhocko@suse.com> wrote:
> > >
> > > On Mon 08-03-21 18:28:02, Muchun Song wrote:
> [...]
> > > > @@ -1771,8 +1813,12 @@ int dissolve_free_huge_page(struct page *page)
> > > >               h->free_huge_pages--;
> > > >               h->free_huge_pages_node[nid]--;
> > > >               h->max_huge_pages--;
> > > > -             update_and_free_page(h, head);
> > > > -             rc = 0;
> > > > +             rc = update_and_free_page(h, head);
> > > > +             if (rc) {
> > > > +                     h->surplus_huge_pages--;
> > > > +                     h->surplus_huge_pages_node[nid]--;
> > > > +                     h->max_huge_pages++;
> > >
> > > This is quite ugly and confusing. update_and_free_page is careful to do
> > > the proper counters accounting and now you just override it partially.
> > > Why cannot we rely on update_and_free_page do the right thing?
> >
> > Dissolving path is special here. Since update_and_free_page failed,
> > the number of surplus pages was incremented.  Surplus pages are
> > the number of pages greater than max_huge_pages.  Since we are
> > incrementing max_huge_pages, we should decrement (undo) the
> > addition to surplus_huge_pages and surplus_huge_pages_node[nid].
>
> Can we make dissolve_free_huge_page less special or tell
> update_and_free_page to not account against dissolve_free_huge_page?

Of course can.

Thanks.

> --
> Michal Hocko
> SUSE Labs
