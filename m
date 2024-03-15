Return-Path: <linux-doc+bounces-12171-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B6F87D271
	for <lists+linux-doc@lfdr.de>; Fri, 15 Mar 2024 18:09:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 444251C20B82
	for <lists+linux-doc@lfdr.de>; Fri, 15 Mar 2024 17:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B943B4F1EE;
	Fri, 15 Mar 2024 17:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rya3Xw3T"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F41E482C6
	for <linux-doc@vger.kernel.org>; Fri, 15 Mar 2024 17:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710522410; cv=none; b=AFuKqXeDTLMTRbIz3H8vIM+xNH/6bV9aWyksD6uv0ecGumgvd3CJ7ygWcC6hraWCLzX+MM5lZ39AyG0WKC9gprft03m0E255Dc7mXhS0AC/CSNNjn9PWkciiEDpxrLdB2Kwwe7ZspD7MlBQW6JTgJGt4zcTKosSsc946kGxJxBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710522410; c=relaxed/simple;
	bh=LNQjeHjDBEInTCwCSWcroDRYdeiq48Ic8r1TtkNrkfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=agr9uGWHRfg+5YNwvHA/x2Nuq0/PFnodiAyQBf4BA2BtMO5V4Da0xxFm/3H8HL40+NTi4U42ciF3M/YOZKAsZerI2+dVatug4Le1LS+7qTtLZWxlxc7mN4gScbfP6UGkuvq2Zi9l79enaUH8kYoWnYUoRzmzigr4UOuPuEH96ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rya3Xw3T; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dcc84ae94c1so2146420276.1
        for <linux-doc@vger.kernel.org>; Fri, 15 Mar 2024 10:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710522406; x=1711127206; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rC572A3yia7X47ZYtWd+ymj431bX9Z5tiP3vPmrWrg8=;
        b=rya3Xw3T8AljDIaTfGNOGJm/xQWnLA6e+ZFuT6jbITv9/8xLt5COBXTWischjeSkEL
         rnMXSbvPATe554rW5eGDTfCeeFdaD8nW3JAf8wT82TppRYwdT3x72FYEM738kQxk97j2
         e9SQrSQ3+Dv3JdQBc6bOako7jAkylCOdV8OdcNqwCOXaPTCgLB0mE/CLtbe6dazWnTNU
         GWnZ7sT7bqE8I/nC8Nv3G6fWRL9v18fMNEpYC8lc2MPPJe02fKAMilCfnaHzYjv+Z3J4
         X2rTSGjpnkKyZX0B1/1JDuTfEU2y628Levs1yUskk//5ZUR2/QtZsttHAEYggz+fXfHu
         w47g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710522406; x=1711127206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rC572A3yia7X47ZYtWd+ymj431bX9Z5tiP3vPmrWrg8=;
        b=C1nSrfQrFYjMS7nM2h1xyNO92UWHzAPB2NxnRb9SIeE5lvaUE1gLGG4pfo2fnxk7HQ
         4KUuU2yDNnRrQtC330Abu/AX1B50I31Tz2VUwZB0rgPJmVGNjUEwkG6KBMyMrWx/6iQT
         0Ha7+KAYVARs9mFEkK6NDEZgaeRrj7cVJqSZkXtYjCMf/k3gOxR1h3234q5HbX2T4JLw
         ueK5swrUREsHqTRSDTD8W+ANJz5ZPwd8n4S2JHqLDL3hpGb0JilqgteECR/GcnhK/6/4
         Dz7R2t/nACTHxMv9FeTGabylki2HVU7S+WJGyhoVyrQpjKO+K66s1VeoqSt0MmPeQfVF
         lYuA==
X-Forwarded-Encrypted: i=1; AJvYcCW7fM1hLED1yUolNwdwpxukB229nuYjM7gH1z8R6tKPPahYVIiXaB/YL/mlcpnOgPL6ktBZT2XXtsBpZC5iUqUQsY6CsT/E4Hhj
X-Gm-Message-State: AOJu0YwSJA07CLeECu05jYo7ztq94t3FzfRl1X+hodAM7SWBgkyTGn8D
	eNU5tu7pANF1R16PWy6MMJVWAxuXc8u1+ZpfXxZO4ejkXgX5IjMhG+3zz7+BwWchavU6ElFOyY7
	MhpqWIdclRtXIXgFzrZl/EAk/AZ+pj/VH+8kU
X-Google-Smtp-Source: AGHT+IG+SAoqNcEaTJHB1lafvOscPKTA59uq+i5wvMJxRbkvSwmj0DhtE9DM8+iuZUaegEqULpfsbKdPtUWThZDcacY=
X-Received: by 2002:a25:dbca:0:b0:dcc:273e:1613 with SMTP id
 g193-20020a25dbca000000b00dcc273e1613mr5471648ybf.40.1710522405619; Fri, 15
 Mar 2024 10:06:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306182440.2003814-1-surenb@google.com> <20240306182440.2003814-24-surenb@google.com>
 <1f51ffe8-e5b9-460f-815e-50e3a81c57bf@suse.cz> <CAJuCfpE5mCXiGLHTm1a8PwLXrokexx9=QrrRF4fWVosTh5Q7BA@mail.gmail.com>
 <e6e96b64-01b1-4e23-bb0b-45438f9a6cc4@suse.cz>
