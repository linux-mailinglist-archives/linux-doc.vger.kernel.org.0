Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84C3B6BA255
	for <lists+linux-doc@lfdr.de>; Tue, 14 Mar 2023 23:19:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231513AbjCNWT3 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 14 Mar 2023 18:19:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231231AbjCNWS6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Mar 2023 18:18:58 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E568719C5A;
        Tue, 14 Mar 2023 15:17:57 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id y14so3036800wrq.4;
        Tue, 14 Mar 2023 15:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678832218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e6bXW/eRWJyVm/71lSKXI2UYtIp2/zZYIhbN0GDUI3M=;
        b=h55DAKjak7ZuiPBshSeeD5tdezDwlx09RM9bln7gjyH3DFgCKdu1LYrejdGBYIzaHl
         LbDvbNoE12/2WPSrCGRhh3+Pc1TW877kl4Pn+/Xb65iI8PQjaimdN4tGoiFUXUcOMvfi
         8fw8NjlFlxUpSt8r9QkGUJdzBns9tw2HT0JmrvZvRPz7MLrzRBo7ojRf1joESsmHOm8b
         tYIDicxFW7UAQRAEOeJegDeqwVVWy0KtNQq4ChfFvAzr/VFbhdPcTdKiQVvo+kP7qhph
         wk4O6F0TtZ7u8x6QmwVZN6fsvQ6U8tG7R5WmrYdNqQVkgt5gU6PY2/4o7FQSG3R8n5kU
         bDaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678832218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6bXW/eRWJyVm/71lSKXI2UYtIp2/zZYIhbN0GDUI3M=;
        b=T5o9e6BfRCiCEsu5y51A9dvRqXr4UYDgw63R++57rH5v0FiHck+CxVXPZinvpHN2Bf
         C3/LQeufXxOpmmZG5hvqHtXA52bDOfTdmGWsaarMYW8ivtB6whBfjDEqlv51u7ltsxc6
         368jO/govYtGCKgIvRtQr8CXSS4HVtvtlBdr/tM9Y0cyerYAR7gXpzN8s+ZHX30Otvaw
         pPSBMo1p55IYECWV+ghjQ5AHB0g85Lrg+K3IyaFihneIuokrQopvCQNSuuiad3tyYCTx
         0eCyx88OLrwWYBL2c+gPjO7TNxO3sDGzqb0IiuNmp54Zfvu4NJlXVBBEdYJAY4mnsoVW
         A1EQ==
X-Gm-Message-State: AO0yUKWN5L5o+2n61gE4wITnpgnH2RgF+Q23HBJgEpqkGOZjtxQkwatA
        OkzinYCELCtwyGDUz5JAxWU=
X-Google-Smtp-Source: AK7set9PGt/SMqADoRlHQTGi2fsfva8y4Tl1zH55zClwQ+TAGOxiU7EojFkfwJdDQy8tizNySXC0wg==
X-Received: by 2002:a5d:44cb:0:b0:2cf:f3ea:533e with SMTP id z11-20020a5d44cb000000b002cff3ea533emr19230wrr.63.1678832218257;
        Tue, 14 Mar 2023 15:16:58 -0700 (PDT)
Received: from localhost (host86-146-209-214.range86-146.btcentralplus.com. [86.146.209.214])
        by smtp.gmail.com with ESMTPSA id o3-20020a056000010300b002ceac2ccc4asm3131660wrx.23.2023.03.14.15.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 15:16:57 -0700 (PDT)
Date:   Tue, 14 Mar 2023 22:16:56 +0000
From:   Lorenzo Stoakes <lstoakes@gmail.com>
To:     Hyeonggon Yoo <42.hyeyoo@gmail.com>
Cc:     Vlastimil Babka <vbabka@suse.cz>, Christoph Lameter <cl@linux.com>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Pekka Enberg <penberg@kernel.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        rcu@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        netdev@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 5/7] mm/slab: remove CONFIG_SLOB code from slab common
 code
Message-ID: <82fa39bb-3fa5-4bb8-a26f-1ca2caf1dc1b@lucifer.local>
References: <20230310103210.22372-1-vbabka@suse.cz>
 <20230310103210.22372-6-vbabka@suse.cz>
 <ZBA+QFCNEbW8Mjyz@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBA+QFCNEbW8Mjyz@localhost>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 14, 2023 at 09:28:32AM +0000, Hyeonggon Yoo wrote:
> On Fri, Mar 10, 2023 at 11:32:07AM +0100, Vlastimil Babka wrote:
> > CONFIG_SLOB has been removed from Kconfig. Remove code and #ifdef's
> > specific to SLOB in the slab headers and common code.
> >
> > Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> > ---
> >  include/linux/slab.h | 39 ----------------------------
> >  mm/slab.h            | 61 --------------------------------------------
> >  mm/slab_common.c     |  2 --
> >  3 files changed, 102 deletions(-)
> >
> > diff --git a/include/linux/slab.h b/include/linux/slab.h
> > index 45af70315a94..7f645a4c1298 100644
> > --- a/include/linux/slab.h
> > +++ b/include/linux/slab.h
> > @@ -298,19 +298,6 @@ static inline unsigned int arch_slab_minalign(void)
> >  #endif
> >  #endif
> >
> > -#ifdef CONFIG_SLOB
> > -/*
> > - * SLOB passes all requests larger than one page to the page allocator.
> > - * No kmalloc array is necessary since objects of different sizes can
> > - * be allocated from the same page.
> > - */
> > -#define KMALLOC_SHIFT_HIGH	PAGE_SHIFT
> > -#define KMALLOC_SHIFT_MAX	(MAX_ORDER + PAGE_SHIFT - 1)
> > -#ifndef KMALLOC_SHIFT_LOW
> > -#define KMALLOC_SHIFT_LOW	3
> > -#endif
> > -#endif
> > -
> >  /* Maximum allocatable size */
> >  #define KMALLOC_MAX_SIZE	(1UL << KMALLOC_SHIFT_MAX)
> >  /* Maximum size for which we actually use a slab cache */
> > @@ -366,7 +353,6 @@ enum kmalloc_cache_type {
> >  	NR_KMALLOC_TYPES
> >  };
> >
> > -#ifndef CONFIG_SLOB
> >  extern struct kmem_cache *
> >  kmalloc_caches[NR_KMALLOC_TYPES][KMALLOC_SHIFT_HIGH + 1];
> >
> > @@ -458,7 +444,6 @@ static __always_inline unsigned int __kmalloc_index(size_t size,
> >  }
> >  static_assert(PAGE_SHIFT <= 20);
> >  #define kmalloc_index(s) __kmalloc_index(s, true)
> > -#endif /* !CONFIG_SLOB */
> >
> >  void *__kmalloc(size_t size, gfp_t flags) __assume_kmalloc_alignment __alloc_size(1);
> >
> > @@ -487,10 +472,6 @@ void kmem_cache_free(struct kmem_cache *s, void *objp);
> >  void kmem_cache_free_bulk(struct kmem_cache *s, size_t size, void **p);
> >  int kmem_cache_alloc_bulk(struct kmem_cache *s, gfp_t flags, size_t size, void **p);
> >
> > -/*
> > - * Caller must not use kfree_bulk() on memory not originally allocated
> > - * by kmalloc(), because the SLOB allocator cannot handle this.
> > - */
> >  static __always_inline void kfree_bulk(size_t size, void **p)
> >  {
> >  	kmem_cache_free_bulk(NULL, size, p);
> > @@ -567,7 +548,6 @@ void *kmalloc_large_node(size_t size, gfp_t flags, int node) __assume_page_align
> >   *	Try really hard to succeed the allocation but fail
> >   *	eventually.
> >   */
> > -#ifndef CONFIG_SLOB
> >  static __always_inline __alloc_size(1) void *kmalloc(size_t size, gfp_t flags)
> >  {
> >  	if (__builtin_constant_p(size) && size) {
> > @@ -583,17 +563,7 @@ static __always_inline __alloc_size(1) void *kmalloc(size_t size, gfp_t flags)
> >  	}
> >  	return __kmalloc(size, flags);
> >  }
> > -#else
> > -static __always_inline __alloc_size(1) void *kmalloc(size_t size, gfp_t flags)
> > -{
> > -	if (__builtin_constant_p(size) && size > KMALLOC_MAX_CACHE_SIZE)
> > -		return kmalloc_large(size, flags);
> > -
> > -	return __kmalloc(size, flags);
> > -}
> > -#endif
> >
> > -#ifndef CONFIG_SLOB
> >  static __always_inline __alloc_size(1) void *kmalloc_node(size_t size, gfp_t flags, int node)
> >  {
> >  	if (__builtin_constant_p(size) && size) {
> > @@ -609,15 +579,6 @@ static __always_inline __alloc_size(1) void *kmalloc_node(size_t size, gfp_t fla
> >  	}
> >  	return __kmalloc_node(size, flags, node);
> >  }
> > -#else
> > -static __always_inline __alloc_size(1) void *kmalloc_node(size_t size, gfp_t flags, int node)
> > -{
> > -	if (__builtin_constant_p(size) && size > KMALLOC_MAX_CACHE_SIZE)
> > -		return kmalloc_large_node(size, flags, node);
> > -
> > -	return __kmalloc_node(size, flags, node);
> > -}
> > -#endif
> >
> >  /**
> >   * kmalloc_array - allocate memory for an array.
> > diff --git a/mm/slab.h b/mm/slab.h
> > index 43966aa5fadf..399966b3ce52 100644
> > --- a/mm/slab.h
> > +++ b/mm/slab.h
> > @@ -51,14 +51,6 @@ struct slab {
> >  	};
> >  	unsigned int __unused;
> >
> > -#elif defined(CONFIG_SLOB)
> > -
> > -	struct list_head slab_list;
> > -	void *__unused_1;
> > -	void *freelist;		/* first free block */
> > -	long units;
> > -	unsigned int __unused_2;
> > -
> >  #else
> >  #error "Unexpected slab allocator configured"
> >  #endif
> > @@ -72,11 +64,7 @@ struct slab {
> >  #define SLAB_MATCH(pg, sl)						\
> >  	static_assert(offsetof(struct page, pg) == offsetof(struct slab, sl))
> >  SLAB_MATCH(flags, __page_flags);
> > -#ifndef CONFIG_SLOB
> >  SLAB_MATCH(compound_head, slab_cache);	/* Ensure bit 0 is clear */
> > -#else
> > -SLAB_MATCH(compound_head, slab_list);	/* Ensure bit 0 is clear */
> > -#endif
> >  SLAB_MATCH(_refcount, __page_refcount);
> >  #ifdef CONFIG_MEMCG
> >  SLAB_MATCH(memcg_data, memcg_data);
> > @@ -200,31 +188,6 @@ static inline size_t slab_size(const struct slab *slab)
> >  	return PAGE_SIZE << slab_order(slab);
> >  }
> >
> > -#ifdef CONFIG_SLOB
> > -/*
> > - * Common fields provided in kmem_cache by all slab allocators
> > - * This struct is either used directly by the allocator (SLOB)
> > - * or the allocator must include definitions for all fields
> > - * provided in kmem_cache_common in their definition of kmem_cache.
> > - *
> > - * Once we can do anonymous structs (C11 standard) we could put a
> > - * anonymous struct definition in these allocators so that the
> > - * separate allocations in the kmem_cache structure of SLAB and
> > - * SLUB is no longer needed.
> > - */
> > -struct kmem_cache {
> > -	unsigned int object_size;/* The original size of the object */
> > -	unsigned int size;	/* The aligned/padded/added on size  */
> > -	unsigned int align;	/* Alignment as calculated */
> > -	slab_flags_t flags;	/* Active flags on the slab */
> > -	const char *name;	/* Slab name for sysfs */
> > -	int refcount;		/* Use counter */
> > -	void (*ctor)(void *);	/* Called on object slot creation */
> > -	struct list_head list;	/* List of all slab caches on the system */
> > -};
> > -
> > -#endif /* CONFIG_SLOB */
> > -
> >  #ifdef CONFIG_SLAB
> >  #include <linux/slab_def.h>
> >  #endif
> > @@ -274,7 +237,6 @@ extern const struct kmalloc_info_struct {
> >  	unsigned int size;
> >  } kmalloc_info[];
> >
> > -#ifndef CONFIG_SLOB
> >  /* Kmalloc array related functions */
> >  void setup_kmalloc_cache_index_table(void);
> >  void create_kmalloc_caches(slab_flags_t);
> > @@ -286,7 +248,6 @@ void *__kmem_cache_alloc_node(struct kmem_cache *s, gfp_t gfpflags,
> >  			      int node, size_t orig_size,
> >  			      unsigned long caller);
> >  void __kmem_cache_free(struct kmem_cache *s, void *x, unsigned long caller);
> > -#endif
> >
> >  gfp_t kmalloc_fix_flags(gfp_t flags);
> >
> > @@ -303,33 +264,16 @@ extern void create_boot_cache(struct kmem_cache *, const char *name,
> >  int slab_unmergeable(struct kmem_cache *s);
> >  struct kmem_cache *find_mergeable(unsigned size, unsigned align,
> >  		slab_flags_t flags, const char *name, void (*ctor)(void *));
> > -#ifndef CONFIG_SLOB
> >  struct kmem_cache *
> >  __kmem_cache_alias(const char *name, unsigned int size, unsigned int align,
> >  		   slab_flags_t flags, void (*ctor)(void *));
> >
> >  slab_flags_t kmem_cache_flags(unsigned int object_size,
> >  	slab_flags_t flags, const char *name);
> > -#else
> > -static inline struct kmem_cache *
> > -__kmem_cache_alias(const char *name, unsigned int size, unsigned int align,
> > -		   slab_flags_t flags, void (*ctor)(void *))
> > -{ return NULL; }
> > -
> > -static inline slab_flags_t kmem_cache_flags(unsigned int object_size,
> > -	slab_flags_t flags, const char *name)
> > -{
> > -	return flags;
> > -}
> > -#endif
> >
> >  static inline bool is_kmalloc_cache(struct kmem_cache *s)
> >  {
> > -#ifndef CONFIG_SLOB
> >  	return (s->flags & SLAB_KMALLOC);
> > -#else
> > -	return false;
> > -#endif
> >  }
> >
> >  /* Legal flag mask for kmem_cache_create(), for various configurations */
> > @@ -634,7 +578,6 @@ static inline void memcg_slab_free_hook(struct kmem_cache *s, struct slab *slab,
> >  }
> >  #endif /* CONFIG_MEMCG_KMEM */
> >
> > -#ifndef CONFIG_SLOB
> >  static inline struct kmem_cache *virt_to_cache(const void *obj)
> >  {
> >  	struct slab *slab;
> > @@ -684,8 +627,6 @@ static inline struct kmem_cache *cache_from_obj(struct kmem_cache *s, void *x)
> >
> >  void free_large_kmalloc(struct folio *folio, void *object);
> >
> > -#endif /* CONFIG_SLOB */
> > -
> >  size_t __ksize(const void *objp);
> >
> >  static inline size_t slab_ksize(const struct kmem_cache *s)
> > @@ -777,7 +718,6 @@ static inline void slab_post_alloc_hook(struct kmem_cache *s,
> >  	memcg_slab_post_alloc_hook(s, objcg, flags, size, p);
> >  }
> >
> > -#ifndef CONFIG_SLOB
> >  /*
> >   * The slab lists for all objects.
> >   */
> > @@ -824,7 +764,6 @@ static inline struct kmem_cache_node *get_node(struct kmem_cache *s, int node)
> >  	for (__node = 0; __node < nr_node_ids; __node++) \
> >  		 if ((__n = get_node(__s, __node)))
> >
> > -#endif
> >
> >  #if defined(CONFIG_SLAB) || defined(CONFIG_SLUB_DEBUG)
> >  void dump_unreclaimable_slab(void);
> > diff --git a/mm/slab_common.c b/mm/slab_common.c
> > index bf4e777cfe90..1522693295f5 100644
> > --- a/mm/slab_common.c
> > +++ b/mm/slab_common.c
> > @@ -625,7 +625,6 @@ void kmem_dump_obj(void *object)
> >  EXPORT_SYMBOL_GPL(kmem_dump_obj);
> >  #endif
> >
> > -#ifndef CONFIG_SLOB
> >  /* Create a cache during boot when no slab services are available yet */
> >  void __init create_boot_cache(struct kmem_cache *s, const char *name,
> >  		unsigned int size, slab_flags_t flags,
> > @@ -1079,7 +1078,6 @@ void *kmalloc_node_trace(struct kmem_cache *s, gfp_t gfpflags,
> >  	return ret;
> >  }
> >  EXPORT_SYMBOL(kmalloc_node_trace);
> > -#endif /* !CONFIG_SLOB */
> >
> >  gfp_t kmalloc_fix_flags(gfp_t flags)
> >  {
>
> Looks good to me,
>
> Reviewed-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>
>
> > --
> > 2.39.2
> >

Looks good to me too,

Acked-by: Lorenzo Stoakes <lstoakes@gmail.com>
