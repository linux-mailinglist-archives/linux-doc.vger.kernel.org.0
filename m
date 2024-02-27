Return-Path: <linux-doc+bounces-10889-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0448E869BB9
	for <lists+linux-doc@lfdr.de>; Tue, 27 Feb 2024 17:13:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85D621F26A00
	for <lists+linux-doc@lfdr.de>; Tue, 27 Feb 2024 16:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559CD148FF4;
	Tue, 27 Feb 2024 16:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PUWcFHPw"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2F614830B
	for <linux-doc@vger.kernel.org>; Tue, 27 Feb 2024 16:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709050356; cv=none; b=aSBtMzFVClplU7JPCDYGZM+UMidiuzmUTXKoKwjoDxSqKsKxYWdPiVTQ4B/bYKCHcYThA+JccHnsqFa0v03p0XH5z2B4etIPVxzvgYgf5hSGbQc7CVIUIaYrrLioiday6NKkeQ+C+IZhLlg9VWe426gHCUQ+QQs6I24F4FenQV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709050356; c=relaxed/simple;
	bh=ZWFzHKUaRbx0c3fmxooFMoXF2H6+yVg0x+0ZAiLEH/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DyM2idgzsxaPfP9XFsyi4pT05pCLn/GW+DGoCX7F8DwV8nCJaVgh2zsQoGiMo3fyMcQVpRCy8fZ5WrYJkom9eXyqQSmcRP2zsjncX5hpuu6v9anX+NUp0UR7s69u0YjNsgPVBZrmlYkMOAewJtVtixoXvhuYIH0lVsXUrt+aP7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PUWcFHPw; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dc6cbe1ac75so3674393276.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Feb 2024 08:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709050352; x=1709655152; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dNhcz6LZWcGFo7q9Dz7N+i5BDAre97NpDL4CFWNtFMg=;
        b=PUWcFHPwUvts/sXmJS1/gFYosjNmXYHGiV7wQflb0VtJ8xS7gfFgo3Lr90GndRugWd
         jE16e2EC+uD/HYhhgBxpk7ag9r99UttGmXaWLi3U4jqsdZUOTobG9P2KygdxC2DVFzrA
         IB25E6FI4sOZgcU4bwPSDKLqw9AkE02L54b01Mu1VEc4BkDDXmB5zuMIL+AHxZxpx4q5
         TKtl2VIc9cEulhop/enWiZllb8ZKLerrRKlWDhann1+vyoUS1E4RtseL4pq6ZoT6bM/5
         n+LIimEpoZGSbUdpM1uZRWWgPBstOsfvoxXm9PIf7KlnTqjX+F8iMu6Oz3Pb4gFXsIy9
         lTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709050352; x=1709655152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dNhcz6LZWcGFo7q9Dz7N+i5BDAre97NpDL4CFWNtFMg=;
        b=I4PyrFxoVkosVPSmaK2FitP4yv77jlODh5UJPvNKO5OBmeXeer1+U5MnwrFR/bHwdO
         pIKQDPXzTC1Z//7WhOKhn4RwwHQreOILio9mPcj76x3ZU27R2XSuhWM+V39dGUJjY5Ge
         StQXzKhoTkaqdmu/NHxPKrauBee2Q1C8u8hY285xHX1IZY1YsyKdslly5e6j08UKLSj4
         rkW7pNlaLsX2t+vpeIqQ7A/br7HapNe3U8HXE1lYg0F4kDm3aJ9mI3GsmFJ3DVvbLFal
         OAMmrqun5pLlB0L+rWtcsfqk8bxscNO0HldwplRoNFgizJW3AbA85v/99VFDV1NJ94Jm
         jQIA==
X-Forwarded-Encrypted: i=1; AJvYcCV7vqhKP4I12Tud3ZfhVECz7ZMxVaXYivRtQATPu4TLtBkc7/5AR/NdfwXWBJYlVOTJVH6/XJ8MDZdYOM9Y/rGouPKKj+LKgNwM
X-Gm-Message-State: AOJu0YwbKoemA+QwXr0roOL8IoG6fyAxmX7WlVolfDCyaBWqlEP24JU7
	9dRKVF1VKalIVPJxHZBrg9xzKiOkBxdWKilRDy47E+UWKniSJxYtBoTWxl/9xxIXuOEGO6j3EEC
	wX2erqRc66mWysykPxcvQuhEWUT2VmVQmvQ8D
