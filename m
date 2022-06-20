Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 824145512C1
	for <lists+linux-doc@lfdr.de>; Mon, 20 Jun 2022 10:30:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236832AbiFTI3S (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 20 Jun 2022 04:29:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235801AbiFTI3R (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Jun 2022 04:29:17 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5903120B2
        for <linux-doc@vger.kernel.org>; Mon, 20 Jun 2022 01:29:16 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id g16-20020a17090a7d1000b001ea9f820449so10042205pjl.5
        for <linux-doc@vger.kernel.org>; Mon, 20 Jun 2022 01:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HDCsdAy+QX5RZ2/HXTcJBiC/hvvMaZ7nHGSNS0BCxJs=;
        b=BSdVm5GvMlD+ciwNJqgCnLtPJ6xrBVj2rSqXecnPhDfpWOylHqhqsMq24PJBTN70Pn
         bZO3FUlo+xalBqUwALzt+wpQNEr5iRy0zKEYVLF3nu9HR+h7ZiYmRn2lCVlDW3j98YNk
         9IGcomM5ZIvYIqZvMfK0dPQeb2Lmb/I9HV1GbXb/rRn1SS0V7OK/oPBppOZSXDJZqxV+
         Zb9eHKpO2kFaJ4trwdb32pm1VMXB4xcyTisY3abBzQ5I0qeJ6wCmNhfupVpB5xcOZUSG
         uLBhM+OKuAVj5Qd+yXlcCyNz2LSwrJbqKwhg9Oz0OF3D+YSjoqV4rL++ArJUK81oeohx
         ZGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HDCsdAy+QX5RZ2/HXTcJBiC/hvvMaZ7nHGSNS0BCxJs=;
        b=OMRSusSFEONNiBetPHHS+E3dVposgTdqLLcDDJCqIPMlh7JBIh9ClqnhEOObFf0lck
         rDjkAkHUZ1ylERP4Fpf6BqRPUB4v9/4yYFwFsM9j6oXWO/7b+Hega4wlphpXMlVKXYzB
         1E3YxwYYxGPyUf0ZIOS+24+NFntYSxr8EOEVI+XwsexaWmY/WWI/JGZWKHcBFD1XCBon
         DapNwqBOUqDy+xQA87TlSem8pjdeW+LgHpwlll5mADU5ADiVZRfUaEfPcmj5cqZfLmKM
         nBJVM1iPRhCiEXI7/neGK/nS3QevpNUyqfftu3g/N+ENa3WVjP+VNFzmXHpga14mkTcy
         9KRA==
X-Gm-Message-State: AJIora+d2LEg81t1slwMmfBuKO/hu9JMGcdZLr9dKEDOuMaxJ8vHSnM8
        sW5n3QwLJdso1ikX9gRpsgpQ1g==
X-Google-Smtp-Source: AGRyM1vyrtcOXL1eCikxoMPCUu9l5jUiwiIVIX8i+BzXYFMUPBMsjPrptYcgwLtvH2+0H6RreqdFXw==
X-Received: by 2002:a17:90b:4a4c:b0:1ec:9036:8f91 with SMTP id lb12-20020a17090b4a4c00b001ec90368f91mr10845237pjb.33.1655713756096;
        Mon, 20 Jun 2022 01:29:16 -0700 (PDT)
Received: from localhost ([139.177.225.255])
        by smtp.gmail.com with ESMTPSA id j4-20020aa783c4000000b0051b9e224623sm8668616pfn.141.2022.06.20.01.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 01:29:15 -0700 (PDT)
Date:   Mon, 20 Jun 2022 16:29:11 +0800
From:   Muchun Song <songmuchun@bytedance.com>
To:     David Hildenbrand <david@redhat.com>
Cc:     akpm@linux-foundation.org, corbet@lwn.net, mike.kravetz@oracle.com,
        osalvador@suse.de, paulmck@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        duanxiongchun@bytedance.com, smuchun@gmail.com
Subject: Re: [PATCH v4 2/2] mm: memory_hotplug: make hugetlb_optimize_vmemmap
 compatible with memmap_on_memory
Message-ID: <YrAv18GnMOcQaAxz@FVFYT0MHHV2J.usts.net>
References: <20220619133851.68184-1-songmuchun@bytedance.com>
 <20220619133851.68184-3-songmuchun@bytedance.com>
 <YrAgUtV6wD6CIrad@FVFYT0MHHV2J.usts.net>
 <226243a9-b4f5-182e-1a5b-7b8d5c28f3b3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <226243a9-b4f5-182e-1a5b-7b8d5c28f3b3@redhat.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 20, 2022 at 09:47:22AM +0200, David Hildenbrand wrote:
> On 20.06.22 09:22, Muchun Song wrote:
> > On Sun, Jun 19, 2022 at 09:38:51PM +0800, Muchun Song wrote:
> >> For now, the feature of hugetlb_free_vmemmap is not compatible with the
> >> feature of memory_hotplug.memmap_on_memory, and hugetlb_free_vmemmap
> >> takes precedence over memory_hotplug.memmap_on_memory. However, someone
> >> wants to make memory_hotplug.memmap_on_memory takes precedence over
> >> hugetlb_free_vmemmap since memmap_on_memory makes it more likely to
> >> succeed memory hotplug in close-to-OOM situations.  So the decision
> >> of making hugetlb_free_vmemmap take precedence is not wise and elegant.
> >> The proper approach is to have hugetlb_vmemmap.c do the check whether
> >> the section which the HugeTLB pages belong to can be optimized.  If
> >> the section's vmemmap pages are allocated from the added memory block
> >> itself, hugetlb_free_vmemmap should refuse to optimize the vmemmap,
> >> otherwise, do the optimization.  Then both kernel parameters are
> >> compatible.  So this patch introduces VmemmapSelfHosted to mask any
> >> non-optimizable vmemmap pages. The hugetlb_vmemmap can use this flag
> >> to detect if a vmemmap page can be optimized.
> >>
> >> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> >> Co-developed-by: Oscar Salvador <osalvador@suse.de>
> >> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> >> ---
> >>  Documentation/admin-guide/kernel-parameters.txt | 22 +++++------
> >>  Documentation/admin-guide/sysctl/vm.rst         |  5 +--
> >>  include/linux/memory_hotplug.h                  |  9 -----
> >>  include/linux/page-flags.h                      | 11 ++++++
> >>  mm/hugetlb_vmemmap.c                            | 52 +++++++++++++++++++++----
> >>  mm/memory_hotplug.c                             | 27 ++++++-------
> >>  6 files changed, 79 insertions(+), 47 deletions(-)
> >>
> >> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> >> index 8090130b544b..d740e2ed0e61 100644
> >> --- a/Documentation/admin-guide/kernel-parameters.txt
> >> +++ b/Documentation/admin-guide/kernel-parameters.txt
> >> @@ -1722,9 +1722,11 @@
> >>  			Built with CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON=y,
> >>  			the default is on.
> >>  
> >> -			This is not compatible with memory_hotplug.memmap_on_memory.
> >> -			If both parameters are enabled, hugetlb_free_vmemmap takes
> >> -			precedence over memory_hotplug.memmap_on_memory.
> >> +			Note that the vmemmap pages may be allocated from the added
> >> +			memory block itself when memory_hotplug.memmap_on_memory is
> >> +			enabled, those vmemmap pages cannot be optimized even if this
> >> +			feature is enabled.  Other vmemmap pages not allocated from
> >> +			the added memory block itself do not be affected.
> >>  
> >>  	hung_task_panic=
> >>  			[KNL] Should the hung task detector generate panics.
> >> @@ -3069,10 +3071,12 @@
> >>  			[KNL,X86,ARM] Boolean flag to enable this feature.
> >>  			Format: {on | off (default)}
> >>  			When enabled, runtime hotplugged memory will
> >> -			allocate its internal metadata (struct pages)
> >> -			from the hotadded memory which will allow to
> >> -			hotadd a lot of memory without requiring
> >> -			additional memory to do so.
> >> +			allocate its internal metadata (struct pages,
> >> +			those vmemmap pages cannot be optimized even
> >> +			if hugetlb_free_vmemmap is enabled) from the
> >> +			hotadded memory which will allow to hotadd a
> >> +			lot of memory without requiring additional
> >> +			memory to do so.
> >>  			This feature is disabled by default because it
> >>  			has some implication on large (e.g. GB)
> >>  			allocations in some configurations (e.g. small
> >> @@ -3082,10 +3086,6 @@
> >>  			Note that even when enabled, there are a few cases where
> >>  			the feature is not effective.
> >>  
> >> -			This is not compatible with hugetlb_free_vmemmap. If
> >> -			both parameters are enabled, hugetlb_free_vmemmap takes
> >> -			precedence over memory_hotplug.memmap_on_memory.
> >> -
> >>  	memtest=	[KNL,X86,ARM,M68K,PPC,RISCV] Enable memtest
> >>  			Format: <integer>
> >>  			default : 0 <disable>
> >> diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
> >> index 5c9aa171a0d3..d7374a1e8ac9 100644
> >> --- a/Documentation/admin-guide/sysctl/vm.rst
> >> +++ b/Documentation/admin-guide/sysctl/vm.rst
> >> @@ -565,9 +565,8 @@ See Documentation/admin-guide/mm/hugetlbpage.rst
> >>  hugetlb_optimize_vmemmap
> >>  ========================
> >>  
> >> -This knob is not available when memory_hotplug.memmap_on_memory (kernel parameter)
> >> -is configured or the size of 'struct page' (a structure defined in
> >> -include/linux/mm_types.h) is not power of two (an unusual system config could
> >> +This knob is not available when the size of 'struct page' (a structure defined
> >> +in include/linux/mm_types.h) is not power of two (an unusual system config could
> >>  result in this).
> >>  
> >>  Enable (set to 1) or disable (set to 0) the feature of optimizing vmemmap pages
> >> diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
> >> index 20d7edf62a6a..e0b2209ab71c 100644
> >> --- a/include/linux/memory_hotplug.h
> >> +++ b/include/linux/memory_hotplug.h
> >> @@ -351,13 +351,4 @@ void arch_remove_linear_mapping(u64 start, u64 size);
> >>  extern bool mhp_supports_memmap_on_memory(unsigned long size);
> >>  #endif /* CONFIG_MEMORY_HOTPLUG */
> >>  
> >> -#ifdef CONFIG_MHP_MEMMAP_ON_MEMORY
> >> -bool mhp_memmap_on_memory(void);
> >> -#else
> >> -static inline bool mhp_memmap_on_memory(void)
> >> -{
> >> -	return false;
> >> -}
> >> -#endif
> >> -
> >>  #endif /* __LINUX_MEMORY_HOTPLUG_H */
> >> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> >> index e66f7aa3191d..2aa5dcbfe468 100644
> >> --- a/include/linux/page-flags.h
> >> +++ b/include/linux/page-flags.h
> >> @@ -193,6 +193,11 @@ enum pageflags {
> >>  
> >>  	/* Only valid for buddy pages. Used to track pages that are reported */
> >>  	PG_reported = PG_uptodate,
> >> +
> >> +#ifdef CONFIG_MEMORY_HOTPLUG
> >> +	/* For self-hosted memmap pages */
> >> +	PG_vmemmap_self_hosted = PG_owner_priv_1,
> >> +#endif
> >>  };
> >>  
> >>  #define PAGEFLAGS_MASK		((1UL << NR_PAGEFLAGS) - 1)
> >> @@ -628,6 +633,12 @@ PAGEFLAG_FALSE(SkipKASanPoison, skip_kasan_poison)
> >>   */
> >>  __PAGEFLAG(Reported, reported, PF_NO_COMPOUND)
> >>  
> >> +#ifdef CONFIG_MEMORY_HOTPLUG
> >> +PAGEFLAG(VmemmapSelfHosted, vmemmap_self_hosted, PF_ANY)
> >> +#else
> >> +PAGEFLAG_FALSE(VmemmapSelfHosted, vmemmap_self_hosted)
> >> +#endif
> >> +
> >>  /*
> >>   * On an anonymous page mapped into a user virtual memory area,
> >>   * page->mapping points to its anon_vma, not to a struct address_space;
> >> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> >> index 1089ea8a9c98..73bfbb47f6a4 100644
> >> --- a/mm/hugetlb_vmemmap.c
> >> +++ b/mm/hugetlb_vmemmap.c
> >> @@ -10,7 +10,7 @@
> >>   */
> >>  #define pr_fmt(fmt)	"HugeTLB: " fmt
> >>  
> >> -#include <linux/memory_hotplug.h>
> >> +#include <linux/memory.h>
> >>  #include "hugetlb_vmemmap.h"
> >>  
> >>  /*
> >> @@ -97,18 +97,54 @@ int hugetlb_vmemmap_alloc(struct hstate *h, struct page *head)
> >>  	return ret;
> >>  }
> >>  
> >> +static unsigned int vmemmap_optimizable_pages(struct hstate *h,
> >> +					      struct page *head)
> >> +{
> >> +	if (READ_ONCE(vmemmap_optimize_mode) == VMEMMAP_OPTIMIZE_OFF)
> >> +		return 0;
> >> +
> >> +	if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG)) {
> >> +		unsigned long pfn = page_to_pfn(head);
> >> +
> >> +		/*
> >> +		 * Due to HugeTLB alignment requirements and the vmemmap pages
> >> +		 * being at the start of the hotplugged memory region in
> >> +		 * memory_hotplug.memmap_on_memory case. Checking the first
> >> +		 * vmemmap page's vmemmap if it is marked as VmemmapSelfHosted
> >> +		 * is sufficient.
> >> +		 *
> >> +		 * [                  hotplugged memory                  ]
> >> +		 * [        section        ][...][        section        ]
> >> +		 * [ vmemmap ][              usable memory               ]
> >> +		 *   ^   |     |                                        |
> >> +		 *   +---+     |                                        |
> >> +		 *     ^       |                                        |
> >> +		 *     +-------+                                        |
> >> +		 *          ^                                           |
> >> +		 *          +-------------------------------------------+
> >> +		 *
> >> +		 * Hotplugged memory block never has non-present sections, while
> >> +		 * boot memory block can have one or more. So pfn_valid() is
> >> +		 * used to filter out the non-present section which also cannot
> >> +		 * be memmap_on_memory.
> >> +		 */
> >> +		pfn = ALIGN_DOWN(pfn, PHYS_PFN(memory_block_size_bytes()));
> >> +		if (pfn_valid(pfn) && PageVmemmapSelfHosted(pfn_to_page(pfn)))
> > 
> > Although it works, I think PageVmemmapSelfHosted() check for the 1st pfn's
> > vmemmap page is not always reliable.  Since we reused PG_owner_priv_1
> > as PG_vmemmap_self_hosted, the test is noly reliable for vmemmap page's
> > vmemmap page.  Other non-vmemmap page can be flagged with PG_owner_priv_1.
> > So this check can be false-positive. Maybe the following code snippet is
> > the solution.
> 
> How could that happen for pages used for backing a vmemmap?
>

It cannot happen for memmap_on_memory case. Howwver, it can happen for other
cases. E.g. the 1st pfn (of boot memory block) whose vmemmap page may be flagged
as PG_owner_priv_1 (if PG_swapcache is set). Then, the check is false-positive.
 
> > 
> > Any thoughts? Oscar or David.
> 
> First of all, I think you should really avoid using
> memory_block_size_bytes(); when using memory_block_size_bytes(), you
> wouldn't need PageVmemmapSelfHosted(), you can just check if the vmemmap
> of the page is itself. But I think we should try making this independent
> of the memory block size.
> 

Agree.

> If virt_to_page(page) doesn't work, maybe just traverse the direct map
> to find the page backing page directly?
>

Yeah, now I have tried to walk page tables to get the backing page.
I'll update a new version.

Thanks.

> -- 
> Thanks,
> 
> David / dhildenb
> 
> 
