Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EACA832A8DF
	for <lists+linux-doc@lfdr.de>; Tue,  2 Mar 2021 19:08:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1580363AbhCBSCU (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 2 Mar 2021 13:02:20 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:10019 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1837778AbhCBI6o (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Mar 2021 03:58:44 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B603dfe1b0005>; Tue, 02 Mar 2021 00:58:03 -0800
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 2 Mar
 2021 08:58:00 +0000
From:   Alistair Popple <apopple@nvidia.com>
To:     Jason Gunthorpe <jgg@nvidia.com>
CC:     <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
        <bskeggs@redhat.com>, <akpm@linux-foundation.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <jhubbard@nvidia.com>,
        <rcampbell@nvidia.com>, <jglisse@redhat.com>, <hch@infradead.org>,
        <daniel@ffwll.ch>
Subject: Re: [PATCH v3 5/8] mm: Device exclusive memory access
Date:   Tue, 2 Mar 2021 19:57:58 +1100
Message-ID: <2758096.Z30Q8iEM0t@nvdebian>
In-Reply-To: <20210302000559.GA763995@nvidia.com>
References: <20210226071832.31547-1-apopple@nvidia.com> <20210226071832.31547-6-apopple@nvidia.com> <20210302000559.GA763995@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1614675483; bh=yLtSrsIkgQVvx8r7tJAFizCDR8BcQxGt7zMk4zLhM4s=;
        h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
         MIME-Version:Content-Transfer-Encoding:Content-Type:
         X-Originating-IP:X-ClientProxiedBy;
        b=R3aeuCco4uXjfOdbmbpC/jx/pN15IAgta990Q0RpPpMoq66arG6yFvILVjoMOXbIv
         uARzcp6pASuz3soKv+5AvjG14rVHQHBSMF2hD10YiweFuGaGyCALW8qxKabfuzWNAo
         SpHa4cFWhd0KxgrFleqLLCXNSFRPLSliBo9VLNG55m0i2cTLJB+WYHqygM6N3BVKz4
         tvFJHnH/slrCoxC3e7LI2QO8G+qZQwAvqQu/1/NesiPauF/h9obFBhz1LxskOnUN6n
         H9KJl1shHnQqPuImOwJ3YVJzkSjbfzKavrbByo1MFY7BJK5fdCo2FHrzNJPJIQzBzo
         IFk4kMULO88TQ==
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tuesday, 2 March 2021 11:05:59 AM AEDT Jason Gunthorpe wrote:
> On Fri, Feb 26, 2021 at 06:18:29PM +1100, Alistair Popple wrote:
> 
> > +/**
> > + * make_device_exclusive_range() - Mark a range for exclusive use by a 
device
> > + * @mm: mm_struct of assoicated target process
> > + * @start: start of the region to mark for exclusive device access
> > + * @end: end address of region
> > + * @pages: returns the pages which were successfully mark for exclusive 
acces
> > + *
> > + * Returns: number of pages successfully marked for exclusive access
> > + *
> > + * This function finds the ptes mapping page(s) to the given address 
range and
> > + * replaces them with special swap entries preventing userspace CPU 
access. On
> > + * fault these entries are replaced with the original mapping after 
calling MMU
> > + * notifiers.
> > + */
> > +int make_device_exclusive_range(struct mm_struct *mm, unsigned long 
start,
> > +				unsigned long end, struct page **pages)
> > +{
> > +	long npages = (end - start) >> PAGE_SHIFT;
> > +	long i;
> > +
> > +	npages = get_user_pages_remote(mm, start, npages,
> > +				       FOLL_GET | FOLL_WRITE | FOLL_SPLIT_PMD,
> > +				       pages, NULL, NULL);
> > +	for (i = 0; i < npages; i++) {
> > +		if (!trylock_page(pages[i])) {
> > +			put_page(pages[i]);
> > +			pages[i] = NULL;
> > +			continue;
> > +		}
> > +
> > +		if (!try_to_protect(pages[i])) {
> 
> Isn't this racy? get_user_pages returns the ptes at an instant in
> time, they could have already been changed to something else?

Right. On it's own this does not guarantee that the page is mapped at the 
given location, only that a mapping won't get established without an mmu 
notifier callback to clear the swap entry.

The intent was a driver could use HMM or some other mechanism to keep PTEs 
synchronised if required. However I just looked at patch 8 in the series again 
and it appears I got this wrong when converting from the old migration 
approach:

+               mutex_unlock(&svmm->mutex);
+               ret = nouveau_atomic_range_fault(svmm, drm, args,
+                                               size, hmm_flags, mm);

The mutex needs to be unlocked after the range fault to ensure the PTE hasn't 
changed. But this ends up being a problem because try_to_protect() calls 
notifiers which need to take that mutex and hence deadlocks.

> I would think you'd want to switch to the swap entry atomically under
> th PTLs?

That is one approach, but the reuse of get_user_pages() to walk the page 
tables and fault/gather the pages is a nice simplification and adding a new 
FOLL flag/mode to atomically swap entries doesn't seem right.

However try_to_protect() scans the PTEs again under the PTL so checking the 
mapping of interest actually gets replaced during the rmap walk seems like a 
reasonable solution. Thanks for the comments.

 - Alistair

> Jason
> 




