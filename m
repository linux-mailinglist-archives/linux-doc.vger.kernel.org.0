Return-Path: <linux-doc+bounces-4549-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E44F780AD8E
	for <lists+linux-doc@lfdr.de>; Fri,  8 Dec 2023 21:08:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2177A1C208CC
	for <lists+linux-doc@lfdr.de>; Fri,  8 Dec 2023 20:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B0A95639B;
	Fri,  8 Dec 2023 20:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4TGrS1ii"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBCA91999
	for <linux-doc@vger.kernel.org>; Fri,  8 Dec 2023 12:08:41 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a1e35c2807fso335091266b.3
        for <linux-doc@vger.kernel.org>; Fri, 08 Dec 2023 12:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702066120; x=1702670920; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gJZC0EyKvttCBBf5HAkTomUPMOr/jz8GF4pA5UwYK/U=;
        b=4TGrS1iizM52z+quB3GyBYTwEs1JfwGzagaKCLeMrR0AJK/y0hkFIY1QZ2ZDbw49q5
         eyeRlZO1bFL35kQjK91nizfl55dRVlIiAdlD6oASajPw4NtmrVYSUP53SL3O3EMTVJ20
         fMSg4sTBeAI+hDTFuviLFEVcGXtUjhHT7PgqpXTEKeLOhdcasP0Cz4HNEWof2lGCjI4M
         2PtFhxCBKfuD3hRvZ+LDeMJqB/YU1TxkIdrqINmb/9io0guQIKHMyiSJ3MOBNwid3cvM
         0nlp0KLcBLCZogmo8iY7KK6ifFtSY/H0nbq7tgXPHLE4D2FVwzj17T4LV12VnSgR1+30
         P6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702066120; x=1702670920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gJZC0EyKvttCBBf5HAkTomUPMOr/jz8GF4pA5UwYK/U=;
        b=UThK7vDli59p7+nQGBnUdAQb7FcgNuTmm+/REVmSSQw38KmQr78pWhuHTrF2aW/g9g
         2x9fqH0X24J76hAJWg4Nry+piuepF2IqxGcT6pOY08tqLj3AiMy9LRIoArMZkx084VVj
         spCL1Vni/w347VtCA8WGkonMt2quXRi/K7/ldOERMKEEkmTUIQbqksrvBM5LR5FW6dfF
         8ojpNCdRJKRjolhlWnPZfQi1PfQ08HOniKl/r3UlJyzv+CE0EW7rxUqKoxlCecTaNxOY
         flSQ4uAxgVX1RSu8xmRwcPl6aOy5WotE61E3yScpTB+ZmTy//OhOSvKL5Vesku9Ubfn6
         Eskg==
X-Gm-Message-State: AOJu0YxERKMypzK8rK2Nu5+lt5bq2Jef3g021oBeduMWhclcqIqO1zHT
	aa3fH8DVFLmhLp4jD7sNVB7YkxIU4bAV5PTwUCtAKA==
X-Google-Smtp-Source: AGHT+IHkFFLZL/c4MHgHs5F3I46EwT0tD6a6UVNJcBucWa4Lu7ouCBseZUF810qVxI1Nou+9gswS5JaDElxKGk/455s=
X-Received: by 2002:a17:907:31c3:b0:a19:a1ba:da2d with SMTP id
 xf3-20020a17090731c300b00a19a1bada2dmr307422ejb.84.1702066120030; Fri, 08 Dec
 2023 12:08:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207192406.3809579-1-nphamcs@gmail.com> <CAF8kJuPEKWbr_1a-OzqrYKSPmuty==KhC2vbTPAmm9xcJHo4cg@mail.gmail.com>
 <CAKEwX=Oj0Rur8i9Oo7y2Py7svx-g11sEj3GKQfMVL62x=4hvdA@mail.gmail.com>
 <CAJD7tkaHaji=0sVobJKajc4hOmOui2U+bZK+1DQ6gbAsQgGLRw@mail.gmail.com> <20231208163451.GA880930@cmpxchg.org>
In-Reply-To: <20231208163451.GA880930@cmpxchg.org>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Fri, 8 Dec 2023 12:08:00 -0800
Message-ID: <CAJD7tkZdf2NsSfuOvC1wynxjUoX+rFjyq_UBa0gRWf1UKFkpXA@mail.gmail.com>
Subject: Re: [PATCH v6] zswap: memcontrol: implement zswap writeback disabling
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Nhat Pham <nphamcs@gmail.com>, Chris Li <chrisl@kernel.org>, akpm@linux-foundation.org, 
	tj@kernel.org, lizefan.x@bytedance.com, cerasuolodomenico@gmail.com, 
	sjenning@redhat.com, ddstreet@ieee.org, vitaly.wool@konsulko.com, 
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeelb@google.com, 
	muchun.song@linux.dev, hughd@google.com, corbet@lwn.net, 
	konrad.wilk@oracle.com, senozhatsky@chromium.org, rppt@kernel.org, 
	linux-mm@kvack.org, kernel-team@meta.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, david@ixit.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 8, 2023 at 8:34=E2=80=AFAM Johannes Weiner <hannes@cmpxchg.org>=
 wrote:
>
> On Thu, Dec 07, 2023 at 05:12:13PM -0800, Yosry Ahmed wrote:
> > On Thu, Dec 7, 2023 at 5:03=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wr=
ote:
> > > On Thu, Dec 7, 2023 at 4:19=E2=80=AFPM Chris Li <chrisl@kernel.org> w=
rote:
> > > > I am wondering about the status of "memory.swap.tiers" proof of con=
cept patch?
> > > > Are we still on board to have this two patch merge together somehow=
 so
> > > > we can have
> > > > "memory.swap.tiers" =3D=3D "all" and "memory.swap.tiers" =3D=3D "zs=
wap" cover the
> > > > memory.zswap.writeback =3D=3D 1 and memory.zswap.writeback =3D=3D 0=
 case?
> > > >
> > > > Thanks
> > > >
> > > > Chris
> > > >
> > >
> > > Hi Chris,
> > >
> > > I briefly summarized my recent discussion with Johannes here:
> > >
> > > https://lore.kernel.org/all/CAKEwX=3DNwGGRAtXoNPfq63YnNLBCF0ZDOdLVRsv=
zUmYhK4jxzHA@mail.gmail.com/
> > >
> > > TL;DR is we acknowledge the potential usefulness of swap.tiers
> > > interface, but the use case is not quite there yet, so it does not
> > > make too much sense to build up that heavy machinery now.
> > > zswap.writeback is a more urgent need, and does not prevent swap.tier=
s
> > > if we do decide to implement it.
> >
> > I am honestly not convinced by this. There is no heavy machinery here.
> > The interface is more generic and extensible, but the implementation
> > is roughly the same. Unless we have a reason to think a swap.tiers
> > interface may make it difficult to extend this later or will not
> > support some use cases, I think we should go ahead with it. If we are
> > worried that "tiers" may not accurately describe future use cases, we
> > can be more generic and call it swap.types or something.
>
> I have to disagree. The generic swap types or tiers ideas actually
> look pretty far-fetched to me, and there is a lack of convincing
> explanation for why this is even a probable direction for swap.
>
> For example,
>
> 1. What are the other backends? Where you seem to see a multitude of
>    backends and arbitrary hierarchies of them, I see compression and
>    flash, and really not much else. And there is only one reasonable
>    direction in which to combine those two.
>
>    The IOPs and latencies of HDDs and network compared to modern
>    memory sizes and compute speeds make them for the most part
>    impractical as paging backends.
>
>    So I don't see a common third swap backend, let alone a fourth or a
>    fifth, or a multitude of meaningful ways of combining them...
>
> 2. Even if the usecases were there, enabling this would be a ton of
>    work and open interface questions:
>
>   1) There is no generic code to transfer pages between arbitrary
>      backends.
>
>   2) There is no accepted indirection model where a swap pte can refer
>      to backends dynamically, in a way that makes migration feasible
>      at scale.
>
>   3) Arbitrary global strings are somewhat unlikely to be accepted as
>      a way to configure these hierarchies.
>
>   4) Backend file paths in a global sysfs file don't work well with
>      namespacing. The swapfile could be in a container
>      namespace. Containers are not guaranteed to see /sys.
>
>   5) Fixed keywords like "zswap" might not be good enough - what about
>      compression and backend parameters?
>
> None of these are insurmountable. My point is that this would be a
> huge amount of prerequisite code and effort for what seems would be a
> fringe usecase at best right now.
>
> And there could be a lot of curve balls in both the software design as
> well as the hardware development between now and then that could make
> your proposals moot. Is a per-cgroup string file really going to be
> the right way to configure arbitrary hierarchies if they materialize?
>
> This strikes me as premature and speculative, for what could be, some
> day.

It is, and I agree with all your reasoning above. My thinking was that
if we create the file now, and we end up only supporting "all" and
"zswap" values (equivalent to memory.zswap.writeback), that's fine,
but if we can find a way to extend it, that would be nice. I honestly
didn't think that "zswap" as a keyword may be a problem later on.

>
> We don't even do it for *internal API*. There is a review rule to
> introduce a function in the same patch as its first caller, to make
> sure it's the right abstraction and a good fit for the usecase. There
> is no way we can have a lower bar than that for permanent ABI.
>
> The patch here integrates with what zswap is NOW and always has been:
> a compressing writeback cache for swap.
>
> Should multiple swap tiers overcome all the above and actually become
> real, this knob here would be the least of our worries. It would be
> easy to just ignore, automatically override, or deprecate.

My main concern was having two knobs with overlapping functionalities
at that point, and we would need to handle invalid combinations, or
make one of the knobs superior to the other one, which is not ideal.

Having said that, you are right that we are probably a long ways from
supporting more swap types anyway, and having two knobs wouldn't be a
blocker then, only a nuisance that we need to take into consideration.

I am fine with memory.zswap.writeback being merged as-is (as I
mentioned earlier), it would have just been nice if we could agree on
a more generic interface, but you thoroughly proved that it is too
early to do that.

Thanks!

