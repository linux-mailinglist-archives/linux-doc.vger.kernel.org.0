Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1AB2ACF68
	for <lists+linux-doc@lfdr.de>; Tue, 10 Nov 2020 07:09:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726746AbgKJGJY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 10 Nov 2020 01:09:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727089AbgKJGJX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Nov 2020 01:09:23 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD336C0613D3
        for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2020 22:09:22 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id e7so10409926pfn.12
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2020 22:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SM5QR02hbZk/xaCTMJcp/DAZns2BuDG/VMmjUxOQnWU=;
        b=or3XJ9irf/D9pLz3fmUfkf6iDsI41klsWua0T4eVg+pl/s9H17mEFtxwZX3CqavMcb
         x/AsrZRo8ff4N6XfCHmadYXh7EKkSL72aNZo46LPNzkHupSoVGXxaCRfFiyyDcx+o11f
         N3Xp+hHmmAA4YpId9kEYScxhWuCm53e7axUhvKkMzSmi2Nenb71cugVb1kJpIGDJckue
         lnvit3Y/sxqSoQlEn7GUzvZZ1s0eT6j5/esHeb9YnbQuoVdMVr95o9Oj8Alj6ewDq6dN
         0lYR6d+Qnu1EyRRq467vLy6CQg4w1J7sxLAJnSts7oC15Eix+/xPu4AoTJPNdP3Wqlx8
         C09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SM5QR02hbZk/xaCTMJcp/DAZns2BuDG/VMmjUxOQnWU=;
        b=t0ui+A8WGPfY3U4ntNMkNiRvSNJxHdAKy78OInUtrsK8F1I3PxD5Auzakt4OuinVtz
         6sxQJLST2XVica3x1Ml/t08uYc12bHPq7GpUk29Wjs2rW0M2xTNmJN3TYoFlT/aeMQPJ
         WZRxpqijmDH67OT7Brr5XJtwpgH7FYTOIREFnxc55cmmIwRsOL5XErl+xtGBhG8GRrDR
         NPwHWi22I5XQPiR0rLF/DWt9APjPav0xsYK2OH1vE4PVZzHKrmhJrgte6Unv03oowIO+
         uwlVekHYqYOaTMK8sMLBS+u92hQBDOMA0cbGD730bDpt/3Qehua1Jc6gH97UIbg8LtlL
         gDxA==
X-Gm-Message-State: AOAM531WkllYK/r5Yvehp4B4PsfeV0/9KfevBCicZQDYrgza2Ip4ig8H
        7xlm8JQ8LRrWzFR7ic0gE/NnAVPSTM5EriIKB0wXSA==
X-Google-Smtp-Source: ABdhPJztVc92P0ds3eW6s5NmrcOMvO3xmXF5QmbTlVF7sojm3E9vLCb4vcMMlPrGJucdNDpDgQFVh77MpbkbuBk9lDk=
X-Received: by 2002:a63:5804:: with SMTP id m4mr15486408pgb.31.1604988562263;
 Mon, 09 Nov 2020 22:09:22 -0800 (PST)
MIME-Version: 1.0
References: <CAMZfGtVm9buFPscDVn5F5nUE=Yq+y4NoL0ci74=hUyjaLAPQQg@mail.gmail.com>
 <20201110054250.GA2906@localhost.localdomain>
In-Reply-To: <20201110054250.GA2906@localhost.localdomain>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Tue, 10 Nov 2020 14:08:46 +0800
Message-ID: <CAMZfGtWbGETq=3b5i0aentemXkZn2J2DNWu05mBs=4L8bJm1jg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 05/21] mm/hugetlb: Introduce pgtable
 allocation/freeing helpers
To:     Oscar Salvador <osalvador@suse.de>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Thomas Gleixner <tglx@linutronix.de>, mingo@redhat.com,
        bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org,
        Peter Zijlstra <peterz@infradead.org>, viro@zeniv.linux.org.uk,
        Andrew Morton <akpm@linux-foundation.org>, paulmck@kernel.org,
        mchehab+huawei@kernel.org, pawan.kumar.gupta@linux.intel.com,
        Randy Dunlap <rdunlap@infradead.org>, oneukum@suse.com,
        anshuman.khandual@arm.com, jroedel@suse.de,
        Mina Almasry <almasrymina@google.com>,
        David Rientjes <rientjes@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        Michal Hocko <mhocko@suse.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 10, 2020 at 1:42 PM Oscar Salvador <osalvador@suse.de> wrote:
>
> On Tue, Nov 10, 2020 at 11:49:27AM +0800, Muchun Song wrote:
> > On Tue, Nov 10, 2020 at 1:21 AM Oscar Salvador <osalvador@suse.de> wrote:
> > >
> > > On Sun, Nov 08, 2020 at 10:10:57PM +0800, Muchun Song wrote:
> > > > +static inline unsigned int pgtable_pages_to_prealloc_per_hpage(struct hstate *h)
> > > > +{
> > > > +     unsigned long vmemmap_size = vmemmap_pages_size_per_hpage(h);
> > > > +
> > > > +     /*
> > > > +      * No need pre-allocate page tabels when there is no vmemmap pages
> > > > +      * to free.
> > >  s /tabels/tables/
> >
> > Thanks.
> >
> > >
> > > > +static int vmemmap_pgtable_prealloc(struct hstate *h, struct page *page)
> > > > +{
> > > > +     int i;
> > > > +     pgtable_t pgtable;
> > > > +     unsigned int nr = pgtable_pages_to_prealloc_per_hpage(h);
> > > > +
> > > > +     if (!nr)
> > > > +             return 0;
> > > > +
> > > > +     vmemmap_pgtable_init(page);
> > > > +
> > > > +     for (i = 0; i < nr; i++) {
> > > > +             pte_t *pte_p;
> > > > +
> > > > +             pte_p = pte_alloc_one_kernel(&init_mm);
> > > > +             if (!pte_p)
> > > > +                     goto out;
> > > > +             vmemmap_pgtable_deposit(page, virt_to_page(pte_p));
> > > > +     }
> > > > +
> > > > +     return 0;
> > > > +out:
> > > > +     while (i-- && (pgtable = vmemmap_pgtable_withdraw(page)))
> > > > +             pte_free_kernel(&init_mm, page_to_virt(pgtable));
> > >
> > >         would not be enough to:
> > >
> > >         while (pgtable = vmemmap_pgtable_withdrag(page))
> > >                 pte_free_kernel(&init_mm, page_to_virt(pgtable));
> >
> > The vmemmap_pgtable_withdraw can not return NULL. So we can not
> > drop the "i--".
>
> Yeah, you are right, I managed to confuse myself.
> But why not make it return null, something like:
>
> static pgtable_t vmemmap_pgtable_withdraw(struct page *page)
> {
>         pgtable_t pgtable;
>
>         /* FIFO */
>         pgtable = page_huge_pte(page);

The check should be added here.

           if (!pgtable)
                   return NULL;

Just like my previous v2 patch does. In this case, we can drop those
checks. What do you think?

>         page_huge_pte(page) = list_first_entry_or_null(&pgtable->lru,
>                                                        struct page, lru);
>         if (page_huge_pte(page))
>                 list_del(&pgtable->lru);
>
>         return page_huge_pte(page) ? pgtable : NULL;
> }
>
> What do you think?
>
>
> --
> Oscar Salvador
> SUSE L3



-- 
Yours,
Muchun
