Return-Path: <linux-doc+bounces-665-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E37C7CFF3D
	for <lists+linux-doc@lfdr.de>; Thu, 19 Oct 2023 18:15:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B2581C20925
	for <lists+linux-doc@lfdr.de>; Thu, 19 Oct 2023 16:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12103315AE;
	Thu, 19 Oct 2023 16:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RM/NO2tN"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F39D314
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 16:15:23 +0000 (UTC)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1F0A115
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 09:15:20 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-53e3e7e478bso10897189a12.0
        for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 09:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697732119; x=1698336919; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G/b8NX3LZ08KUi8N/JxWRGCAHy00FjZwd+7ev/CK28g=;
        b=RM/NO2tNF1ngM2+D1mIzwhNmvRS/dHjJK771zbHrAETLv4HSPGjWq4prspNNhx7ZTQ
         S3/OGJ1XMuOIok0IWhkuz5g56vpXt4xKllBt1J8WFjfvQ9JP+Ypr5zHtOKcdM1nf/wBk
         Mbft9NK40VRysaxKT7l3VFtN92dTRuQ3oCCY32LFdE9E0Hfj/BbPmVUKZD3RNTNnCZmR
         8fC/D5A4dk6PjJvF0sayh9rYFJI6jA2L7/kl+08BsLwyF0AYNk9nFoIHj0TDGKW7DgTr
         ieW7jo1Xqi409d0H1a2F3FdtMIWpfrkmgdhTi7JauEjt3Lp3s+UltR8xGtodqZSZylVr
         GX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697732119; x=1698336919;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G/b8NX3LZ08KUi8N/JxWRGCAHy00FjZwd+7ev/CK28g=;
        b=H7SDZ+5kIPw+GD9StZ4jIfmFYqoBQbmzteSbIBIMl0h2KiCK4ihfZAmS9ZUGPXRPA3
         bZSX7d+rTBNybtQKyqGTdZqECR0Tvf4ceUOoPXfGx2CDaB08nYBTL5EseOlok+ieCJC2
         igjwkCCgg9O+66xHu9+MdGXu5HIeGP5hULsyVYI+O6kKLdFWr6g6hiQrGGVg38FzL1B7
         3evlMdf6j3hGi+qgPA0l/lPM3OFs7BHIc2YZZLoQ2oa6Ln3egvZLVWbo6oCZ+XkhgiNG
         LPq0Vmu/ZqSGx3flbY6i4kd8U6C6LbSOOdbq8DuSnBu7PUwclSIot8215s0azZqg9mNP
         i3qA==
X-Gm-Message-State: AOJu0YyhXz3m522DzDtgACfx6IOAwtfpuB7B29KHSIt3CXIJ0Y+3cxK7
	u0Ibbi/tc/x422VJnhAHqUmetLR7D+Hh3j5JyObKnw==
X-Google-Smtp-Source: AGHT+IGM/W6bf/hMyIriY2xknmWe5iIB3++CkEDtWjC/jru0q+VNenklttfEFNoHJ1TdlZh7iRIEkccf4iCsLE7MEm8=
X-Received: by 2002:a17:907:3e20:b0:9ae:594d:d3fc with SMTP id
 hp32-20020a1709073e2000b009ae594dd3fcmr2175026ejc.17.1697732119001; Thu, 19
 Oct 2023 09:15:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231017232152.2605440-1-nphamcs@gmail.com> <20231017232152.2605440-3-nphamcs@gmail.com>
 <CAJD7tka2aVKBJj6cYutcVzOGzj_6gop6-ytSmWWML=sEe9qHbA@mail.gmail.com> <CA+CLi1jiyY3oueWrLtd5JOrtP-aYQ90sPgSCBoWtB2jVL_-FxA@mail.gmail.com>
