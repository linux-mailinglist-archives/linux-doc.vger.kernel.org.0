Return-Path: <linux-doc+bounces-20952-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F06C2934311
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jul 2024 22:14:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D0351F221C7
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jul 2024 20:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EF441849F3;
	Wed, 17 Jul 2024 20:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vimeo.com header.i=@vimeo.com header.b="Y0jY5jMl"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2B5184130
	for <linux-doc@vger.kernel.org>; Wed, 17 Jul 2024 20:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721247261; cv=none; b=Btw87+Wa8v0KHWv/5XAbNrbkIqxcW9cxnDFiXxDi5LnxUVVEgFFp2KMjzQQHVv0NIxXnxMD7gYI/dL4BKeeNj7tGkfomo8bMWwB+KdoRerc7DADQyMiPsVbDKMzLOkaC6M79EpWcD40l3nSpyizUfzWQJfBVPYEoaKjc/JUDKyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721247261; c=relaxed/simple;
	bh=/wnb4jXWgE2RA/H06/Y43g0/Ann5Vw+C0TKboaIx704=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JFatOgSFaWHPUkfWEUX14BaUwciiMmnQFS3fdLERqZejuVEA/pxnSHxiyxHEpvvOlPYtybQs8E1srsuP2lxn0XkXQRpnGcKC8xOexHc/iWRj423rCZds+MeV14fnSHNUIrGy3qYFTnQrWGHtKrwU+zT3cwkEdT8H1N+d04PuZ90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vimeo.com; spf=fail smtp.mailfrom=vimeo.com; dkim=pass (1024-bit key) header.d=vimeo.com header.i=@vimeo.com header.b=Y0jY5jMl; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vimeo.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=vimeo.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-78964fd9f2dso6532a12.3
        for <linux-doc@vger.kernel.org>; Wed, 17 Jul 2024 13:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vimeo.com; s=google; t=1721247259; x=1721852059; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+Rl51Pjux9AOX3fJ65ZFReyLBwLYFT1Ie5IA25miZs=;
        b=Y0jY5jMlMcKMqI/tHCbEW+C5N5841NedAG1rHzfDCZhIx5gqNlAh2rfjYJt4RBuclM
         1qdwEohYoEebUyFIqs1ws64L0a7u8kSEgYk7ULohPx0v1ua9zKaeCBs2n+bjs/KgUasi
         cwscqN6SkythTfhgyPwzfT95rVXr6WlyqMrIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721247259; x=1721852059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+Rl51Pjux9AOX3fJ65ZFReyLBwLYFT1Ie5IA25miZs=;
        b=UzPZjWOBv3Q2cW8SgOvvXf1FkLiZSlq71zQcoTAXZ/iR8iTzWkas1XWPYJyIQ5sQvn
         kOPiOqbYJrt53aA3kr5sZwUJFiYU6lprcTwK3aX3AG9UBcxnNqqjfEumurb+6euJCChv
         U7yW/EqLX8g3X4p0P9iarPwzlraWKiO7OSP3u51qZKi9jZYchdEHiB50KvrGPNQJzsP3
         q4jE0FR/ToMoLye6evcDo9VdJIqnMAzfLiRj+pd3dkolPHYD57r/XvZzijERYe9MuZp9
         i6YyIIXD3akXBQEW/nJy+HnI5mxdu7JPpQywX8NBBAYXHbhlrRNISmAxR44PovKWYivn
         CeaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmT1iCt4G8LY4m75G5jaQkIOhPs8GrwCJ5T+mUIKEmX1NOpBttJT5Nvhe3ziF6nqVo+2QhdMuzW+woOPAzgrIsnkAq2U7ooGHQ
X-Gm-Message-State: AOJu0Yy8RJ9dCNMau8g6nTuXtpupoE0SIykT4A5Qj8bMACJvkA1KSbEZ
	eT9Mp1qyXxI2mBexlOIyqzgre7UTjRMbPtLQsLCyrSejOhXNBPuGgrltTspLCTlSOzAh1/Fg9Ur
	l/ZuHzq+70w1d27sMmNNFHIK+rlBJZflAuS+dtg==
X-Google-Smtp-Source: AGHT+IFsqWciT6jPaa0Dlx43ECGt3R243m651jWcjSVnPUBqfjdJ7t0VIckH17rerVRQxJrGCfkyWyJXQjrE+BvHMWo=
X-Received: by 2002:a05:6a20:8423:b0:1c0:f6d5:be9a with SMTP id
 adf61e73a8af0-1c3fddc4176mr3946787637.36.1721247259155; Wed, 17 Jul 2024
 13:14:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715203625.1462309-1-davidf@vimeo.com> <20240715203625.1462309-2-davidf@vimeo.com>
 <ZpZ6IZL482XZT1fU@tiehlicka> <ZpajW9BKCFcCCTr-@slm.duckdns.org> <20240717170408.GC1321673@cmpxchg.org>
