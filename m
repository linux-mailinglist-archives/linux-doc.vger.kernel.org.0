Return-Path: <linux-doc+bounces-585-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FCB7CEC41
	for <lists+linux-doc@lfdr.de>; Thu, 19 Oct 2023 01:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F03D7B20EAD
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 23:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3025B3E015;
	Wed, 18 Oct 2023 23:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AF0diONI"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B295639861
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 23:47:13 +0000 (UTC)
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDCD9B6;
	Wed, 18 Oct 2023 16:47:10 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-79fb78e297bso310532739f.0;
        Wed, 18 Oct 2023 16:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697672830; x=1698277630; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zrC86Rs6qF+NDCGybzpr8afhv2WKWXGSdchJYM7XuwU=;
        b=AF0diONIgRYxmhnVxqONxpa605kvNuYohrcwp1Vts+5Mw9FxFBX41BgJZ2CLy5ue9f
         NVVHIo2+gMvWBDO18hDCCW2Z4PsouKQkxrgv9NuGMYTez+8aC3Yo4AbE4xZYfziB/Q/P
         0nGcpYMFk0XdLoTOZkWN2UstyC9jwSX7LV/GUqj6U0s4a0HKWtge3wx/mQVZ2MLCfH92
         WetFuiQa3T0G9zNv7aJmyBD5BEEkV5FU6cCezyHRVrfA/jEnCJVGRNVKhDpD/kE7LjW8
         6mI4w7dYjFIsUMAMPr7ZzFWGsJwcryIAy5HImbuQ2PTgD5ExDbAGND4zS5f8Ue2/DpKk
         sqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697672830; x=1698277630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zrC86Rs6qF+NDCGybzpr8afhv2WKWXGSdchJYM7XuwU=;
        b=pxdt4nma6BVCO97x6D39/+/umjKNGcO8NowfbuVXQO4PxbHAeRYqdzsYwpye8/nYzf
         vXfS+rUw/t3X8irZljlY4jTHRLd70VSG/KOzS76oFTkelfuTbrW2aYDxjuJv91j5tbD7
         rbHYraJfzspiNJJmUL1AK3QCNY6MAqROJiBFgu3HjmfS33MdhVoKpLbNIL7RUIMJEqSh
         t41EUGEXGr3wW1KdSlO1eBa5G5/0TRKal40yymRYOJbV/zSHh6wQlW1RqQhdQHA8doQM
         qt9vXu0D+AAB1Dqok8azY4zxxfXH7nNaZqEwXW10A7N7hgv3u2938awLCRauzN+8AJ8p
         JQaw==
X-Gm-Message-State: AOJu0YxRpOpqd128RrHhDtQKqjhuyZtgz8pHfBuI7dg6x+ITLpknIalB
	rpC1cK8m7yDs8oOU2T6eeRVc5M3LmXWiWVpzBj4=
X-Google-Smtp-Source: AGHT+IEongFA6OKeYSxIY4NQ/kpNwapiAjv9lsdCIOaUmmq3ZCAZ7Gvc6P/5FSu1G1Fl6tTmGEI9HNZumcssORlVcBA=
X-Received: by 2002:a5d:9d92:0:b0:784:314f:8d68 with SMTP id
 ay18-20020a5d9d92000000b00784314f8d68mr910755iob.1.1697672829845; Wed, 18 Oct
 2023 16:47:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231017232152.2605440-1-nphamcs@gmail.com> <20231017232152.2605440-3-nphamcs@gmail.com>
 <CAJD7tka2aVKBJj6cYutcVzOGzj_6gop6-ytSmWWML=sEe9qHbA@mail.gmail.com>