In-Reply-To: <CA+CLi1jiyY3oueWrLtd5JOrtP-aYQ90sPgSCBoWtB2jVL_-FxA@mail.gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Thu, 19 Oct 2023 09:14:40 -0700
Message-ID: <CAJD7tka_gvNPgu4gim9-dqx0Wf-zdGj+==nwx2yrmOuZoe=oyw@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] zswap: make shrinking memcg-aware
To: Domenico Cerasuolo <cerasuolodomenico@gmail.com>
Cc: Nhat Pham <nphamcs@gmail.com>, akpm@linux-foundation.org, hannes@cmpxchg.org, 
	sjenning@redhat.com, ddstreet@ieee.org, vitaly.wool@konsulko.com, 
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeelb@google.com, 
	muchun.song@linux.dev, linux-mm@kvack.org, kernel-team@meta.com, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"

[..]
> > >
> > > +/*********************************
> > > +* lru functions
> > > +**********************************/
> > > +static bool zswap_lru_add(struct list_lru *list_lru, struct zswap_entry *entry)
> > > +{
> > > +       struct mem_cgroup *memcg = get_mem_cgroup_from_entry(entry);
> >
> > Could we avoid the need for get/put with an rcu_read_lock() instead?
>
> I think we can, I'm not entirely sure of the consequences though. By the
> look of it I'd say it's safe but I wouldn't trust my judgement on this.

It just seems like we have a pattern of short-lived get/put. If RCU
gives enough protection it should be simpler. IIUC taking a reference
does not protect against offlining or reparenting, so I am not sure if
taking a reference here would provide any more protection than

>
> >
[..]
> > > @@ -686,7 +716,36 @@ static int zswap_reclaim_entry(struct zswap_pool *pool)
> > >         zswap_entry_put(tree, entry);
> > >  unlock:
> > >         spin_unlock(&tree->lock);
> > > -       return ret ? -EAGAIN : 0;
> > > +       spin_lock(lock);
> > > +       return ret;
> > > +}
> > > +
> > > +static int shrink_memcg(struct mem_cgroup *memcg)
> > > +{
> > > +       struct zswap_pool *pool;
> > > +       int nid, shrunk = 0;
> > > +
> > > +       pool = zswap_pool_current_get();
> > > +       if (!pool)
> > > +               return -EINVAL;
> > > +
> > > +       /*
> > > +        * Skip zombies because their LRUs are reparented and we would be
> > > +        * reclaiming from the parent instead of the dead memcgroup.
> >
> > nit: s/memcgroup/memcg.
> >
> > > +        */
> > > +       if (memcg && !mem_cgroup_online(memcg))
> > > +               goto out;
> >
> > If we move this above zswap_pool_current_get(), we can return directly
> > and remove the label. I noticed we will return -EAGAIN if memcg is
> > offline. IIUC -EAGAIN for the caller will move on to the next memcg,
> > but I am wondering if a different errno would be clearer here.
>
> True, I remember spending some time staring at error codes but couldn't find a
> better one. What if we use -EINVAL for retryable errors, and use something else
> for the one where there is no pool? -ENODEV?

Do you mean -EINVAL for non-retryable errors? Perhaps -ENOENT is more
appropriate as a return for offline memcgs?

>
> >
[..]
> > >  static void shrink_worker(struct work_struct *w)
> > > @@ -695,10 +754,13 @@ static void shrink_worker(struct work_struct *w)
> > >                                                 shrink_work);
> > >         int ret, failures = 0;
> > >
> > > +       /* global reclaim will select cgroup in a round-robin fashion. */
> > >         do {
> > > -               ret = zswap_reclaim_entry(pool);
> > > +               pool->next_shrink = mem_cgroup_iter(NULL, pool->next_shrink, NULL);
> >
> > Perhaps next_shrink_memcg is a better name here?
>
> Will change if you have a strong preference, I'd keep it shorter because it's
> always used in conjunction with a memcg type or function.

I'd rather have the more explicit name unless it causes some annoying
line breaks or so.

>
> >
> > > +
> > > +               ret = shrink_memcg(pool->next_shrink);
> > > +
> > >                 if (ret) {
> > > -                       zswap_reject_reclaim_fail++;
> > >                         if (ret != -EAGAIN)
> > >                                 break;
> > >                         if (++failures == MAX_RECLAIM_RETRIES)
> > > @@ -764,8 +826,7 @@ static struct zswap_pool *zswap_pool_create(char *type, char *compressor)
> > >          */
> > >         kref_init(&pool->kref);
> > >         INIT_LIST_HEAD(&pool->list);
> > > -       INIT_LIST_HEAD(&pool->lru);
> > > -       spin_lock_init(&pool->lru_lock);
> > > +       list_lru_init_memcg(&pool->list_lru, NULL);
> > >         INIT_WORK(&pool->shrink_work, shrink_worker);
> > >
> > >         zswap_pool_debug("created", pool);
> > > @@ -831,6 +892,9 @@ static void zswap_pool_destroy(struct zswap_pool *pool)
> > >
> > >         cpuhp_state_remove_instance(CPUHP_MM_ZSWP_POOL_PREPARE, &pool->node);
> > >         free_percpu(pool->acomp_ctx);
> > > +       list_lru_destroy(&pool->list_lru);
> > > +       if (pool->next_shrink)
> > > +               mem_cgroup_put(pool->next_shrink);
> > >         for (i = 0; i < ZSWAP_NR_ZPOOLS; i++)
> > >                 zpool_destroy_pool(pool->zpools[i]);
> > >         kfree(pool);
> > > @@ -1076,7 +1140,7 @@ static int zswap_writeback_entry(struct zswap_entry *entry,
> > >
> > >         /* try to allocate swap cache page */
> > >         page = __read_swap_cache_async(swpentry, GFP_KERNEL, NULL, 0,
> > > -                                      &page_was_allocated);
> > > +                                      &page_was_allocated, true);
> > >         if (!page) {
> > >                 ret = -ENOMEM;
> > >                 goto fail;
> > > @@ -1142,7 +1206,6 @@ static int zswap_writeback_entry(struct zswap_entry *entry,
> > >         /* start writeback */
> > >         __swap_writepage(page, &wbc);
> > >         put_page(page);
> > > -       zswap_written_back_pages++;
> > >
> > >         return ret;
> > >
> > > @@ -1199,8 +1262,10 @@ bool zswap_store(struct folio *folio)
> > >         struct scatterlist input, output;
> > >         struct crypto_acomp_ctx *acomp_ctx;
> > >         struct obj_cgroup *objcg = NULL;
> > > +       struct mem_cgroup *memcg = NULL;
> > >         struct zswap_pool *pool;
> > >         struct zpool *zpool;
> > > +       int lru_alloc_ret;
> > >         unsigned int dlen = PAGE_SIZE;
> > >         unsigned long handle, value;
> > >         char *buf;
> > > @@ -1230,15 +1295,15 @@ bool zswap_store(struct folio *folio)
> > >                 zswap_invalidate_entry(tree, dupentry);
> > >         }
> > >         spin_unlock(&tree->lock);
> > > -
> > > -       /*
> > > -        * XXX: zswap reclaim does not work with cgroups yet. Without a
> > > -        * cgroup-aware entry LRU, we will push out entries system-wide based on
> > > -        * local cgroup limits.
> > > -        */
> > >         objcg = get_obj_cgroup_from_folio(folio);
> > > -       if (objcg && !obj_cgroup_may_zswap(objcg))
> > > -               goto reject;
> > > +       if (objcg && !obj_cgroup_may_zswap(objcg)) {
> > > +               memcg = get_mem_cgroup_from_objcg(objcg);
> > > +               if (shrink_memcg(memcg)) {
> > > +                       mem_cgroup_put(memcg);
> > > +                       goto reject;
> > > +               }
> > > +               mem_cgroup_put(memcg);
> > > +       }
> > >
> > >         /* reclaim space if needed */
> > >         if (zswap_is_full()) {
> > > @@ -1254,10 +1319,15 @@ bool zswap_store(struct folio *folio)
> > >                         zswap_pool_reached_full = false;
> > >         }
> > >
> > > +       pool = zswap_pool_current_get();
> > > +       if (!pool)
> > > +               goto reject;
> > > +
> >
> > Why do we need to move zswap_pool_current_get() up here?
>
> Ah, thanks. This is a leftover from a previous version where the pool was needed
> to allocate the entry.
>
>
> >
> > >         /* allocate entry */
> > > -       entry = zswap_entry_cache_alloc(GFP_KERNEL);
> > > +       entry = zswap_entry_cache_alloc(GFP_KERNEL, page_to_nid(page));
> > >         if (!entry) {
> > >                 zswap_reject_kmemcache_fail++;
> > > +               zswap_pool_put(pool);
> > >                 goto reject;
> > >         }
> > >
> > > @@ -1269,6 +1339,7 @@ bool zswap_store(struct folio *folio)
> > >                         entry->length = 0;
> > >                         entry->value = value;
> > >                         atomic_inc(&zswap_same_filled_pages);
> > > +                       zswap_pool_put(pool);
> > >                         goto insert_entry;
> > >                 }
> > >                 kunmap_atomic(src);
> > > @@ -1278,9 +1349,15 @@ bool zswap_store(struct folio *folio)
> > >                 goto freepage;
> > >
> > >         /* if entry is successfully added, it keeps the reference */
> > > -       entry->pool = zswap_pool_current_get();
> > > -       if (!entry->pool)
> > > -               goto freepage;
> > > +       entry->pool = pool;
> > > +       if (objcg) {
> > > +               memcg = get_mem_cgroup_from_objcg(objcg);
> > > +               lru_alloc_ret = memcg_list_lru_alloc(memcg, &pool->list_lru, GFP_KERNEL);
> > > +               mem_cgroup_put(memcg);
> > > +
> > > +               if (lru_alloc_ret)
> > > +                       goto freepage;
> > > +       }
> > >
> > >         /* compress */
> > >         acomp_ctx = raw_cpu_ptr(entry->pool->acomp_ctx);
> > > @@ -1358,9 +1435,8 @@ bool zswap_store(struct folio *folio)
> > >                 zswap_invalidate_entry(tree, dupentry);
> > >         }
> > >         if (entry->length) {
> > > -               spin_lock(&entry->pool->lru_lock);
> > > -               list_add(&entry->lru, &entry->pool->lru);
> > > -               spin_unlock(&entry->pool->lru_lock);
> > > +               INIT_LIST_HEAD(&entry->lru);
> > > +               zswap_lru_add(&pool->list_lru, entry);
> > >         }
> > >         spin_unlock(&tree->lock);
> > >
> > > @@ -1373,8 +1449,8 @@ bool zswap_store(struct folio *folio)
> > >
> > >  put_dstmem:
> > >         mutex_unlock(acomp_ctx->mutex);
> > > -       zswap_pool_put(entry->pool);
> > >  freepage:
> > > +       zswap_pool_put(entry->pool);
> > >         zswap_entry_cache_free(entry);
> > >  reject:
> > >         if (objcg)
> > > @@ -1467,9 +1543,8 @@ bool zswap_load(struct folio *folio)
> > >                 zswap_invalidate_entry(tree, entry);
> > >                 folio_mark_dirty(folio);
> > >         } else if (entry->length) {
> > > -               spin_lock(&entry->pool->lru_lock);
> > > -               list_move(&entry->lru, &entry->pool->lru);
> > > -               spin_unlock(&entry->pool->lru_lock);
> > > +               zswap_lru_del(&entry->pool->list_lru, entry);
> > > +               zswap_lru_add(&entry->pool->list_lru, entry);
> > >         }
> > >         zswap_entry_put(tree, entry);
> > >         spin_unlock(&tree->lock);
> > > --
> > > 2.34.1

