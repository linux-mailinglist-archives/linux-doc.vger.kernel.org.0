Return-Path: <linux-doc+bounces-43437-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4187EA91173
	for <lists+linux-doc@lfdr.de>; Thu, 17 Apr 2025 04:09:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B3135A30B2
	for <lists+linux-doc@lfdr.de>; Thu, 17 Apr 2025 02:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D1D1AB52F;
	Thu, 17 Apr 2025 02:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JzYLMow2"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4105118871F
	for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 02:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744855760; cv=none; b=eXNaLR0ghR+AybDIOlSRFG9kdCtHy/yYuhPuLZEaNDUEUWzyvhxHxhA8H/uLk4yEaCcc/xvL4igQrXv0Yli38pX3LshmDqyj16qf+1I/HIW4Dsi4PKhiCvmVZaNvVtWwG+DWzZRxezsX1VmbIZuf3v6IJV10jib4miVFq9qhf38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744855760; c=relaxed/simple;
	bh=KSelZMOHGBCAC6ffhylcs5ml2BXN3psxianAepa1Pw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KAnlYW/Q+Bsa8F89YyWNZHmnQxaKl1tlvQWax15MRTYH8l/VytkpXIStGmp/17RUWlZjXO4GliCJv7XqFK+UzLNow0uTpDTPjWi326QC1XESa/S82LrYfAd/PQmbGeuzjaMB38K+yd/wV2DPmyRnx9mSg+wiSg+KUFrVZW2M+R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JzYLMow2; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf3192d8bso20225e9.1
        for <linux-doc@vger.kernel.org>; Wed, 16 Apr 2025 19:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744855756; x=1745460556; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSelZMOHGBCAC6ffhylcs5ml2BXN3psxianAepa1Pw0=;
        b=JzYLMow2LkLFPXSefmx1gmC72CSr7O902d+IMLLKHcYAnh4cz8Z42hzFCxR278ZFOh
         rgTm2RhJ8s4j9zKTKcCTzvxUeqkG2ffMfGvV2NpV9o3YnmhZbd6HAWygJywKPPHOBQHT
         v6GIose+LN7ZeN91pXPT1Szt17BECGMYNYtx6/0mCaBNr13XKGiBlBj+5a5QNHqerh+x
         4QXhYYFltm1e2vCJOOijX/HmedyvwaQHIb4WuFedgAfA2W9bVYAgvet+0f1ILZloSDi+
         jgdGGbsEFNJwAzwz7c5kGbLAugnCQp+WN9XRSo8wN4tV3uHaAP2EiTZbCGdRkqhwKqmI
         TI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744855756; x=1745460556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KSelZMOHGBCAC6ffhylcs5ml2BXN3psxianAepa1Pw0=;
        b=Iu/b+XtRr/j8yajv+u0rQ5GqLiB1InDOVaaHDBADGiHbGs2Pv+g8g5UjqgvoLwPgTf
         gLU9dPfDZ0A/LgdfpGsjqeXdq9aQ1Y92IX7wFHf7IWfdBmJa4zWy5/JHY/4375x2PNuq
         wjCBFe4aTt4YKEVca/dPdydEtBEwxVYKhpRsOAxGe7BWtDiaEotliJRJ07RGZPqcKQV+
         873DdFZRr6GIDhWo+tD9wuocLsQbZ5Bha8/TqPnM+wMMH4IJRjn7ADkR0aIr0OeNOi4L
         rOgjN9uDkDSPofIu9F0pPfltAekRQGeGhEeQJvwX2Pzydq5zMPmpAQa+husUjWcrNTJr
         aLfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeMO6rGITbLGWMhXBnlyZj1sn746cY+1Hf74B0lhe3iGeIlPPFdisjHANG/nZJ+UBqGWPUabFAb7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3R4sVAqp5y+5IGBiAQ36/n2NVo3geB1EAD9WlUKdIwxNAdBR0
	oZyaazw4uG9IoYpWOYkkWWDh/oJ36o1Hkti6jCpEaYdKUKGw6VWODuEiRWmz+P0Svqx4hPra4uC
	0Q3282NEgF0VnG/jx63NmBqlpvODgtTAdASwx
X-Gm-Gg: ASbGncvdPmC/lFYPejVKhMWHZS/fixC/L3gD6BsCrFac5vX8uhcY8NG75UYrcwa5vZo
	xJS0ItaqxaGmHFyfbfBPaUm6EQVLm6ZfyjG7H8B8I8+NMrhAxoQaMauHoZw72jrMHe8vLXSDB84
	b9atOA/12CluqsejJxiik9K8nP40SIfFI=
