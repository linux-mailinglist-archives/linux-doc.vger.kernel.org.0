Return-Path: <linux-doc+bounces-11017-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5E186B746
	for <lists+linux-doc@lfdr.de>; Wed, 28 Feb 2024 19:39:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 605B31C24C34
	for <lists+linux-doc@lfdr.de>; Wed, 28 Feb 2024 18:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67FA71EBC;
	Wed, 28 Feb 2024 18:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bZRYLvOc"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30A379B79
	for <linux-doc@vger.kernel.org>; Wed, 28 Feb 2024 18:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709145546; cv=none; b=JEKBaUTH8IIDZrbh3XlyqgabHl4xiJsHBt0dri69BaLpoBorJrLIY5fxjGGaWDGsXRSu02goPRPI/3WkyOhOts+fG9T85magp9SyzojYACFU1zyOV0ePOZAS8NwDvGUCzYu4UmT3BW7VSv5RRIVwiUGDRRCeAWwfJu3SLwYa+Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709145546; c=relaxed/simple;
	bh=7iqFBA+LWwnU3gwgoROsymeSLKp/pJPiwqlUMLON2K8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tfq9OL+iz5FNxt6FDNkrL/KfS1FJu55xXAkwV6K0IFCnItB/kh8lQ83K9BYM85hKm7iLfechF0N4lpF9bUwSQFnbIeX439u/inK/tnW7QazmdpxbS7DNANuUmF0+Uq0qk6eOYf+BkJIBivlBQDqSp8iDPBfZxKEDPfanlU3SNf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bZRYLvOc; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-60938adfed8so787287b3.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Feb 2024 10:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709145544; x=1709750344; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7iqFBA+LWwnU3gwgoROsymeSLKp/pJPiwqlUMLON2K8=;
        b=bZRYLvOcuSQJ7yTTsyjqu0vwk3flVlQP1DkzZ/201fIwY1LLOW6TSNF6BYYEq7oYih
         1Cl/Df6h2RV0hl63dNEtntv3f0hZjvN14lRZSYwmLl6hBmIvAn8BJrmsnKFHiRyYxvSy
         1wr5QF6lFsds62i4Y8iuXFqdO0/MBLf6T7/+JSj90jrAlTfxy6GUL+48TvD+WOQc65TS
         PDOLJlrQzICYzz+uFhAZmzzcJl2jXbwZ8tb34Kwjdq/CreXpKKumqlKO+WPcgXvIqXBq
         8HDEcoozgv8zib5X41FWRrwsnVv8RmgjkKKUEW/eb3ulqmH/IChjCZdd7xJUHNqnSmlQ
         Y4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709145544; x=1709750344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7iqFBA+LWwnU3gwgoROsymeSLKp/pJPiwqlUMLON2K8=;
        b=rND73c9m3GfVScHa6UIc9w/MDq1XwHSpA0Oze1H7rdEExCjBqxMlggR92fENK2FB8e
         C7ilP46KG6RxQva/fDR8irdeCf0sfY7p6zCjTFtLMJwEYDp9fZHZ1fgybb3pVDFFlP0A
         4PTOp/5AwnB86mq93rkjuwyPBx+gOL1/34orJt6UZ9iX+rxbueWg1+bspM29WTFU3F6t
         3RwgdIZ46czgqo4R757iChedLEQL67Vr1hjwOMEDKzXw60BqkAX93YlQBG2tqRYbGYLQ
         dj0Ppmhnk68/zttERHG/ZUFEpT7Twbv1A2zX3MIf6NG8hroiiw+ST5loffKuG6f5EsJs
         ebrg==
