Return-Path: <linux-doc+bounces-10350-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B560F85EDF2
	for <lists+linux-doc@lfdr.de>; Thu, 22 Feb 2024 01:25:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C25181C2130E
	for <lists+linux-doc@lfdr.de>; Thu, 22 Feb 2024 00:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C1DFF4E7;
	Thu, 22 Feb 2024 00:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ofhFBy0g"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D02B101F1
	for <linux-doc@vger.kernel.org>; Thu, 22 Feb 2024 00:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708561506; cv=none; b=NFOv1kNUCcbKkXL2r9WOTTlGm6JyxaW3lHlTgCpxmU5rBgMiwLX3LEzje40tpw9qMbUSFnxLtIqASpNU52QN21B1u8CmDjsnMgjMLTqx5RQdCu0+mebbQhBe+ti0idxchtbbxrSadTvSg1yT+RCOH4D8NMxxld3eXSolBpSy+dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708561506; c=relaxed/simple;
	bh=Wl2VBsr8T1E9brAP9ZLk+di58Ii4yEnpHnIDqcL7Ys4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MXfdjs31ZvcZM+7K6SPsRyIK45ELoDmaC7um1y8NF9jlu5ZN5FctYkAmyldAFKQhf9ep8so2GEaVSUsUYixCjTUitJf5NCps0bLw7GTifeDojQAtM32zMpl2hiOYpQycKEkKw0rsO1kw3AbRUvmXAI0qf7byvKXTYGzgp+QhmkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ofhFBy0g; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e4670921a4so2621923b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 21 Feb 2024 16:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708561503; x=1709166303; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WrVxGxFZ9H3+hlcYIVohDlCBqheEbLY5A8SDm36k8gU=;
        b=ofhFBy0gzNz2gmMbsAtpvobfLetDEr2h/tPE+renP/99jyIWS80pMhgteraIKPRAuT
         dVlepU+AgxElGXhJTrV3XW5TKRRYghKYMkGBB6bsmf9UWTapjBEs+sytEdFYdPj195G4
         U9m8fSBu+mk6/tjkHArePIX9vdpFML0ALGQ50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708561503; x=1709166303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WrVxGxFZ9H3+hlcYIVohDlCBqheEbLY5A8SDm36k8gU=;
        b=vas4MRzgnU11SPpkNwDwqdF0m2NJpLIFF1gTW4NZWkReTVtLxWBCmfCP8yxzZFjbGj
         z14U0qd+QyZGfd2zuUkazvB+QlTgUeuxUd5faaLwp7w6UT1IpkrgRY6ltXJBbvYD1SXE
         Jy6vTAuOtkRyBtyCS141snHtQ69KeeefYFqh/JCenxPW3u1ce0fvPEFSKzBIcftS5aNL
         rgHTL2eis2ThiWKE8CihaLqpKAYXtUQ27uJ4Kq78SC4FeBv7DxkJxEXGKuM5jHKauj8p
         y1vA4IrPTgsVhGcgcNX5nNiujIRF0B62netaU+s5lPD9kgt9L7D+vke7JPnN2YsXXdUe
         X5OA==
X-Forwarded-Encrypted: i=1; AJvYcCVqeBg5I0y3I98A9zzfPcMU5jZd96EoutXcC+1LsL12IWdQ/O3EMk2sZPDqyFcVaw9HqD3XUBtET5eKorWnyDq6D/J39kpPeu0B
X-Gm-Message-State: AOJu0YzNUxwPVbYmek4IvkM3d6wLiWA52hnWE0cwlrHcK3rPhUjWa8wZ
	9Yo7F9AnBD6TDFgP1m1xrgzLJP/HI2x6UKVpnq5c8zwZZbMjlay76qkI7BSzAw==
X-Google-Smtp-Source: AGHT+IEJZ3HYcFxZObICKM/x49WlLf4h3po0Yzl2rQr8TWxwQ9a9m/zFcKDEERUUQbcGP3mxNS8r5A==
X-Received: by 2002:aa7:8a06:0:b0:6e4:59d0:febe with SMTP id m6-20020aa78a06000000b006e459d0febemr11129392pfa.7.1708561503366;
        Wed, 21 Feb 2024 16:25:03 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id q13-20020a056a00088d00b006e05c801748sm9501136pfj.199.2024.02.21.16.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 16:25:03 -0800 (PST)
Date: Wed, 21 Feb 2024 16:25:02 -0800
From: Kees Cook <keescook@chromium.org>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org,
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org,
	roman.gushchin@linux.dev, mgorman@suse.de, dave@stgolabs.net,
	willy@infradead.org, liam.howlett@oracle.com,
	penguin-kernel@i-love.sakura.ne.jp, corbet@lwn.net,
	void@manifault.com, peterz@infradead.org, juri.lelli@redhat.com,
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
	tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
	x86@kernel.org, peterx@redhat.com, david@redhat.com,
	axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org,
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org,
	muchun.song@linux.dev, rppt@kernel.org, paulmck@kernel.org,
	pasha.tatashin@soleen.com, yosryahmed@google.com, yuzhao@google.com,
	dhowells@redhat.com, hughd@google.com, andreyknvl@gmail.com,
	ndesaulniers@google.com, vvvvvv@google.com,
	gregkh@linuxfoundation.org, ebiggers@google.com, ytcoode@gmail.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, bristot@redhat.com,
	vschneid@redhat.com, cl@linux.com, penberg@kernel.org,
	iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com,
	elver@google.com, dvyukov@google.com, shakeelb@google.com,
	songmuchun@bytedance.com, jbaron@akamai.com, rientjes@google.com,
	minchan@google.com, kaleshsingh@google.com, kernel-team@android.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-arch@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com,
	cgroups@vger.kernel.org
