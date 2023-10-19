Return-Path: <linux-doc+bounces-635-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E56977CF94E
	for <lists+linux-doc@lfdr.de>; Thu, 19 Oct 2023 14:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 999CA282041
	for <lists+linux-doc@lfdr.de>; Thu, 19 Oct 2023 12:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5CE199A8;
	Thu, 19 Oct 2023 12:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wb4yZMFV"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C18619467
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 12:47:55 +0000 (UTC)
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDF56F7;
	Thu, 19 Oct 2023 05:47:53 -0700 (PDT)
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-581ed744114so1153021eaf.0;
        Thu, 19 Oct 2023 05:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697719673; x=1698324473; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTpU2GJS0iJKwr+DejD1SyjMobqh5RXzZFM0nPMlyiQ=;
        b=Wb4yZMFVpV6302Kaz1GFnY3+NzID71+thqOfjZjdqu4kkltn6j3Qxa4i8DBaY5gP+q
         d3jjMfXUbGM9XHMmEzKdcKo+vLMcv3xYn5SxnKRbPoPDH+dqhMxuiVYKVY7S8gd6NdcX
         BkYU0oUsgX3QX7IXWA4x5KWDgli5xCtFotsoE3eSk8IDmGApbYR1oXcUXijlK8uBw3XE
         umYRfjzvvUpsqVtTBPBtqd9YFu759twLERo0vg3S7Ru934GJ37V6x0jHZMv0kbVGLxaa
         5Ud2WTXfc86uKt1qMxniTRMqWusGt0xsuyHGAJDVzdHtF3q9hYis8OTfm3qcTsdUSO1t
         EC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697719673; x=1698324473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTpU2GJS0iJKwr+DejD1SyjMobqh5RXzZFM0nPMlyiQ=;
        b=Py13+ZVskUAhh4tmF64CvafwHIXjAAG9eQO5bx5X6IGGWoY1iAx5LtuoAErHLz68FC
         STE3MqPdLkHFpbxrpN2P5SZ5KmfSMUT9pc6B7rtS3MjABRlOpKgvvQXIB+ueXpB+qIBC
         sIy0WLnARgDBWz0vFhF5ibwoHkvl3FOQnwjluW+u1AuyE9sc6o2+p4O88I/rOtNuFj9d
         9Ow/Vnb5yJNoHVk4p8p2+kOK6wOtIAKeZHpRoZ8BPB9lF3xyv1Mhh3wVxA4V0VWWwR/m
         ArI3sdEdJbndN1yuLnq5cGo2Kxhk9L1vZc2i8s20dHWZ3IeGQvpb4eOg4EMQg67LchTg
         bBgA==
X-Gm-Message-State: AOJu0YzsPJXVy9t3mq9a24FeaciKlniPtGUNVq4P7LAKTW7pSt1a4vXO
	rOgpS7IqaLzFk3lXIYCW3h3eXEr01GflYPoEi8U=
X-Google-Smtp-Source: AGHT+IGsI5edFB7RtfCwgkr7TTohQ6JOMBTVyhQPj6TmiAmJ9v7o9ujOevVEED1TbCLyOrToyxjZH2ABsCvpmdSRL04=
X-Received: by 2002:a05:6358:455:b0:168:aed9:4806 with SMTP id
 21-20020a056358045500b00168aed94806mr83951rwe.22.1697719673117; Thu, 19 Oct
 2023 05:47:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231017232152.2605440-1-nphamcs@gmail.com> <20231017232152.2605440-3-nphamcs@gmail.com>
 <CAJD7tka2aVKBJj6cYutcVzOGzj_6gop6-ytSmWWML=sEe9qHbA@mail.gmail.com>
 <CAKEwX=N3CnKE+gu-EP98Wr3goQV0Z8fXn_nBPW_H_rupjkBwhA@mail.gmail.com> <CAJD7tkbBBTatK7LUHw__0K_8hykoepygfYLJuZx01CD8V+CZvg@mail.gmail.com>
In-Reply-To: <CAJD7tkbBBTatK7LUHw__0K_8hykoepygfYLJuZx01CD8V+CZvg@mail.gmail.com>
From: Domenico Cerasuolo <cerasuolodomenico@gmail.com>
Date: Thu, 19 Oct 2023 14:47:42 +0200
Message-ID: <CA+CLi1i9GHxMvMj16WPr7h_SNUhYo1rr9U8VtJDtOxiVhVznbg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] zswap: make shrinking memcg-aware
To: Yosry Ahmed <yosryahmed@google.com>
Cc: Nhat Pham <nphamcs@gmail.com>, akpm@linux-foundation.org, hannes@cmpxchg.org, 
	sjenning@redhat.com, ddstreet@ieee.org, vitaly.wool@konsulko.com, 
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeelb@google.com, 
	muchun.song@linux.dev, linux-mm@kvack.org, kernel-team@meta.com, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 19, 2023 at 3:12=E2=80=AFAM Yosry Ahmed <yosryahmed@google.com>=
 wrote:
>
> On Wed, Oct 18, 2023 at 4:47=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wro=
te:
> >
> > On Wed, Oct 18, 2023 at 4:20=E2=80=AFPM Yosry Ahmed <yosryahmed@google.=
com> wrote:
> > >
> > > On Tue, Oct 17, 2023 at 4:21=E2=80=AFPM Nhat Pham <nphamcs@gmail.com>=
 wrote:
> > > >
> > > > From: Domenico Cerasuolo <cerasuolodomenico@gmail.com>
> > > >
> > > > Currently, we only have a single global LRU for zswap. This makes i=
t
> > > > impossible to perform worload-specific shrinking - an memcg cannot
> > > > determine which pages in the pool it owns, and often ends up writin=
g
> > > > pages from other memcgs. This issue has been previously observed in
> > > > practice and mitigated by simply disabling memcg-initiated shrinkin=
g:
> > > >
> > > > https://lore.kernel.org/all/20230530232435.3097106-1-nphamcs@gmail.=
com/T/#u
> > > >
> > > > This patch fully resolves the issue by replacing the global zswap L=
RU
> > > > with memcg- and NUMA-specific LRUs, and modify the reclaim logic:
> > > >
> > > > a) When a store attempt hits an memcg limit, it now triggers a
> > > >    synchronous reclaim attempt that, if successful, allows the new
> > > >    hotter page to be accepted by zswap.
> > > > b) If the store attempt instead hits the global zswap limit, it wil=
l
> > > >    trigger an asynchronous reclaim attempt, in which an memcg is
> > > >    selected for reclaim in a round-robin-like fashion.
> > >
> > > Could you explain the rationale behind the difference in behavior her=
e
> > > between the global limit and the memcg limit?
> >
> > The global limit hit reclaim behavior was previously asynchronous too.
> > We just added the round-robin part because now the zswap LRU is
> > cgroup-aware :)
> >
> > For the cgroup limit hit, however, we cannot make it asynchronous,
> > as it is a bit hairy to add a per-cgroup shrink_work. So, we just
> > perform the reclaim synchronously.
> >
> > The question is whether it makes sense to make the global limit
> > reclaim synchronous too. That is a task of its own IMO.
>
> Let's add such context to the commit log, and perhaps an XXX comment
> in the code asking whether we should consider doing the reclaim
> synchronously for the global limit too.

Makes sense, I wonder if the original reason for switching from a synchrono=
us
to asynchronous reclaim will still be valid with the shrinker in place.

>
> >
> > (FWIW, this somewhat mirrors the direct reclaimer v.s kswapd
> > story to me, but don't quote me too hard on this).
> >
> [..]
> >
> > >
> > > >         /* Hold a reference to prevent a free during writeback */
> > > >         zswap_entry_get(entry);
> > > >         spin_unlock(&tree->lock);
> > > >
> > > > -       ret =3D zswap_writeback_entry(entry, tree);
> > > > +       writeback_result =3D zswap_writeback_entry(entry, tree);
> > > >
> > > >         spin_lock(&tree->lock);
> > > > -       if (ret) {
> > > > -               /* Writeback failed, put entry back on LRU */
> > > > -               spin_lock(&pool->lru_lock);
> > > > -               list_move(&entry->lru, &pool->lru);
> > > > -               spin_unlock(&pool->lru_lock);
> > > > +       if (writeback_result) {
> > > > +               zswap_reject_reclaim_fail++;
> > > > +               memcg =3D get_mem_cgroup_from_entry(entry);
> > > > +               spin_lock(lock);
> > > > +               /* we cannot use zswap_lru_add here, because it inc=
rements node's lru count */
> > > > +               list_lru_putback(&entry->pool->list_lru, item, entr=
y_to_nid(entry), memcg);
> > > > +               spin_unlock(lock);
> > > > +               mem_cgroup_put(memcg);
> > > > +               ret =3D LRU_RETRY;
> > > >                 goto put_unlock;
> > > >         }
> > > > +       zswap_written_back_pages++;
> > >
> > > Why is this moved here from zswap_writeback_entry()? Also why is
> > > zswap_reject_reclaim_fail incremented here instead of inside
> > > zswap_writeback_entry()?
> >
> > Domenico should know this better than me, but my understanding
> > is that moving it here protects concurrent modifications of
> > zswap_written_back_pages with the tree lock.
> >
> > Is writeback single-threaded in the past? This counter is non-atomic,
> > and doesn't seem to be protected by any locks...
> >
> > There definitely can be concurrent stores now though - with
> > a synchronous reclaim from cgroup-limit hit and another
> > from the old shrink worker.
> >
> > (and with the new zswap shrinker, concurrent reclaim is
> > the expectation!)
>
> The comment above the stats definition stats that they are left
> unprotected purposefully. If we want to fix that let's do it
> separately. If this patch makes it significantly worse such that it
> would cause a regression, let's at least do it in a separate patch.
> The diff here is too large already.
>
> >
> > zswap_reject_reclaim_fail was previously incremented in
> > shrink_worker I think. We need it to be incremented
> > for the shrinker as well, so might as well move it here.
>
> Wouldn't moving it inside zswap_writeback_entry() near incrementing
> zswap_written_back_pages make it easier to follow?

As Nhat said, zswap_reject_reclaim_fail++ had to be moved, I naturally move=
d it
here because it's where we act upon the result of the writeback. I then not=
iced
that zswap_written_back_pages++ was elsewhere and decided to move that as w=
ell
so that they're in the same place and at least they're under the tree lock.

It's not meant to fix the unprotected counters, it's just a mitigation sinc=
e we
are forced to move at least one of them.