X-Forwarded-Encrypted: i=1; AJvYcCXVeg/IhoWqvbfDZTSPgfOejC9eDXuWsg6EvAAPC8BscOggRSVMaba3ZgnbwNzx7l7bO8pFueKMzFZP5O+w4BqStW+/ecgo5ZuQ
X-Gm-Message-State: AOJu0YzlReUVqGNghjD4Wh/NNrBCN3Q3XSDr8LvpUvzC3HW+62Vw0Ab0
	bVO1nUxbcuilaboO/VsbMfOcQX9RZWI8RrBZWcr4FJoeazDN+hWvkT5AvPtgWO7rpFGoqz5TuQ2
	bV1I4wdYLnZJelRnFtFf6rARRyn1LRhgagdxY
X-Google-Smtp-Source: AGHT+IGPWnLmF2TVmBJmUMEp5oMR8c6WgnFtjjNeDdqebhJZ+NPAbFsWrA/RAsFNPaaO16thY7f2/GzzgeasEYFaVaU=
X-Received: by 2002:a5b:f45:0:b0:dc6:e75d:d828 with SMTP id
 y5-20020a5b0f45000000b00dc6e75dd828mr48009ybr.18.1709145543730; Wed, 28 Feb
 2024 10:39:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221194052.927623-1-surenb@google.com> <20240221194052.927623-20-surenb@google.com>
 <2daf5f5a-401a-4ef7-8193-6dca4c064ea0@suse.cz> <CAJuCfpGt+zfFzfLSXEjeTo79gw2Be-UWBcJq=eL1qAnPf9PaiA@mail.gmail.com>
 <6db0f0c8-81cb-4d04-9560-ba73d63db4b8@suse.cz> <CAJuCfpEgh1OiYNE_uKG-BqW2x97sOL9+AaTX4Jct3=WHzAv+kg@mail.gmail.com>
 <f494b8e5-f1ca-4b95-a8aa-01b9c4395523@suse.cz>
In-Reply-To: <f494b8e5-f1ca-4b95-a8aa-01b9c4395523@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 28 Feb 2024 10:38:49 -0800
Message-ID: <CAJuCfpHJoPa_pQNPrcWNZyU7V7=UA4deGFMxh9_aZPyiP0bFSw@mail.gmail.com>
Subject: Re: [PATCH v4 19/36] mm: create new codetag references during page splitting
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

On Wed, Feb 28, 2024 at 10:28=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> w=
rote:
>
> On 2/28/24 18:50, Suren Baghdasaryan wrote:
> > On Wed, Feb 28, 2024 at 12:47=E2=80=AFAM Vlastimil Babka <vbabka@suse.c=
z> wrote:
> >
> >>
> >> Now this might be rare enough that it's not worth fixing if that would=
 be
> >> too complicated, just FYI.
> >
> > Yeah. We can fix this by subtracting the "bytes" counter of the "head"
> > page for all free_the_page(page + (1 << order), order) calls we do
> > inside __free_pages(). But we can't simply use pgalloc_tag_sub()
> > because the "calls" counter will get over-decremented (we allocated
> > all of these pages with one call). I'll need to introduce a new
> > pgalloc_tag_sub_bytes() API and use it here. I feel it's too targeted
> > of a solution but OTOH this is a special situation, so maybe it's
> > acceptable. WDYT?
>
> Hmm I think there's a problem that once you fail put_page_testzero() and
> detect you need to do this, the page might be already gone or reallocated=
 so
> you can't get to the tag for decrementing bytes. You'd have to get it
> upfront (I guess for "head && order > 0" cases) just in case it happens.
> Maybe it's not worth the trouble for such a rare case.

Yes, that hit me when I tried to implement it but there is a simple
solution around that. I can obtain alloc_tag before doing
put_page_testzero() and then decrement bytes counter directly as
needed.
Not sure if it is a rare enough case that we can ignore it but if the
fix is simple enough then might as well do it?

>
> >>
> >>
> >> > Every time
> >> > one of these pages are freed that codetag's "bytes" and "calls"
> >> > counters will be decremented. I think accounting will work correctly
> >> > irrespective of where these pages are freed, in __free_pages() or by
> >> > put_page().
> >> >
> >>
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kernel-team+unsubscribe@android.com.
>