Subject: Re: [PATCH v4 14/36] lib: add allocation tagging support for memory
 allocation profiling
Message-ID: <202402211608.41AD94094@keescook>
References: <20240221194052.927623-1-surenb@google.com>
 <20240221194052.927623-15-surenb@google.com>
 <202402211449.401382D2AF@keescook>
 <4vwiwgsemga7vmahgwsikbsawjq5xfskdsssmjsfe5hn7k2alk@b6ig5v2pxe5i>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4vwiwgsemga7vmahgwsikbsawjq5xfskdsssmjsfe5hn7k2alk@b6ig5v2pxe5i>

On Wed, Feb 21, 2024 at 06:29:17PM -0500, Kent Overstreet wrote:
> On Wed, Feb 21, 2024 at 03:05:32PM -0800, Kees Cook wrote:
> > On Wed, Feb 21, 2024 at 11:40:27AM -0800, Suren Baghdasaryan wrote:
> > > [...]
> > > +struct alloc_tag {
> > > +	struct codetag			ct;
> > > +	struct alloc_tag_counters __percpu	*counters;
> > > +} __aligned(8);
> > > [...]
> > > +#define DEFINE_ALLOC_TAG(_alloc_tag)						\
> > > +	static DEFINE_PER_CPU(struct alloc_tag_counters, _alloc_tag_cntr);	\
> > > +	static struct alloc_tag _alloc_tag __used __aligned(8)			\
> > > +	__section("alloc_tags") = {						\
> > > +		.ct = CODE_TAG_INIT,						\
> > > +		.counters = &_alloc_tag_cntr };
> > > [...]
> > > +static inline struct alloc_tag *alloc_tag_save(struct alloc_tag *tag)
> > > +{
> > > +	swap(current->alloc_tag, tag);
> > > +	return tag;
> > > +}
> > 
> > Future security hardening improvement idea based on this infrastructure:
> > it should be possible to implement per-allocation-site kmem caches. For
> > example, we could create:
> > 
> > struct alloc_details {
> > 	u32 flags;
> > 	union {
> > 		u32 size; /* not valid after __init completes */
> > 		struct kmem_cache *cache;
> > 	};
> > };
> > 
> > - add struct alloc_details to struct alloc_tag
> > - move the tags section into .ro_after_init
> > - extend alloc_hooks() to populate flags and size:
> > 	.flags = __builtin_constant_p(size) ? KMALLOC_ALLOCATE_FIXED
> > 					    : KMALLOC_ALLOCATE_BUCKETS;
> > 	.size = __builtin_constant_p(size) ? size : SIZE_MAX;
> > - during kernel start or module init, walk the alloc_tag list
> >   and create either a fixed-size kmem_cache or to allocate a
> >   full set of kmalloc-buckets, and update the "cache" member.
> > - adjust kmalloc core routines to use current->alloc_tag->cache instead
> >   of using the global buckets.
> > 
> > This would get us fully separated allocations, producing better than
> > type-based levels of granularity, exceeding what we have currently with
> > CONFIG_RANDOM_KMALLOC_CACHES.
> > 
> > Does this look possible, or am I misunderstanding something in the
> > infrastructure being created here?
> 
> Definitely possible, but... would we want this?

Yes, very very much. One of the worst and mostly unaddressed weaknesses
with the kernel right now is use-after-free based type confusion[0], which
depends on merged caches (or cache reuse).

This doesn't solve cross-allocator (kmalloc/page_alloc) type confusion
(as terrifyingly demonstrated[1] by Jann Horn), but it does help with
what has been a very common case of "use msg_msg to impersonate your
target object"[2] exploitation.

> That would produce a _lot_ of kmem caches

Fewer than you'd expect, but yes, there is some overhead. However,
out-of-tree forks of Linux have successfully experimented with this
already and seen good results[3].

> and don't we already try to collapse those where possible to reduce
> internal fragmentation?

In the past, yes, but the desire for security has tended to have more
people building with SLAB_MERGE_DEFAULT=n and/or CONFIG_RANDOM_KMALLOC_CACHES=y
(or booting with "slab_nomerge").

Just doing the type safety isn't sufficient without the cross-allocator
safety, but we've also had solutions for that proposed[4].

-Kees

[0] https://github.com/KSPP/linux/issues/189
[1] https://googleprojectzero.blogspot.com/2021/10/how-simple-linux-kernel-memory.html
[2] https://www.willsroot.io/2021/08/corctf-2021-fire-of-salvation-writeup.html
    https://google.github.io/security-research/pocs/linux/cve-2021-22555/writeup.html#exploring-struct-msg_msg
[3] https://grsecurity.net/how_autoslab_changes_the_memory_unsafety_game
[4] https://lore.kernel.org/linux-hardening/20230915105933.495735-1-matteorizzo@google.com/

-- 
Kees Cook

