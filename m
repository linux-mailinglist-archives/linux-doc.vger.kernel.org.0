Return-Path: <linux-doc+bounces-9680-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD2485735A
	for <lists+linux-doc@lfdr.de>; Fri, 16 Feb 2024 02:23:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90B7C287F8A
	for <lists+linux-doc@lfdr.de>; Fri, 16 Feb 2024 01:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54BE7D2F0;
	Fri, 16 Feb 2024 01:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="bnq5wUUQ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B140C2ED
	for <linux-doc@vger.kernel.org>; Fri, 16 Feb 2024 01:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708046604; cv=none; b=KHYXBJRI3pL0/0B43oi0q6WoM04329EjQuvYPL/CxNvS5uGewhbqPhyFF48XKCf9XySORPpepceK3/6fxlmEDih1Z2vj6dVa1R+kjjX5ICX1IXxo2EtyvZrY6moxk3FjORKim45mqKHwrVyeejjCc8XaTJHZHDjRClp/X05qimk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708046604; c=relaxed/simple;
	bh=yOv4lCsMlL/EKUXCC4Ma+3szviWFRNJ0I0zqeqBfOVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KGOD0m9s8y1WNpyVA60FPdFqgWLJkv5haVsCxb29dMJEvI11iSg80+vFum0/mQryJjDT4NCGD8mG+pptCwiOUqsiR5PN0sldO1w8u3eDK7xeTSESboH9NbhU5xRv09lig0xBVkLxEkC/rwnKrYRYiNeCMrwYXUj7AzqO46+3OdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=bnq5wUUQ; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-42db64efac3so9303061cf.3
        for <linux-doc@vger.kernel.org>; Thu, 15 Feb 2024 17:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1708046601; x=1708651401; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLBxcB96LUnXdvE3EMMcNpcL8B6icUkLMA8zN7Nwyj8=;
        b=bnq5wUUQgCVZaEihoESdR94jM+VcbO/HpJnNeAOc0f2OI9uvp9qPHfGPkyDP5SgR4L
         jpb96hY6UPoxWRwnk7y7Ci1sezowXkn6flGMK3r/B2KO2XRdBZXdMd1qLUSX5GR2EsLP
         ERSo6plK8hnIbVY6+wIWyHqtvzKAU/w0GM5BnJ7i3Kcz/L/7XgKMEgOIuZDdzkXui8JN
         GuPuhvIolgpUv4mOPqAIeOqvG1Yg6p0VSD8L2QRF204ArpO1TOCg5hWmzF40dU4psVp4
         TTh9NHWgZR2S5Tdo/1RNQLZLGdCKwAT0+Z7mi/SbMCjlcS1d9GQatrJSaTvRJLE/dOF9
         JLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708046601; x=1708651401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLBxcB96LUnXdvE3EMMcNpcL8B6icUkLMA8zN7Nwyj8=;
        b=cxj2gg2bS8reWMRTkp5TsZJ3EOORDWa8l8ZEHQCLo8kL0MwYvTr0RJrWree32gm0+p
         n/e5aOOtTizfilgF8iAIvFTLDLAoDENGQ0VwhRb0QaVvRFhDnUhQ9vY+UMkZKGoPrmef
         Hun3fWsdX/YiG43pC3WigQyyV+TfcPiRoDbgw1fHvGfZFzSoL7cXqKWM7uhVOheYGqfl
         JizCAMQOw+dFciymsSJtfWJGOaUEhN1lsPMsyVS5U1xSFmdfi4Z735rnu4b/p2hv3lsd
         z8ohavJLMUwxL4ijGAz0kvVh+yB4pptCMPUbldPkdQySHsAhoVym1IhVcBehx9VXH6QK
         wRbg==
X-Forwarded-Encrypted: i=1; AJvYcCU9RShfmNbAki20T/v2GQH9Kmx7GVrXOMx3KoXk2k8Y/KGOf8gwWbOQ5d7Eo1yX3VWlHn/hpITfCPH/Y9d8t89/ESRpM7BiyYD2
X-Gm-Message-State: AOJu0YzEDNIwXRjk0l/sweiNDklwrKsJybeDbxKmwqgFMqqBzCmUEzki
	+VziD8Vo/UTnRsYNUb7ewHNkLWS7InM1dOTdaZEfaTZclmNB5r4tOLuuveicKM3ivdisLVP9AVq
	LYzMTmJpCQ+9JRfa4q2aNiDve55kalA6VIpo4qA==