X-Google-Smtp-Source: AGHT+IFrppytZV5cSJfrYgzaifTbDrHqkypNt5Bohd7JB9cXbxaDZ8Ylu35PtX/6cVUznzvu+dDy2IZggStg9q0OeRc=
X-Received: by 2002:a05:600c:3042:b0:439:9434:1b66 with SMTP id
 5b1f17b1804b1-44063d2802cmr294225e9.1.1744855756423; Wed, 16 Apr 2025
 19:09:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414225227.3642618-1-tjmercier@google.com>
 <20250414225227.3642618-3-tjmercier@google.com> <CAPhsuW6sgGvjeAcciskmGO7r6+eeDo_KVS3y7C8fCDPptzCebw@mail.gmail.com>
 <CABdmKX0bgxZFYuvQvQPK0AnAHEE3FebY_eA1+Vo=ScH1MbfzMg@mail.gmail.com>
 <CAPhsuW72Q2--E9tQQY8xADghTV6bYy9vHpFQoCWNh0V_QBWafA@mail.gmail.com>
 <CABdmKX1tDv3fSFURDN7=txFSbQ1xTjp8ZhLP8tFAvLcO9_-4_A@mail.gmail.com> <CAPhsuW7xvSYjWvy8K9Ev_tMwDRy2dpEiBcHYai3n-wAa0xvLow@mail.gmail.com>
In-Reply-To: <CAPhsuW7xvSYjWvy8K9Ev_tMwDRy2dpEiBcHYai3n-wAa0xvLow@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 16 Apr 2025 19:09:04 -0700
X-Gm-Features: ATxdqUFLL37LKBoNbpt1TbRt2xDWynqShrVasUjLiM1tjzZW-eK8x-aahsy-M1I
Message-ID: <CABdmKX1p0KgbipTSW1Ywi4bTBabQmsg21gA14Bp5atYHg8FeXQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] bpf: Add dmabuf iterator
To: Song Liu <song@kernel.org>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, android-mm@google.com, 
	simona@ffwll.ch, corbet@lwn.net, eddyz87@gmail.com, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	jolsa@kernel.org, mykolal@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 6:26=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> On Wed, Apr 16, 2025 at 4:40=E2=80=AFPM T.J. Mercier <tjmercier@google.co=
m> wrote:
> >
> > On Wed, Apr 16, 2025 at 4:08=E2=80=AFPM Song Liu <song@kernel.org> wrot=
e:
> > >
> > > On Wed, Apr 16, 2025 at 3:51=E2=80=AFPM T.J. Mercier <tjmercier@googl=
e.com> wrote:
> > > [...]
> > > > >
> > > > > IIUC, the iterator simply traverses elements in a linked list. I =
feel it is
> > > > > an overkill to implement a new BPF iterator for it.
> > > >
> > > > Like other BPF iterators such as kmem_cache_iter or task_iter.
> > > > Cgroup_iter iterates trees instead of lists. This is iterating over
> > > > kernel objects just like the docs say, "A BPF iterator is a type of
> > > > BPF program that allows users to iterate over specific types of ker=
nel
> > > > objects". More complicated iteration should not be a requirement he=
re.
> > > >
> > > > > Maybe we simply
> > > > > use debugging tools like crash or drgn for this? The access with
> > > > > these tools will not be protected by the mutex. But from my perso=
nal
> > > > > experience, this is not a big issue for user space debugging tool=
s.
> > > >
> > > > drgn is *way* too slow, and even if it weren't the dependencies for
> > > > running it aren't available. crash needs debug symbols which also
> > > > aren't available on user builds. This is not just for manual
> > > > debugging, it's for reporting memory use in production. Or anything
> > > > else someone might care to extract like attachment info or refcount=
s.
> > >
> > > Could you please share more information about the use cases and
> > > the time constraint here, and why drgn is too slow. Is most of the de=
lay
> > > comes from parsing DWARF? This is mostly for my curiosity, because
> > > I have been thinking about using drgn to do some monitoring in
> > > production.
> > >
> > > Thanks,
> > > Song
> >
> > These RunCommands have 10 second timeouts for example. It's rare that
> > I see them get exceeded but it happens occasionally.:
> > https://cs.android.com/android/platform/superproject/main/+/main:framew=
orks/native/cmds/dumpstate/dumpstate.cpp;drc=3D98bdc04b7658fde0a99403fc052d=
1d18e7d48ea6;l=3D2008
>
> Thanks for sharing this information.
>
> > The last time I used drgn (admittedly back in 2023) it took over a
> > minute to iterate through less than 200 cgroups. I'm not sure what the
> > root cause of the slowness was, but I'd expect the DWARF processing to
> > be done up-front once and the slowness I experienced was not just at
> > startup. Eventually I switched over to tracefs for that issue, which
> > we still use for some telemetry.
>
> I haven't tried drgn on Android. On server side, iterating should 200
> cgroups should be fairly fast (< 5 seconds, where DWARF parsing is
> the most expensive part).
>
> > Other uses are by statsd for telemetry, memory reporting on app kills
> > or death, and for "dumpsys meminfo".
>
> Here is another rookie question, it appears to me there is a file descrip=
tor
> associated with each DMA buffer, can we achieve the same goal with
> a task-file iterator?

That would find almost all of them, but not the kernel-only
allocations. (kernel_rss in the dmabuf_dump output I attached earlier.
If there's a leak, it's likely to show up in kernel_rss because some
driver forgot to release its reference(s).) Also wouldn't that be a
ton more iterations since we'd have to visit every FD to find the
small portion that are dmabufs? I'm not actually sure if buffers that
have been mapped, and then have had their file descriptors closed
would show up in task_struct->files; if not I think that would mean
scanning both files and vmas for each task.

