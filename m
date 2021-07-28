Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE6D33D87AE
	for <lists+linux-doc@lfdr.de>; Wed, 28 Jul 2021 08:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233828AbhG1GJW (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 28 Jul 2021 02:09:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234074AbhG1GJV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Jul 2021 02:09:21 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59309C061757
        for <linux-doc@vger.kernel.org>; Tue, 27 Jul 2021 23:09:20 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id e5so1399060pld.6
        for <linux-doc@vger.kernel.org>; Tue, 27 Jul 2021 23:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ni/fBI9O4Wpkc9I0icl/8eEwTGRZFCOE6KDR5N+g2I0=;
        b=MWoVq1mOFv7nS1yF/gpUwWvmXUdyPQO4XeV9P8sx1ieBka2LEiXtdxxxDTIuZLG34o
         90Xh+qIHAeFIYp2p8gTpLpM327eJPIXAPhpRrHDSMy8HHF1QE8i1XXjyTauFeJZvCuTC
         Z7RpOC8NSdo3ui3BYhiYysvYciExD1ya37t1yGG1U47eSpBVSlXBdMZ687jpy+oW5Iqh
         uS2gK/DqHm6YTE+/Ey6j757/F/AhTJAIm4Xjik7xpcKaY7zT+8szQ0+88R9Yf/VMkWrf
         refyKGVp0Hf5Zka20GkYZ8MGIf56f6gBT42/u0HQUrdXg2QzWRCy3zeTGwLvlvX/pGhC
         y2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ni/fBI9O4Wpkc9I0icl/8eEwTGRZFCOE6KDR5N+g2I0=;
        b=Xgxr0gr9FSrLVMsTk/710ygwsaPXqsYNOFNQNQBwH/t7AF7lXYCBH/ACwAZK7les0h
         01HxX2tu/ISyB/3SLeMqu3F89mKguWTtKNa13vY89oYOBnxxSBeU5JgHU2q6ZDFwA8BR
         K7WihCD4XzMt66mdqjKwhU4G3SktBrjilPSXQw/e+A72dC8lUHh4anXGepXQa5woyawA
         2EBM6XFaCHXF24jClpdSu3upmm4diJiNXQrvOi9QJH/4M1CGK/Fr42fjc+uqBbN8fG2f
         5RcxuleQY2pHfXhfaJ4Y0lveK7RyRpHvgtOU4gzu+/oESKCcXNzOUkLg4PXwkBg2OgnY
         xH0A==
X-Gm-Message-State: AOAM532FCO0b81iuGryEawQ+DXElmPBgL0kBi3oC16Kow+MY0NMoT5A5
        NCE+LOvs0VFJa6LSvlSzxkCEcKF3kJTAyVjuRjwiHA==
X-Google-Smtp-Source: ABdhPJxWcvqY7wnk+J404OZE5baQ+gOcLBHOo7nXRXYcrmSSAGIBtiqdXBjL6laMr/5lPRL430cq2hEfm5cC0CMdU2w=
X-Received: by 2002:a65:5544:: with SMTP id t4mr27242005pgr.240.1627452559821;
 Tue, 27 Jul 2021 23:09:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210714193542.21857-1-joao.m.martins@oracle.com> <20210714193542.21857-8-joao.m.martins@oracle.com>
In-Reply-To: <20210714193542.21857-8-joao.m.martins@oracle.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Tue, 27 Jul 2021 23:09:09 -0700
Message-ID: <CAPcyv4hMUY+wtB1P4SbzesOB45fo7bZzg14kdX86Hrnd4A-RBQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/14] mm/hugetlb_vmemmap: move comment block to Documentation/vm
To:     Joao Martins <joao.m.martins@oracle.com>
Cc:     Linux MM <linux-mm@kvack.org>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Matthew Wilcox <willy@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        John Hubbard <jhubbard@nvidia.com>,
        Jane Chu <jane.chu@oracle.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux NVDIMM <nvdimm@lists.linux.dev>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 14, 2021 at 12:36 PM Joao Martins <joao.m.martins@oracle.com> wrote:
>
> In preparation for device-dax for using hugetlbfs compound page tail
> deduplication technique, move the comment block explanation into a
> common place in Documentation/vm.
>
> Cc: Muchun Song <songmuchun@bytedance.com>
> Cc: Mike Kravetz <mike.kravetz@oracle.com>
> Suggested-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>

Looks good,

Reviewed-by: Dan Williams <dan.j.williams@intel.com>

