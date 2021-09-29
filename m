Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2027741CC8F
	for <lists+linux-doc@lfdr.de>; Wed, 29 Sep 2021 21:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345485AbhI2TZy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 29 Sep 2021 15:25:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:52020 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343505AbhI2TZx (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 29 Sep 2021 15:25:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D669F6140F;
        Wed, 29 Sep 2021 19:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632943452;
        bh=Kic1xJl340EDGWe45l8iOlr2pQS1CGNbWFMeOBeCVnQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IV9s+ltdhsqghIwkv47ivP4VliZE95ZjYph5zm7PrF+feipDFsaYdAfYHrYHP+o0A
         4XjDdKqz5o9ZKLmYkZF2bJmEqO0FE8mdOU9FAaDQfOCnPReQrWPkMvs28GQdMxaXU8
         MB38pj16HImpN4iSocIU0nRR7gU9Niv5fMZTmXK39CczqigP9s9jSQ+kFJ7d3seBFA
         K35UkTtgv8ZKKFtE7b+ljU8gW91H6CA6DHe8dIcv1JCHku47lSJlc8EDC5/kuwIynw
         l6VM7HOhMvDgT8DAqopy6fodKqmpWD1AjYNKqNrn53dAP2iqyB+SeBK3/3XquBLVAE
         J/Kno9ZVXtRCw==
Date:   Wed, 29 Sep 2021 12:24:06 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Zhenguo Yao <yaozhenguo1@gmail.com>
Cc:     mike.kravetz@oracle.com, mpe@ellerman.id.au,
        benh@kernel.crashing.org, paulus@samba.org, corbet@lwn.net,
        rppt@kernel.org, akpm@linux-foundation.org, yaozhenguo@jd.com,
        willy@infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev
Subject: Re: [PATCH v7] hugetlbfs: Extend the definition of hugepages
 parameter to support node allocation
Message-ID: <YVS9VhrAuKE2YdbF@archlinux-ax161>
References: <20210927104149.46884-1-yaozhenguo1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927104149.46884-1-yaozhenguo1@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Sep 27, 2021 at 06:41:49PM +0800, Zhenguo Yao wrote:
> We can specify the number of hugepages to allocate at boot. But the
> hugepages is balanced in all nodes at present. In some scenarios,
> we only need hugepages in one node. For example: DPDK needs hugepages
> which are in the same node as NIC. if DPDK needs four hugepages of 1G
> size in node1 and system has 16 numa nodes. We must reserve 64 hugepages
> in kernel cmdline. But, only four hugepages are used. The others should
> be free after boot. If the system memory is low(for example: 64G), it will
> be an impossible task. So, Extending hugepages parameter to support
> specifying hugepages at a specific node.
> For example add following parameter:
> 
> hugepagesz=1G hugepages=0:1,1:3
> 
> It will allocate 1 hugepage in node0 and 3 hugepages in node1.
> 
> Signed-off-by: Zhenguo Yao <yaozhenguo1@gmail.com>

<snip>

> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 95dc7b83381f..ca00676a1bdd 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -66,6 +66,7 @@ static struct hstate * __initdata parsed_hstate;
>  static unsigned long __initdata default_hstate_max_huge_pages;
>  static bool __initdata parsed_valid_hugepagesz = true;
>  static bool __initdata parsed_default_hugepagesz;
> +static unsigned int default_hugepages_in_node[MAX_NUMNODES] __initdata;
>  
>  /*
>   * Protects updates to hugepage_freelists, hugepage_activelist, nr_huge_pages,
> @@ -2868,33 +2869,41 @@ struct page *alloc_huge_page(struct vm_area_struct *vma,
>  	return ERR_PTR(-ENOSPC);
>  }
>  
> -int alloc_bootmem_huge_page(struct hstate *h)
> +int alloc_bootmem_huge_page(struct hstate *h, int nid)
>  	__attribute__ ((weak, alias("__alloc_bootmem_huge_page")));
> -int __alloc_bootmem_huge_page(struct hstate *h)
> +int __alloc_bootmem_huge_page(struct hstate *h, int nid)
>  {
>  	struct huge_bootmem_page *m;
>  	int nr_nodes, node;
>  
> +	if (nid >= nr_online_nodes)
> +		return 0;
> +	/* do node specific alloc */
> +	if (nid != NUMA_NO_NODE) {
> +		m = memblock_alloc_try_nid_raw(huge_page_size(h), huge_page_size(h),
> +				0, MEMBLOCK_ALLOC_ACCESSIBLE, nid);
> +		if (m)
> +			goto found;
> +		else
> +			return 0;
> +	}
> +	/* do all node balanced alloc */
>  	for_each_node_mask_to_alloc(h, nr_nodes, node, &node_states[N_MEMORY]) {
> -		void *addr;
> -
> -		addr = memblock_alloc_try_nid_raw(
> +		m = memblock_alloc_try_nid_raw(
>  				huge_page_size(h), huge_page_size(h),
>  				0, MEMBLOCK_ALLOC_ACCESSIBLE, node);
> -		if (addr) {
> -			/*
> -			 * Use the beginning of the huge page to store the
> -			 * huge_bootmem_page struct (until gather_bootmem
> -			 * puts them into the mem_map).
> -			 */
> -			m = addr;
> +		/*
> +		 * Use the beginning of the huge page to store the
> +		 * huge_bootmem_page struct (until gather_bootmem
> +		 * puts them into the mem_map).
> +		 */
> +		if (m)
>  			goto found;
> -		}
> +		else
> +			return 0;
>  	}
> -	return 0;
>  
>  found:
> -	BUG_ON(!IS_ALIGNED(virt_to_phys(m), huge_page_size(h)));
>  	/* Put them into a private list first because mem_map is not up yet */
>  	INIT_LIST_HEAD(&m->list);
>  	list_add(&m->list, &huge_boot_pages);

This hunk causes a clang warning now:

mm/hugetlb.c:2957:33: error: variable 'm' is used uninitialized whenever '&&' condition is false [-Werror,-Wsometimes-uninitialized]
        for_each_node_mask_to_alloc(h, nr_nodes, node, &node_states[N_MEMORY]) {
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
mm/hugetlb.c:1254:3: note: expanded from macro 'for_each_node_mask_to_alloc'
                nr_nodes > 0 &&                                         \
                ^~~~~~~~~~~~
mm/hugetlb.c:2974:18: note: uninitialized use occurs here
        INIT_LIST_HEAD(&m->list);
                        ^
mm/hugetlb.c:2957:33: note: remove the '&&' if its condition is always true
        for_each_node_mask_to_alloc(h, nr_nodes, node, &node_states[N_MEMORY]) {
                                       ^
mm/hugetlb.c:2942:29: note: initialize the variable 'm' to silence this warning
        struct huge_bootmem_page *m;
                                   ^
                                    = NULL
1 error generated.

I am not sure if it is possible for nr_nodes to be 0 right out of the
gate so might be a false positive?

Cheers,
Nathan
