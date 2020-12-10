Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1C092D5A29
	for <lists+linux-doc@lfdr.de>; Thu, 10 Dec 2020 13:17:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbgLJMPp (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 10 Dec 2020 07:15:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387872AbgLJMPf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Dec 2020 07:15:35 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 084F1C061794
        for <linux-doc@vger.kernel.org>; Thu, 10 Dec 2020 04:14:55 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id d2so3888779pfq.5
        for <linux-doc@vger.kernel.org>; Thu, 10 Dec 2020 04:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QxFGFJsxZYls/I5RHSRMKxF31Bhdbu1ViR2qIipRD4o=;
        b=pyeUveG5izDmcPi3YPsdLwxm0UGDjaVIvqkfLtY9ehokEsyj0koOU+oO137aCVQe1n
         S9HbuVil3IFRqdfB7r2OcFUWgLNJW+pv/J+/Keq+c6ZggD153zxP6abVtB9FFrULXeR2
         jUAGtgQeJeZNEyEgghMJ7bReovymKtcyGa5Jh7/AyHNE6JX+aJWPEVd5B78XNf0VWh9q
         e2zxpabuIfdVa1n0VaeTS3ZCHPLpW0+1egqVx2c63LJbOKyXdERXCiy5MMkbEci2BvI3
         LmqDjXkDLvHx19/lRyQ5jdx29rjQnuu+X6pw/+sFi6+hSszzz4+h8lWuSzqjDIkkm4bU
         yRgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QxFGFJsxZYls/I5RHSRMKxF31Bhdbu1ViR2qIipRD4o=;
        b=elJQ/fP4YIt3kx7+/0Ok3aR5GZt72AEU7jWoVr52iMk9LTW11FI4p13tmnRjDWTcZU
         vOmcnWvy3DHle3XhFGhGTbZzpXzrzXBGo+QvJLC1hDj5T/kAHytdkL+wLv4GXY9vgOj3
         W5AMDMkjQau9gdof3qg7zKsxsEafwGixw9mWq2QlbX0D68CkxogzI1ahs+Fw5N4fSULj
         sbcKSHu0q03MkTx6/jzEJElp4SBqy8sA5WpmpF9jWR6Q3NiUZ1wApyaQXlfvEE9HbMtP
         puEv213fVjMcrRPAxLQtdMnnjZG9BfqjGp4BqM02/B0nuVO6F1PaCShum756ll5+E0jO
         bG7g==
X-Gm-Message-State: AOAM53179PyP0BohKPSEgMvIMcrQwmgC4/SqQrpaY1bcMuBiq9SpVXDb
        G/3bfaXzrzJ5Wo87ixtPS8zB1zE1xgRaihyRtBlRgw==
X-Google-Smtp-Source: ABdhPJw0Q3sbE5ilZgEAGeKR/BMorRwGHmKVqeOb9m/6WNpEGR39LDL8qXPIi5AGsXa7U+Z8+8NR0X+NUb+G4ihOY1Q=
X-Received: by 2002:a63:c15:: with SMTP id b21mr6294519pgl.341.1607602494485;
 Thu, 10 Dec 2020 04:14:54 -0800 (PST)
MIME-Version: 1.0
References: <20201210035526.38938-1-songmuchun@bytedance.com>
 <20201210035526.38938-13-songmuchun@bytedance.com> <375d6bad6bb37e3626f71bfabc20b384@suse.de>
In-Reply-To: <375d6bad6bb37e3626f71bfabc20b384@suse.de>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 10 Dec 2020 20:14:18 +0800
Message-ID: <CAMZfGtUQOXmuRumv48MYGCYh_JZn4bMPPz8HW2ExgTPCfFMMnw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v8 12/12] mm/hugetlb: Optimize the code
 with the help of the compiler
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
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        David Hildenbrand <david@redhat.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 10, 2020 at 7:39 PM Oscar Salvador <osalvador@suse.de> wrote:
>
> On 2020-12-10 04:55, Muchun Song wrote:
> > We cannot optimize if a "struct page" crosses page boundaries. If
> > it is true, we can optimize the code with the help of a compiler.
> > When free_vmemmap_pages_per_hpage() returns zero, most functions are
> > optimized by the compiler.
>
> As I said earlier, I would squash this patch with patch#10 and
> remove the !is_power_of_2 check in hugetlb_vmemmap_init and leave
> only the check for the boot parameter.
> That should be enough.

Yeah, you are right. I just want the compiler to do optimization.

>
> >  static inline bool is_hugetlb_free_vmemmap_enabled(void)
> >  {
> > -     return hugetlb_free_vmemmap_enabled;
> > +     return hugetlb_free_vmemmap_enabled &&
> > +            is_power_of_2(sizeof(struct page));
>
> Why? hugetlb_free_vmemmap_enabled can only become true
> if the is_power_of_2 check succeeds in early_hugetlb_free_vmemmap_param.
> The "is_power_of_2" check here can go.
>
> > diff --git a/mm/hugetlb_vmemmap.h b/mm/hugetlb_vmemmap.h
> > index 0a1c0d33a316..5f5e90c81cd2 100644
> > --- a/mm/hugetlb_vmemmap.h
> > +++ b/mm/hugetlb_vmemmap.h
> > @@ -21,7 +21,7 @@ void free_huge_page_vmemmap(struct hstate *h, struct
> > page *head);
> >   */
> >  static inline unsigned int free_vmemmap_pages_per_hpage(struct hstate
> > *h)
> >  {
> > -     return h->nr_free_vmemmap_pages;
> > +     return h->nr_free_vmemmap_pages && is_power_of_2(sizeof(struct
> > page));
>
> If hugetlb_free_vmemmap_enabled is false, hugetlb_vmemmap_init() leaves
> h->nr_free_vmemmap_pages unset to 0, so no need for the is_power_of_2
> check here.

Yeah, you are right. But if we do this check can make the code simple.

For example, here is a code snippet.

void func(void)
{
        if (free_vmemmap_pages_per_hpage())
                return;
        /* Do something */
}

With this patch, the func will be optimized to null when is_power_of_2
returns false.

void func(void)
{
}

Without this patch, the compiler cannot do this optimization.

Thanks.

>
>
> --
> Oscar Salvador
> SUSE L3



-- 
Yours,
Muchun
