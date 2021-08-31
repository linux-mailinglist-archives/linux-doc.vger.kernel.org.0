Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 397A73FCC08
	for <lists+linux-doc@lfdr.de>; Tue, 31 Aug 2021 19:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232711AbhHaRGZ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 31 Aug 2021 13:06:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbhHaRGY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 31 Aug 2021 13:06:24 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3165C061575
        for <linux-doc@vger.kernel.org>; Tue, 31 Aug 2021 10:05:28 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id y144so20391272qkb.6
        for <linux-doc@vger.kernel.org>; Tue, 31 Aug 2021 10:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RI4Ac6WAi5yKA8ntnFbDg+ty5IiXtOO0SbBv0l/UQ94=;
        b=hau0yWxNYG6fi61DN8SdMIlss5Ow8debrvqBXoDotPRQJ7VKtAhLHZZvk+Ary5wLka
         gQM3ae73tci1VNwK1Isfl1wfZlt3TrdKgjMA7W0hVhWEoqw55Iyuwq7qE4W/vzvutue0
         TyXJK8U/fqsrDRjAsiHDVDB+qYjU1Fa2n1gxkp81TwCykt3cTe3ZUFJ5OE3s/7RJxzHz
         Cw3u5xHu2TR9yl0V3ZnWitvKcaUy2wZNGSNoJqx85Cm83iL0ekLLpbtHi9d9t5hwYCaw
         9HsGr3vH6Pgrn3R5JtjCJhRnAOu18IjLLpz0hpSVhU5lehCJg3I910S0iUUXrZfizZIJ
         /7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RI4Ac6WAi5yKA8ntnFbDg+ty5IiXtOO0SbBv0l/UQ94=;
        b=cB7zupkOypdQfwTughExkDTmqlYrtdnyvZPjVYQMCy+Rg9kWS7UBP7g36O8/61rjoY
         mW6y6Qg2rtN5U5m4kygt+6x13tyR2PmrUM9U0xuavTvL6G+V2eiyFJ4KNDKFznsDGp+w
         Zup/sjH1y5jj46VibUXaezAmo6OEPctH7TSv1Feze/m51IAExm970+rghK9dYidDJLyC
         s6sKRgcvIsrj3zZMpF3HwOt9sF65rUgIRbBbSSwFsT2bmMwfVQ4RfqxMrmXVcRGdicsl
         jzfe0INLw/XUP9l9krVwKnn4IKTXDDSGjN//i8RDoBSOH24zMnVIXwuem8DMiqYVRfqj
         LXUw==
X-Gm-Message-State: AOAM531499a4ckRVXjyKaeaTFj1LbZ1O2WG8rhNS8S/elupE3zPzY6JO
        oqDbouLZuw+uNx2O5NuoSqPyApK3jaZtHg==
X-Google-Smtp-Source: ABdhPJy0G1fRs0NIiDZlwso1zZilQ19q11niF7T7IPBkwMlRhmphqX9wL2tgb5ltEbaH8YT+u/5rdQ==
X-Received: by 2002:a05:620a:444b:: with SMTP id w11mr4052231qkp.479.1630429527966;
        Tue, 31 Aug 2021 10:05:27 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id w20sm10656272qtj.72.2021.08.31.10.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 10:05:27 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1mL7CQ-007XAW-7L; Tue, 31 Aug 2021 14:05:26 -0300
Date:   Tue, 31 Aug 2021 14:05:26 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Joao Martins <joao.m.martins@oracle.com>
Cc:     linux-mm@kvack.org, Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Matthew Wilcox <willy@infradead.org>,
        John Hubbard <jhubbard@nvidia.com>,
        Jane Chu <jane.chu@oracle.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Christoph Hellwig <hch@lst.de>, nvdimm@lists.linux.dev,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 08/14] mm/gup: grab head page refcount once for group
 of subpages
Message-ID: <20210831170526.GP1200268@ziepe.ca>
References: <20210827145819.16471-1-joao.m.martins@oracle.com>
 <20210827145819.16471-9-joao.m.martins@oracle.com>
 <20210827162552.GK1200268@ziepe.ca>
 <da90638d-d97f-bacb-f0fa-01f5fd9f2504@oracle.com>
 <20210830130741.GO1200268@ziepe.ca>
 <cda6d8fb-bd48-a3de-9d4e-96e4a43ebe58@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cda6d8fb-bd48-a3de-9d4e-96e4a43ebe58@oracle.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 31, 2021 at 01:34:04PM +0100, Joao Martins wrote:
