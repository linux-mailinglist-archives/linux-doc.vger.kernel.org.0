Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EEFF450A0D
	for <lists+linux-doc@lfdr.de>; Mon, 15 Nov 2021 17:49:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbhKOQwO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 15 Nov 2021 11:52:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbhKOQwI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Nov 2021 11:52:08 -0500
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84239C061570
        for <linux-doc@vger.kernel.org>; Mon, 15 Nov 2021 08:49:11 -0800 (PST)
Received: by mail-qk1-x72b.google.com with SMTP id de30so17585737qkb.0
        for <linux-doc@vger.kernel.org>; Mon, 15 Nov 2021 08:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=l+DuSZ4CW3uL8ZGrV5XvM1KJZzBkYZnjOzvV75YmFLo=;
        b=Ay5N0s8W4b7VWIRp7+IGY+vcj52iXCNMABiaFI4BwZnlyhEKyCJAC4k8Hx+Ot61u50
         4uxq2AvK8wylxaMUu8r+m6V3DG4HIyQ/H9RgawG6AZyRjrl7HC2vYrdzquwY089O1yB+
         bnhD1uwhOj1aKSdRi+WIkTst+lgYZpniNkKfm8SWcV7PUyLorigOKmIsTArLChwUwjH+
         dEw23mfdG5N3GpLCSuw7pDL22zWmw6CoxtMTa1hhP2ABh7FpLTgMagIsBk14IEIXlskz
         sK2nWz+EgH49hitnef3sBsxKao5ga2fS5HU8laCGmr+Gm2sgulNMCYf+eTjr1IBh/cNb
         T1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l+DuSZ4CW3uL8ZGrV5XvM1KJZzBkYZnjOzvV75YmFLo=;
        b=jq3PTzfdZC58mv3U0sLTqKvnjU/4jbLGYk3px5/LmejDfTC1c0cOVErnH65Cg0iMNG
         0goi5JOXwfKGgnSM3Y+BIax0UHtrOoncnFSYiAmQ8yekDOWhMmOpaZnXHSkS9h+JARN4
         XSG+pmMb5i4VrHRUqXJ90AoRK96KLq5vxvuBft6bbjAy69GZxKuBrq8Y9dPL4cS8mFVV
         FqILlMCGmBxtO/pC2ss2e/rDEWdQKL7+ZxjOCekq9htj8WIwsbqSaPVP0RLX3iJc/QaT
         eydxAT47+1WWfUQFeWtfdleX0Iszow9GgDg3lC+/wouIBtlpvWqS7DKJ/NL1GfmUkspp
         bxzg==
X-Gm-Message-State: AOAM532JGzkuZVDZlGiRm1yhVtHKVTygBEegHfrqTD/+CxlwblbHt9P7
        XzJdV5x7wNyELV+1hDf25oVUZA==
X-Google-Smtp-Source: ABdhPJz+ALQX7Ix+Apg+9TYbsDdiwwHHM1jer6yDEsam6jfbWC1D5oVKN/IAmZrKG8fm3LwKH5O1dA==
X-Received: by 2002:a05:620a:288c:: with SMTP id j12mr317315qkp.103.1636994950666;
        Mon, 15 Nov 2021 08:49:10 -0800 (PST)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id i16sm3334898qtx.57.2021.11.15.08.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 08:49:10 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1mmfAL-00A2Er-2M; Mon, 15 Nov 2021 12:49:09 -0400
Date:   Mon, 15 Nov 2021 12:49:09 -0400
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
Subject: Re: [PATCH v5 8/8] device-dax: compound devmap support
Message-ID: <20211115164909.GF876299@ziepe.ca>
References: <20211112150824.11028-1-joao.m.martins@oracle.com>
 <20211112150824.11028-9-joao.m.martins@oracle.com>
 <20211112153404.GD876299@ziepe.ca>
 <01f36268-4010-ecea-fee5-c128dd8bb179@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01f36268-4010-ecea-fee5-c128dd8bb179@oracle.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Nov 15, 2021 at 01:11:32PM +0100, Joao Martins wrote:
> On 11/12/21 16:34, Jason Gunthorpe wrote:
> > On Fri, Nov 12, 2021 at 04:08:24PM +0100, Joao Martins wrote:
> > 
> >> diff --git a/drivers/dax/device.c b/drivers/dax/device.c
> >> index a65c67ab5ee0..0c2ac97d397d 100644
> >> +++ b/drivers/dax/device.c
> >> @@ -192,6 +192,42 @@ static vm_fault_t __dev_dax_pud_fault(struct dev_dax *dev_dax,
> >>  }
> >>  #endif /* !CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
> >>  
> >> +static void set_page_mapping(struct vm_fault *vmf, pfn_t pfn,
> >> +			     unsigned long fault_size,
> >> +			     struct address_space *f_mapping)
> >> +{
> >> +	unsigned long i;
> >> +	pgoff_t pgoff;
> >> +
> >> +	pgoff = linear_page_index(vmf->vma, ALIGN(vmf->address, fault_size));
> >> +
> >> +	for (i = 0; i < fault_size / PAGE_SIZE; i++) {
> >> +		struct page *page;
> >> +
> >> +		page = pfn_to_page(pfn_t_to_pfn(pfn) + i);
> >> +		if (page->mapping)
> >> +			continue;
> >> +		page->mapping = f_mapping;
> >> +		page->index = pgoff + i;
> >> +	}
> >> +}
> >> +
> >> +static void set_compound_mapping(struct vm_fault *vmf, pfn_t pfn,
> >> +				 unsigned long fault_size,
> >> +				 struct address_space *f_mapping)
> >> +{
> >> +	struct page *head;
> >> +
> >> +	head = pfn_to_page(pfn_t_to_pfn(pfn));
> >> +	head = compound_head(head);
> >> +	if (head->mapping)
> >> +		return;
> >> +
> >> +	head->mapping = f_mapping;
> >> +	head->index = linear_page_index(vmf->vma,
> >> +			ALIGN(vmf->address, fault_size));
> >> +}
> > 
> > Should this stuff be setup before doing vmf_insert_pfn_XX?
> > 
> 
> Interestingly filesystem-dax does this, but not device-dax.

I think it may be a bug ?

> set_page_mapping/set_compound_mapping() could be moved to before and
> then torn down on @rc != VM_FAULT_NOPAGE (failure). I am not sure
> what's the benefit in this series..  besides the ordering (that you
> hinted below) ?

Well, it should probably be fixed in a precursor patch.

I think the general idea is that page->mapping/index are stable once
the page is published in a PTE?

> > In normal cases the page should be returned in the vmf and populated
> > to the page tables by the core code after all this is done.
>
> So I suppose by call sites examples as 'core code' is either hugetlbfs call to
> __filemap_add_folio() (on hugetlbfs fault handler), shmem_add_to_page_cache() or
> anon-equivalent.

I was talking more about the normal page insertion flow which is done
by setting vmf->page and then returning. finish_fault() will install
the PTE

If this is the best way then I would expect some future where maybe
there is a vmf->folio and finish_fault() will install a PUD/PMD/PTE
and we don't call vmf_insert_pfnxx in DAX.

Jason