In-Reply-To: <CAJD7tka2aVKBJj6cYutcVzOGzj_6gop6-ytSmWWML=sEe9qHbA@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 18 Oct 2023 16:46:58 -0700
Message-ID: <CAKEwX=N3CnKE+gu-EP98Wr3goQV0Z8fXn_nBPW_H_rupjkBwhA@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] zswap: make shrinking memcg-aware
To: Yosry Ahmed <yosryahmed@google.com>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, cerasuolodomenico@gmail.com, 
	sjenning@redhat.com, ddstreet@ieee.org, vitaly.wool@konsulko.com, 
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeelb@google.com, 
	muchun.song@linux.dev, linux-mm@kvack.org, kernel-team@meta.com, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2023 at 4:20=E2=80=AFPM Yosry Ahmed <yosryahmed@google.com>=
 wrote:
>
> On Tue, Oct 17, 2023 at 4:21=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wro=
te:
> >
> > From: Domenico Cerasuolo <cerasuolodomenico@gmail.com>
> >
> > Currently, we only have a single global LRU for zswap. This makes it
> > impossible to perform worload-specific shrinking - an memcg cannot
> > determine which pages in the pool it owns, and often ends up writing
> > pages from other memcgs. This issue has been previously observed in
> > practice and mitigated by simply disabling memcg-initiated shrinking:
> >
> > https://lore.kernel.org/all/20230530232435.3097106-1-nphamcs@gmail.com/=
T/#u
> >
> > This patch fully resolves the issue by replacing the global zswap LRU
> > with memcg- and NUMA-specific LRUs, and modify the reclaim logic:
> >
> > a) When a store attempt hits an memcg limit, it now triggers a
> >    synchronous reclaim attempt that, if successful, allows the new
> >    hotter page to be accepted by zswap.
> > b) If the store attempt instead hits the global zswap limit, it will
> >    trigger an asynchronous reclaim attempt, in which an memcg is
> >    selected for reclaim in a round-robin-like fashion.
>
> Could you explain the rationale behind the difference in behavior here
> between the global limit and the memcg limit?

The global limit hit reclaim behavior was previously asynchronous too.
We just added the round-robin part because now the zswap LRU is
cgroup-aware :)

For the cgroup limit hit, however, we cannot make it asynchronous,
as it is a bit hairy to add a per-cgroup shrink_work. So, we just
perform the reclaim synchronously.

The question is whether it makes sense to make the global limit
reclaim synchronous too. That is a task of its own IMO.

(FWIW, this somewhat mirrors the direct reclaimer v.s kswapd
story to me, but don't quote me too hard on this).

>
> >
> > Signed-off-by: Domenico Cerasuolo <cerasuolodomenico@gmail.com>
> > Co-developed-by: Nhat Pham <nphamcs@gmail.com>
> > Signed-off-by: Nhat Pham <nphamcs@gmail.com>
> > ---
> >  include/linux/memcontrol.h |   5 ++
> >  mm/swap.h                  |   3 +-
> >  mm/swap_state.c            |  17 +++-
> >  mm/zswap.c                 | 179 ++++++++++++++++++++++++++-----------
> >  4 files changed, 147 insertions(+), 57 deletions(-)
>
> This is a dense patch, I haven't absorbed all of it yet, but the first
> round of comments below.

Regardless, thanks for the feedback, Yosry! Domenico definitely
knows more than me about this, but I'll respond with what I know,
and he can expand and/or fact-check me :)

