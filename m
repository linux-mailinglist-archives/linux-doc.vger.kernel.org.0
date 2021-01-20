Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B00A72FD1AD
	for <lists+linux-doc@lfdr.de>; Wed, 20 Jan 2021 14:55:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732270AbhATNWY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 20 Jan 2021 08:22:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731996AbhATNOo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Jan 2021 08:14:44 -0500
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FDCFC0613C1
        for <linux-doc@vger.kernel.org>; Wed, 20 Jan 2021 05:14:03 -0800 (PST)
Received: by mail-qk1-x72f.google.com with SMTP id f26so25202168qka.0
        for <linux-doc@vger.kernel.org>; Wed, 20 Jan 2021 05:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IUNaNIuA4xbDu98svmM2jn7EHmzgSCmG0EsKgdaOjwc=;
        b=EY2/n64rd27QwPm334cvc25FC3HqqQAa2JvZIwWeJfC6Sw8IsGSP9NF3TB4t4bvQyr
         6/nJeY8fnh4gyFVaj8GdWbKqzQGfWlT5r3AdxO5v/kSyQXUS9c3H84IGsuGLzSgvaCsH
         ZIH+A/x4S81MCqFVAaG6/Px7s2sfoUEirHPAp5OJ3okJ9sBjmehcCWj1NX5BmSW/bgGQ
         VIt36bu0jJZu5XtgX5J7XECO+libQX3agGKYf1IIuWRcyUDCof+JS4XBVV+Bc8wyJjFv
         bukPZf94vOJJrfrFpY80L0uE7N4+BPBSHfIOde8lLLEREMUiyaBAc4WcsRLwoMDt/VBY
         uVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IUNaNIuA4xbDu98svmM2jn7EHmzgSCmG0EsKgdaOjwc=;
        b=s5MEorWHTm1UGJy4Oeu+lHVFlvifDEobWJAmMnAKQMlXZJ8TG9fijX5tiJobFvzBZG
         4ELT2OYI59aFd1W3iYTFfZUzut+KqHrR6DC5UM/a4zqrnKbchumR4zkq3oap8x3rnY2V
         hmKNtC6UwK1VJpgE16vAkS7hzhN55SeH2GpHcQvDQYic1HDL0pCWe/LIcjQ6f0viRsRy
         K2zfmqxfzdru3H0lvxAicmiunsn9T7lyyG6xzk09fETUKyiGEhSyFSKzN83/Y/UTw3kR
         +hg1OEg1xDbBrC7WCgB0icnF5DmGCJ1AG5p6uhzbWr4eB9t7CAxN+CJTlHHqvoDHws6V
         BCxg==
X-Gm-Message-State: AOAM530+2SCr6FJSdTX5yNNtfv4R8IKF3SyZRCqCR+BPsxNDn+FHRPLh
        cq1ACHqfZi+qaeIY59mDvVotyQ==
X-Google-Smtp-Source: ABdhPJyfy2v9Ch96n2plUWMfFXXwme22yEuiQY1fW7FNJfI/zbY1rTdtYgr6cXaH+rX5HohPJbfvSQ==
X-Received: by 2002:a05:620a:1265:: with SMTP id b5mr9335122qkl.27.1611148442493;
        Wed, 20 Jan 2021 05:14:02 -0800 (PST)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id g189sm1274279qkf.8.2021.01.20.05.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 05:14:01 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1l2DJA-004Tqb-Nu; Wed, 20 Jan 2021 09:14:00 -0400
Date:   Wed, 20 Jan 2021 09:14:00 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Pavel Tatashin <pasha.tatashin@soleen.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        akpm@linux-foundation.org, vbabka@suse.cz, mhocko@suse.com,
        david@redhat.com, osalvador@suse.de, dan.j.williams@intel.com,
        sashal@kernel.org, tyhicks@linux.microsoft.com,
        iamjoonsoo.kim@lge.com, mike.kravetz@oracle.com,
        rostedt@goodmis.org, mingo@redhat.com, peterz@infradead.org,
        mgorman@suse.de, willy@infradead.org, rientjes@google.com,
        jhubbard@nvidia.com, linux-doc@vger.kernel.org,
        ira.weiny@intel.com, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v6 08/14] mm/gup: do not migrate zero page
Message-ID: <20210120131400.GF4605@ziepe.ca>
References: <20210120014333.222547-1-pasha.tatashin@soleen.com>
 <20210120014333.222547-9-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120014333.222547-9-pasha.tatashin@soleen.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jan 19, 2021 at 08:43:27PM -0500, Pavel Tatashin wrote:
> On some platforms ZERO_PAGE(0) might end-up in a movable zone. Do not
> migrate zero page in gup during longterm pinning as migration of zero page
> is not allowed.
> 
> For example, in x86 QEMU with 16G of memory and kernelcore=5G parameter, I
> see the following:
> 
> Boot#1: zero_pfn  0x48a8d zero_pfn zone: ZONE_DMA32
> Boot#2: zero_pfn 0x20168d zero_pfn zone: ZONE_MOVABLE
> 
> On x86, empty_zero_page is declared in .bss and depending on the loader
> may end up in different physical locations during boots.
> 
> Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
>  include/linux/mmzone.h | 4 ++++
>  mm/gup.c               | 2 ++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index fc99e9241846..f67427a8f22b 100644
> +++ b/include/linux/mmzone.h
> @@ -427,6 +427,10 @@ enum zone_type {
>  	 *    techniques might use alloc_contig_range() to hide previously
>  	 *    exposed pages from the buddy again (e.g., to implement some sort
>  	 *    of memory unplug in virtio-mem).
> +	 * 6. ZERO_PAGE(0), kernelcore/movablecore setups might create
> +	 *    situations where ZERO_PAGE(0) which is allocated differently
> +	 *    on different platforms may end up in a movable zone. ZERO_PAGE(0)
> +	 *    cannot be migrated.
>  	 *
>  	 * In general, no unmovable allocations that degrade memory offlining
>  	 * should end up in ZONE_MOVABLE. Allocators (like alloc_contig_range())
> diff --git a/mm/gup.c b/mm/gup.c
> index 857b273e32ac..fdd5cda30a07 100644
> +++ b/mm/gup.c
> @@ -1580,6 +1580,8 @@ static long check_and_migrate_cma_pages(struct mm_struct *mm,
>  		 * of the CMA zone if possible.
>  		 */
>  		if (is_migrate_cma_page(head)) {
> +			if (is_zero_pfn(page_to_pfn(head)))
> +				continue;

I think you should put this logic in is_pinnable_page()

Jason