X-Google-Smtp-Source: AGHT+IE3Ib/dLAymrmwvQkYDzdp8TQ37Go/G2wnHE4Xm/9+fqP9Mn0SYQYjmra6zLBDtJRxXpTmBRSRRYI9tV7m3olM=
X-Received: by 2002:a25:c501:0:b0:dc2:2f3f:2148 with SMTP id
 v1-20020a25c501000000b00dc22f3f2148mr1714724ybe.29.1709050352173; Tue, 27 Feb
 2024 08:12:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221194052.927623-1-surenb@google.com> <20240221194052.927623-32-surenb@google.com>
 <ae4f9958-813a-42c8-8e54-4ef19fd36d6c@suse.cz>
In-Reply-To: <ae4f9958-813a-42c8-8e54-4ef19fd36d6c@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 27 Feb 2024 08:12:21 -0800
Message-ID: <CAJuCfpFnqGLj2L5QdnMWYxX6ENqc0Gnkc3pjURu7CmGtNMhE1g@mail.gmail.com>
Subject: Re: [PATCH v4 31/36] lib: add memory allocations report in show_mem()
To: Vlastimil Babka <vbabka@suse.cz>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, mhocko@suse.com, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	penguin-kernel@i-love.sakura.ne.jp, corbet@lwn.net, void@manifault.com, 
	peterz@infradead.org, juri.lelli@redhat.com, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org, muchun.song@linux.dev, 
	rppt@kernel.org, paulmck@kernel.org, pasha.tatashin@soleen.com, 
	yosryahmed@google.com, yuzhao@google.com, dhowells@redhat.com, 
	hughd@google.com, andreyknvl@gmail.com, keescook@chromium.org, 
	ndesaulniers@google.com, vvvvvv@google.com, gregkh@linuxfoundation.org, 
	ebiggers@google.com, ytcoode@gmail.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	bristot@redhat.com, vschneid@redhat.com, cl@linux.com, penberg@kernel.org, 
	iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com, 
	elver@google.com, dvyukov@google.com, shakeelb@google.com, 
	songmuchun@bytedance.com, jbaron@akamai.com, rientjes@google.com, 
	minchan@google.com, kaleshsingh@google.com, kernel-team@android.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-arch@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 5:18=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> On 2/21/24 20:40, Suren Baghdasaryan wrote:
> > Include allocations in show_mem reports.
> >
> > Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
>
> Nit: there's pr_notice() that's shorter than printk(KERN_NOTICE

I used printk() since other parts of show_mem() used it but I can
change if that's preferable.

>
> > ---
> >  include/linux/alloc_tag.h |  7 +++++++
> >  include/linux/codetag.h   |  1 +
> >  lib/alloc_tag.c           | 38 ++++++++++++++++++++++++++++++++++++++
> >  lib/codetag.c             |  5 +++++
> >  mm/show_mem.c             | 26 ++++++++++++++++++++++++++
> >  5 files changed, 77 insertions(+)
> >
> > diff --git a/include/linux/alloc_tag.h b/include/linux/alloc_tag.h
> > index 29636719b276..85a24a027403 100644
> > --- a/include/linux/alloc_tag.h
> > +++ b/include/linux/alloc_tag.h
> > @@ -30,6 +30,13 @@ struct alloc_tag {
> >
> >  #ifdef CONFIG_MEM_ALLOC_PROFILING
> >
> > +struct codetag_bytes {
> > +     struct codetag *ct;
> > +     s64 bytes;
> > +};
> > +
> > +size_t alloc_tag_top_users(struct codetag_bytes *tags, size_t count, b=
ool can_sleep);
> > +
> >  static inline struct alloc_tag *ct_to_alloc_tag(struct codetag *ct)
> >  {
> >       return container_of(ct, struct alloc_tag, ct);
> > diff --git a/include/linux/codetag.h b/include/linux/codetag.h
> > index bfd0ba5c4185..c2a579ccd455 100644
> > --- a/include/linux/codetag.h
> > +++ b/include/linux/codetag.h
> > @@ -61,6 +61,7 @@ struct codetag_iterator {
> >  }
> >
> >  void codetag_lock_module_list(struct codetag_type *cttype, bool lock);
> > +bool codetag_trylock_module_list(struct codetag_type *cttype);
> >  struct codetag_iterator codetag_get_ct_iter(struct codetag_type *cttyp=
e);
> >  struct codetag *codetag_next_ct(struct codetag_iterator *iter);
> >
> > diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> > index cb5adec4b2e2..ec54f29482dc 100644
> > --- a/lib/alloc_tag.c
> > +++ b/lib/alloc_tag.c
> > @@ -86,6 +86,44 @@ static const struct seq_operations allocinfo_seq_op =
=3D {
> >       .show   =3D allocinfo_show,
> >  };
> >
> > +size_t alloc_tag_top_users(struct codetag_bytes *tags, size_t count, b=
ool can_sleep)
> > +{
> > +     struct codetag_iterator iter;
> > +     struct codetag *ct;
> > +     struct codetag_bytes n;
> > +     unsigned int i, nr =3D 0;
> > +
> > +     if (can_sleep)
> > +             codetag_lock_module_list(alloc_tag_cttype, true);
> > +     else if (!codetag_trylock_module_list(alloc_tag_cttype))
> > +             return 0;
> > +
> > +     iter =3D codetag_get_ct_iter(alloc_tag_cttype);
> > +     while ((ct =3D codetag_next_ct(&iter))) {
> > +             struct alloc_tag_counters counter =3D alloc_tag_read(ct_t=
o_alloc_tag(ct));
> > +
> > +             n.ct    =3D ct;
> > +             n.bytes =3D counter.bytes;
> > +
> > +             for (i =3D 0; i < nr; i++)
> > +                     if (n.bytes > tags[i].bytes)
> > +                             break;
> > +
> > +             if (i < count) {
> > +                     nr -=3D nr =3D=3D count;
> > +                     memmove(&tags[i + 1],
> > +                             &tags[i],
> > +                             sizeof(tags[0]) * (nr - i));
> > +                     nr++;
> > +                     tags[i] =3D n;
> > +             }
> > +     }
> > +
> > +     codetag_lock_module_list(alloc_tag_cttype, false);
> > +
> > +     return nr;
> > +}
> > +
> >  static void __init procfs_init(void)
> >  {
> >       proc_create_seq("allocinfo", 0444, NULL, &allocinfo_seq_op);
> > diff --git a/lib/codetag.c b/lib/codetag.c
> > index b13412ca57cc..7b39cec9648a 100644
> > --- a/lib/codetag.c
> > +++ b/lib/codetag.c
> > @@ -36,6 +36,11 @@ void codetag_lock_module_list(struct codetag_type *c=
ttype, bool lock)
> >               up_read(&cttype->mod_lock);
> >  }
> >
> > +bool codetag_trylock_module_list(struct codetag_type *cttype)
> > +{
> > +     return down_read_trylock(&cttype->mod_lock) !=3D 0;
> > +}
> > +
> >  struct codetag_iterator codetag_get_ct_iter(struct codetag_type *cttyp=
e)
> >  {
> >       struct codetag_iterator iter =3D {
> > diff --git a/mm/show_mem.c b/mm/show_mem.c
> > index 8dcfafbd283c..1e41f8d6e297 100644
> > --- a/mm/show_mem.c
> > +++ b/mm/show_mem.c
> > @@ -423,4 +423,30 @@ void __show_mem(unsigned int filter, nodemask_t *n=
odemask, int max_zone_idx)
> >  #ifdef CONFIG_MEMORY_FAILURE
> >       printk("%lu pages hwpoisoned\n", atomic_long_read(&num_poisoned_p=
ages));
> >  #endif
> > +#ifdef CONFIG_MEM_ALLOC_PROFILING
> > +     {
> > +             struct codetag_bytes tags[10];
> > +             size_t i, nr;
> > +
> > +             nr =3D alloc_tag_top_users(tags, ARRAY_SIZE(tags), false)=
;
> > +             if (nr) {
> > +                     printk(KERN_NOTICE "Memory allocations:\n");
> > +                     for (i =3D 0; i < nr; i++) {
> > +                             struct codetag *ct =3D tags[i].ct;
> > +                             struct alloc_tag *tag =3D ct_to_alloc_tag=
(ct);
> > +                             struct alloc_tag_counters counter =3D all=
oc_tag_read(tag);
> > +
> > +                             /* Same as alloc_tag_to_text() but w/o in=
termediate buffer */
> > +                             if (ct->modname)
> > +                                     printk(KERN_NOTICE "%12lli %8llu =
%s:%u [%s] func:%s\n",
> > +                                            counter.bytes, counter.cal=
ls, ct->filename,
> > +                                            ct->lineno, ct->modname, c=
t->function);
> > +                             else
> > +                                     printk(KERN_NOTICE "%12lli %8llu =
%s:%u func:%s\n",
> > +                                            counter.bytes, counter.cal=
ls, ct->filename,
> > +                                            ct->lineno, ct->function);
> > +                     }
> > +             }
> > +     }
> > +#endif
> >  }
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kernel-team+unsubscribe@android.com.
>

