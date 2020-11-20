Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0F72BA8BD
	for <lists+linux-doc@lfdr.de>; Fri, 20 Nov 2020 12:14:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727806AbgKTLKh (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 20 Nov 2020 06:10:37 -0500
Received: from mx2.suse.de ([195.135.220.15]:43916 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728274AbgKTLKg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 20 Nov 2020 06:10:36 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1605870634; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=YvUigKSfUEdsuDoUnt1ux1Q4ET6cZRqyZToM55lmzhg=;
        b=WTaANqbRhP0FIEZwkNlDTvoDL+jcjiVUAef9SUW/lhFoIR1bPxtgIqQBI1IN29xoYHcXbW
        VrR90wuc+6gZkcsX7B/08V5gSORVq4EwBGrtBPs4HbmCnrRoEMC4prwAdNh2Es9vI2eS0S
        rk+OMWUniuxvyqcF8dZ0M2pogy3stBo=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 7971BAF37;
        Fri, 20 Nov 2020 11:10:34 +0000 (UTC)
Date:   Fri, 20 Nov 2020 12:10:33 +0100
From:   Michal Hocko <mhocko@suse.com>
To:     Muchun Song <songmuchun@bytedance.com>
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
        Oscar Salvador <osalvador@suse.de>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Subject: Re: [External] Re: [PATCH v5 11/21] mm/hugetlb: Allocate the vmemmap
 pages associated with each hugetlb page
Message-ID: <20201120111033.GN3200@dhcp22.suse.cz>
References: <20201120064325.34492-1-songmuchun@bytedance.com>
 <20201120064325.34492-12-songmuchun@bytedance.com>
 <20201120081123.GC3200@dhcp22.suse.cz>
 <CAMZfGtWVxCPpL7=0dfHa7_qtakmGDMLP0twWoyM=gVou=HRmEg@mail.gmail.com>
 <20201120092826.GL3200@dhcp22.suse.cz>
 <CAMZfGtVPNdykd=E2bEje0GCdZT9ksLy2BdaRZ41eRDbGQp0_rg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMZfGtVPNdykd=E2bEje0GCdZT9ksLy2BdaRZ41eRDbGQp0_rg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri 20-11-20 17:37:09, Muchun Song wrote:
> On Fri, Nov 20, 2020 at 5:28 PM Michal Hocko <mhocko@suse.com> wrote:
> >
> > On Fri 20-11-20 16:51:59, Muchun Song wrote:
> > > On Fri, Nov 20, 2020 at 4:11 PM Michal Hocko <mhocko@suse.com> wrote:
> > > >
> > > > On Fri 20-11-20 14:43:15, Muchun Song wrote:
> > > > [...]
> > > > > diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> > > > > index eda7e3a0b67c..361c4174e222 100644
> > > > > --- a/mm/hugetlb_vmemmap.c
> > > > > +++ b/mm/hugetlb_vmemmap.c
> > > > > @@ -117,6 +117,8 @@
> > > > >  #define RESERVE_VMEMMAP_NR           2U
> > > > >  #define RESERVE_VMEMMAP_SIZE         (RESERVE_VMEMMAP_NR << PAGE_SHIFT)
> > > > >  #define TAIL_PAGE_REUSE                      -1
> > > > > +#define GFP_VMEMMAP_PAGE             \
> > > > > +     (GFP_KERNEL | __GFP_NOFAIL | __GFP_MEMALLOC)
> > > >
> > > > This is really dangerous! __GFP_MEMALLOC would allow a complete memory
> > > > depletion. I am not even sure triggering the OOM killer is a reasonable
> > > > behavior. It is just unexpected that shrinking a hugetlb pool can have
> > > > destructive side effects. I believe it would be more reasonable to
> > > > simply refuse to shrink the pool if we cannot free those pages up. This
> > > > sucks as well but it isn't destructive at least.
> > >
> > > I find the instructions of __GFP_MEMALLOC from the kernel doc.
> > >
> > > %__GFP_MEMALLOC allows access to all memory. This should only be used when
> > > the caller guarantees the allocation will allow more memory to be freed
> > > very shortly.
> > >
> > > Our situation is in line with the description above. We will free a HugeTLB page
> > > to the buddy allocator which is much larger than that we allocated shortly.
> >
> > Yes that is a part of the description. But read it in its full entirety.
> >  * %__GFP_MEMALLOC allows access to all memory. This should only be used when
> >  * the caller guarantees the allocation will allow more memory to be freed
> >  * very shortly e.g. process exiting or swapping. Users either should
> >  * be the MM or co-ordinating closely with the VM (e.g. swap over NFS).
> >  * Users of this flag have to be extremely careful to not deplete the reserve
> >  * completely and implement a throttling mechanism which controls the
> >  * consumption of the reserve based on the amount of freed memory.
> >  * Usage of a pre-allocated pool (e.g. mempool) should be always considered
> >  * before using this flag.
> >
> > GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_HIGH
> 
> We want to free the HugeTLB page to the buddy allocator, but before that,
> we need to allocate some pages as vmemmap pages, so here we cannot
> handle allocation failures.

Why cannot you simply refuse to shrink the pool size?

> I think that we should replace the
> __GFP_RETRY_MAYFAIL to __GFP_NOFAIL.
> 
> GFP_KERNEL | __GFP_NOFAIL | __GFP_HIGH
> 
> This meets our needs here. Thanks.

Please read again my concern about the disruptive behavior or explain
why it is desirable.

-- 
Michal Hocko
SUSE Labs