> ---
>  Documentation/vm/index.rst         |   1 +
>  Documentation/vm/vmemmap_dedup.rst | 170 +++++++++++++++++++++++++++++
>  mm/hugetlb_vmemmap.c               | 162 +--------------------------
>  3 files changed, 172 insertions(+), 161 deletions(-)
>  create mode 100644 Documentation/vm/vmemmap_dedup.rst
>
> diff --git a/Documentation/vm/index.rst b/Documentation/vm/index.rst
> index eff5fbd492d0..edd690afd890 100644
> --- a/Documentation/vm/index.rst
> +++ b/Documentation/vm/index.rst
> @@ -51,5 +51,6 @@ descriptions of data structures and algorithms.
>     split_page_table_lock
>     transhuge
>     unevictable-lru
> +   vmemmap_dedup
>     z3fold
>     zsmalloc
> diff --git a/Documentation/vm/vmemmap_dedup.rst b/Documentation/vm/vmemmap_dedup.rst
> new file mode 100644
> index 000000000000..215ae2ef3bce
> --- /dev/null
> +++ b/Documentation/vm/vmemmap_dedup.rst
> @@ -0,0 +1,170 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. _vmemmap_dedup:
> +
> +==================================
> +Free some vmemmap pages of HugeTLB
> +==================================
> +
> +The struct page structures (page structs) are used to describe a physical
> +page frame. By default, there is a one-to-one mapping from a page frame to
> +it's corresponding page struct.
> +
> +HugeTLB pages consist of multiple base page size pages and is supported by
> +many architectures. See hugetlbpage.rst in the Documentation directory for
> +more details. On the x86-64 architecture, HugeTLB pages of size 2MB and 1GB
> +are currently supported. Since the base page size on x86 is 4KB, a 2MB
> +HugeTLB page consists of 512 base pages and a 1GB HugeTLB page consists of
> +4096 base pages. For each base page, there is a corresponding page struct.
> +
> +Within the HugeTLB subsystem, only the first 4 page structs are used to
> +contain unique information about a HugeTLB page. __NR_USED_SUBPAGE provides
> +this upper limit. The only 'useful' information in the remaining page structs
> +is the compound_head field, and this field is the same for all tail pages.
> +
> +By removing redundant page structs for HugeTLB pages, memory can be returned
> +to the buddy allocator for other uses.
> +
> +Different architectures support different HugeTLB pages. For example, the
> +following table is the HugeTLB page size supported by x86 and arm64
> +architectures. Because arm64 supports 4k, 16k, and 64k base pages and
> +supports contiguous entries, so it supports many kinds of sizes of HugeTLB
> +page.
> +
> ++--------------+-----------+-----------------------------------------------+
> +| Architecture | Page Size |                HugeTLB Page Size              |
> ++--------------+-----------+-----------+-----------+-----------+-----------+
> +|    x86-64    |    4KB    |    2MB    |    1GB    |           |           |
> ++--------------+-----------+-----------+-----------+-----------+-----------+
> +|              |    4KB    |   64KB    |    2MB    |    32MB   |    1GB    |
> +|              +-----------+-----------+-----------+-----------+-----------+
> +|    arm64     |   16KB    |    2MB    |   32MB    |     1GB   |           |
> +|              +-----------+-----------+-----------+-----------+-----------+
> +|              |   64KB    |    2MB    |  512MB    |    16GB   |           |
> ++--------------+-----------+-----------+-----------+-----------+-----------+
> +
> +When the system boot up, every HugeTLB page has more than one struct page
> +structs which size is (unit: pages):
> +
> +   struct_size = HugeTLB_Size / PAGE_SIZE * sizeof(struct page) / PAGE_SIZE
> +
> +Where HugeTLB_Size is the size of the HugeTLB page. We know that the size
> +of the HugeTLB page is always n times PAGE_SIZE. So we can get the following
> +relationship.
> +
> +   HugeTLB_Size = n * PAGE_SIZE
> +
> +Then,
> +
> +   struct_size = n * PAGE_SIZE / PAGE_SIZE * sizeof(struct page) / PAGE_SIZE
> +               = n * sizeof(struct page) / PAGE_SIZE
> +
> +We can use huge mapping at the pud/pmd level for the HugeTLB page.
> +
> +For the HugeTLB page of the pmd level mapping, then
> +
> +   struct_size = n * sizeof(struct page) / PAGE_SIZE
> +               = PAGE_SIZE / sizeof(pte_t) * sizeof(struct page) / PAGE_SIZE
> +               = sizeof(struct page) / sizeof(pte_t)
> +               = 64 / 8
> +               = 8 (pages)
> +
> +Where n is how many pte entries which one page can contains. So the value of
> +n is (PAGE_SIZE / sizeof(pte_t)).
> +
> +This optimization only supports 64-bit system, so the value of sizeof(pte_t)
> +is 8. And this optimization also applicable only when the size of struct page
> +is a power of two. In most cases, the size of struct page is 64 bytes (e.g.
> +x86-64 and arm64). So if we use pmd level mapping for a HugeTLB page, the
> +size of struct page structs of it is 8 page frames which size depends on the
> +size of the base page.
> +
> +For the HugeTLB page of the pud level mapping, then
> +
> +   struct_size = PAGE_SIZE / sizeof(pmd_t) * struct_size(pmd)
> +               = PAGE_SIZE / 8 * 8 (pages)
> +               = PAGE_SIZE (pages)
> +
> +Where the struct_size(pmd) is the size of the struct page structs of a
> +HugeTLB page of the pmd level mapping.
> +
> +E.g.: A 2MB HugeTLB page on x86_64 consists in 8 page frames while 1GB
> +HugeTLB page consists in 4096.
> +
> +Next, we take the pmd level mapping of the HugeTLB page as an example to
> +show the internal implementation of this optimization. There are 8 pages
> +struct page structs associated with a HugeTLB page which is pmd mapped.
> +
> +Here is how things look before optimization.
> +
> +    HugeTLB                  struct pages(8 pages)         page frame(8 pages)
> + +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
> + |           |                     |     0     | -------------> |     0     |
> + |           |                     +-----------+                +-----------+
> + |           |                     |     1     | -------------> |     1     |
> + |           |                     +-----------+                +-----------+
> + |           |                     |     2     | -------------> |     2     |
> + |           |                     +-----------+                +-----------+
> + |           |                     |     3     | -------------> |     3     |
> + |           |                     +-----------+                +-----------+
> + |           |                     |     4     | -------------> |     4     |
> + |    PMD    |                     +-----------+                +-----------+
> + |   level   |                     |     5     | -------------> |     5     |
> + |  mapping  |                     +-----------+                +-----------+
> + |           |                     |     6     | -------------> |     6     |
> + |           |                     +-----------+                +-----------+
> + |           |                     |     7     | -------------> |     7     |
> + |           |                     +-----------+                +-----------+
> + |           |
> + |           |
> + |           |
> + +-----------+
> +
> +The value of page->compound_head is the same for all tail pages. The first
> +page of page structs (page 0) associated with the HugeTLB page contains the 4
> +page structs necessary to describe the HugeTLB. The only use of the remaining
> +pages of page structs (page 1 to page 7) is to point to page->compound_head.
> +Therefore, we can remap pages 2 to 7 to page 1. Only 2 pages of page structs
> +will be used for each HugeTLB page. This will allow us to free the remaining
> +6 pages to the buddy allocator.
> +
> +Here is how things look after remapping.
> +
> +    HugeTLB                  struct pages(8 pages)         page frame(8 pages)
> + +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
> + |           |                     |     0     | -------------> |     0     |
> + |           |                     +-----------+                +-----------+
> + |           |                     |     1     | -------------> |     1     |
> + |           |                     +-----------+                +-----------+
> + |           |                     |     2     | ----------------^ ^ ^ ^ ^ ^
> + |           |                     +-----------+                   | | | | |
> + |           |                     |     3     | ------------------+ | | | |
> + |           |                     +-----------+                     | | | |
> + |           |                     |     4     | --------------------+ | | |
> + |    PMD    |                     +-----------+                       | | |
> + |   level   |                     |     5     | ----------------------+ | |
> + |  mapping  |                     +-----------+                         | |
> + |           |                     |     6     | ------------------------+ |
> + |           |                     +-----------+                           |
> + |           |                     |     7     | --------------------------+
> + |           |                     +-----------+
> + |           |
> + |           |
> + |           |
> + +-----------+
> +
> +When a HugeTLB is freed to the buddy system, we should allocate 6 pages for
> +vmemmap pages and restore the previous mapping relationship.
> +
> +For the HugeTLB page of the pud level mapping. It is similar to the former.
> +We also can use this approach to free (PAGE_SIZE - 2) vmemmap pages.
> +
> +Apart from the HugeTLB page of the pmd/pud level mapping, some architectures
> +(e.g. aarch64) provides a contiguous bit in the translation table entries
> +that hints to the MMU to indicate that it is one of a contiguous set of
> +entries that can be cached in a single TLB entry.
> +
> +The contiguous bit is used to increase the mapping size at the pmd and pte
> +(last) level. So this type of HugeTLB page can be optimized only when its
> +size of the struct page structs is greater than 2 pages.
> +
> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> index c540c21e26f5..e2994e50ddee 100644
> --- a/mm/hugetlb_vmemmap.c
> +++ b/mm/hugetlb_vmemmap.c
> @@ -6,167 +6,7 @@
>   *
>   *     Author: Muchun Song <songmuchun@bytedance.com>
>   *
> - * The struct page structures (page structs) are used to describe a physical
> - * page frame. By default, there is a one-to-one mapping from a page frame to
> - * it's corresponding page struct.
> - *
> - * HugeTLB pages consist of multiple base page size pages and is supported by
> - * many architectures. See hugetlbpage.rst in the Documentation directory for
> - * more details. On the x86-64 architecture, HugeTLB pages of size 2MB and 1GB
> - * are currently supported. Since the base page size on x86 is 4KB, a 2MB
> - * HugeTLB page consists of 512 base pages and a 1GB HugeTLB page consists of
> - * 4096 base pages. For each base page, there is a corresponding page struct.
> - *
> - * Within the HugeTLB subsystem, only the first 4 page structs are used to
> - * contain unique information about a HugeTLB page. __NR_USED_SUBPAGE provides
> - * this upper limit. The only 'useful' information in the remaining page structs
> - * is the compound_head field, and this field is the same for all tail pages.
> - *
> - * By removing redundant page structs for HugeTLB pages, memory can be returned
> - * to the buddy allocator for other uses.
> - *
> - * Different architectures support different HugeTLB pages. For example, the
> - * following table is the HugeTLB page size supported by x86 and arm64
> - * architectures. Because arm64 supports 4k, 16k, and 64k base pages and
> - * supports contiguous entries, so it supports many kinds of sizes of HugeTLB
> - * page.
> - *
> - * +--------------+-----------+-----------------------------------------------+
> - * | Architecture | Page Size |                HugeTLB Page Size              |
> - * +--------------+-----------+-----------+-----------+-----------+-----------+
> - * |    x86-64    |    4KB    |    2MB    |    1GB    |           |           |
> - * +--------------+-----------+-----------+-----------+-----------+-----------+
> - * |              |    4KB    |   64KB    |    2MB    |    32MB   |    1GB    |
> - * |              +-----------+-----------+-----------+-----------+-----------+
> - * |    arm64     |   16KB    |    2MB    |   32MB    |     1GB   |           |
> - * |              +-----------+-----------+-----------+-----------+-----------+
> - * |              |   64KB    |    2MB    |  512MB    |    16GB   |           |
> - * +--------------+-----------+-----------+-----------+-----------+-----------+
> - *
> - * When the system boot up, every HugeTLB page has more than one struct page
> - * structs which size is (unit: pages):
> - *
> - *    struct_size = HugeTLB_Size / PAGE_SIZE * sizeof(struct page) / PAGE_SIZE
> - *
> - * Where HugeTLB_Size is the size of the HugeTLB page. We know that the size
> - * of the HugeTLB page is always n times PAGE_SIZE. So we can get the following
> - * relationship.
> - *
> - *    HugeTLB_Size = n * PAGE_SIZE
> - *
> - * Then,
> - *
> - *    struct_size = n * PAGE_SIZE / PAGE_SIZE * sizeof(struct page) / PAGE_SIZE
> - *                = n * sizeof(struct page) / PAGE_SIZE
> - *
> - * We can use huge mapping at the pud/pmd level for the HugeTLB page.
> - *
> - * For the HugeTLB page of the pmd level mapping, then
> - *
> - *    struct_size = n * sizeof(struct page) / PAGE_SIZE
> - *                = PAGE_SIZE / sizeof(pte_t) * sizeof(struct page) / PAGE_SIZE
> - *                = sizeof(struct page) / sizeof(pte_t)
> - *                = 64 / 8
> - *                = 8 (pages)
> - *
> - * Where n is how many pte entries which one page can contains. So the value of
> - * n is (PAGE_SIZE / sizeof(pte_t)).
> - *
> - * This optimization only supports 64-bit system, so the value of sizeof(pte_t)
> - * is 8. And this optimization also applicable only when the size of struct page
> - * is a power of two. In most cases, the size of struct page is 64 bytes (e.g.
> - * x86-64 and arm64). So if we use pmd level mapping for a HugeTLB page, the
> - * size of struct page structs of it is 8 page frames which size depends on the
> - * size of the base page.
> - *
> - * For the HugeTLB page of the pud level mapping, then
> - *
> - *    struct_size = PAGE_SIZE / sizeof(pmd_t) * struct_size(pmd)
> - *                = PAGE_SIZE / 8 * 8 (pages)
> - *                = PAGE_SIZE (pages)
> - *
> - * Where the struct_size(pmd) is the size of the struct page structs of a
> - * HugeTLB page of the pmd level mapping.
> - *
> - * E.g.: A 2MB HugeTLB page on x86_64 consists in 8 page frames while 1GB
> - * HugeTLB page consists in 4096.
> - *
> - * Next, we take the pmd level mapping of the HugeTLB page as an example to
> - * show the internal implementation of this optimization. There are 8 pages
> - * struct page structs associated with a HugeTLB page which is pmd mapped.
> - *
> - * Here is how things look before optimization.
> - *
> - *    HugeTLB                  struct pages(8 pages)         page frame(8 pages)
> - * +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
> - * |           |                     |     0     | -------------> |     0     |
> - * |           |                     +-----------+                +-----------+
> - * |           |                     |     1     | -------------> |     1     |
> - * |           |                     +-----------+                +-----------+
> - * |           |                     |     2     | -------------> |     2     |
> - * |           |                     +-----------+                +-----------+
> - * |           |                     |     3     | -------------> |     3     |
> - * |           |                     +-----------+                +-----------+
> - * |           |                     |     4     | -------------> |     4     |
> - * |    PMD    |                     +-----------+                +-----------+
> - * |   level   |                     |     5     | -------------> |     5     |
> - * |  mapping  |                     +-----------+                +-----------+
> - * |           |                     |     6     | -------------> |     6     |
> - * |           |                     +-----------+                +-----------+
> - * |           |                     |     7     | -------------> |     7     |
> - * |           |                     +-----------+                +-----------+
> - * |           |
> - * |           |
> - * |           |
> - * +-----------+
> - *
> - * The value of page->compound_head is the same for all tail pages. The first
> - * page of page structs (page 0) associated with the HugeTLB page contains the 4
> - * page structs necessary to describe the HugeTLB. The only use of the remaining
> - * pages of page structs (page 1 to page 7) is to point to page->compound_head.
> - * Therefore, we can remap pages 2 to 7 to page 1. Only 2 pages of page structs
> - * will be used for each HugeTLB page. This will allow us to free the remaining
> - * 6 pages to the buddy allocator.
> - *
> - * Here is how things look after remapping.
> - *
> - *    HugeTLB                  struct pages(8 pages)         page frame(8 pages)
> - * +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
> - * |           |                     |     0     | -------------> |     0     |
> - * |           |                     +-----------+                +-----------+
> - * |           |                     |     1     | -------------> |     1     |
> - * |           |                     +-----------+                +-----------+
> - * |           |                     |     2     | ----------------^ ^ ^ ^ ^ ^
> - * |           |                     +-----------+                   | | | | |
> - * |           |                     |     3     | ------------------+ | | | |
> - * |           |                     +-----------+                     | | | |
> - * |           |                     |     4     | --------------------+ | | |
> - * |    PMD    |                     +-----------+                       | | |
> - * |   level   |                     |     5     | ----------------------+ | |
> - * |  mapping  |                     +-----------+                         | |
> - * |           |                     |     6     | ------------------------+ |
> - * |           |                     +-----------+                           |
> - * |           |                     |     7     | --------------------------+
> - * |           |                     +-----------+
> - * |           |
> - * |           |
> - * |           |
> - * +-----------+
> - *
> - * When a HugeTLB is freed to the buddy system, we should allocate 6 pages for
> - * vmemmap pages and restore the previous mapping relationship.
> - *
> - * For the HugeTLB page of the pud level mapping. It is similar to the former.
> - * We also can use this approach to free (PAGE_SIZE - 2) vmemmap pages.
> - *
> - * Apart from the HugeTLB page of the pmd/pud level mapping, some architectures
> - * (e.g. aarch64) provides a contiguous bit in the translation table entries
> - * that hints to the MMU to indicate that it is one of a contiguous set of
> - * entries that can be cached in a single TLB entry.
> - *
> - * The contiguous bit is used to increase the mapping size at the pmd and pte
> - * (last) level. So this type of HugeTLB page can be optimized only when its
> - * size of the struct page structs is greater than 2 pages.
> + * See Documentation/vm/vmemmap_dedup.rst
>   */
>  #define pr_fmt(fmt)    "HugeTLB: " fmt
>
> --
> 2.17.1
>
