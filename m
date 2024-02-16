Return-Path: <linux-doc+bounces-9756-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6620B857858
	for <lists+linux-doc@lfdr.de>; Fri, 16 Feb 2024 10:02:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C061AB21303
	for <lists+linux-doc@lfdr.de>; Fri, 16 Feb 2024 09:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2201B806;
	Fri, 16 Feb 2024 09:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Aa4qGi5k"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7E91B815
	for <linux-doc@vger.kernel.org>; Fri, 16 Feb 2024 09:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708074159; cv=none; b=fACXGFcOIYCS3S9CR/lwoqj2fSKZ1mau3vX3cwZ/Z/KF4FOBAs0oc/DoEQsHELFGQDP+TdxjPqHTZJKpT/lpKzRK+IYIGOHFJ2mVJkb+JCMfMh8dHuTYElCU80i72OJ8Xf5sHXQUhabecyk4z+fZsP1ZXHXO2mY+M9jhGdRo4gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708074159; c=relaxed/simple;
	bh=0ASL8/2Fnq0OuCZD8H09gdyT0FLFuomqfwj8h+QBwB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GPCC4F9Gzn3DdMECBbixUv3zW4Xd72lfts2mC+15CfnCunXJdGpWBNcLt7UzFs553rTC+uJhJzFWFnjL9zWLcaVQwrjox51oa3MScAU2823JsqHsUHkPLQv/VTzAX+9u1k28ixNGH4QxCahaiNQTr60eI/whPbOHANFd8EgPlmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Aa4qGi5k; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc6d9a8815fso1914991276.3
        for <linux-doc@vger.kernel.org>; Fri, 16 Feb 2024 01:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708074157; x=1708678957; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aC0zV0jURwgzq9Q6615BgsaS7tbK8PR71BWfZKB9Bg0=;
        b=Aa4qGi5ko2WzUV+jH6oa9oWrZHue0INtEQodKMwZR6oy3qFY32F7/uf0Ro+Qike6sh
         m5ajjY6rF0LavNZfRoy2p4RP/PP1yXtuX02ypA0PYGfHpLaoabIdf3fLcHrkvvhjnohg
         cjOItnTUFyF6XUMwzZDvwCA+D+cO0ZTrAuRhhJUadlOBRhCob4rMzccgQxIMvl7WlSKn
         tgf2qKEgQ4I715/ta689QJRUTChZE6GR2DEoP4DyerGfEN+Csa1egLgGeWs2xjVX7w3j
         zp/InkjOkfMB1PKGN9U7ay33MxCloKc3paseNzbzkPHhO5dZzXoyZ2Aal+jL6PSesebg
         wgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708074157; x=1708678957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aC0zV0jURwgzq9Q6615BgsaS7tbK8PR71BWfZKB9Bg0=;
        b=i9TcptdjKW8voOsI+PKTQbgbE48h7ScAFlnszOj2I58jQ3RP3s5dXvsj7JY03uYG5W
         R11Cw9ktChWj6Eg3zEDmGnhjkYs+hIT9fBiTX+MOfB1YKz+Ot1QJSWHhQKOJuKMpVYH1
         dEEF23yfFGACqjITRl2XdKo4/yqg1me1uegvD2M5UmB/p+wq+tE+WC0t9HCs6/q188uo
         i/ps6mptBHpq/3o3aN2lnBoN/ZgPS4iMGR3lHPLYCVrOuZJ5DmqNxiOsqhWKxXBggvFr
         AVZbZAq+RkNrvSeNtRO3TmMmfGx9Lrb9Woj6A04X/trUmdpR5DJp/WqU3A+1UMGbnOdS
         pfdw==
X-Forwarded-Encrypted: i=1; AJvYcCU5Cfj5wWZgkgtiB/P8CRef3BJrh7BFN04MRKUror74SIzl8z32HEWvWxAkirVJaIprGXcBJXyuEnj7yBcIg9XCm7MCfGZw3rn4
X-Gm-Message-State: AOJu0Yy2gGEVwWckrRkgHNrht85kpbBeXqdPyo7oXFh4agTixfkWZWN5
	ybeUdl5jf55bnXECOA/tilOMPa72a24Sp5XyXWl6tjRAil6Tjd8iwg11dzIO4kdSD38WV4AUDMQ
	Rs5esS+IdfHT/VRMXwMGoatsKEAjqA22lCx54
X-Google-Smtp-Source: AGHT+IEM+380cGg5HHP1OkOXBhTo7zHOdUbLmTZ9RIz7nJiHcIKUi7+k7jSA3j73/vSCaixotNnzkCuz3vuGoeIcxZc=
X-Received: by 2002:a05:6902:1b85:b0:dc6:421a:3024 with SMTP id
 ei5-20020a0569021b8500b00dc6421a3024mr5156888ybb.43.1708074156727; Fri, 16
 Feb 2024 01:02:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240212213922.783301-1-surenb@google.com> <20240212213922.783301-14-surenb@google.com>
 <20240215165438.cd4f849b291c9689a19ba505@linux-foundation.org>
 <wdj72247rptlp4g7dzpvgrt3aupbvinskx3abxnhrxh32bmxvt@pm3d3k6rn7pm>
 <CA+CK2bBod-1FtrWQH89OUhf0QMvTar1btTsE0wfROwiCumA8tg@mail.gmail.com> <iqynyf7tiei5xgpxiifzsnj4z6gpazujrisdsrjagt2c6agdfd@th3rlagul4nn>
