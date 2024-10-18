Return-Path: <linux-doc+bounces-27979-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B79699A4452
	for <lists+linux-doc@lfdr.de>; Fri, 18 Oct 2024 19:08:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D747A1C222EB
	for <lists+linux-doc@lfdr.de>; Fri, 18 Oct 2024 17:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C262038D3;
	Fri, 18 Oct 2024 17:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PcRR6RT5"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C3D20370A
	for <linux-doc@vger.kernel.org>; Fri, 18 Oct 2024 17:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729271307; cv=none; b=btBodur10rGGMwVyFYk8cboll0yrkFyqMNmuHd3rmr43+Hc/ANdRfFU7oa+WW8yvH9hKGwV1LdHFin0rtLSK1pIbfvbXVUQjHlv5L512RTJYnF6liZotSj0AT5dNLbGo0mkln24hBcvEsUsNPa0mY9vuayhoNMqU5l43idKrvtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729271307; c=relaxed/simple;
	bh=VjNjZ0gTlxnJa5Q6Sh2pxzO/5VJ24DWKlfbi+7tp948=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b2qOt0ng2BYoJ1Y2N4nil1JaqW8BV/0vYOPcvBdbdo2ac2d4ubXgE/wBUkJtGcO+yo3QNyWCXqtRtYoA7SfoP6MT0q9SZtNFGtIyTyqSRIQl8QZQnaBEoTzn4n2opxkfbEZ+B/MNC7+AU08+/rFv//kzjIYzCEdnf/zoi8nyCv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PcRR6RT5; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb584a8f81so28366191fa.3
        for <linux-doc@vger.kernel.org>; Fri, 18 Oct 2024 10:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729271303; x=1729876103; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OWlja0ncpRimS1KnaLy3/LNPFh3lK39/ETwogwVX5bI=;
        b=PcRR6RT5D4XjmlACZgzyBS5ESfTelle/UA7kEqo8ZZqG46fU+2XS6KZhFoSSrmrDof
         sfiQNa+Jm8BnTcRBTRexjiymFLj7qfhMVDKwvPYMGQLno6cyHI7wjMKt9OhuhcyVq5pT
         1ifRxalZN3MdxyQ6wEfhmxN9CLa/pYlmzKpe9zAmySDi22SJWmBqxotiwzKV5N7QUKjg
         XjzIi9xP61YS2pazliPGnavS/tgpfbgWRTfwTaWAaFwCdFt/vAmLXofm0zfNrGSBzs4A
         IraeVa5MI/mmM9iAZXelj4OuZym/Si5HOBycqIv22o3h4luZzzkPwEkuMZHCngvy0PtG
         tcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729271303; x=1729876103;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OWlja0ncpRimS1KnaLy3/LNPFh3lK39/ETwogwVX5bI=;
        b=kDgHK3pibgAwWdyGmLKsVvyRtn9DZKHZhJbCAd4oYFRusuh386Tphtc4JJYxhDy95E
         Ng1FYaAk0LIcVr74fWYm1k/py8yycI6nNGIeI8pNCgtWwBKhGIDZZzgniukPo8Jm/tkF
         I8VZeM6xed8h7s3p0m7XNcFOPBGGE4iraBQ+9qDlc49M49or95l4z8bwiki3PO6DvA7i
         WdzHf5Ldw21OnBW7UUcpVhcrrfPyfUEsNrl5o5r4p0vRjhMsEUQm7fruNNvAzQzIS6kk
         2VWovTqwMask1lkKiqR2Hq2PagWsYFaq5jlkcvbB3+G5jAob/EaZHa/j3qqBu9F1vIX5
         AlPg==
X-Forwarded-Encrypted: i=1; AJvYcCVlfkZRC4f+JPiSYmRHad4TEYKkjyLvrOvTFsKGLQ6PcLT1ebOQ2nJW+cOqu8q1q1stsqmLGuJLyJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyK9YnrLOUyE8xTk+5+Gs+U09wXEeJaWx2cFFJhYF8vpFjWnjee
	a6xS9/y3Y4fscwIpYYhY4SWBnAORlH06Dwup8KPwVrBvn/f8RS/r3snMTH/LrNM=
X-Google-Smtp-Source: AGHT+IEoOYixU3j4FTjyHEPmwQ4j8jzTk9Gr33/mgkWnbpSfAHz7OIgIar5gJpwNSHyBDhu8Ljp8CQ==
X-Received: by 2002:a2e:bc03:0:b0:2fb:5168:1a0c with SMTP id 38308e7fff4ca-2fb82eb03eamr17936621fa.19.1729271302829;
        Fri, 18 Oct 2024 10:08:22 -0700 (PDT)
