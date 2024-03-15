Return-Path: <linux-doc+bounces-12166-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A1887D089
	for <lists+linux-doc@lfdr.de>; Fri, 15 Mar 2024 16:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 596CDB2219A
	for <lists+linux-doc@lfdr.de>; Fri, 15 Mar 2024 15:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 984FC3FB09;
	Fri, 15 Mar 2024 15:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CuveZ4If"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15463D56A
	for <linux-doc@vger.kernel.org>; Fri, 15 Mar 2024 15:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710517451; cv=none; b=VnycqoLicZZX/LXcUfgEbqc4k0z46HmWrJRyA3fA3OqttY361wJmkeI8kkWeTsPXYSYIQGaJZxN+aqDx/NwA+GEklwoOVDqG8fq24jhyyoDO2dMEOqyFN3xeVbpUbF7zPmU2kwoJo0SNtelGUnp9FpWzubQ5peElA1vHWBy1nTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710517451; c=relaxed/simple;
	bh=jLfgDHVGzLGqs8bVPCHj+06YQWXtnZrPss4BVdlJYT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dNj1+3Vu/TlKGuP/Mi1bUfevI2MTA8HZZ/JJILHnIubrWrGZMASLJxPK6D6/XeKdA+cGmEmh3LtyJm7SpSofiyu8DVs25H7z/SZMWZjzsDOSn+bxSx+fD30xl7JnPoTnUhfW6sq+oz7XekSuV6FiRiYTlc6LBkdPo35VgKLqkBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CuveZ4If; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-609fd5fbe50so24105157b3.0
        for <linux-doc@vger.kernel.org>; Fri, 15 Mar 2024 08:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710517448; x=1711122248; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clGRLHEdZJU1hIbUHWzW6z0FfJkCL+OJ6aU0ekE5bnA=;
        b=CuveZ4IfV5kQDXH+CAWirCcaii3bADGJxgVLc6jqHl4FTjFyGvzddl2Ee9smHs/AHS
         5jJnqc+mlovvpWDYYeGnfnppr7WaUUJr8xLaWd/I2xtCu7W4nDTw4/keYzqErMlUIeUQ
         sKh/v3qiAhmtJTcFFrtnL9nC5FusXYg1zfYQij4XHy/UOwaOeRqOFZOUkoWlpfKPNfyY
         HOPyXxLakyA6kw496KCGvpVEtuEkKg6sSOx027xoCWK1KcnpbE81WPbzFendMPdppa45
         wPERflySncziLCUfYyClXbCakDb4p28YwUwn16DxU79D4VmRxU5Nrn8OH3OsNB7RWqvC
         18ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710517448; x=1711122248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clGRLHEdZJU1hIbUHWzW6z0FfJkCL+OJ6aU0ekE5bnA=;
        b=Mehfu02sLrwJFuH59OsmTcBV6kXdqIao8uE9mQPtDbTz4AOAj8/nDEbRUwkT4Kspcd
         tAfInuE3SUPlDZjR3+AuHZ/c0I7fr1dywPd+5BlzWwNI19oKGK6jOYFOfjL2VAwq5Bem
         hn16vPesfRMr+F8qeTcDmuZUl3Kzj5g6WoK3m9nr/tfsdDi6nGtDSmggbn2FjM7F6ze4
         odDLL8hSyzYb2W8W3UYRQ5ewDpTZFdMH9G1rCNVDVMX6MTV3DmXGdl7qUMk0cld+JVDI
         h+QqNNNQaOAL1AJbAahJ/kTRFD3p+3NT0zjVIq4H/CBccFbdR4X3ucRvnTirbU3Tm22J
         hNXA==
X-Forwarded-Encrypted: i=1; AJvYcCX0/FaDrqd8DrRppKUwPG9/+9KiTcJkFSXL9EPoBEObxuAPc+YV2GziO5vY1m755uSEa40InJ1qUsric1ER/bRGauagUZFCSNCE
X-Gm-Message-State: AOJu0YymFTN1xMGxdaqmIu16LiKNnzANUVaeN5p+pRYm1BpJIeQvliLP
	m5UZ4uPgiiGnu8mEKGUnrVemdPk0zdWzPB+pvz2LkuhQwbMxez5w/mBGSwSb+Qo9B5FLXg+mhj7
	S4CI4SzvNBqdYNcZoB5pGVGS+0ERIbRMeFx/Z
X-Google-Smtp-Source: AGHT+IGAJ13N7pVvU4k2+lrRs5QxLZCCWdNXmROcACjXHKoXZPNi1NEiRR6CnqJxwRRq0iV9XWDMKjHgawP1NzMi2X0=
X-Received: by 2002:a25:2fc2:0:b0:dd0:e439:cec6 with SMTP id
 v185-20020a252fc2000000b00dd0e439cec6mr4700323ybv.18.1710517447501; Fri, 15
 Mar 2024 08:44:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306182440.2003814-1-surenb@google.com> <20240306182440.2003814-24-surenb@google.com>
 <1f51ffe8-e5b9-460f-815e-50e3a81c57bf@suse.cz>
