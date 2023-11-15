Return-Path: <linux-doc+bounces-1396-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9AB7DBF9A
	for <lists+linux-doc@lfdr.de>; Mon, 30 Oct 2023 19:16:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3113D1C20AF9
	for <lists+linux-doc@lfdr.de>; Mon, 30 Oct 2023 18:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846F319BAA;
	Mon, 30 Oct 2023 18:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CsgCQ/aR"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1BC19BA5
	for <linux-doc@vger.kernel.org>; Mon, 30 Oct 2023 18:16:52 +0000 (UTC)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41958FA
	for <linux-doc@vger.kernel.org>; Mon, 30 Oct 2023 11:16:48 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-53ed4688b9fso7377082a12.0
        for <linux-doc@vger.kernel.org>; Mon, 30 Oct 2023 11:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698689806; x=1699294606; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XNAE/3aC2lNL4lcg+U/6tDVAD81XY3dhOt1l+j+r1Y0=;
        b=CsgCQ/aRSI8oeNykPd1H3Vw1bU3hAd9V8Wgmag9klY8oNhYgz805J8JB47fDUwaLNy
         /d97sxUTzOdvBGXWrjqNCjbs5gkrwKk9OAA4Q5hNCGEExXMa22xCOIb6u3dkEopYKV74
         R6HBUhdiFKu9uzNeIFwK/gf3UWp4xFTK0GqC41YRi9e6YF+qx30rFlWi9pkB7dgvJchg
         j2ZuJmzoVwMacN0Jty1kpB4FL2im4MnaYBGOOzmwi4YOEOi0oCtZMMY4clJvlSAoeiZH
         FwQg8IjyNGeNCkc5/7lQh0SruYqybExeJhC1fKZVW6xATsAmY4xnI1z77m+dsUszz20j
         jeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698689806; x=1699294606;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNAE/3aC2lNL4lcg+U/6tDVAD81XY3dhOt1l+j+r1Y0=;
        b=ReAR+6HfC+Q0O/F6rUDjPN18syR3MQM747uiqZC3Du88DLKl8pVXked4L4tO/huPTe
         vpTUV6nDwHf7JVUOL+raeoncbJwuA+AKgLTPCzm5wXCsWOZpeFqEzEAcT/6EVVmvQ+md
         ZuKA04ijr0cfBsoYqAzIRHrdvT71cFmwoxk2IuQiIQlFXouBbrFBkV1RsuP7HOKkAGLj
         j3RrhaQP6BEMHPx7ewAfocm+gC5ahjaMobznQJEdQCkm9C/zFSrUk18hMapxduO4OYSx
         duL5iUo6V9J2zRcDc7UVKRaGOBg9tsskhNePOCP9tiB7OPOwT8GMjuIOW+G4zizA+5zL
         soig==
X-Gm-Message-State: AOJu0Yxe058QsbW5T0y3TKTnUzQ6JYucck0xftA3T8hnckqFP9y0W9HJ
	HlMKBkPmLk0nk+Uy5uisDWZU3jqvYzGPSwEi0wmXaw==
X-Google-Smtp-Source: AGHT+IENwS1N7Hx+TRzjhWYcV0enr0HvAOm8fD5bZdSc53hLpUYyGMmqwwxUWxQxThG/uKP/3FP8UjKuG236SN4+FF0=
X-Received: by 2002:a17:907:3f20:b0:9be:e278:4d47 with SMTP id
 hq32-20020a1709073f2000b009bee2784d47mr9500540ejc.27.1698689806504; Mon, 30
 Oct 2023 11:16:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231024203302.1920362-1-nphamcs@gmail.com> <20231024203302.1920362-3-nphamcs@gmail.com>
 <CAJD7tkZM4aOAwc4nRiU1PHofxHeZmV-NNGP5-E7X88ivRC7Pgw@mail.gmail.com> <CAKEwX=Nr7xJYpL2nE_ob0dWg9rnfoz67OMe_wvGsKjxboo1H+A@mail.gmail.com>
In-Reply-To: <CAKEwX=Nr7xJYpL2nE_ob0dWg9rnfoz67OMe_wvGsKjxboo1H+A@mail.gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Mon, 30 Oct 2023 11:16:10 -0700
Message-ID: <CAJD7tkZ7PPQmWu9UVH7WS3KFjmNW3q=JoMASmYtUb-Uy702iJg@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] zswap: make shrinking memcg-aware
To: Nhat Pham <nphamcs@gmail.com>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, cerasuolodomenico@gmail.com, 
	sjenning@redhat.com, ddstreet@ieee.org, vitaly.wool@konsulko.com, 
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeelb@google.com, 
	muchun.song@linux.dev, chrisl@kernel.org, linux-mm@kvack.org, 
	kernel-team@meta.com, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"

> > [..]
> > > +/*********************************
> > > +* lru functions
> > > +**********************************/
> > > +static bool zswap_lru_add(struct list_lru *list_lru, struct zswap_entry *entry)
> > > +{
> > > +       struct mem_cgroup *memcg = get_mem_cgroup_from_entry(entry);
> > > +       int nid = entry_to_nid(entry);
> > > +       bool added = list_lru_add(list_lru, &entry->lru, nid, memcg);
> > > +
> > > +       mem_cgroup_put(memcg);
> >
> > Still not fond of the get/put pattern but okay..
>
> Actually, Johannes and I took another look to see if we can replace
> the memcg reference getting with just rcu_read_lock().
>
> It seems there might be a race between zswap LRU manipulation
> and memcg offlining - not just with the rcu_read_lock() idea, but also
> with our current implementation!
>
> I'll shoot another email with more details later when I'm sure of it
> one way or another...
>

Interesting, well at least something came out of my complaining :)