Received: from localhost (109-81-89-238.rct.o2.cz. [109.81.89.238])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ca0b08caa6sm953220a12.56.2024.10.18.10.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 10:08:22 -0700 (PDT)
Date: Fri, 18 Oct 2024 19:08:21 +0200
From: Michal Hocko <mhocko@suse.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: David Hildenbrand <david@redhat.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Yosry Ahmed <yosryahmed@google.com>, akpm@linux-foundation.org,
	kent.overstreet@linux.dev, corbet@lwn.net, arnd@arndb.de,
	mcgrof@kernel.org, rppt@kernel.org, paulmck@kernel.org,
	thuth@redhat.com, tglx@linutronix.de, bp@alien8.de,
	xiongwei.song@windriver.com, ardb@kernel.org, vbabka@suse.cz,
	hannes@cmpxchg.org, roman.gushchin@linux.dev, dave@stgolabs.net,
	willy@infradead.org, liam.howlett@oracle.com,
	pasha.tatashin@soleen.com, souravpanda@google.com,
	keescook@chromium.org, dennis@kernel.org, yuzhao@google.com,
	vvvvvv@google.com, rostedt@goodmis.org, iamjoonsoo.kim@lge.com,
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v3 5/5] alloc_tag: config to store page allocation tag
 refs in page flags
Message-ID: <ZxKWBfQ_Lps93fY1@tiehlicka>
References: <20241014203646.1952505-1-surenb@google.com>
 <20241014203646.1952505-6-surenb@google.com>
 <CAJD7tkY0zzwX1BCbayKSXSxwKEGiEJzzKggP8dJccdajsr_bKw@mail.gmail.com>
 <cd848c5f-50cd-4834-a6dc-dff16c586e49@nvidia.com>
 <6a2a84f5-8474-432f-b97e-18552a9d993c@redhat.com>
 <CAJuCfpGkuaCh+PxKbzMbu-81oeEdzcfjFThoRk+-Cezf0oJWZg@mail.gmail.com>
 <9c81a8bb-18e5-4851-9925-769bf8535e46@redhat.com>
 <CAJuCfpH-YqwEi1aqUAF3rCZGByFpvKVSfDckATtCFm=J_4+QOw@mail.gmail.com>
 <ZxJcryjDUk_LzOuj@tiehlicka>
 <CAJuCfpGV3hwCRJj6D-SnSOc+VEe5=_045R1aGJEuYCL7WESsrg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpGV3hwCRJj6D-SnSOc+VEe5=_045R1aGJEuYCL7WESsrg@mail.gmail.com>

On Fri 18-10-24 09:04:24, Suren Baghdasaryan wrote:
> On Fri, Oct 18, 2024 at 6:03 AM Michal Hocko <mhocko@suse.com> wrote:
> >
> > On Tue 15-10-24 08:58:59, Suren Baghdasaryan wrote:
> > > On Tue, Oct 15, 2024 at 8:42 AM David Hildenbrand <david@redhat.com> wrote:
> > [...]
> > > > Right, I think what John is concerned about (and me as well) is that
> > > > once a new feature really needs a page flag, there will be objection
> > > > like "no you can't, we need them for allocation tags otherwise that
> > > > feature will be degraded".
> > >
> > > I do understand your concern but IMHO the possibility of degrading a
> > > feature should not be a reason to always operate at degraded capacity
> > > (which is what we have today). If one is really concerned about
> > > possible future regression they can set
> > > CONFIG_PGALLOC_TAG_USE_PAGEFLAGS=n and keep what we have today. That's
> > > why I'm strongly advocating that we do need
> > > CONFIG_PGALLOC_TAG_USE_PAGEFLAGS so that the user has control over how
> > > this scarce resource is used.
> >
> > I really do not think users will know how/why to setup this and I wouldn't
> > even bother them thinking about that at all TBH.
> >
> > This is an implementation detail. It is fine to reuse unused flags space
> > as a storage as a performance optimization but why do you want users to
> > bother with that? Why would they ever want to say N here?
> 
> In this patch you can find a couple of warnings that look like this:
> 
> pr_warn("With module %s there are too many tags to fit in %d page flag
> bits. Memory profiling is disabled!\n", mod->name,
> NR_UNUSED_PAGEFLAG_BITS);
> emitted when we run out of page flag bits during a module loading,
> 
> pr_err("%s: alignment %lu is incompatible with allocation tag
> indexing, disable CONFIG_PGALLOC_TAG_USE_PAGEFLAGS",  mod->name,
> align);
> emitted when the arch-specific section alignment is incompatible with
> alloc_tag indexing.

You are asking users to workaround implementation issue by configuration
which sounds like a really bad idea. Why cannot you make the fallback
automatic?

-- 
Michal Hocko
SUSE Labs