X-Google-Smtp-Source: AGHT+IHdAGPa3f0BFvBlw2QNdQJLAcEidwl+gXCtt3AMFT8zJaebOs+nRCRcB3nHVA77tKuaOx7EkhIR+i04j0HLT/E=
X-Received: by 2002:a05:622a:1a94:b0:42a:48bc:f69 with SMTP id
 s20-20020a05622a1a9400b0042a48bc0f69mr4538976qtc.35.1708046601368; Thu, 15
 Feb 2024 17:23:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240212213922.783301-1-surenb@google.com> <20240212213922.783301-14-surenb@google.com>
 <20240215165438.cd4f849b291c9689a19ba505@linux-foundation.org> <wdj72247rptlp4g7dzpvgrt3aupbvinskx3abxnhrxh32bmxvt@pm3d3k6rn7pm>
In-Reply-To: <wdj72247rptlp4g7dzpvgrt3aupbvinskx3abxnhrxh32bmxvt@pm3d3k6rn7pm>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 15 Feb 2024 20:22:44 -0500
Message-ID: <CA+CK2bBod-1FtrWQH89OUhf0QMvTar1btTsE0wfROwiCumA8tg@mail.gmail.com>
Subject: Re: [PATCH v3 13/35] lib: add allocation tagging support for memory
 allocation profiling
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Suren Baghdasaryan <surenb@google.com>, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	corbet@lwn.net, void@manifault.com, peterz@infradead.org, 
	juri.lelli@redhat.com, catalin.marinas@arm.com, will@kernel.org, 
	arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
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

On Thu, Feb 15, 2024 at 8:00=E2=80=AFPM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Thu, Feb 15, 2024 at 04:54:38PM -0800, Andrew Morton wrote:
> > On Mon, 12 Feb 2024 13:38:59 -0800 Suren Baghdasaryan <surenb@google.co=
m> wrote:
> >
> > > +Example output.
> > > +
> > > +::
> > > +
> > > +    > cat /proc/allocinfo
> > > +
> > > +      153MiB     mm/slub.c:1826 module:slub func:alloc_slab_page
> > > +     6.08MiB     mm/slab_common.c:950 module:slab_common func:_kmall=
oc_order
> > > +     5.09MiB     mm/memcontrol.c:2814 module:memcontrol func:alloc_s=
lab_obj_exts
> > > +     4.54MiB     mm/page_alloc.c:5777 module:page_alloc func:alloc_p=
ages_exact
> > > +     1.32MiB     include/asm-generic/pgalloc.h:63 module:pgtable fun=
c:__pte_alloc_one
> >
> > I don't really like the fancy MiB stuff.  Wouldn't it be better to just
> > present the amount of memory in plain old bytes, so people can use sort
> > -n on it?
>
> They can use sort -h on it; the string_get_size() patch was specifically
> so that we could make the output compatible with sort -h
>
> > And it's easier to tell big-from-small at a glance because
> > big has more digits.
> >
> > Also, the first thing any sort of downstream processing of this data is
> > going to have to do is to convert the fancified output back into
> > plain-old-bytes.  So why not just emit plain-old-bytes?
> >
> > If someone wants the fancy output (and nobody does) then that can be
> > done in userspace.
>
> I like simpler, more discoverable tools; e.g. we've got a bunch of
> interesting stuff in scripts/ but it doesn't get used nearly as much -
> not as accessible as cat'ing a file, definitely not going to be
> installed by default.

I also prefer plain bytes instead of MiB. A driver developer that
wants to verify up-to the byte allocations for a new data structure
that they added is going to be disappointed by the rounded MiB
numbers.

The data contained in this file is not consumable without at least
"sort -h -r", so why not just output bytes instead?

There is /proc/slabinfo  and there is a slabtop tool.
For raw /proc/allocinfo we can create an alloctop tool that would
parse, sort and show data in human readable format based on various
criteria.

We should also add at the top of this file "allocinfo - version: 1.0",
to allow future extensions (i.e. column for proc name).

Pasha