>
> >
> > diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> > index 031102ac9311..3de10fabea0f 100644
> > --- a/include/linux/memcontrol.h
> > +++ b/include/linux/memcontrol.h
> > @@ -1179,6 +1179,11 @@ static inline struct mem_cgroup *page_memcg_chec=
k(struct page *page)
> >         return NULL;
> >  }
> >
> > +static inline struct mem_cgroup *get_mem_cgroup_from_objcg(struct obj_=
cgroup *objcg)
> > +{
> > +       return NULL;
> > +}
> > +
> >  static inline bool folio_memcg_kmem(struct folio *folio)
> >  {
> >         return false;
> > diff --git a/mm/swap.h b/mm/swap.h
> > index 8a3c7a0ace4f..bbd6ce661a20 100644
> > --- a/mm/swap.h
> > +++ b/mm/swap.h
> > @@ -50,7 +50,8 @@ struct page *read_swap_cache_async(swp_entry_t entry,=
 gfp_t gfp_mask,
> >  struct page *__read_swap_cache_async(swp_entry_t entry, gfp_t gfp_mask=
,
> >                                      struct vm_area_struct *vma,
> >                                      unsigned long addr,
> > -                                    bool *new_page_allocated);
> > +                                    bool *new_page_allocated,
> > +                                    bool fail_if_exists);
> >  struct page *swap_cluster_readahead(swp_entry_t entry, gfp_t flag,
> >                                     struct vm_fault *vmf);
> >  struct page *swapin_readahead(swp_entry_t entry, gfp_t flag,
> > diff --git a/mm/swap_state.c b/mm/swap_state.c
> > index b3b14bd0dd64..0356df52b06a 100644
> > --- a/mm/swap_state.c
> > +++ b/mm/swap_state.c
> > @@ -411,7 +411,7 @@ struct folio *filemap_get_incore_folio(struct addre=
ss_space *mapping,
> >
> >  struct page *__read_swap_cache_async(swp_entry_t entry, gfp_t gfp_mask=
,
> >                         struct vm_area_struct *vma, unsigned long addr,
> > -                       bool *new_page_allocated)
> > +                       bool *new_page_allocated, bool fail_if_exists)
>
> nit: I don't feel like "fail" is the correct word here. Perhaps "skip"?
>
> >  {
> >         struct swap_info_struct *si;
> >         struct folio *folio;
> > @@ -468,6 +468,15 @@ struct page *__read_swap_cache_async(swp_entry_t e=
ntry, gfp_t gfp_mask,
> >                 if (err !=3D -EEXIST)
> >                         goto fail_put_swap;
> >
> > +               /*
> > +                * This check guards against a state that happens if a =
call
> > +                * to __read_swap_cache_async triggers a reclaim, if th=
e
> > +                * reclaimer (zswap's writeback as of now) then decides=
 to
> > +                * reclaim that same entry, then the subsequent call to
> > +                * __read_swap_cache_async would get stuck in this loop=
.
>
> I think this comment needs to first state that it is protecting
> against a recursive call in general, not necessarily in reclaim, as
> __read_swap_cache_async() is not usually called in the context of
> reclaim so this can be confusing. Then it can give the exact example
> we have today. Perhaps something like:
>
> Protect against a recursive call to __read_swap_cache_async() on the
> same entry waiting forever here because SWAP_HAS_CACHE is set but the
> folio is not the swap cache yet. This can happen today if
> mem_cgroup_swapin_charge_folio() below triggers reclaim through zswap,
> which may call __read_swap_cache_async() in the writeback path.
>
> > +                */
> > +               if (fail_if_exists && err =3D=3D -EEXIST)
>
> We already made sure  in the preceding condition that err is -EEXIST.
>
> > +                       goto fail_put_swap;
> >                 /*
> >                  * We might race against __delete_from_swap_cache(), an=
d
> >                  * stumble across a swap_map entry whose SWAP_HAS_CACHE
> > @@ -530,7 +539,7 @@ struct page *read_swap_cache_async(swp_entry_t entr=
y, gfp_t gfp_mask,
> >  {
> >         bool page_was_allocated;
> >         struct page *retpage =3D __read_swap_cache_async(entry, gfp_mas=
k,
> > -                       vma, addr, &page_was_allocated);
> > +                       vma, addr, &page_was_allocated, false);
> >
> >         if (page_was_allocated)
> >                 swap_readpage(retpage, false, plug);
> > @@ -649,7 +658,7 @@ struct page *swap_cluster_readahead(swp_entry_t ent=
ry, gfp_t gfp_mask,
> >                 /* Ok, do the async read-ahead now */
> >                 page =3D __read_swap_cache_async(
> >                         swp_entry(swp_type(entry), offset),
> > -                       gfp_mask, vma, addr, &page_allocated);
> > +                       gfp_mask, vma, addr, &page_allocated, false);
> >                 if (!page)
> >                         continue;
> >                 if (page_allocated) {
> > @@ -815,7 +824,7 @@ static struct page *swap_vma_readahead(swp_entry_t =
fentry, gfp_t gfp_mask,
> >                 pte_unmap(pte);
> >                 pte =3D NULL;
> >                 page =3D __read_swap_cache_async(entry, gfp_mask, vma,
> > -                                              addr, &page_allocated);
> > +                                              addr, &page_allocated, f=
alse);
> >                 if (!page)
> >                         continue;
> >                 if (page_allocated) {
> > diff --git a/mm/zswap.c b/mm/zswap.c
> > index 083c693602b8..d2989ad11814 100644
> > --- a/mm/zswap.c
> > +++ b/mm/zswap.c
> > @@ -34,6 +34,7 @@
> >  #include <linux/writeback.h>
> >  #include <linux/pagemap.h>
> >  #include <linux/workqueue.h>
> > +#include <linux/list_lru.h>
> >
> >  #include "swap.h"
> >  #include "internal.h"
> > @@ -171,8 +172,8 @@ struct zswap_pool {
> >         struct work_struct shrink_work;
> >         struct hlist_node node;
> >         char tfm_name[CRYPTO_MAX_ALG_NAME];
> > -       struct list_head lru;
> > -       spinlock_t lru_lock;
> > +       struct list_lru list_lru;
> > +       struct mem_cgroup *next_shrink;
> >  };
> >
> >  /*
> > @@ -288,15 +289,25 @@ static void zswap_update_total_size(void)
> >         zswap_pool_total_size =3D total;
> >  }
> >
> > +static inline struct mem_cgroup *get_mem_cgroup_from_entry(struct zswa=
p_entry *entry)
> > +{
> > +       return entry->objcg ? get_mem_cgroup_from_objcg(entry->objcg) :=
 NULL;
> > +}
> > +
> > +static inline int entry_to_nid(struct zswap_entry *entry)
> > +{
> > +       return page_to_nid(virt_to_page(entry));
> > +}
> > +
> >  /*********************************
> >  * zswap entry functions
> >  **********************************/
> >  static struct kmem_cache *zswap_entry_cache;
> >
> > -static struct zswap_entry *zswap_entry_cache_alloc(gfp_t gfp)
> > +static struct zswap_entry *zswap_entry_cache_alloc(gfp_t gfp, int nid)
> >  {
> >         struct zswap_entry *entry;
> > -       entry =3D kmem_cache_alloc(zswap_entry_cache, gfp);
> > +       entry =3D kmem_cache_alloc_node(zswap_entry_cache, gfp, nid);
> >         if (!entry)
> >                 return NULL;
> >         entry->refcount =3D 1;
> > @@ -309,6 +320,27 @@ static void zswap_entry_cache_free(struct zswap_en=
try *entry)
> >         kmem_cache_free(zswap_entry_cache, entry);
> >  }
> >
> > +/*********************************
> > +* lru functions
> > +**********************************/
> > +static bool zswap_lru_add(struct list_lru *list_lru, struct zswap_entr=
y *entry)
> > +{
> > +       struct mem_cgroup *memcg =3D get_mem_cgroup_from_entry(entry);
>
> Could we avoid the need for get/put with an rcu_read_lock() instead?
>
> > +       bool added =3D __list_lru_add(list_lru, &entry->lru, entry_to_n=
id(entry), memcg);
> > +
> > +       mem_cgroup_put(memcg);
> > +       return added;
> > +}
> > +
> > +static bool zswap_lru_del(struct list_lru *list_lru, struct zswap_entr=
y *entry)
> > +{
> > +       struct mem_cgroup *memcg =3D get_mem_cgroup_from_entry(entry);
> > +       bool removed =3D __list_lru_del(list_lru, &entry->lru, entry_to=
_nid(entry), memcg);
> > +
> > +       mem_cgroup_put(memcg);
> > +       return removed;
> > +}
> > +
> >  /*********************************
> >  * rbtree functions
> >  **********************************/
> > @@ -393,9 +425,7 @@ static void zswap_free_entry(struct zswap_entry *en=
try)
> >         if (!entry->length)
> >                 atomic_dec(&zswap_same_filled_pages);
> >         else {
> > -               spin_lock(&entry->pool->lru_lock);
> > -               list_del(&entry->lru);
> > -               spin_unlock(&entry->pool->lru_lock);
> > +               zswap_lru_del(&entry->pool->list_lru, entry);
> >                 zpool_free(zswap_find_zpool(entry), entry->handle);
> >                 zswap_pool_put(entry->pool);
> >         }
> > @@ -629,21 +659,16 @@ static void zswap_invalidate_entry(struct zswap_t=
ree *tree,
> >                 zswap_entry_put(tree, entry);
> >  }
> >
> > -static int zswap_reclaim_entry(struct zswap_pool *pool)
> > +static enum lru_status shrink_memcg_cb(struct list_head *item, struct =
list_lru_one *l,
> > +                                      spinlock_t *lock, void *arg)
> >  {
> > -       struct zswap_entry *entry;
> > +       struct zswap_entry *entry =3D container_of(item, struct zswap_e=
ntry, lru);
> > +       struct mem_cgroup *memcg;
> >         struct zswap_tree *tree;
> >         pgoff_t swpoffset;
> > -       int ret;
> > +       enum lru_status ret =3D LRU_REMOVED_RETRY;
> > +       int writeback_result;
> >
> > -       /* Get an entry off the LRU */
> > -       spin_lock(&pool->lru_lock);
> > -       if (list_empty(&pool->lru)) {
> > -               spin_unlock(&pool->lru_lock);
> > -               return -EINVAL;
> > -       }
> > -       entry =3D list_last_entry(&pool->lru, struct zswap_entry, lru);
> > -       list_del_init(&entry->lru);
> >         /*
> >          * Once the lru lock is dropped, the entry might get freed. The
> >          * swpoffset is copied to the stack, and entry isn't deref'd ag=
ain
> > @@ -651,28 +676,33 @@ static int zswap_reclaim_entry(struct zswap_pool =
*pool)
> >          */
> >         swpoffset =3D swp_offset(entry->swpentry);
> >         tree =3D zswap_trees[swp_type(entry->swpentry)];
> > -       spin_unlock(&pool->lru_lock);
> > +       list_lru_isolate(l, item);
> > +       spin_unlock(lock);
>
> Perhaps a comment somewhere stating that we only return either
> LRU_REMOVED_RETRY or LRU_RETRY, so it's fine to drop and reacquire the
> lock.
>
> >
> >         /* Check for invalidate() race */
> >         spin_lock(&tree->lock);
> >         if (entry !=3D zswap_rb_search(&tree->rbroot, swpoffset)) {
> > -               ret =3D -EAGAIN;
> >                 goto unlock;
> >         }
>
> nit: braces no longer needed?

Ah, for some reason checkpatch did not pick up on this.
Weird.

>
> >         /* Hold a reference to prevent a free during writeback */
> >         zswap_entry_get(entry);
> >         spin_unlock(&tree->lock);
> >
> > -       ret =3D zswap_writeback_entry(entry, tree);
> > +       writeback_result =3D zswap_writeback_entry(entry, tree);
> >
> >         spin_lock(&tree->lock);
> > -       if (ret) {
> > -               /* Writeback failed, put entry back on LRU */
> > -               spin_lock(&pool->lru_lock);
> > -               list_move(&entry->lru, &pool->lru);
> > -               spin_unlock(&pool->lru_lock);
> > +       if (writeback_result) {
> > +               zswap_reject_reclaim_fail++;
> > +               memcg =3D get_mem_cgroup_from_entry(entry);
> > +               spin_lock(lock);
> > +               /* we cannot use zswap_lru_add here, because it increme=
nts node's lru count */
> > +               list_lru_putback(&entry->pool->list_lru, item, entry_to=
_nid(entry), memcg);
> > +               spin_unlock(lock);
> > +               mem_cgroup_put(memcg);
> > +               ret =3D LRU_RETRY;
> >                 goto put_unlock;
> >         }
> > +       zswap_written_back_pages++;
>
> Why is this moved here from zswap_writeback_entry()? Also why is
> zswap_reject_reclaim_fail incremented here instead of inside
> zswap_writeback_entry()?

Domenico should know this better than me, but my understanding
is that moving it here protects concurrent modifications of
zswap_written_back_pages with the tree lock.

Is writeback single-threaded in the past? This counter is non-atomic,
and doesn't seem to be protected by any locks...

There definitely can be concurrent stores now though - with
a synchronous reclaim from cgroup-limit hit and another
from the old shrink worker.

(and with the new zswap shrinker, concurrent reclaim is
the expectation!)

zswap_reject_reclaim_fail was previously incremented in
shrink_worker I think. We need it to be incremented
for the shrinker as well, so might as well move it here.

>
> >
> >         /*
> >          * Writeback started successfully, the page now belongs to the
> > @@ -686,7 +716,36 @@ static int zswap_reclaim_entry(struct zswap_pool *=
pool)
> >         zswap_entry_put(tree, entry);
> >  unlock:
> >         spin_unlock(&tree->lock);
> > -       return ret ? -EAGAIN : 0;
> > +       spin_lock(lock);
> > +       return ret;
> > +}
> > +
> > +static int shrink_memcg(struct mem_cgroup *memcg)
> > +{
> > +       struct zswap_pool *pool;
> > +       int nid, shrunk =3D 0;
> > +
> > +       pool =3D zswap_pool_current_get();
> > +       if (!pool)
> > +               return -EINVAL;
> > +
> > +       /*
> > +        * Skip zombies because their LRUs are reparented and we would =
be
> > +        * reclaiming from the parent instead of the dead memcgroup.
>
> nit: s/memcgroup/memcg.
>
> > +        */
> > +       if (memcg && !mem_cgroup_online(memcg))
> > +               goto out;
>
> If we move this above zswap_pool_current_get(), we can return directly
> and remove the label. I noticed we will return -EAGAIN if memcg is
> offline. IIUC -EAGAIN for the caller will move on to the next memcg,
> but I am wondering if a different errno would be clearer here.
>
> > +
> > +       for_each_node_state(nid, N_NORMAL_MEMORY) {
> > +               unsigned long nr_to_walk =3D 1;
> > +
> > +               if (list_lru_walk_one(&pool->list_lru, nid, memcg, &shr=
ink_memcg_cb,
> > +                                     NULL, &nr_to_walk))
> > +                       shrunk++;
>
> nit:
> shrunk +=3D list_lru_walk_one(..);

yeah might be a tad cleaner.

>
> > +       }
> > +out:
> > +       zswap_pool_put(pool);
> > +       return shrunk ? 0 : -EAGAIN;
> >  }
> >
> >  static void shrink_worker(struct work_struct *w)
> > @@ -695,10 +754,13 @@ static void shrink_worker(struct work_struct *w)
> >                                                 shrink_work);
> >         int ret, failures =3D 0;
> >
> > +       /* global reclaim will select cgroup in a round-robin fashion. =
*/
> >         do {
> > -               ret =3D zswap_reclaim_entry(pool);
> > +               pool->next_shrink =3D mem_cgroup_iter(NULL, pool->next_=
shrink, NULL);
>
> Perhaps next_shrink_memcg is a better name here?
>
> > +
> > +               ret =3D shrink_memcg(pool->next_shrink);
> > +
> >                 if (ret) {
> > -                       zswap_reject_reclaim_fail++;
> >                         if (ret !=3D -EAGAIN)
> >                                 break;
> >                         if (++failures =3D=3D MAX_RECLAIM_RETRIES)
> > @@ -764,8 +826,7 @@ static struct zswap_pool *zswap_pool_create(char *t=
ype, char *compressor)
> >          */
> >         kref_init(&pool->kref);
> >         INIT_LIST_HEAD(&pool->list);
> > -       INIT_LIST_HEAD(&pool->lru);
> > -       spin_lock_init(&pool->lru_lock);
> > +       list_lru_init_memcg(&pool->list_lru, NULL);
> >         INIT_WORK(&pool->shrink_work, shrink_worker);
> >
> >         zswap_pool_debug("created", pool);
> > @@ -831,6 +892,9 @@ static void zswap_pool_destroy(struct zswap_pool *p=
ool)
> >
> >         cpuhp_state_remove_instance(CPUHP_MM_ZSWP_POOL_PREPARE, &pool->=
node);
> >         free_percpu(pool->acomp_ctx);
> > +       list_lru_destroy(&pool->list_lru);
> > +       if (pool->next_shrink)
> > +               mem_cgroup_put(pool->next_shrink);
> >         for (i =3D 0; i < ZSWAP_NR_ZPOOLS; i++)
> >                 zpool_destroy_pool(pool->zpools[i]);
> >         kfree(pool);
> > @@ -1076,7 +1140,7 @@ static int zswap_writeback_entry(struct zswap_ent=
ry *entry,
> >
> >         /* try to allocate swap cache page */
> >         page =3D __read_swap_cache_async(swpentry, GFP_KERNEL, NULL, 0,
> > -                                      &page_was_allocated);
> > +                                      &page_was_allocated, true);
> >         if (!page) {
> >                 ret =3D -ENOMEM;
> >                 goto fail;
> > @@ -1142,7 +1206,6 @@ static int zswap_writeback_entry(struct zswap_ent=
ry *entry,
> >         /* start writeback */
> >         __swap_writepage(page, &wbc);
> >         put_page(page);
> > -       zswap_written_back_pages++;
> >
> >         return ret;
> >
> > @@ -1199,8 +1262,10 @@ bool zswap_store(struct folio *folio)
> >         struct scatterlist input, output;
> >         struct crypto_acomp_ctx *acomp_ctx;
> >         struct obj_cgroup *objcg =3D NULL;
> > +       struct mem_cgroup *memcg =3D NULL;
> >         struct zswap_pool *pool;
> >         struct zpool *zpool;
> > +       int lru_alloc_ret;
> >         unsigned int dlen =3D PAGE_SIZE;
> >         unsigned long handle, value;
> >         char *buf;
> > @@ -1230,15 +1295,15 @@ bool zswap_store(struct folio *folio)
> >                 zswap_invalidate_entry(tree, dupentry);
> >         }
> >         spin_unlock(&tree->lock);
> > -
> > -       /*
> > -        * XXX: zswap reclaim does not work with cgroups yet. Without a
> > -        * cgroup-aware entry LRU, we will push out entries system-wide=
 based on
> > -        * local cgroup limits.
> > -        */
> >         objcg =3D get_obj_cgroup_from_folio(folio);
> > -       if (objcg && !obj_cgroup_may_zswap(objcg))
> > -               goto reject;
> > +       if (objcg && !obj_cgroup_may_zswap(objcg)) {
> > +               memcg =3D get_mem_cgroup_from_objcg(objcg);
> > +               if (shrink_memcg(memcg)) {
> > +                       mem_cgroup_put(memcg);
> > +                       goto reject;
> > +               }
> > +               mem_cgroup_put(memcg);
> > +       }
> >
> >         /* reclaim space if needed */
> >         if (zswap_is_full()) {
> > @@ -1254,10 +1319,15 @@ bool zswap_store(struct folio *folio)
> >                         zswap_pool_reached_full =3D false;
> >         }
> >
> > +       pool =3D zswap_pool_current_get();
> > +       if (!pool)
> > +               goto reject;
> > +
>
> Why do we need to move zswap_pool_current_get() up here?
>
> >         /* allocate entry */
> > -       entry =3D zswap_entry_cache_alloc(GFP_KERNEL);
> > +       entry =3D zswap_entry_cache_alloc(GFP_KERNEL, page_to_nid(page)=
);
> >         if (!entry) {
> >                 zswap_reject_kmemcache_fail++;
> > +               zswap_pool_put(pool);
> >                 goto reject;
> >         }
> >
> > @@ -1269,6 +1339,7 @@ bool zswap_store(struct folio *folio)
> >                         entry->length =3D 0;
> >                         entry->value =3D value;
> >                         atomic_inc(&zswap_same_filled_pages);
> > +                       zswap_pool_put(pool);
> >                         goto insert_entry;
> >                 }
> >                 kunmap_atomic(src);
> > @@ -1278,9 +1349,15 @@ bool zswap_store(struct folio *folio)
> >                 goto freepage;
> >
> >         /* if entry is successfully added, it keeps the reference */
> > -       entry->pool =3D zswap_pool_current_get();
> > -       if (!entry->pool)
> > -               goto freepage;
> > +       entry->pool =3D pool;
> > +       if (objcg) {
> > +               memcg =3D get_mem_cgroup_from_objcg(objcg);
> > +               lru_alloc_ret =3D memcg_list_lru_alloc(memcg, &pool->li=
st_lru, GFP_KERNEL);
> > +               mem_cgroup_put(memcg);
> > +
> > +               if (lru_alloc_ret)
> > +                       goto freepage;
> > +       }
> >
> >         /* compress */
> >         acomp_ctx =3D raw_cpu_ptr(entry->pool->acomp_ctx);
> > @@ -1358,9 +1435,8 @@ bool zswap_store(struct folio *folio)
> >                 zswap_invalidate_entry(tree, dupentry);
> >         }
> >         if (entry->length) {
> > -               spin_lock(&entry->pool->lru_lock);
> > -               list_add(&entry->lru, &entry->pool->lru);
> > -               spin_unlock(&entry->pool->lru_lock);
> > +               INIT_LIST_HEAD(&entry->lru);
> > +               zswap_lru_add(&pool->list_lru, entry);
> >         }
> >         spin_unlock(&tree->lock);
> >
> > @@ -1373,8 +1449,8 @@ bool zswap_store(struct folio *folio)
> >
> >  put_dstmem:
> >         mutex_unlock(acomp_ctx->mutex);
> > -       zswap_pool_put(entry->pool);
> >  freepage:
> > +       zswap_pool_put(entry->pool);
> >         zswap_entry_cache_free(entry);
> >  reject:
> >         if (objcg)
> > @@ -1467,9 +1543,8 @@ bool zswap_load(struct folio *folio)
> >                 zswap_invalidate_entry(tree, entry);
> >                 folio_mark_dirty(folio);
> >         } else if (entry->length) {
> > -               spin_lock(&entry->pool->lru_lock);
> > -               list_move(&entry->lru, &entry->pool->lru);
> > -               spin_unlock(&entry->pool->lru_lock);
> > +               zswap_lru_del(&entry->pool->list_lru, entry);
> > +               zswap_lru_add(&entry->pool->list_lru, entry);
> >         }
> >         zswap_entry_put(tree, entry);
> >         spin_unlock(&tree->lock);
> > --
> > 2.34.1

I don't have (strong) opinions or (educated) guesses
on the rest.