In-Reply-To: <iqynyf7tiei5xgpxiifzsnj4z6gpazujrisdsrjagt2c6agdfd@th3rlagul4nn>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 16 Feb 2024 01:02:25 -0800
Message-ID: <CAJuCfpHxaCQ_sy0u88EcdkgsV-GX3AbhCaiaRW-DWYFvZK1=Ew@mail.gmail.com>
Subject: Re: [PATCH v3 13/35] lib: add allocation tagging support for memory
 allocation profiling
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, Andrew Morton <akpm@linux-foundation.org>, 
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org, roman.gushchin@linux.dev, 
	mgorman@suse.de, dave@stgolabs.net, willy@infradead.org, 
	liam.howlett@oracle.com, corbet@lwn.net, void@manifault.com, 
	peterz@infradead.org, juri.lelli@redhat.com, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org, muchun.song@linux.dev, 
	rppt@kernel.org, paulmck@kernel.org, yosryahmed@google.com, yuzhao@google.com, 
	dhowells@redhat.com, hughd@google.com, andreyknvl@gmail.com, 
	keescook@chromium.org, ndesaulniers@google.com, vvvvvv@google.com, 
	gregkh@linuxfoundation.org, ebiggers@google.com, ytcoode@gmail.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, bristot@redhat.com, vschneid@redhat.com, cl@linux.com, 
	penberg@kernel.org, iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, 
	glider@google.com, elver@google.com, dvyukov@google.com, shakeelb@google.com, 
	songmuchun@bytedance.com, jbaron@akamai.com, rientjes@google.com, 
	minchan@google.com, kaleshsingh@google.com, kernel-team@android.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-arch@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 15, 2024 at 5:27=E2=80=AFPM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Thu, Feb 15, 2024 at 08:22:44PM -0500, Pasha Tatashin wrote:
> > On Thu, Feb 15, 2024 at 8:00=E2=80=AFPM Kent Overstreet
> > <kent.overstreet@linux.dev> wrote:
> > >
> > > On Thu, Feb 15, 2024 at 04:54:38PM -0800, Andrew Morton wrote:
> > > > On Mon, 12 Feb 2024 13:38:59 -0800 Suren Baghdasaryan <surenb@googl=
e.com> wrote:
> > > >
> > > > > +Example output.
> > > > > +
> > > > > +::
> > > > > +
> > > > > +    > cat /proc/allocinfo
> > > > > +
> > > > > +      153MiB     mm/slub.c:1826 module:slub func:alloc_slab_page
> > > > > +     6.08MiB     mm/slab_common.c:950 module:slab_common func:_k=
malloc_order
> > > > > +     5.09MiB     mm/memcontrol.c:2814 module:memcontrol func:all=
oc_slab_obj_exts
> > > > > +     4.54MiB     mm/page_alloc.c:5777 module:page_alloc func:all=
oc_pages_exact
> > > > > +     1.32MiB     include/asm-generic/pgalloc.h:63 module:pgtable=
 func:__pte_alloc_one
> > > >
> > > > I don't really like the fancy MiB stuff.  Wouldn't it be better to =
just
> > > > present the amount of memory in plain old bytes, so people can use =
sort
> > > > -n on it?
> > >
> > > They can use sort -h on it; the string_get_size() patch was specifica=
lly
> > > so that we could make the output compatible with sort -h
> > >
> > > > And it's easier to tell big-from-small at a glance because
> > > > big has more digits.
> > > >
> > > > Also, the first thing any sort of downstream processing of this dat=
a is
> > > > going to have to do is to convert the fancified output back into
> > > > plain-old-bytes.  So why not just emit plain-old-bytes?
> > > >
> > > > If someone wants the fancy output (and nobody does) then that can b=
e
> > > > done in userspace.
> > >
> > > I like simpler, more discoverable tools; e.g. we've got a bunch of
> > > interesting stuff in scripts/ but it doesn't get used nearly as much =
-
> > > not as accessible as cat'ing a file, definitely not going to be
> > > installed by default.
> >
> > I also prefer plain bytes instead of MiB. A driver developer that
> > wants to verify up-to the byte allocations for a new data structure
> > that they added is going to be disappointed by the rounded MiB
> > numbers.
>
> That's a fair point.
>
> > The data contained in this file is not consumable without at least
> > "sort -h -r", so why not just output bytes instead?
> >
> > There is /proc/slabinfo  and there is a slabtop tool.
> > For raw /proc/allocinfo we can create an alloctop tool that would
> > parse, sort and show data in human readable format based on various
> > criteria.
> >
> > We should also add at the top of this file "allocinfo - version: 1.0",
> > to allow future extensions (i.e. column for proc name).
>
> How would we feel about exposing two different versions in /proc? It
> should be a pretty minimal addition to .text.
>
> Personally, I hate trying to count long strings digits by eyeball...

Maybe something like this work for everyone then?:

160432128 (153MiB)     mm/slub.c:1826 module:slub func:alloc_slab_page

