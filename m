Return-Path: <linux-doc+bounces-1075-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 479457D6072
	for <lists+linux-doc@lfdr.de>; Wed, 25 Oct 2023 05:17:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68C0A1C20DCF
	for <lists+linux-doc@lfdr.de>; Wed, 25 Oct 2023 03:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 553681FBF;
	Wed, 25 Oct 2023 03:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hZOTHeWf"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B8C5225
	for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 03:17:23 +0000 (UTC)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 923C1134
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 20:17:19 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9becde9ea7bso88279666b.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 20:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698203838; x=1698808638; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKK4m2IQk6nPxyznALX5s4ZDJxKiaEoNf6nxbf5qPkA=;
        b=hZOTHeWflOVD2VlLjFnXn4gg1dVBpjc+UbLYsQlD4ciXa64mycsjaur8IKupYMunyI
         Ormfv6oxWSk3aNOQz0dXy6RNcYTsBNBNjfdL/D/DfnMpmSobgeVSkKhnv4GnG5zBUGw9
         NpmaS5Is7RfwecL2TZ1lDcipL6aQepJPZNWIJnHOjBGhv0oY1Jt+cKvTwGC1vIvUaqVy
         KxryCCe7uhSWJ+xffTaJvLQrtURNMwYEiKr5rLltsw/Xb5Aa8lvapMA1shMwluWBC/9f
         gwFy3VIndfaj+EkVThEK5IDx0+w3A3wm7g91RypiJXojN78135jzwDSQfPHl29+vhuEf
         rdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698203838; x=1698808638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xKK4m2IQk6nPxyznALX5s4ZDJxKiaEoNf6nxbf5qPkA=;
        b=ScjxpVeuhwAilTnjCJyUuRH06XBWMZHv1fgU0HE3gGUnwfnwUCgwCpS2m54oEvu0JH
         TaH71mV32FGEgte+jdw+HeNbujgwrTG10xcb9Wj1XX8uv1Pt05fhy8r4u8F46n0w4s7N
         n02uPUcwh9W0TFBVHKbTYF3GmLkhvKyzlgrOXizYMoC/0v04heUqEiEtudY3KBEFCk1J
         o3rB4lO3xAr85LIxqDXj8gxGm/0OD4O1wiulml93jfloHqJOlyQuEFFPgIyr44m/7nB9
         l7hzRLKJp8MJzT7w8XvY4whTxDciK5uNMcXHIEHuzUiWY1jN9vfrqkz8DSmXgJSBXlo2
         p5cg==
X-Gm-Message-State: AOJu0YwXsPr0POopLY19IWnGzUiUz8FT9QeusHhD6oUJhBjhU48T0NkI
	/R57EwtdbJ8q8mIxQI1NmfeoG35a+cqmQqu9rdCCSA==
X-Google-Smtp-Source: AGHT+IFX3IifeJqs+cLJ1Lp//yLwXn5VIp/POfCh40DD5rhvAnUZP9Zudeb7YeIe5z16xrPcSJinwLUwhu7RK6843yk=
X-Received: by 2002:a17:907:ea7:b0:9ae:699d:8a31 with SMTP id
 ho39-20020a1709070ea700b009ae699d8a31mr12875117ejc.33.1698203837643; Tue, 24
 Oct 2023 20:17:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231024203302.1920362-1-nphamcs@gmail.com> <20231024203302.1920362-3-nphamcs@gmail.com>
In-Reply-To: <20231024203302.1920362-3-nphamcs@gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Tue, 24 Oct 2023 20:16:38 -0700
Message-ID: <CAJD7tkZM4aOAwc4nRiU1PHofxHeZmV-NNGP5-E7X88ivRC7Pgw@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] zswap: make shrinking memcg-aware
To: Nhat Pham <nphamcs@gmail.com>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, cerasuolodomenico@gmail.com, 
	sjenning@redhat.com, ddstreet@ieee.org, vitaly.wool@konsulko.com, 
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeelb@google.com, 
	muchun.song@linux.dev, chrisl@kernel.org, linux-mm@kvack.org, 
	kernel-team@meta.com, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 24, 2023 at 1:33=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> From: Domenico Cerasuolo <cerasuolodomenico@gmail.com>
