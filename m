Return-Path: <linux-doc+bounces-18456-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FE99061A9
	for <lists+linux-doc@lfdr.de>; Thu, 13 Jun 2024 04:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B24771F21416
	for <lists+linux-doc@lfdr.de>; Thu, 13 Jun 2024 02:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B33C33062;
	Thu, 13 Jun 2024 02:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t4SWGH7y"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FC72AE93
	for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2024 02:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718245127; cv=none; b=QS/xk6G42rvq2goRDre36dKB+nJ+EV+R9mekgN2hl2jWa+fE8hp7mqJpYrkXDYgaaITNBlPBKcUUgkK3audsfIKKg2vtjBwpYG5tpvCrSF7atIGBbQKGo0iMRr6RhzL4BCZVs0GJfPJdtSBQC/PfHpK2XfMSR5y5+qovIlLDcZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718245127; c=relaxed/simple;
	bh=/mWRmkzIysBdEAY04QxydbXxRhNTjjlwsLIad+cJVKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rsJgQp9jM8U++BX5wFx1JTVttoyoD1H7g4CyOB+PqavXDeQTCxswxsBBqo6JPSJgtbBJehZ+7kUgiHnFiMoKUVDgBXTtDmnYNHNhuuHe+7+78a63+KALm9leX8pWKa7LCi3TqFOJYj/lTUPZLc4F9aUlG0vYRa6C6HRSshkpLCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t4SWGH7y; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2eabd22d441so6076261fa.2
        for <linux-doc@vger.kernel.org>; Wed, 12 Jun 2024 19:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718245123; x=1718849923; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12rYDQECQwR2eWoCJ65xt9hG+fucIyD5JxR2TElJl4c=;
        b=t4SWGH7yBWFGOYwS8N8ZA3t4zCp2X5koTHe60b84FrgkrA2PddRMg96p8+zZijFeGA
         owm+c34mToD1eqdobOnpNA9V/3L3/VfBrX8ybmaKMmdYUMTb2h0p0EguG+OdR9Ir1ASR
         H4BWYn2iYAu/U4wjPAc+w/miTJO9kWfozVDaY8psFWbEqrapwXM2Wc/eb3aQC39USpPh
         VGsGuEhZV1CG0igdObf+9StY0fgmtISZKzBx3CVNUAH/q8vvblFDmTeJJyxCTkUEnxD3
         yiBZkDd+R9VW/CuwVvqdC1rpTlBwGiGA/EPMFPbo2JMpl645uYNKVteWN4x3tfEVtHNc
         qN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718245123; x=1718849923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=12rYDQECQwR2eWoCJ65xt9hG+fucIyD5JxR2TElJl4c=;
        b=KTPbc9PzadVnkI5bIyrGfW1ENwiBYQHvrulbR9zUeR2OBDTNF3jf/vMHSfQZjSCjdz
         U2Hsf+unZvFx3oYxy9FJX5vFIPLm70uDwH+9ZRCoxKucSxidAFSs8EkEibho+PbFbZ+T
         XSCjjd1w/02eCC1msJA8s/PGTNqIdjpZq+O0wqSugdoOgFQgO32LZIVPhKv7wtEUFdfP
         3wiKfi40m50cjQpy/PSWFQ25Twc4uJgqY+ky9BM6PhdBf3McgJOCr7IVIUxlHClCvZkb
         SkPxB2QRZsnU/0Vj555MyoEUiL+zzUgGpojhm+MCZb5EZmjlZEq01ULAOi5X8fPfmRHg
         c8ng==
X-Forwarded-Encrypted: i=1; AJvYcCWsOVqhRyJi/cBviiLVWms0FP/LyB+l7Qi8v8vnaqhJLe3yIwV74v97kAJXIuJQJ9RK4jPo2uYeBtSaL2OUb4DR5294phhAXKJD
X-Gm-Message-State: AOJu0YwrcI9fvysdD0ExiA4dZS08At9EwRqt1bYZoxocUlMI9s70x5rk
	eclhTD7sG+bfALUThWkHSuVqUPbkV4NlYbU40uk/18LsN946goP4iOVKrjmm8vrspqrQV+18QNA
	JEYPrA7YtHCbHUhp/mfep8ZbVg1pNsabwb+7e
X-Google-Smtp-Source: AGHT+IFU4l3WY9wL81p+yVuTlpyUuiNnuA0ZnMTCC1qXPf1EmUjm/ZVtjaVB9KB3C5PIpAeWSfa1KdjCeGTyVRLq/zA=
X-Received: by 2002:a05:651c:198c:b0:2eb:eb25:81f4 with SMTP id
 38308e7fff4ca-2ebfc9ab264mr31400101fa.6.1718245123334; Wed, 12 Jun 2024
 19:18:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240608155316.451600-1-flintglass@gmail.com> <20240608155316.451600-2-flintglass@gmail.com>
 <CAKEwX=P1Ojb71AEJ2gzQTrfWidFPcJZmoNxEwji7TceBN-szCg@mail.gmail.com>
 <CAPpoddeigM44jhTA8Ua=+J4MC1MikouBZVoPrCW2LZF+9r5YeA@mail.gmail.com>
 <CAJD7tkYp3GbuXV9G5bAZ1DetMmepV5ynciA+ukae7CKuxpXDJQ@mail.gmail.com> <CAPpoddfj1EdfXfTUT8bLaNxat0hYiE4X9=qG38gPgRgmmVOjcw@mail.gmail.com>