> On 8/30/21 2:07 PM, Jason Gunthorpe wrote:
> > On Fri, Aug 27, 2021 at 07:34:54PM +0100, Joao Martins wrote:
> >> On 8/27/21 5:25 PM, Jason Gunthorpe wrote:
> >>> On Fri, Aug 27, 2021 at 03:58:13PM +0100, Joao Martins wrote:
> >>>
> >>>>  #if defined(CONFIG_ARCH_HAS_PTE_DEVMAP) && defined(CONFIG_TRANSPARENT_HUGEPAGE)
> >>>>  static int __gup_device_huge(unsigned long pfn, unsigned long addr,
> >>>>  			     unsigned long end, unsigned int flags,
> >>>>  			     struct page **pages, int *nr)
> >>>>  {
> >>>> -	int nr_start = *nr;
> >>>> +	int refs, nr_start = *nr;
> >>>>  	struct dev_pagemap *pgmap = NULL;
> >>>>  	int ret = 1;
> >>>>  
> >>>>  	do {
> >>>> -		struct page *page = pfn_to_page(pfn);
> >>>> +		struct page *head, *page = pfn_to_page(pfn);
> >>>> +		unsigned long next = addr + PAGE_SIZE;
> >>>>  
> >>>>  		pgmap = get_dev_pagemap(pfn, pgmap);
> >>>>  		if (unlikely(!pgmap)) {
> >>>> @@ -2252,16 +2265,25 @@ static int __gup_device_huge(unsigned long pfn, unsigned long addr,
> >>>>  			ret = 0;
> >>>>  			break;
> >>>>  		}
> >>>> -		SetPageReferenced(page);
> >>>> -		pages[*nr] = page;
> >>>> -		if (unlikely(!try_grab_page(page, flags))) {
> >>>> -			undo_dev_pagemap(nr, nr_start, flags, pages);
> >>>> +
> >>>> +		head = compound_head(page);
> >>>> +		/* @end is assumed to be limited at most one compound page */
> >>>> +		if (PageHead(head))
> >>>> +			next = end;
> >>>> +		refs = record_subpages(page, addr, next, pages + *nr);
> >>>> +
> >>>> +		SetPageReferenced(head);
> >>>> +		if (unlikely(!try_grab_compound_head(head, refs, flags))) {
> >>>> +			if (PageHead(head))
> >>>> +				ClearPageReferenced(head);
> >>>> +			else
> >>>> +				undo_dev_pagemap(nr, nr_start, flags, pages);
> >>>>  			ret = 0;
> >>>>  			break;
> >>>
> >>> Why is this special cased for devmap?
> >>>
> >>> Shouldn't everything processing pud/pmds/etc use the same basic loop
> >>> that is similar in idea to the 'for_each_compound_head' scheme in
> >>> unpin_user_pages_dirty_lock()?
> >>>
> >>> Doesn't that work for all the special page type cases here?
> >>
> >> We are iterating over PFNs to create an array of base pages (regardless of page table
> >> type), rather than iterating over an array of pages to work on. 
> > 
> > That is part of it, yes, but the slow bit here is to minimally find
> > the head pages and do the atomics on them, much like the
> > unpin_user_pages_dirty_lock()
> > 
> > I would think this should be designed similar to how things work on
> > the unpin side.
> > 
> I don't think it's the same thing. The bit you say 'minimally find the
> head pages' carries a visible overhead in unpin_user_pages() as we are
> checking each of the pages belongs to the same head page -- because you
> can pass an arbritary set of pages. This does have a cost which is not
> in gup-fast right now AIUI. Whereas in our gup-fast 'handler' you
> already know that you are processing a contiguous chunk of pages.
> If anything, we are closer to unpin_user_page_range*()
> than unpin_user_pages().

Yes, that is what I mean, it is very similar to the range case as we
don't even know that a single compound spans a pud/pmd. So you end up
doing the same loop to find the compound boundaries.

Under GUP slow we can also aggregate multiple page table entires, eg a
split huge page could be procesed as a single 2M range operation even
if it is broken to 4K PTEs.
> 
> Switching to similar iteration logic to unpin would look something like
> this (still untested):
> 
>         for_each_compound_range(index, &page, npages, head, refs) {
>                 pgmap = get_dev_pagemap(pfn + *nr, pgmap);

I recall talking to DanW about this and we agreed it was unnecessary
here to hold the pgmap and should be deleted.

Jason
