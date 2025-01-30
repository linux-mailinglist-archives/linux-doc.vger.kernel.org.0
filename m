Return-Path: <linux-doc+bounces-36445-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 83074A22D8F
	for <lists+linux-doc@lfdr.de>; Thu, 30 Jan 2025 14:20:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D82D21665DD
	for <lists+linux-doc@lfdr.de>; Thu, 30 Jan 2025 13:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC421E2613;
	Thu, 30 Jan 2025 13:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="es9YFAGC"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6D6819
	for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 13:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738243197; cv=none; b=PJD+P2+efEy8ALfxNj7j3oMjMaX0Zj7cCb33AWEEIZFO53OHQkleNY+hhAHPVhGqWa2XsdcJjal40r8EnvBVvSB96DmlHGDqBIs1ypprawbnS44LD1lOsBVMlQLVqllg4eQ2TqmBUKueWy9zUdEOFky/r9UeY6uYqCvkOtD8Vzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738243197; c=relaxed/simple;
	bh=UD1qbWhvJsDDKhvUsyIpHDxQFL8U+b4Ar2ELu6KW2gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hAjgqaBC0HZ9ROBfxnPnwi9VMq+IFQycP+P01f0QOGv4F/0VjhO5VnOrq5i0sClsUONkyaodkt9cmfhHaPYx5FdK7qqVjKk3luY2CozwboL8rAV7WD+Hf2XaepFsknbUFQJnI9Z4I9UoYI3tWpomb0F/icTgZK5ZPMUM7maK7h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=es9YFAGC; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361f796586so8562535e9.3
        for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 05:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738243193; x=1738847993; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=je4i/r40oAXuV4+p1/WiSxUA0U60ME/6bXfv5n4XiRM=;
        b=es9YFAGCwre7eWo9S4bWFRHPoFdczsl2Yz1wzm5J9hlExfC562F4AwBYC9SZ1sxf8J
         rDUo0GoG+EQdH3bCucQV/EMq/BVXaX/GpK6p4mQShXNY4Z2HGYhnMEGuAWzI1XZGhVFY
         gROUW5hdX/OmR6Apsm4ulTQboKr3S+90sImQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738243193; x=1738847993;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=je4i/r40oAXuV4+p1/WiSxUA0U60ME/6bXfv5n4XiRM=;
        b=jUTWyBv1OA0pV1TcTT9y8rsD00GudmQjYky83kKQOv19OXRkXTtzY7R7lTpKYAJyJr
         F6657vT1mUAdBaMuFg4iiZockyUlQ4qg3vqWThJXRdCvJ/aqejGkgeovpCxkLQ44Vmq1
         fm58bSPJ5n21z3ooXs8CMeP+eqqSpHKHRM2lrYiHKfGbH0cj80+U4visEdCK/J0Z0NYw
         QyTJg6mLUt//jKCpGB5atroC662z2Z38W0AUmlQFd0xR3y2vvbyTJBbsrNr82qkr76+a
         nkQeR2WnKR9gUdvSjLC4GJE9AQIYYrYajut1pv7EiYb5qNEgAqCT4Q2QpCxwdJl+KZoV
         0c5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXTH0iGCZdjwQ2fiXj2U3dLj4/7ksDLSl5wpAuHYKtGm56R/D5Ch/MD2Tmy0jLw+EVcM2famCMpO9c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKqpdc7K0XGzbtOUdGsXMWZDRJ+89H6RpZdyfHApHOoJadeuVN
	gO2zGgXmqvEzylsf713PLUYX/r+eqjfBVmVseSpKlu6KLIATyFX16TkZOw7OBFo=
X-Gm-Gg: ASbGnctgKVdolP5Q9ybzJIzdklUH+4MIVG0W7+2iYulpyy4PWRdM7kFZ9xABi/g4HLw
	f87Cq7UCryywzNCMN+/tVZ7sELp/x+pPHeRAeVRTSeCnHAce0RN1gqbnDi3hOeReiaSwp/wiHlq
	Gs1y0dyvy4IEVwSpmC18DYvyFvBe6Z2DHhxSVzC4QFAv1SkIOGR9HKg1w8HeNtFeJmAVxoLEcGF
	YeGEzx+rY3YdrQfNmUMw+awlS/7pHZDcwUiBKox8CWYnN77C9qVs6Tvrl9eQ0OfejIFelB9c2Ny
	Zflx4/zSzJt38fAh02BoVzfnk9o=
X-Google-Smtp-Source: AGHT+IGpIlpBVQ4cq9fFNMeb+rvecigacDPTxIRWc2mwixyppcYhS8KCgcxJ6JU5vKwfdjCrG9DHJQ==
X-Received: by 2002:a5d:5f56:0:b0:385:d7f9:f157 with SMTP id ffacd0b85a97d-38c51e957b9mr6367577f8f.36.1738243193249;
        Thu, 30 Jan 2025 05:19:53 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c101599sm1939047f8f.23.2025.01.30.05.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 05:19:52 -0800 (PST)
Date: Thu, 30 Jan 2025 14:19:50 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	nouveau@lists.freedesktop.org,
	Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>, Alistair Popple <apopple@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 12/12] mm/rmap: keep mapcount untouched for
 device-exclusive entries
