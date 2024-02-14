Return-Path: <linux-doc+bounces-9413-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F12185532D
	for <lists+linux-doc@lfdr.de>; Wed, 14 Feb 2024 20:24:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AED741F22930
	for <lists+linux-doc@lfdr.de>; Wed, 14 Feb 2024 19:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D19A13B78B;
	Wed, 14 Feb 2024 19:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UwsuHlGc"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C88613A87B
	for <linux-doc@vger.kernel.org>; Wed, 14 Feb 2024 19:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707938678; cv=none; b=DjDEyGSO8XKSKngtcqB+4zvud2r90r454dXBgGOSGxrZEVpy0kJNxU/Sv4QT4U80RtDYb8lmXr3xKMgpuv7WdMEsjXiCEPu+8XQqymdh3uhCWCym5ib3OdN0IqvvkZffGMc6RolV3CjLpclQFBs7A9evEPvCBlA3YGV88fJQw2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707938678; c=relaxed/simple;
	bh=S0A1kfhRzOuiQ1TlmH8X2A+T0pY8dnMRCMj0SI+jFYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RDyjYoM4gWr4LCA6ljvzLamjCiqth1l6hFef2qsNnMZLbFC0sM3Or2BYPk9jNBAPEC4FmJbtMzMQjzOPrNbDckpOGyQpanv2xWsWmBO0Pcck7JxTdEhCfKPHKeB3rJ1JZD1bV6M/H0Jm+sgEE8XZtypDSN/zRvkZq2aP3RjLANk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UwsuHlGc; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc238cb1b17so28838276.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Feb 2024 11:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707938675; x=1708543475; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QCBYE/AD/BvL6op5scnwP5wjSjqsrmapht1Ra223I1c=;
        b=UwsuHlGcrhXjhdyz7FsaHAoTBX0zVMz5qXtPM2OUj55wrNZvLqHXFw+eWmQICcNqD2
         mkRIzvQEt/wyfA87b6KzFPbtednd9Wmn4PYhx1ZSYaIQ3a9tTgY/ASdL/7qnbOlWxf+c
         DeW0BYZFVxVxzLKtQqgf5JqXwApgR9aXf6eXe00HuM3qIUBz3mMid3IyuF5oqOk9dxEA
         aWxa6nX0QA3VPyIIH1G820sazWtnbnvG3QIr2VkjFBstjRyavNejipQ18gjPiU6Xq8YY
         Ow4V+/UvoV9CFC+8Ocfs3i8DP341meEB5WlQU0bq6ogkSqOXE3P/pDdaXHBawmv36DDf
         zcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707938675; x=1708543475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QCBYE/AD/BvL6op5scnwP5wjSjqsrmapht1Ra223I1c=;
        b=deGFHuG96/eBUs78der2SpRXAjN+imFujEp+QkkVc2Sa8njQs+fQ5VPNqz7cIG2Rll
         4iLXQLouQyq8uegi8dqi7TCV8mRHUwWiMz9JV1HItAYC1FScYfeHzjhdyCySrrXhg9o1
         R0zapNSrdRN/y+/y/M7hOBf2c0N+TrSddo5CLVJ0G0PfNXz0Spt5gPPLfBSCUc0WMroh
         FL1YY147DvWAxIDZm3nPnDUCAB8cvyQvPsW+VK6UieSvWdcFgv06FTB5mcXhPSJ2RGaC
         dnbr7VueqXNShVfgEt3NBFXFYMYFWxTyn5TTkmZwfRShKGqYsA2sjlB7qZts98RYFPdO
         rycQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO5eYcg2Fw593w3d3PrwmFubMhqKHNRFLqnW6RFxvWLpFnExK8NFIw3S8X8ozTValHzrNL57g9DGyofXdi+HV9XgYeEzY/Nx0c
X-Gm-Message-State: AOJu0YxjEYCcC8WZ8qYbCGCGkJrbRna9O3nuOE+eBudPG9T4xiRRBDYR
	6kTX9P820cV0AakgOU0Uvw7mYhIb+1SoalByayPfX7oqPpEhd7EOrAeZqmAj+lr9KUkdVSTqova
	irsQrSINbwQkbMAJfcGlpUtkA5921RsyHslKp