In-Reply-To: <CAPpoddfj1EdfXfTUT8bLaNxat0hYiE4X9=qG38gPgRgmmVOjcw@mail.gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Wed, 12 Jun 2024 19:18:05 -0700
Message-ID: <CAJD7tkZTSGz1bpo-pMNP_=11O-7RrhubWonqhUJwrt+TB=Ougg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] mm: zswap: fix global shrinker memcg iteration
To: Takero Funaki <flintglass@gmail.com>
Cc: Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Domenico Cerasuolo <cerasuolodomenico@gmail.com>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 7:13=E2=80=AFPM Takero Funaki <flintglass@gmail.com=
> wrote:
>
> 2024=E5=B9=B46=E6=9C=8813=E6=97=A5(=E6=9C=A8) 3:28 Yosry Ahmed <yosryahme=
d@google.com>:
> >
> > On Wed, Jun 12, 2024 at 11:16=E2=80=AFAM Takero Funaki <flintglass@gmai=
l.com> wrote:
> > >
> > > 2024=E5=B9=B46=E6=9C=8812=E6=97=A5(=E6=B0=B4) 3:26 Nhat Pham <nphamcs=
@gmail.com>:
> > >
> > > >
> > > > As I have noted in v0, I think this is unnecessary and makes it mor=
e confusing.
> > > >
> > >
> > > Does spin_lock() ensure that compiler optimizations do not remove
> > > memory access to an external variable? I think we need to use
> > > READ_ONCE/WRITE_ONCE for shared variable access even under a spinlock=
.
> > > For example,
> > > https://elixir.bootlin.com/linux/latest/source/mm/mmu_notifier.c#L234
> >
> > In this example, it seems like mmu_interval_set_seq() updates
> > interval_sub->invalidate_seq locklessly using WRITE_ONCE(). I think
> > this is why READ_ONCE() is required in that particular case.
> >
> > >
> > > isn't this a common use case of READ_ONCE?
> > > ```c
> > > bool shared_flag =3D false;
> > > spinlock_t flag_lock;
> > >
> > > void somefunc(void) {
> > >     for (;;) {
> > >         spin_lock(&flag_lock);
> > >         /* check external updates */
> > >         if (READ_ONCE(shared_flag))
> > >             break;
> > >         /* do something */
> > >         spin_unlock(&flag_lock);
> > >     }
> > >     spin_unlock(&flag_lock);
> > > }
> > > ```
> > > Without READ_ONCE, the check can be extracted from the loop by optimi=
zation.
> >
> > According to Documentation/memory-barriers.txt, lock acquiring
> > functions are implicit memory barriers. Otherwise, the compiler would
> > be able to pull any memory access outside of the lock critical section
> > and locking wouldn't be reliable.
>
> Ah, I understand now. The implicit barrier is sufficient as long as
> all memory access occurs within the lock. It=E2=80=99s a fundamental rule=
 of
> locking=E2=80=94facepalm.
>
> I misread a module code, like in the link, where a lockless write
> could invade a critical section. My example was in the opposite
> direction, just wrong. Thank you so much for clarifying my
> misunderstanding.
>
> For now checking the patch, I suppose the locking mechanism itself is
> not affected by my misunderstanding of READ_ONCE.
>
> The corrected version of the cleaner should be:
> ```c
> void zswap_memcg_offline_cleanup(struct mem_cgroup *memcg)
> {
>         /* lock out zswap shrinker walking memcg tree */
>         spin_lock(&zswap_shrink_lock);
>         if (zswap_next_shrink =3D=3D memcg) {
>                 do {
>                         zswap_next_shrink =3D mem_cgroup_iter(NULL,
>                                         zswap_next_shrink, NULL);
>                         spin_unlock(&zswap_shrink_lock);
>                         spin_lock(&zswap_shrink_lock);
>                         if (!zswap_next_shrink)
>                                 break;
>                 } while (!mem_cgroup_online(zswap_next_shrink));
>         }
>         spin_unlock(&zswap_shrink_lock);
> }
> ```

Is the idea here to avoid moving the iterator to another offline memcg
that zswap_memcg_offline_cleanup() was already called for, to avoid
holding a ref on that memcg until the next run of zswap shrinking?

If yes, I think it's probably worth doing. But why do we need to
release and reacquire the lock in the loop above?