Message-ID: <Z5t8dkujVv7xZiuV@phenom.ffwll.local>
Mail-Followup-To: David Hildenbrand <david@redhat.com>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	nouveau@lists.freedesktop.org,
	Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>, Alistair Popple <apopple@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-13-david@redhat.com>
 <Z5tWYpwpUfgEmeKj@phenom.ffwll.local>
 <887df26d-b8bb-48df-af2f-21b220ef22e6@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <887df26d-b8bb-48df-af2f-21b220ef22e6@redhat.com>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Thu, Jan 30, 2025 at 12:42:26PM +0100, David Hildenbrand wrote:
> On 30.01.25 11:37, Simona Vetter wrote:
> > On Wed, Jan 29, 2025 at 12:54:10PM +0100, David Hildenbrand wrote:
> > > Now that conversion to device-exclusive does no longer perform an
> > > rmap walk and the main page_vma_mapped_walk() users were taught to
> > > properly handle nonswap entries, let's treat device-exclusive entries just
> > > as if they would be present, similar to how we handle device-private
> > > entries already.
> > 
> > So the reason for handling device-private entries in rmap is so that
> > drivers can rely on try_to_migrate and related code to invalidate all the
> > various ptes even for device private memory. Otherwise no one should hit
> > this path, at least if my understanding is correct.
> 
> Right, device-private probably only happen to be seen on the migration path
> so far.
> 
> > 
> > So I'm very much worried about opening a can of worms here because I think
> > this adds a genuine new case to all the various callers.
> 
> To be clear: it can all already happen.
> 
> Assume you have a THP (or any mTHP today). You can easily trigger the
> scenario that folio_mapcount() != 0 with active device-exclusive entries,
> and you start doing rmap walks and stumble over these device-exclusive
> entries and *not* handle them properly. Note that more and more systems are
> configured to just give you THP unless you explicitly opted-out using
> MADV_NOHUGEPAGE early.
> 
> Note that b756a3b5e7ea added that hunk that still walks these
> device-exclusive entries in rmap code, but didn't actually update the rmap
> walkers:
> 
> @@ -102,7 +104,8 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw)
> 
>                 /* Handle un-addressable ZONE_DEVICE memory */
>                 entry = pte_to_swp_entry(*pvmw->pte);
> -               if (!is_device_private_entry(entry))
> +               if (!is_device_private_entry(entry) &&
> +                   !is_device_exclusive_entry(entry))
>                         return false;
> 
>                 pfn = swp_offset(entry);
> 
> That was the right thing to do, because they resemble PROT_NONE entries and
> not migration entries or anything else that doesn't hold a folio reference).

Yeah I got that part. What I meant is that doubling down on this needs a
full audit and cannot rely on "we already have device private entries
going through these paths for much longer", which was the impression I
got. I guess it worked, thanks for doing that below :-)

And at least from my very rough understanding of mm, at least around all
this gpu stuff, tracking device exclusive mappings like real cpu mappings
makes sense, they do indeed act like PROT_NONE with some magic to restore
access on fault.

I do wonder a bit though what else is all not properly tracked because
they should be like prot_none except arent. I guess we'll find those as we
hit them :-/

> Fortunately, it's only the page_vma_mapped_walk() callers that need care.
> 
> mm/rmap.c is handled with this series.
> 
> mm/page_vma_mapped.c should work already.
> 
> mm/migrate.c: does not apply
> 
> mm/page_idle.c: likely should just skip !pte_present().
> 
> mm/ksm.c might be fine, but likely we should just reject !pte_present().
> 
> kernel/events/uprobes.c likely should reject !pte_present().
> 
> mm/damon/paddr.c likely should reject !pte_present().
> 
> 
> I briefly though about a flag to indicate if a page_vma_mapped_walk()
> supports these non-present entries, but likely just fixing them up is
> easier+cleaner.
> 
> Now that I looked at all, I might just write patches for them.
> 
> > 
> > > This fixes swapout/migration of folios with device-exclusive entries.
> > > 
> > > Likely there are still some page_vma_mapped_walk() callers that are not
> > > fully prepared for these entries, and where we simply want to refuse
> > > !pte_present() entries. They have to be fixed independently; the ones in
> > > mm/rmap.c are prepared.
> > 
> > The other worry is that maybe breaking migration is a feature, at least in
> > parts.
> 
> Maybe breaking swap and migration is a feature in some reality, in this
> reality it's a BUG :)

Oh yeah I agree on those :-)

> If thp constantly reassembles a pmd entry because hey all the
> > memory is contig and userspace allocated a chunk of memory to place
> > atomics that alternate between cpu and gpu nicely separated by 4k pages,
> > then we'll thrash around invalidating ptes to no end. So might be more
> > fallout here.
> 
> khugepaged will back off once it sees an exclusive entry, so collapsing
> could only happen once everything is non-exclusive. See
> __collapse_huge_page_isolate() as an example.

Ah ok. I think might be good to add that to the commit message, so that
people who don't understand mm deeply (like me) aren't worried when they
stumble over this change in the future again when digging around.

> It's really only page_vma_mapped_walk() callers that are affected by this
> change, not any other page table walkers.

I guess my mm understanding is just not up to that, but I couldn't figure
out why just looking at page_vma_mapped_walk() only is good enough?

> It's unfortunate that we now have to fix it all up, that original series
> should have never been merged that way.

Yeah looks like a rather big miss.
-Sima

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