In-Reply-To: <e6e96b64-01b1-4e23-bb0b-45438f9a6cc4@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 15 Mar 2024 17:06:32 +0000
Message-ID: <CAJuCfpEsAHSAUP_EFP4yZdyZ1hfVPbQSWn9j-eZQdiRLy5MGYg@mail.gmail.com>
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

On Fri, Mar 15, 2024 at 4:52=E2=80=AFPM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> On 3/15/24 16:43, Suren Baghdasaryan wrote:
> > On Fri, Mar 15, 2024 at 3:58=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz=
> wrote:
> >>
> >> On 3/6/24 19:24, Suren Baghdasaryan wrote:
> >> > Account slab allocations using codetag reference embedded into slabo=
bj_ext.
> >> >
> >> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> >> > Co-developed-by: Kent Overstreet <kent.overstreet@linux.dev>
> >> > Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
> >> > Reviewed-by: Kees Cook <keescook@chromium.org>
> >>
> >> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> >>
> >> Nit below:
> >>
> >> > @@ -3833,6 +3913,7 @@ void slab_post_alloc_hook(struct kmem_cache *s=
, struct obj_cgroup *objcg,
> >> >                         unsigned int orig_size)
> >> >  {
> >> >       unsigned int zero_size =3D s->object_size;
> >> > +     struct slabobj_ext *obj_exts;
> >> >       bool kasan_init =3D init;
> >> >       size_t i;
> >> >       gfp_t init_flags =3D flags & gfp_allowed_mask;
> >> > @@ -3875,6 +3956,12 @@ void slab_post_alloc_hook(struct kmem_cache *=
s,        struct obj_cgroup *objcg,
> >> >               kmemleak_alloc_recursive(p[i], s->object_size, 1,
> >> >                                        s->flags, init_flags);
> >> >               kmsan_slab_alloc(s, p[i], init_flags);
> >> > +             obj_exts =3D prepare_slab_obj_exts_hook(s, flags, p[i]=
);
> >> > +#ifdef CONFIG_MEM_ALLOC_PROFILING
> >> > +             /* obj_exts can be allocated for other reasons */
> >> > +             if (likely(obj_exts) && mem_alloc_profiling_enabled())
>
> Could you at least flip these two checks then so the static key one goes =
first?

Yes, definitely. I was thinking about removing need_slab_obj_ext()
from prepare_slab_obj_exts_hook() and adding this instead of the above
code:

+        if (need_slab_obj_ext()) {
+                obj_exts =3D prepare_slab_obj_exts_hook(s, flags, p[i]);
+#ifdef CONFIG_MEM_ALLOC_PROFILING
+                /*
+                 * Currently obj_exts is used only for allocation
profiling. If other users appear
+                 * then mem_alloc_profiling_enabled() check should be
added here.
+                 */
+                if (likely(obj_exts))
+                        alloc_tag_add(&obj_exts->ref,
current->alloc_tag, s->size);
+#endif
+        }

Does that look good?

> >> > +#ifdef CONFIG_MEM_ALLOC_PROFILING
> >> > +             /* obj_exts can be allocated for other reasons */
> >> > +             if (likely(obj_exts) && mem_alloc_profiling_enabled())
>
> >> > +                     alloc_tag_add(&obj_exts->ref, current->alloc_t=
ag, s->size);
> >> > +#endif
> >>
> >> I think you could still do this a bit better:
> >>
> >> Check mem_alloc_profiling_enabled() once before the whole block callin=
g
> >> prepare_slab_obj_exts_hook() and alloc_tag_add()
> >> Remove need_slab_obj_ext() check from prepare_slab_obj_exts_hook()
> >
> > Agree about checking mem_alloc_profiling_enabled() early and one time,
> > except I would like to use need_slab_obj_ext() instead of
> > mem_alloc_profiling_enabled() for that check. Currently they are
> > equivalent but if there are more slab_obj_ext users in the future then
> > there will be cases when we need to prepare_slab_obj_exts_hook() even
> > when mem_alloc_profiling_enabled()=3D=3Dfalse. need_slab_obj_ext() will=
 be
> > easy to extend for such cases.
>
> I thought we don't generally future-proof internal implementation details
> like this until it's actually needed. But at least what I suggested above
> would help, thanks.
>
> > Thanks,
> > Suren.
> >
> >>
> >> >       }
> >> >
> >> >       memcg_slab_post_alloc_hook(s, objcg, flags, size, p);
> >> > @@ -4353,6 +4440,7 @@ void slab_free(struct kmem_cache *s, struct sl=
ab *slab, void *object,
> >> >              unsigned long addr)
> >> >  {
> >> >       memcg_slab_free_hook(s, slab, &object, 1);
> >> > +     alloc_tagging_slab_free_hook(s, slab, &object, 1);
> >> >
> >> >       if (likely(slab_free_hook(s, object, slab_want_init_on_free(s)=
)))
> >> >               do_slab_free(s, slab, object, object, 1, addr);
> >> > @@ -4363,6 +4451,7 @@ void slab_free_bulk(struct kmem_cache *s, stru=
ct slab *slab, void *head,
> >> >                   void *tail, void **p, int cnt, unsigned long addr)
> >> >  {
> >> >       memcg_slab_free_hook(s, slab, p, cnt);
> >> > +     alloc_tagging_slab_free_hook(s, slab, p, cnt);
> >> >       /*
> >> >        * With KASAN enabled slab_free_freelist_hook modifies the fre=
elist
> >> >        * to remove objects, whose reuse must be delayed.
> >>
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kernel-team+unsubscribe@android.com.
>

