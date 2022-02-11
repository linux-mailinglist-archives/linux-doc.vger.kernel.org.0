Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 013434B1FB1
	for <lists+linux-doc@lfdr.de>; Fri, 11 Feb 2022 08:55:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345190AbiBKHzQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 11 Feb 2022 02:55:16 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbiBKHzP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Feb 2022 02:55:15 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6090BC1
        for <linux-doc@vger.kernel.org>; Thu, 10 Feb 2022 23:55:14 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id e140so3249419ybh.9
        for <linux-doc@vger.kernel.org>; Thu, 10 Feb 2022 23:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SxWwp4vhzlHM/r5dlY3eoYylnbCH6SSOv7vRZ0v/oPk=;
        b=5wlqz7WwEsPV70o9vwoNCHYQssh7D6yEtfOT1EvihAqWheirjNiIAsBWO5gB/2npQS
         diPV/2tkqg2Par9OS0Cqwu+jYH8+w2UWiFeyuhSCwcuKo0sjevRLR3I8JLO8+BgtgHgX
         3//h71enruNwBOV8f4EpTmP5K4SJLk/Q4UlEjuanjANvCR0r2Z+9s9KRFdNGdHltrx43
         OOe15MhJXQ3m8Mt/Q6E9XHBDleRHo95IL5tZzXtKkvJtoqXvgCYJtEiUlbkqFzlKbKd1
         IBWT/KkcfklF/zYxnWFb9icjpNKmP0HJELKSYWPYR+UPuibyG54TsXWEfx6BPZHqQ5oF
         yDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SxWwp4vhzlHM/r5dlY3eoYylnbCH6SSOv7vRZ0v/oPk=;
        b=IajolgipMkgYYiWp9DXQOIQckfHrgE/CWhbGCrtdG4GGFQWZ2cQQJX6pzPKxrh5T0o
         mMsrKDtWFqv5cHz7URZKH0C4W59NiAwWzRvALj9QdOiWjKbeHr94mZZ5I8iuI/enufOc
         JopvxGxqDnu2i7lrfK6IFbzJ7k/+kCfwGia3zAZoVy16cdD0/mRxXT7NMysXUR78N3VS
         RMEYHoHP6gcufGVZa6AzsaCxqpURgz4wtQBk69lkV28Ge0B69brsdWxD9xfMGVHOWGFH
         /J5nSeWevQ0oqP6iGHCZZAYXDWCHkJG1tKVhLn1e5IE6QFIEBHy3FDEyFVFs4khWDTMR
         XAgA==
X-Gm-Message-State: AOAM531uqp4otGw8wQmQmENAd1XA1O5cVxP6+tKq4jG2CyP7USW0ZJAD
        dnQ1PjNtIT/rHLtjA3aINipQhLnZZWkeRDmJ0N2fRw==
X-Google-Smtp-Source: ABdhPJx9DX4VXkSD8lglmhSxc6yMrxUjrjTM2Qa3nh1Yx8UmysmxxA9eJL1Xr53Gmvx0cjL3/gA6ws7KnQbnxq+vAjM=
X-Received: by 2002:a25:e406:: with SMTP id b6mr261879ybh.703.1644566114077;
 Thu, 10 Feb 2022 23:55:14 -0800 (PST)
MIME-Version: 1.0
References: <20220210193345.23628-1-joao.m.martins@oracle.com> <20220210193345.23628-5-joao.m.martins@oracle.com>
In-Reply-To: <20220210193345.23628-5-joao.m.martins@oracle.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Fri, 11 Feb 2022 15:54:36 +0800
Message-ID: <CAMZfGtUEaFg=CGLRJomyumsZzcyn8O0JE1+De2Vd3a5remcH6w@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] mm/sparse-vmemmap: improve memory savings for
 compound devmaps