In-Reply-To: <1f51ffe8-e5b9-460f-815e-50e3a81c57bf@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 15 Mar 2024 08:43:53 -0700
Message-ID: <CAJuCfpE5mCXiGLHTm1a8PwLXrokexx9=QrrRF4fWVosTh5Q7BA@mail.gmail.com>
Subject: Re: [PATCH v5 23/37] mm/slab: add allocation accounting into slab
 allocation and free paths
To: Vlastimil Babka <vbabka@suse.cz>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, mhocko@suse.com, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	penguin-kernel@i-love.sakura.ne.jp, corbet@lwn.net, void@manifault.com, 
	peterz@infradead.org, juri.lelli@redhat.com, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, dennis@kernel.org, jhubbard@nvidia.com, tj@kernel.org, 
	muchun.song@linux.dev, rppt@kernel.org, paulmck@kernel.org, 
	pasha.tatashin@soleen.com, yosryahmed@google.com, yuzhao@google.com, 
	dhowells@redhat.com, hughd@google.com, andreyknvl@gmail.com, 
	keescook@chromium.org, ndesaulniers@google.com, vvvvvv@google.com, 
	gregkh@linuxfoundation.org, ebiggers@google.com, ytcoode@gmail.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, bristot@redhat.com, vschneid@redhat.com, cl@linux.com, 
	penberg@kernel.org, iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, 
	glider@google.com, elver@google.com, dvyukov@google.com, shakeelb@google.com, 
	songmuchun@bytedance.com, jbaron@akamai.com, aliceryhl@google.com, 
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com, 
	kernel-team@android.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 15, 2024 at 3:58=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> On 3/6/24 19:24, Suren Baghdasaryan wrote:
> > Account slab allocations using codetag reference embedded into slabobj_=
ext.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > Co-developed-by: Kent Overstreet <kent.overstreet@linux.dev>
> > Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
> > Reviewed-by: Kees Cook <keescook@chromium.org>
>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
>
> Nit below:
>
> > @@ -3833,6 +3913,7 @@ void slab_post_alloc_hook(struct kmem_cache *s, s=
truct obj_cgroup *objcg,
> >                         unsigned int orig_size)
> >  {
> >       unsigned int zero_size =3D s->object_size;
> > +     struct slabobj_ext *obj_exts;
> >       bool kasan_init =3D init;
> >       size_t i;
> >       gfp_t init_flags =3D flags & gfp_allowed_mask;
> > @@ -3875,6 +3956,12 @@ void slab_post_alloc_hook(struct kmem_cache *s, =
       struct obj_cgroup *objcg,
> >               kmemleak_alloc_recursive(p[i], s->object_size, 1,
> >                                        s->flags, init_flags);
> >               kmsan_slab_alloc(s, p[i], init_flags);
> > +             obj_exts =3D prepare_slab_obj_exts_hook(s, flags, p[i]);
> > +#ifdef CONFIG_MEM_ALLOC_PROFILING
> > +             /* obj_exts can be allocated for other reasons */
> > +             if (likely(obj_exts) && mem_alloc_profiling_enabled())
> > +                     alloc_tag_add(&obj_exts->ref, current->alloc_tag,=
 s->size);
> > +#endif
>
> I think you could still do this a bit better:
>
> Check mem_alloc_profiling_enabled() once before the whole block calling
> prepare_slab_obj_exts_hook() and alloc_tag_add()
> Remove need_slab_obj_ext() check from prepare_slab_obj_exts_hook()

Agree about checking mem_alloc_profiling_enabled() early and one time,
except I would like to use need_slab_obj_ext() instead of
mem_alloc_profiling_enabled() for that check. Currently they are
equivalent but if there are more slab_obj_ext users in the future then
there will be cases when we need to prepare_slab_obj_exts_hook() even
when mem_alloc_profiling_enabled()=3D=3Dfalse. need_slab_obj_ext() will be
easy to extend for such cases.
Thanks,
Suren.

>
> >       }
> >
> >       memcg_slab_post_alloc_hook(s, objcg, flags, size, p);
> > @@ -4353,6 +4440,7 @@ void slab_free(struct kmem_cache *s, struct slab =
*slab, void *object,
> >              unsigned long addr)
> >  {
> >       memcg_slab_free_hook(s, slab, &object, 1);
> > +     alloc_tagging_slab_free_hook(s, slab, &object, 1);
> >
> >       if (likely(slab_free_hook(s, object, slab_want_init_on_free(s))))
> >               do_slab_free(s, slab, object, object, 1, addr);
> > @@ -4363,6 +4451,7 @@ void slab_free_bulk(struct kmem_cache *s, struct =
slab *slab, void *head,
> >                   void *tail, void **p, int cnt, unsigned long addr)
> >  {
> >       memcg_slab_free_hook(s, slab, p, cnt);
> > +     alloc_tagging_slab_free_hook(s, slab, p, cnt);
> >       /*
> >        * With KASAN enabled slab_free_freelist_hook modifies the freeli=
st
> >        * to remove objects, whose reuse must be delayed.
>

