Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48C943A11F6
	for <lists+linux-doc@lfdr.de>; Wed,  9 Jun 2021 12:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238084AbhFILAO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 9 Jun 2021 07:00:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33074 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238657AbhFILAN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Jun 2021 07:00:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623236298;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2Gdg9+tpOx626Ezvggt1xE7D6QrGInTamndBpZke/4o=;
        b=Vy6d+dzr6z0zNwc9jeqg1w7YStI8+CWbJRUzdbDBUaW4znp+uT2T1TaAT7DBOAZxJaoSwu
        CIxL+8UZcmNhUVTuFiCOJbKRtJtF6plrkX4sttHwoD/9w1DrVfDL0SHAiGJUfzV/QpK+ug
        wdNPAG+eIeDyVamrOtLFBucXviWSucA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-QgZlKwyENNKR-F3QnT8plA-1; Wed, 09 Jun 2021 06:58:14 -0400
X-MC-Unique: QgZlKwyENNKR-F3QnT8plA-1
Received: by mail-wr1-f71.google.com with SMTP id m27-20020a056000025bb0290114d19822edso10605427wrz.21
        for <linux-doc@vger.kernel.org>; Wed, 09 Jun 2021 03:58:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=2Gdg9+tpOx626Ezvggt1xE7D6QrGInTamndBpZke/4o=;
        b=X4Ezm/Yq6KdaQrRQ9InL7ilz2yksQGVuUkkfI4vFZ6nx5Mc5bMeLPU85Bdjv/oOY4j
         LXw+Yo5UicprQroPkzTi1WfZfbiWOuoByoZPHBmJyt1Busj5QHRSEFr4WzVyYfXf+sAU
         gs0VVfrAn9INnM7Y5jzVeLaBWgNHFHbOEugvQGq9bDcs1XHmk+95kuAO750VIe0IeGJk
         2r7geYpvNzF9pVOwNiv/74le4SCugJiNWSP9xt2V2+sGO4MeCJEaFxdZYI4TYkM21sOz
         qXpWukkiACzchwM53Fz5xn9lnOhuYMcJyxkAcanp4YvhkfBQHO/FpBiLpBTdbK+9216I
         uDJQ==
X-Gm-Message-State: AOAM5321jJNcbuwHPRLFgUwvDBIjRsfO93gClmS+WzQDx3IwDJlhtjHx
        ezI046EbfsNvma6F8btoT1fyAiPjQ+dizlXsnK4e4xYqhY+dmZfKmC3r3Hxo/rohDpt9PzvFn9Y
        EdPTJtq19Wo8D7I7qX6Jd
X-Received: by 2002:a5d:6b81:: with SMTP id n1mr27256953wrx.144.1623236292819;
        Wed, 09 Jun 2021 03:58:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxANfssiXPPwd5jXqSLFwZZmn/VQ6v6aq6x8NxYxZ6oulxycL5+UbfQGME/wwP7BrwnDfbhqg==
X-Received: by 2002:a5d:6b81:: with SMTP id n1mr27256934wrx.144.1623236292583;
        Wed, 09 Jun 2021 03:58:12 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c611d.dip0.t-ipconnect.de. [91.12.97.29])
        by smtp.gmail.com with ESMTPSA id o3sm24218939wrm.78.2021.06.09.03.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jun 2021 03:58:12 -0700 (PDT)
Subject: Re: [PATCH 9/9] mm: replace CONFIG_FLAT_NODE_MEM_MAP with
 CONFIG_FLATMEM
To:     Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Jonathan Corbet <corbet@lwn.net>,
        Matt Turner <mattst88@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Richard Henderson <rth@twiddle.net>,
        Vineet Gupta <vgupta@synopsys.com>, kexec@lists.infradead.org,
        linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
References: <20210602105348.13387-1-rppt@kernel.org>
 <20210602105348.13387-10-rppt@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <5dc2c695-06c9-671f-a77d-24db56485041@redhat.com>