To:     Joao Martins <joao.m.martins@oracle.com>
Cc:     Linux Memory Management List <linux-mm@kvack.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>, Jane Chu <jane.chu@oracle.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Christoph Hellwig <hch@lst.de>, nvdimm@lists.linux.dev,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Feb 11, 2022 at 3:34 AM Joao Martins <joao.m.martins@oracle.com> wrote:
[...]
>  pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, int node,
> -                                      struct vmem_altmap *altmap)
> +                                      struct vmem_altmap *altmap,
> +                                      struct page *block)

Why not use the name of "reuse" instead of "block"?
Seems like "reuse" is more clear.

>  {
>         pte_t *pte = pte_offset_kernel(pmd, addr);
>         if (pte_none(*pte)) {
>                 pte_t entry;
>                 void *p;
>
> -               p = vmemmap_alloc_block_buf(PAGE_SIZE, node, altmap);
> -               if (!p)
> -                       return NULL;
> +               if (!block) {
> +                       p = vmemmap_alloc_block_buf(PAGE_SIZE, node, altmap);
> +                       if (!p)
> +                               return NULL;
> +               } else {
> +                       /*
> +                        * When a PTE/PMD entry is freed from the init_mm
> +                        * there's a a free_pages() call to this page allocated
> +                        * above. Thus this get_page() is paired with the
> +                        * put_page_testzero() on the freeing path.
> +                        * This can only called by certain ZONE_DEVICE path,
> +                        * and through vmemmap_populate_compound_pages() when
> +                        * slab is available.
> +                        */
> +                       get_page(block);
> +                       p = page_to_virt(block);
> +               }
>                 entry = pfn_pte(__pa(p) >> PAGE_SHIFT, PAGE_KERNEL);
>                 set_pte_at(&init_mm, addr, pte, entry);
>         }
> @@ -609,7 +624,8 @@ pgd_t * __meminit vmemmap_pgd_populate(unsigned long addr, int node)
>  }
>
>  static int __meminit vmemmap_populate_address(unsigned long addr, int node,
> -                                             struct vmem_altmap *altmap)
> +                                             struct vmem_altmap *altmap,
> +                                             struct page *reuse, struct page **page)

We can remove the last argument (struct page **page) if we change
the return type to "pte_t *".  More simple, don't you think?

