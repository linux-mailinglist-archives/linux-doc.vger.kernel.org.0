Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D078350922E
	for <lists+linux-doc@lfdr.de>; Wed, 20 Apr 2022 23:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350692AbiDTVn2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 20 Apr 2022 17:43:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240006AbiDTVn2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Apr 2022 17:43:28 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A5AB38D9A
        for <linux-doc@vger.kernel.org>; Wed, 20 Apr 2022 14:40:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5785CB82194
        for <linux-doc@vger.kernel.org>; Wed, 20 Apr 2022 21:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84B26C385A0;
        Wed, 20 Apr 2022 21:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1650490837;
        bh=vmOOYXgIqVmJv6Ynfv4pVSdE8+/S6hF5D1Kl1qwaVvU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=thNo9wgIAXrJWqhwyyf3EdE8u9+lQc1YnozYsvYbJp4fyJqyGr0tPvqiLnmBgdkjv
         Ld7BFCZqCj8XKMBcUiMUYrkRvdEPr4/8AUHYDQQxFgECzXlSxUNS+UmKIvlDxJTKPX
         /UD26xfNslVtpTXROF0h+5R80+RqKP37IJOsKZOM=
Date:   Wed, 20 Apr 2022 14:40:36 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Joao Martins <joao.m.martins@oracle.com>
Cc:     linux-mm@kvack.org, Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>, Jane Chu <jane.chu@oracle.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Christoph Hellwig <hch@lst.de>, nvdimm@lists.linux.dev,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 4/5] mm/sparse-vmemmap: improve memory savings for
 compound devmaps
Message-Id: <20220420144036.0bd0955e5d8478ca64f2df19@linux-foundation.org>
In-Reply-To: <20220420155310.9712-5-joao.m.martins@oracle.com>
References: <20220420155310.9712-1-joao.m.martins@oracle.com>
        <20220420155310.9712-5-joao.m.martins@oracle.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-11.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 20 Apr 2022 16:53:09 +0100 Joao Martins <joao.m.martins@oracle.com> wrote:

> A compound devmap is a dev_pagemap with @vmemmap_shift > 0 and it
> means that pages are mapped at a given huge page alignment and utilize
> uses compound pages as opposed to order-0 pages.
> 
> Take advantage of the fact that most tail pages look the same (except
> the first two) to minimize struct page overhead. Allocate a separate
> page for the vmemmap area which contains the head page and separate for
> the next 64 pages. The rest of the subsections then reuse this tail
> vmemmap page to initialize the rest of the tail pages.
> 
> Sections are arch-dependent (e.g. on x86 it's 64M, 128M or 512M) and
> when initializing compound devmap with big enough @vmemmap_shift (e.g.
> 1G PUD) it may cross multiple sections. The vmemmap code needs to
> consult @pgmap so that multiple sections that all map the same tail
> data can refer back to the first copy of that data for a given
> gigantic page.
> 
> On compound devmaps with 2M align, this mechanism lets 6 pages be
> saved out of the 8 necessary PFNs necessary to set the subsection's
> 512 struct pages being mapped. On a 1G compound devmap it saves
> 4094 pages.
> 
> Altmap isn't supported yet, given various restrictions in altmap pfn
> allocator, thus fallback to the already in use vmemmap_populate().  It
> is worth noting that altmap for devmap mappings was there to relieve the
> pressure of inordinate amounts of memmap space to map terabytes of pmem.
> With compound pages the motivation for altmaps for pmem gets reduced.
> 
> ...
>
> @@ -665,12 +770,19 @@ struct page * __meminit __populate_section_memmap(unsigned long pfn,
>  {
>  	unsigned long start = (unsigned long) pfn_to_page(pfn);
>  	unsigned long end = start + nr_pages * sizeof(struct page);
> +	int r;
>  
>  	if (WARN_ON_ONCE(!IS_ALIGNED(pfn, PAGES_PER_SUBSECTION) ||
>  		!IS_ALIGNED(nr_pages, PAGES_PER_SUBSECTION)))
>  		return NULL;
>  
> -	if (vmemmap_populate(start, end, nid, altmap))
> +	if (is_power_of_2(sizeof(struct page)) &&

Note that Muchun is working on a compile-time
STRUCT_PAGE_SIZE_IS_POWER_OF_2 which this site should be able to
utilize.

https://lkml.kernel.org/r/20220413144748.84106-2-songmuchun@bytedance.com

> +	    pgmap && pgmap_vmemmap_nr(pgmap) > 1 && !altmap)
> +		r = vmemmap_populate_compound_pages(pfn, start, end, nid, pgmap);
> +	else
> +		r = vmemmap_populate(start, end, nid, altmap);
> +
> +	if (r < 0)
>  		return NULL;
>  
>  	return pfn_to_page(pfn);