Date:   Wed, 9 Jun 2021 12:58:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602105348.13387-10-rppt@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 02.06.21 12:53, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> After removal of the DISCONTIGMEM memory model the FLAT_NODE_MEM_MAP
> configuration option is equivalent to FLATMEM.
> 
> Drop CONFIG_FLAT_NODE_MEM_MAP and use CONFIG_FLATMEM instead.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>   include/linux/mmzone.h | 4 ++--
>   kernel/crash_core.c    | 2 +-
>   mm/Kconfig             | 4 ----
>   mm/page_alloc.c        | 6 +++---
>   mm/page_ext.c          | 2 +-
>   5 files changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index ad42f440c704..2698cdbfbf75 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -775,7 +775,7 @@ typedef struct pglist_data {
>   	struct zonelist node_zonelists[MAX_ZONELISTS];
>   
>   	int nr_zones; /* number of populated zones in this node */
> -#ifdef CONFIG_FLAT_NODE_MEM_MAP	/* means !SPARSEMEM */
> +#ifdef CONFIG_FLATMEM	/* means !SPARSEMEM */
>   	struct page *node_mem_map;
>   #ifdef CONFIG_PAGE_EXTENSION
>   	struct page_ext *node_page_ext;
> @@ -865,7 +865,7 @@ typedef struct pglist_data {
>   
>   #define node_present_pages(nid)	(NODE_DATA(nid)->node_present_pages)
>   #define node_spanned_pages(nid)	(NODE_DATA(nid)->node_spanned_pages)
> -#ifdef CONFIG_FLAT_NODE_MEM_MAP
> +#ifdef CONFIG_FLATMEM
>   #define pgdat_page_nr(pgdat, pagenr)	((pgdat)->node_mem_map + (pagenr))
>   #else
>   #define pgdat_page_nr(pgdat, pagenr)	pfn_to_page((pgdat)->node_start_pfn + (pagenr))
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index 53eb8bc6026d..2b8446ea7105 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -483,7 +483,7 @@ static int __init crash_save_vmcoreinfo_init(void)
>   	VMCOREINFO_OFFSET(page, compound_head);
>   	VMCOREINFO_OFFSET(pglist_data, node_zones);
>   	VMCOREINFO_OFFSET(pglist_data, nr_zones);
> -#ifdef CONFIG_FLAT_NODE_MEM_MAP
> +#ifdef CONFIG_FLATMEM
>   	VMCOREINFO_OFFSET(pglist_data, node_mem_map);
>   #endif
>   	VMCOREINFO_OFFSET(pglist_data, node_start_pfn);
> diff --git a/mm/Kconfig b/mm/Kconfig
> index bffe4bd859f3..ded98fb859ab 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -55,10 +55,6 @@ config FLATMEM
>   	def_bool y
>   	depends on !SPARSEMEM || FLATMEM_MANUAL
>   
> -config FLAT_NODE_MEM_MAP
> -	def_bool y
> -	depends on !SPARSEMEM
> -
>   #
>   # SPARSEMEM_EXTREME (which is the default) does some bootmem
>   # allocations when sparse_init() is called.  If this cannot
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 8f08135d3eb4..f039736541eb 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -6444,7 +6444,7 @@ static void __meminit zone_init_free_lists(struct zone *zone)
>   	}
>   }
>   
> -#if !defined(CONFIG_FLAT_NODE_MEM_MAP)
> +#if !defined(CONFIG_FLATMEM)
>   /*
>    * Only struct pages that correspond to ranges defined by memblock.memory
>    * are zeroed and initialized by going through __init_single_page() during
> @@ -7241,7 +7241,7 @@ static void __init free_area_init_core(struct pglist_data *pgdat)
>   	}
>   }
>   
> -#ifdef CONFIG_FLAT_NODE_MEM_MAP
> +#ifdef CONFIG_FLATMEM
>   static void __ref alloc_node_mem_map(struct pglist_data *pgdat)
>   {
>   	unsigned long __maybe_unused start = 0;
> @@ -7289,7 +7289,7 @@ static void __ref alloc_node_mem_map(struct pglist_data *pgdat)
>   }
>   #else
>   static void __ref alloc_node_mem_map(struct pglist_data *pgdat) { }
> -#endif /* CONFIG_FLAT_NODE_MEM_MAP */
> +#endif /* CONFIG_FLATMEM */
>   
>   #ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT
>   static inline void pgdat_set_deferred_range(pg_data_t *pgdat)
> diff --git a/mm/page_ext.c b/mm/page_ext.c
> index df6f74aac8e1..293b2685fc48 100644
> --- a/mm/page_ext.c
> +++ b/mm/page_ext.c
> @@ -191,7 +191,7 @@ void __init page_ext_init_flatmem(void)
>   	panic("Out of memory");
>   }
>   
> -#else /* CONFIG_FLAT_NODE_MEM_MAP */
> +#else /* CONFIG_FLATMEM */
>   
>   struct page_ext *lookup_page_ext(const struct page *page)
>   {
> 

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