X-Google-Smtp-Source: AGHT+IEHeftxzGg3B5Z0Zkp/sdZtFFtkyDYYBmhmOt9OEJce/O9D422LSeKSHbRCNIcYUksKiHgnsjkqT91cBPG3844=
X-Received: by 2002:a05:6902:143:b0:dcb:cdce:3902 with SMTP id
 p3-20020a056902014300b00dcbcdce3902mr3406955ybh.55.1707938674882; Wed, 14 Feb
 2024 11:24:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Zctfa2DvmlTYSfe8@tiehlicka> <CAJuCfpEsWfZnpL1vUB2C=cxRi_WxhxyvgGhUg7WdAxLEqy6oSw@mail.gmail.com>
 <9e14adec-2842-458d-8a58-af6a2d18d823@redhat.com> <2hphuyx2dnqsj3hnzyifp5yqn2hpgfjuhfu635dzgofr5mst27@4a5dixtcuxyi>
 <6a0f5d8b-9c67-43f6-b25e-2240171265be@redhat.com> <CAJuCfpEtOhzL65eMDk2W5SchcquN9hMCcbfD50a-FgtPgxh4Fw@mail.gmail.com>
 <adbb77ee-1662-4d24-bcbf-d74c29bc5083@redhat.com> <r6cmbcmalryodbnlkmuj2fjnausbcysmolikjguqvdwkngeztq@45lbvxjavwb3>
 <CAJuCfpF4g1jeEwHVHjQWwi5kqS-3UqjMt7GnG0Kdz5VJGyhK3Q@mail.gmail.com>
 <20240214085548.d3608627739269459480d86e@linux-foundation.org> <7c3walgmzmcygchqaylcz2un5dandlnzdqcohyooryurx6utxr@66adcw7f26c3>
In-Reply-To: <7c3walgmzmcygchqaylcz2un5dandlnzdqcohyooryurx6utxr@66adcw7f26c3>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 14 Feb 2024 11:24:23 -0800
Message-ID: <CAJuCfpGi6g3rG8aVmXveSxKvXnfm+5gLKS=Q4ouQBDaTxSuhww@mail.gmail.com>
Subject: Re: [PATCH v3 00/35] Memory allocation profiling
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Michal Hocko <mhocko@suse.com>, vbabka@suse.cz, hannes@cmpxchg.org, 
	roman.gushchin@linux.dev, mgorman@suse.de, dave@stgolabs.net, 
	willy@infradead.org, liam.howlett@oracle.com, corbet@lwn.net, 
	void@manifault.com, peterz@infradead.org, juri.lelli@redhat.com, 
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, tglx@linutronix.de, 
	mingo@redhat.com, dave.hansen@linux.intel.com, x86@kernel.org, 
	peterx@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, 
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

On Wed, Feb 14, 2024 at 9:52=E2=80=AFAM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Wed, Feb 14, 2024 at 08:55:48AM -0800, Andrew Morton wrote:
> > On Tue, 13 Feb 2024 14:59:11 -0800 Suren Baghdasaryan <surenb@google.co=
m> wrote:
> >
> > > > > If you think you can easily achieve what Michal requested without=
 all that,
> > > > > good.
> > > >
> > > > He requested something?
> > >
> > > Yes, a cleaner instrumentation. Unfortunately the cleanest one is not
> > > possible until the compiler feature is developed and deployed. And it
> > > still would require changes to the headers, so don't think it's worth
> > > delaying the feature for years.
> >
> > Can we please be told much more about this compiler feature?
> > Description of what it is, what it does, how it will affect this kernel
> > feature, etc.
> >
> > Who is developing it and when can we expect it to become available?
> >
> > Will we be able to migrate to it without back-compatibility concerns?
> > (I think "you need quite recent gcc for memory profiling" is
> > reasonable).
> >
> >
> >
> > Because: if the maintainability issues which Michel describes will be
> > significantly addressed with the gcc support then we're kinda reviewing
> > the wrong patchset.  Yes, it may be a maintenance burden initially, but
> > at some (yet to be revealed) time in the future, this will be addressed
> > with the gcc support?
>
> Even if we had compiler magic, after considering it more I don't think
> the patchset would be improved by it - I would still prefer to stick
> with the macro approach.
>
> There's also a lot of unresolved questions about whether the compiler
> approach would even end being what we need; we need macro expansion to
> happen in the caller of the allocation function

For the record, that's what this attribute will be doing. So it should
cover our usecase.

> , and that's another
> level of hooking that I don't think the compiler people are even
> considering yet, since cpp runs before the main part of the compiler; if
> C macros worked and were implemented more like Rust macros I'm sure it
> could be done - in fact, I think this could all be done in Rust
> _without_ any new compiler support - but in C, this is a lot to ask.
>
> Let's look at the instrumentation again. There's two steps:
>
> - Renaming the original function to _noprof
> - Adding a hooked version of the original function.
>
> We need to do the renaming regardless of what approach we take in order
> to correctly handle allocations that happen inside the context of an
> existing alloc tag hook but should not be accounted to the outer
> context; we do that by selecting the alloc_foo() or alloc_foo_noprof()
> version as appropriate.
>
> It's important to get this right; consider slab object extension
> vectors or the slab allocator allocating pages from the page allocator.
>
> Second step, adding a hooked version of the original function. We do
> that with
>
> #define alloc_foo(...) alloc_hooks(alloc_foo_noprof(__VA_ARGS__))
>
> That's pretty clean, if you ask me. The only way to make it more succint
> be if it were possible for a C macro to define a new macro, then it
> could be just
>
> alloc_fn(alloc_foo);
>
> But honestly, the former is probably preferable anyways from a ctags/csco=
pe POV.