>  {
>         pgd_t *pgd;
>         p4d_t *p4d;
> @@ -629,11 +645,13 @@ static int __meminit vmemmap_populate_address(unsigned long addr, int node,
>         pmd = vmemmap_pmd_populate(pud, addr, node);
>         if (!pmd)
>                 return -ENOMEM;
> -       pte = vmemmap_pte_populate(pmd, addr, node, altmap);
> +       pte = vmemmap_pte_populate(pmd, addr, node, altmap, reuse);
>         if (!pte)
>                 return -ENOMEM;
>         vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
>
> +       if (page)
> +               *page = pte_page(*pte);
>         return 0;
>  }
>
> @@ -644,10 +662,120 @@ int __meminit vmemmap_populate_basepages(unsigned long start, unsigned long end,
>         int rc;
>
>         for (; addr < end; addr += PAGE_SIZE) {
> -               rc = vmemmap_populate_address(addr, node, altmap);
> +               rc = vmemmap_populate_address(addr, node, altmap, NULL, NULL);
>                 if (rc)
>                         return rc;
> +       }
> +
> +       return 0;
> +}
> +
> +static int __meminit vmemmap_populate_range(unsigned long start,
> +                                           unsigned long end,
> +                                           int node, struct page *page)
> +{
> +       unsigned long addr = start;
> +       int rc;
>
> +       for (; addr < end; addr += PAGE_SIZE) {
> +               rc = vmemmap_populate_address(addr, node, NULL, page, NULL);
> +               if (rc)
> +                       return rc;
> +       }
> +
> +       return 0;
> +}
> +
> +static inline int __meminit vmemmap_populate_page(unsigned long addr, int node,
> +                                                 struct page **page)
> +{
> +       return vmemmap_populate_address(addr, node, NULL, NULL, page);
> +}
> +
> +/*
> + * For compound pages bigger than section size (e.g. x86 1G compound
> + * pages with 2M subsection size) fill the rest of sections as tail
> + * pages.
> + *
> + * Note that memremap_pages() resets @nr_range value and will increment
> + * it after each range successful onlining. Thus the value or @nr_range
> + * at section memmap populate corresponds to the in-progress range
> + * being onlined here.
> + */
> +static bool __meminit reuse_compound_section(unsigned long start_pfn,
> +                                            struct dev_pagemap *pgmap)
> +{
> +       unsigned long nr_pages = pgmap_vmemmap_nr(pgmap);
> +       unsigned long offset = start_pfn -
> +               PHYS_PFN(pgmap->ranges[pgmap->nr_range].start);
> +
> +       return !IS_ALIGNED(offset, nr_pages) && nr_pages > PAGES_PER_SUBSECTION;
> +}
> +
> +static struct page * __meminit compound_section_tail_page(unsigned long addr)
> +{
> +       pte_t *ptep;
> +
> +       addr -= PAGE_SIZE;
> +
> +       /*
> +        * Assuming sections are populated sequentially, the previous section's
> +        * page data can be reused.
> +        */
> +       ptep = pte_offset_kernel(pmd_off_k(addr), addr);
> +       if (!ptep)
> +               return NULL;
> +
> +       return pte_page(*ptep);
> +}
> +
> +static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
> +                                                    unsigned long start,
> +                                                    unsigned long end, int node,
> +                                                    struct dev_pagemap *pgmap)
> +{
> +       unsigned long size, addr;
> +
> +       if (reuse_compound_section(start_pfn, pgmap)) {
> +               struct page *page;
> +
> +               page = compound_section_tail_page(start);
> +               if (!page)
> +                       return -ENOMEM;
> +
> +               /*
> +                * Reuse the page that was populated in the prior iteration
> +                * with just tail struct pages.
> +                */
> +               return vmemmap_populate_range(start, end, node, page);
> +       }
> +
> +       size = min(end - start, pgmap_vmemmap_nr(pgmap) * sizeof(struct page));
> +       for (addr = start; addr < end; addr += size) {
> +               unsigned long next = addr, last = addr + size;
> +               struct page *block;
> +               int rc;
> +
> +               /* Populate the head page vmemmap page */
> +               rc = vmemmap_populate_page(addr, node, NULL);
> +               if (rc)
> +                       return rc;
> +
> +               /* Populate the tail pages vmemmap page */
> +               block = NULL;
> +               next = addr + PAGE_SIZE;
> +               rc = vmemmap_populate_page(next, node, &block);
> +               if (rc)
> +                       return rc;
> +
> +               /*
> +                * Reuse the previous page for the rest of tail pages
> +                * See layout diagram in Documentation/vm/vmemmap_dedup.rst
> +                */
> +               next += PAGE_SIZE;
> +               rc = vmemmap_populate_range(next, last, node, block);
> +               if (rc)
> +                       return rc;
>         }
>
>         return 0;
> @@ -659,12 +787,18 @@ struct page * __meminit __populate_section_memmap(unsigned long pfn,
>  {
>         unsigned long start = (unsigned long) pfn_to_page(pfn);
>         unsigned long end = start + nr_pages * sizeof(struct page);
> +       int r;
>
>         if (WARN_ON_ONCE(!IS_ALIGNED(pfn, PAGES_PER_SUBSECTION) ||
>                 !IS_ALIGNED(nr_pages, PAGES_PER_SUBSECTION)))
>                 return NULL;
>
> -       if (vmemmap_populate(start, end, nid, altmap))
> +       if (pgmap && pgmap_vmemmap_nr(pgmap) > 1 && !altmap)

Should we add a judgment like "is_power_of_2(sizeof(struct page))" since
this optimization is only applied when the size of the struct page does not
cross page boundaries?

Thanks.