>
> Currently, we only have a single global LRU for zswap. This makes it
> impossible to perform worload-specific shrinking - an memcg cannot
> determine which pages in the pool it owns, and often ends up writing
> pages from other memcgs. This issue has been previously observed in
> practice and mitigated by simply disabling memcg-initiated shrinking:
>
> https://lore.kernel.org/all/20230530232435.3097106-1-nphamcs@gmail.com/T/=
#u
>
> This patch fully resolves the issue by replacing the global zswap LRU
> with memcg- and NUMA-specific LRUs, and modify the reclaim logic:
>
> a) When a store attempt hits an memcg limit, it now triggers a
>    synchronous reclaim attempt that, if successful, allows the new
>    hotter page to be accepted by zswap.
> b) If the store attempt instead hits the global zswap limit, it will
>    trigger an asynchronous reclaim attempt, in which an memcg is
>    selected for reclaim in a round-robin-like fashion.
>
> Signed-off-by: Domenico Cerasuolo <cerasuolodomenico@gmail.com>
> Co-developed-by: Nhat Pham <nphamcs@gmail.com>
> Signed-off-by: Nhat Pham <nphamcs@gmail.com>
> ---
>  include/linux/memcontrol.h |   5 +
>  mm/swap.h                  |   3 +-
>  mm/swap_state.c            |  23 +++--
>  mm/zswap.c                 | 188 ++++++++++++++++++++++++++-----------
>  4 files changed, 156 insertions(+), 63 deletions(-)
>
> diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> index 6edd3ec4d8d5..c1846e57011b 100644
> --- a/include/linux/memcontrol.h
> +++ b/include/linux/memcontrol.h
> @@ -1187,6 +1187,11 @@ static inline struct mem_cgroup *page_memcg_check(=
struct page *page)
>         return NULL;
>  }
>
> +static inline struct mem_cgroup *get_mem_cgroup_from_objcg(struct obj_cg=
roup *objcg)
> +{
> +       return NULL;
> +}
> +
>  static inline bool folio_memcg_kmem(struct folio *folio)
>  {
>         return false;
> diff --git a/mm/swap.h b/mm/swap.h
> index 73c332ee4d91..c0dc73e10e91 100644
> --- a/mm/swap.h
> +++ b/mm/swap.h
> @@ -51,7 +51,8 @@ struct page *read_swap_cache_async(swp_entry_t entry, g=
fp_t gfp_mask,
>                                    struct swap_iocb **plug);
>  struct page *__read_swap_cache_async(swp_entry_t entry, gfp_t gfp_mask,
>                                      struct mempolicy *mpol, pgoff_t ilx,
> -                                    bool *new_page_allocated);
> +                                    bool *new_page_allocated,
> +                                    bool skip_if_exists);
>  struct page *swap_cluster_readahead(swp_entry_t entry, gfp_t flag,
>                                     struct mempolicy *mpol, pgoff_t ilx);
>  struct page *swapin_readahead(swp_entry_t entry, gfp_t flag,
> diff --git a/mm/swap_state.c b/mm/swap_state.c
> index 85d9e5806a6a..040639e1c77e 100644
> --- a/mm/swap_state.c
> +++ b/mm/swap_state.c
> @@ -412,7 +412,8 @@ struct folio *filemap_get_incore_folio(struct address=
_space *mapping,
>
>  struct page *__read_swap_cache_async(swp_entry_t entry, gfp_t gfp_mask,
>                                      struct mempolicy *mpol, pgoff_t ilx,
> -                                    bool *new_page_allocated)
> +                                    bool *new_page_allocated,
> +                                    bool skip_if_exists)
>  {
>         struct swap_info_struct *si;
>         struct folio *folio;
> @@ -470,6 +471,16 @@ struct page *__read_swap_cache_async(swp_entry_t ent=
ry, gfp_t gfp_mask,
>                 if (err !=3D -EEXIST)
>                         goto fail_put_swap;
>
> +               /* Protect against a recursive call to __read_swap_cache_=
async()

nit: insert new line before "Protect", see surrounding comments.

> +                * on the same entry waiting forever here because SWAP_HA=
S_CACHE
> +                * is set but the folio is not the swap cache yet. This c=
an
> +                * happen today if mem_cgroup_swapin_charge_folio() below
> +                * triggers reclaim through zswap, which may call
> +                * __read_swap_cache_async() in the writeback path.
> +                */
> +               if (skip_if_exists)
> +                       goto fail_put_swap;
> +
>                 /*
>                  * We might race against __delete_from_swap_cache(), and
>                  * stumble across a swap_map entry whose SWAP_HAS_CACHE
[..]
> +/*********************************
> +* lru functions
> +**********************************/
> +static bool zswap_lru_add(struct list_lru *list_lru, struct zswap_entry =
*entry)
> +{
> +       struct mem_cgroup *memcg =3D get_mem_cgroup_from_entry(entry);
> +       int nid =3D entry_to_nid(entry);
> +       bool added =3D list_lru_add(list_lru, &entry->lru, nid, memcg);
> +
> +       mem_cgroup_put(memcg);

Still not fond of the get/put pattern but okay..

> +       return added;
> +}
> +
> +static bool zswap_lru_del(struct list_lru *list_lru, struct zswap_entry =
*entry)
> +{
> +       struct mem_cgroup *memcg =3D get_mem_cgroup_from_entry(entry);
> +       int nid =3D entry_to_nid(entry);
> +       bool removed =3D list_lru_del(list_lru, &entry->lru, nid, memcg);
> +
> +       mem_cgroup_put(memcg);
> +       return removed;
> +}
> +
>  /*********************************
>  * rbtree functions
>  **********************************/
[..]
> @@ -652,28 +679,37 @@ static int zswap_reclaim_entry(struct zswap_pool *p=
ool)
>          */
>         swpoffset =3D swp_offset(entry->swpentry);
>         tree =3D zswap_trees[swp_type(entry->swpentry)];
> -       spin_unlock(&pool->lru_lock);
> +       list_lru_isolate(l, item);
> +       /*
> +        * It's safe to drop the lock here because we return either
> +        * LRU_REMOVED_RETRY or LRU_RETRY.
> +        */
> +       spin_unlock(lock);
>
>         /* Check for invalidate() race */
>         spin_lock(&tree->lock);
> -       if (entry !=3D zswap_rb_search(&tree->rbroot, swpoffset)) {
> -               ret =3D -EAGAIN;
> +       if (entry !=3D zswap_rb_search(&tree->rbroot, swpoffset))
>                 goto unlock;
> -       }
> +
>         /* Hold a reference to prevent a free during writeback */
>         zswap_entry_get(entry);
>         spin_unlock(&tree->lock);
>
> -       ret =3D zswap_writeback_entry(entry, tree);
> +       writeback_result =3D zswap_writeback_entry(entry, tree);
>
>         spin_lock(&tree->lock);
> -       if (ret) {
> -               /* Writeback failed, put entry back on LRU */
> -               spin_lock(&pool->lru_lock);
> -               list_move(&entry->lru, &pool->lru);
> -               spin_unlock(&pool->lru_lock);
> +       if (writeback_result) {
> +               zswap_reject_reclaim_fail++;
> +               memcg =3D get_mem_cgroup_from_entry(entry);

Can this return NULL? Seems like we don't check the return in most/all plac=
es.

> +               spin_lock(lock);
> +               /* we cannot use zswap_lru_add here, because it increment=
s node's lru count */
> +               list_lru_putback(&entry->pool->list_lru, item, entry_to_n=
id(entry), memcg);

Perhaps we can move this call with the memcg get/put to a helper like
add/del? (e.g. zswap_lru_putback)

We would need to move get_mem_cgroup_from_entry() into the lock but I
think that's okay.

> +               spin_unlock(lock);
> +               mem_cgroup_put(memcg);
> +               ret =3D LRU_RETRY;
>                 goto put_unlock;
>         }
> +       zswap_written_back_pages++;
>
>         /*
>          * Writeback started successfully, the page now belongs to the
> @@ -687,7 +723,34 @@ static int zswap_reclaim_entry(struct zswap_pool *po=
ol)
>         zswap_entry_put(tree, entry);
>  unlock:
>         spin_unlock(&tree->lock);
> -       return ret ? -EAGAIN : 0;
> +       spin_lock(lock);
> +       return ret;
> +}
> +
> +static int shrink_memcg(struct mem_cgroup *memcg)
> +{
> +       struct zswap_pool *pool;
> +       int nid, shrunk =3D 0;
> +
> +       /*
> +        * Skip zombies because their LRUs are reparented and we would be
> +        * reclaiming from the parent instead of the dead memcg.
> +        */
> +       if (memcg && !mem_cgroup_online(memcg))
> +               return -ENOENT;
> +
> +       pool =3D zswap_pool_current_get();
> +       if (!pool)
> +               return -EINVAL;
> +
> +       for_each_node_state(nid, N_NORMAL_MEMORY) {
> +               unsigned long nr_to_walk =3D 1;
> +
> +               shrunk +=3D list_lru_walk_one(&pool->list_lru, nid, memcg=
,
> +                                           &shrink_memcg_cb, NULL, &nr_t=
o_walk);
> +       }
> +       zswap_pool_put(pool);
> +       return shrunk ? 0 : -EAGAIN;
>  }
>
>  static void shrink_worker(struct work_struct *w)
> @@ -696,15 +759,17 @@ static void shrink_worker(struct work_struct *w)
>                                                 shrink_work);
>         int ret, failures =3D 0;
>
> +       /* global reclaim will select cgroup in a round-robin fashion. */
>         do {
> -               ret =3D zswap_reclaim_entry(pool);
> -               if (ret) {
> -                       zswap_reject_reclaim_fail++;
> -                       if (ret !=3D -EAGAIN)
> -                               break;
> -                       if (++failures =3D=3D MAX_RECLAIM_RETRIES)
> -                               break;
> -               }
> +               pool->next_shrink =3D mem_cgroup_iter(NULL, pool->next_sh=
rink, NULL);

I think this can be a problem. We hold a ref to a memcg here until the
next time we shrink, which can be a long time IIUC. This can cause the
memcg to linger as a zombie. I understand it is one memcg per-zswap
pool, but I am still unsure about it.

MGLRU maintains a memcg LRU for global reclaim that gets properly
cleaned up when a memcg is going away, so that's one option, although
complicated.

A second option would be to hold a pointer to the objcg instead, which
should be less problematic (although we are still holding that objcg
hostage indefinitely). The problem here is that if the objcg gets
reparented, next time we will start at the parent of the memcg we
stopped at last time, which tbh doesn't sound bad at all to me.

A third option would be to flag the memcg such that when it is getting
offlined we can call into zswap to reset pool->next_shrink (or move it
to the parent) and drop the ref. Although synchronization can get
hairy when racing with offlining.

Not sure what's the right solution, but I prefer we don't hold any
memcgs hostages indefinitely. I also think if we end up using
mem_cgroup_iter() then there should be a mem_cgroup_iter_break()
somewhere if/when breaking the iteration.

> +
> +               ret =3D shrink_memcg(pool->next_shrink);
> +
> +               if (ret =3D=3D -EINVAL)
> +                       break;
> +               if (ret && ++failures =3D=3D MAX_RECLAIM_RETRIES)
> +                       break;
> +
>                 cond_resched();
>         } while (!zswap_can_accept());
>         zswap_pool_put(pool);
[..]
> @@ -1233,15 +1301,15 @@ bool zswap_store(struct folio *folio)
>                 zswap_invalidate_entry(tree, dupentry);
>         }
>         spin_unlock(&tree->lock);
> -
> -       /*
> -        * XXX: zswap reclaim does not work with cgroups yet. Without a
> -        * cgroup-aware entry LRU, we will push out entries system-wide b=
ased on
> -        * local cgroup limits.
> -        */
>         objcg =3D get_obj_cgroup_from_folio(folio);
> -       if (objcg && !obj_cgroup_may_zswap(objcg))
> -               goto reject;
> +       if (objcg && !obj_cgroup_may_zswap(objcg)) {
> +               memcg =3D get_mem_cgroup_from_objcg(objcg);
> +               if (shrink_memcg(memcg)) {
> +                       mem_cgroup_put(memcg);
> +                       goto reject;
> +               }
> +               mem_cgroup_put(memcg);

Here we choose to replicate mem_cgroup_put().

> +       }
>
>         /* reclaim space if needed */
>         if (zswap_is_full()) {
> @@ -1258,7 +1326,7 @@ bool zswap_store(struct folio *folio)
>         }
>
>         /* allocate entry */
> -       entry =3D zswap_entry_cache_alloc(GFP_KERNEL);
> +       entry =3D zswap_entry_cache_alloc(GFP_KERNEL, page_to_nid(page));
>         if (!entry) {
>                 zswap_reject_kmemcache_fail++;
>                 goto reject;
> @@ -1285,6 +1353,15 @@ bool zswap_store(struct folio *folio)
>         if (!entry->pool)
>                 goto freepage;
>
> +       if (objcg) {
> +               memcg =3D get_mem_cgroup_from_objcg(objcg);
> +               lru_alloc_ret =3D memcg_list_lru_alloc(memcg, &entry->poo=
l->list_lru, GFP_KERNEL);
> +               mem_cgroup_put(memcg);
> +
> +               if (lru_alloc_ret)
> +                       goto put_pool;
> +       }

Yet here we choose to have a single mem_cgroup_put() and stash the
output in a variable.

Consistency would be nice.

> +
>         /* compress */
>         acomp_ctx =3D raw_cpu_ptr(entry->pool->acomp_ctx);
>
> @@ -1361,9 +1438,8 @@ bool zswap_store(struct folio *folio)
>                 zswap_invalidate_entry(tree, dupentry);
>         }
>         if (entry->length) {
> -               spin_lock(&entry->pool->lru_lock);
> -               list_add(&entry->lru, &entry->pool->lru);
> -               spin_unlock(&entry->pool->lru_lock);
> +               INIT_LIST_HEAD(&entry->lru);
> +               zswap_lru_add(&entry->pool->list_lru, entry);
>         }
>         spin_unlock(&tree->lock);
>
> @@ -1376,6 +1452,7 @@ bool zswap_store(struct folio *folio)
>
>  put_dstmem:
>         mutex_unlock(acomp_ctx->mutex);
> +put_pool:
>         zswap_pool_put(entry->pool);
>  freepage:
>         zswap_entry_cache_free(entry);
> @@ -1470,9 +1547,8 @@ bool zswap_load(struct folio *folio)
>                 zswap_invalidate_entry(tree, entry);
>                 folio_mark_dirty(folio);
>         } else if (entry->length) {
> -               spin_lock(&entry->pool->lru_lock);
> -               list_move(&entry->lru, &entry->pool->lru);
> -               spin_unlock(&entry->pool->lru_lock);
> +               zswap_lru_del(&entry->pool->list_lru, entry);
> +               zswap_lru_add(&entry->pool->list_lru, entry);

Can we use list_move_tail() here? (perhaps wrapped in a helper if needed).

>         }
>         zswap_entry_put(tree, entry);
>         spin_unlock(&tree->lock);
> --
> 2.34.1