> > [..]
> > > @@ -652,28 +679,37 @@ static int zswap_reclaim_entry(struct zswap_pool *pool)
> > >          */
> > >         swpoffset = swp_offset(entry->swpentry);
> > >         tree = zswap_trees[swp_type(entry->swpentry)];
> > > -       spin_unlock(&pool->lru_lock);
> > > +       list_lru_isolate(l, item);
> > > +       /*
> > > +        * It's safe to drop the lock here because we return either
> > > +        * LRU_REMOVED_RETRY or LRU_RETRY.
> > > +        */
> > > +       spin_unlock(lock);
> > >
> > >         /* Check for invalidate() race */
> > >         spin_lock(&tree->lock);
> > > -       if (entry != zswap_rb_search(&tree->rbroot, swpoffset)) {
> > > -               ret = -EAGAIN;
> > > +       if (entry != zswap_rb_search(&tree->rbroot, swpoffset))
> > >                 goto unlock;
> > > -       }
> > > +
> > >         /* Hold a reference to prevent a free during writeback */
> > >         zswap_entry_get(entry);
> > >         spin_unlock(&tree->lock);
> > >
> > > -       ret = zswap_writeback_entry(entry, tree);
> > > +       writeback_result = zswap_writeback_entry(entry, tree);
> > >
> > >         spin_lock(&tree->lock);
> > > -       if (ret) {
> > > -               /* Writeback failed, put entry back on LRU */
> > > -               spin_lock(&pool->lru_lock);
> > > -               list_move(&entry->lru, &pool->lru);
> > > -               spin_unlock(&pool->lru_lock);
> > > +       if (writeback_result) {
> > > +               zswap_reject_reclaim_fail++;
> > > +               memcg = get_mem_cgroup_from_entry(entry);
> >
> > Can this return NULL? Seems like we don't check the return in most/all places.
>
> I believe so, but memcg experts should fact check me on this.

If that's the case, there should be NULL checks, no?

> It's roughly the same pattern as zswap charging/uncharging:
>
> obj_cgroup_uncharge_zswap(entry->objcg, entry->length)
> -> getting memcg (under rcu_read_lock())
>
> >
> > > +               spin_lock(lock);
> > > +               /* we cannot use zswap_lru_add here, because it increments node's lru count */
> > > +               list_lru_putback(&entry->pool->list_lru, item, entry_to_nid(entry), memcg);
> >
> > Perhaps we can move this call with the memcg get/put to a helper like
> > add/del? (e.g. zswap_lru_putback)
> >
> > We would need to move get_mem_cgroup_from_entry() into the lock but I
> > think that's okay.
>
> We probably could, but that sounds like extra code for not a lot of gains, no?

I don't feel strongly, just a fan of consistency.

>
> >
> > > +               spin_unlock(lock);
> > > +               mem_cgroup_put(memcg);
> > > +               ret = LRU_RETRY;
> > >                 goto put_unlock;
> > >         }
> > > +       zswap_written_back_pages++;
> > >
> > >         /*
> > >          * Writeback started successfully, the page now belongs to the
[..]
> > > @@ -696,15 +759,17 @@ static void shrink_worker(struct work_struct *w)
> > >                                                 shrink_work);
> > >         int ret, failures = 0;
> > >
> > > +       /* global reclaim will select cgroup in a round-robin fashion. */
> > >         do {
> > > -               ret = zswap_reclaim_entry(pool);
> > > -               if (ret) {
> > > -                       zswap_reject_reclaim_fail++;
> > > -                       if (ret != -EAGAIN)
> > > -                               break;
> > > -                       if (++failures == MAX_RECLAIM_RETRIES)
> > > -                               break;
> > > -               }
> > > +               pool->next_shrink = mem_cgroup_iter(NULL, pool->next_shrink, NULL);
> >
> > I think this can be a problem. We hold a ref to a memcg here until the
> > next time we shrink, which can be a long time IIUC. This can cause the
> > memcg to linger as a zombie. I understand it is one memcg per-zswap
> > pool, but I am still unsure about it.
> >
> > MGLRU maintains a memcg LRU for global reclaim that gets properly
> > cleaned up when a memcg is going away, so that's one option, although
> > complicated.
> >
> > A second option would be to hold a pointer to the objcg instead, which
> > should be less problematic (although we are still holding that objcg
> > hostage indefinitely). The problem here is that if the objcg gets
> > reparented, next time we will start at the parent of the memcg we
> > stopped at last time, which tbh doesn't sound bad at all to me.
> >
> > A third option would be to flag the memcg such that when it is getting
> > offlined we can call into zswap to reset pool->next_shrink (or move it
> > to the parent) and drop the ref. Although synchronization can get
> > hairy when racing with offlining.
> >
> > Not sure what's the right solution, but I prefer we don't hold any
> > memcgs hostages indefinitely. I also think if we end up using
> > mem_cgroup_iter() then there should be a mem_cgroup_iter_break()
> > somewhere if/when breaking the iteration.
> >
>
> I'm not sure if this is that big of a problem in the first place, but
> if it is, doing something similar to MGLRU is probably the cleanest:
> when the memcg is freed, trigger the zswap_exit_memcg() callback,
> which will loop through all the zswap pools and update pool->next_shrink
> where appropriate.
>
> Note that we only have one pool per (compression algorithm x allocator)
> combinations, so there cannot be that many pools, correct?
>
> Johannes suggests this idea to me (my apologies if I butcher it)
> during one of our conversations. That sounds relatively easy IIUC.

Be careful that there will be a race between memcg offlining and
zswap's usage of pool->next_shrink. AFAICT there is no lock to prevent
offlining so there will have to be some sort of dance here to make
sure everything works correctly.