In-Reply-To: <20240717170408.GC1321673@cmpxchg.org>
From: David Finkel <davidf@vimeo.com>
Date: Wed, 17 Jul 2024 16:14:07 -0400
Message-ID: <CAFUnj5OA0KaC54M9vd8W+NZJwz5Jw25u-BStO=Bi2An=98Ruwg@mail.gmail.com>
Subject: Re: [PATCH] mm, memcg: cg2 memory{.swap,}.peak write handlers
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Tejun Heo <tj@kernel.org>, Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, core-services@vimeo.com, 
	Jonathan Corbet <corbet@lwn.net>, Roman Gushchin <roman.gushchin@linux.dev>, Shuah Khan <shuah@kernel.org>, 
	Zefan Li <lizefan.x@bytedance.com>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 1:04=E2=80=AFPM Johannes Weiner <hannes@cmpxchg.org=
> wrote:
>
> On Tue, Jul 16, 2024 at 06:44:11AM -1000, Tejun Heo wrote:
> > Hello,
> >
> > On Tue, Jul 16, 2024 at 03:48:17PM +0200, Michal Hocko wrote:
> > ...
> > > > This behavior is particularly useful for work scheduling systems th=
at
> > > > need to track memory usage of worker processes/cgroups per-work-ite=
m.
> > > > Since memory can't be squeezed like CPU can (the OOM-killer has
> > > > opinions), these systems need to track the peak memory usage to com=
pute
> > > > system/container fullness when binpacking workitems.
> >
> > Swap still has bad reps but there's nothing drastically worse about it =
than
> > page cache. ie. If you're under memory pressure, you get thrashing one =
way
> > or another. If there's no swap, the system is just memlocking anon memo=
ry
> > even when they are a lot colder than page cache, so I'm skeptical that =
no
> > swap + mostly anon + kernel OOM kills is a good strategy in general
> > especially given that the system behavior is not very predictable under=
 OOM
> > conditions.
> >
> > > As mentioned down the email thread, I consider usefulness of peak val=
ue
> > > rather limited. It is misleading when memory is reclaimed. But
> > > fundamentally I do not oppose to unifying the write behavior to reset
> > > values.
> >
> > The removal of resets was intentional. The problem was that it wasn't c=
lear
> > who owned those counters and there's no way of telling who reset what w=
hen.
> > It was easy to accidentally end up with multiple entities that think th=
ey
> > can get timed measurement by resetting.
> >
> > So, in general, I don't think this is a great idea. There are shortcomi=
ngs
> > to how memory.peak behaves in that its meaningfulness quickly declines =
over
> > time. This is expected and the rationale behind adding memory.peak, IIR=
C,
> > was that it was difficult to tell the memory usage of a short-lived cgr=
oup.
> >
> > If we want to allow peak measurement of time periods, I wonder whether =
we
> > could do something similar to pressure triggers - ie. let users registe=
r
> > watchers so that each user can define their own watch periods. This is =
more
> > involved but more useful and less error-inducing than adding reset to a
> > single counter.
> >
> > Johannes, what do you think?
>
> I'm also not a fan of the ability to reset globally.
>
> I seem to remember a scheme we discussed some time ago to do local
> state tracking without having the overhead in the page counter
> fastpath. The new data that needs to be tracked is a pc->local_peak
> (in the page_counter) and an fd->peak (in the watcher's file state).
>
> 1. Usage peak is tracked in pc->watermark, and now also in pc->local_peak=
.
>
> 2. Somebody opens the memory.peak. Initialize fd->peak =3D -1.
>
> 3. If they write, set fd->peak =3D pc->local_peak =3D usage.
>
> 4. Usage grows.
>
> 5. They read(). A conventional reader has fd->peak =3D=3D -1, so we retur=
n
>    pc->watermark. If the fd has been written to, return max(fd->peak, pc-=
>local_peak).
>
> 6. Usage drops.
>
> 7. New watcher opens and writes. Bring up all existing watchers'
>    fd->peak (that aren't -1) to pc->local_peak *iff* latter is bigger.
>    Then set the new fd->peak =3D pc->local_peak =3D current usage as in 3=
.
>
> 8. See 5. again for read() from each watcher.
>
> This way all fd's can arbitrarily start tracking new local peaks with
> write(). The operation in the charging fast path is cheap. The write()
> is O(existing_watchers), which seems reasonable. It's fully backward
> compatible with conventional open() + read() users.

That scheme seems viable, but it's a lot more work to implement and maintai=
n
than a simple global reset.

Since that scheme maintains a separate pc->local_peak, it's not mutually
exclusive with implementing a global reset now. (as long as we reserve a
way to distinguish the different kinds of writes).

As discussed on other sub-threads, this might be too niche to be worth
the significant complexity of avoiding a global reset. (especially when
users would likely be moving from cgroups v1 which does have a global reset=
)

Thanks,
--=20
David Finkel
Senior Principal Software Engineer, Core Services

