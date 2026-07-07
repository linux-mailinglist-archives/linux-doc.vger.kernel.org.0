Return-Path: <linux-doc+bounces-95313-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Lf2XIKWqTGptnwEAu9opvQ
	(envelope-from <linux-doc+bounces-95313-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 09:28:37 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE894718761
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 09:28:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=plMzQfR9;
	dmarc=pass (policy=reject) header.from=google.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95313-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95313-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A740306846B
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 07:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698223CBE71;
	Tue,  7 Jul 2026 07:21:46 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7FA388E58
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 07:21:37 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783408905; cv=pass; b=qFsrrLX28HVO3/z7apbq2TF8InzxHLiYcO0kVfX7LuxLY8f4IFXSOyIuRujV1GBd/9f9a+ezEXdDGaKArr+SczVXHseUtj4iorREDE5A4vph22XSqSMfkfBhA068G3ve7ddgk6rOa8kGcbKcyWGhdL2Bmr6Wkunlh/XnHo0b0MI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783408905; c=relaxed/simple;
	bh=qcg4RcF0mT1TEuo/6J21ZVBADngE4CsURMKwvYL8kvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TIZZmPGOx9j+Jl2DMSgfUAdGtnZIq5X5qdr/YheQNdyo9vrwpq+XuHJYPTy59jm2DDUF00VWkPEFBex9m9YS0HWb1G6lpMLSdZ05jT0YVap3UMTbmSdIQgK7NB78xwrcV8WI6mwLmjrpvamkdR71V81lI/1gvbImNhKnm9c+rjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=plMzQfR9; arc=pass smtp.client-ip=209.85.167.51
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aeb6bdeaeaso3017e87.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 00:21:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783408894; cv=none;
        d=google.com; s=arc-20260327;
        b=h1y6kiy/7PKcQnRzOzLyRrnR/Ot4HM0xtM4YvK/h2WVZpE04fQW/Odcoe/66DMst6V
         CsPgiENm8tW2xl96eD7kq2VSNMdTpMUgh2SWiuX9T/ZwDZxab3uRf7h3fXwTeZLSkYIB
         8yF8A0L3SVDTdIn4RAX60HUk3XEAoUSPMex8cXqCTrq2N053qWWqiPgtHdNNoKPXydOy
         hf+C62hABmHhuweJTUkNp3ugjcwtThY3FrW+WTsFfbFfTNBhOaIxXyEeNvONpj4TUU9e
         MRcwm9ICuWXiJ/c9+FQuwM5DZjJ6olS5LMesBWhq1vDN1sLCrUNaUXHPh0YpentVyhCq
         jIiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RuL7lrFAhFFbC0DaxVnYi7IkQ87nYE6lxKOGL6gGHpI=;
        fh=ICfML4PsWMEHG8WoHhgCEPDJeBXwTt2SeUUkHMY5VDM=;
        b=Kx/6GeodasYcyzEbYqhkr+KhIuLD0qURNTx+ICy8KzG2Nj4jREhCHivTqIl+uKBP3x
         /5n8raiF3hl3PGgqdOtFo71FLBri/32WemLHyNSBeUBDF3OwfUiwo58kJexw5z9kjMXi
         J9HS5FejyUVZH24HI1+m55CjSNQweVt7mNgTjPxJMdb5ZKinNHZMSdC2ZObrSTy0cSuN
         uQXA8aGzhKiOvbHNAUnmwX7PdiNpDCruesWiDlQt0ETxApDWuveuAGYyU1c/fbTfbVCr
         uxgQXCfsPRnoL48fqpVUiiypAbRW0dZeWEkJDKA5itnjymUSQdmoYwXqUZx2Z0AUi1lH
         vyiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783408894; x=1784013694; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RuL7lrFAhFFbC0DaxVnYi7IkQ87nYE6lxKOGL6gGHpI=;
        b=plMzQfR922PtFnGS5XA2VJfL6RDVBLwf0PZzoxkLAca0PRT7FLyXmraU00QlJug3IN
         cLt+bzRgR9BldahYGoennkm3SBHH/mTwNKhd6WucaikwGTB0X/5vHDtDD4LR8jqBEMXg
         cVYxEslyJIiuasj9zdeDHEpOafrV9kDl4nhgNh8m0SCnvqjMi00eJkJkPbnka6pU2LBu
         plVg5ZcRfnlhA/QdwpWsnXG9X/0C0PVJO7AKZKQkWX7yqzd4JtZrWr1omfiCvh07Ww1X
         ybwIdITVQgJkOEjI7OXUnR5pI81QZqYTby0b+M0/gUxv7D25q4YeIlFwa/sIx2R17//N
         sNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783408894; x=1784013694;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RuL7lrFAhFFbC0DaxVnYi7IkQ87nYE6lxKOGL6gGHpI=;
        b=A7dCsOKxT6hE2e7+qNtRRaNtwhsngX+lhTqTQnxXPWN6R9kQP88hYqXca89lI4K1iC
         12kSmI4Eo6joWLh/obK17OGeW1KjbG+oqSW4qwtJOSoyrcNoI67wTNi2nX+RpW73y/YQ
         I3EGg/bmJJsLLm+S+kRICkI7K+A5FgJBkPlv9cNDKaYmFc1MgMCSjcMpNFh/jW3hqFK7
         Y5HwCIWqBkOJvwkNd3+pedKIUbZHk6Q1hR7dxGtzcQaUWzPkwzbCaFGUFW/XPyVu36ib
         MpdfdUNpdTGGjXleFdvoBBxM1zdUpKvz2kRjWrcwOEJGsiJJ6d9KzN1ecmMRu7jPt2Tl
         tyVg==
X-Forwarded-Encrypted: i=1; AHgh+RrwFYHuIx5qdpza01AT95AeSZrwKF8hfTqYZe/sWHNDoNeFa5U9r3ra5QTO3Jype5OFW4Py0LxwN+M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7AhYt7DVTsR+Zt1N18nw+Dk3WABsdGKOCcOog/dwKXGjg9jRr
	8P1NVNvhDQOSChRctZwcCKUf5tTWW7k+papQv1N8mTfO3tbdBJRme7e59a5v/LdrzISex7WPaMI
	kaDaPb6L+Ewr6FxojikNywQV5lQizbT/axtA+M5UihWYd/AHYIy2Qr1/v/kan4A==
X-Gm-Gg: AfdE7cm3DxQXTokNA9hv3MoZL0eEeZvd7VmmLZn3KRNx18Dm4Wr9q9Zqy5NIc9C3+1y
	Uv4o8LNsQREjfG0HGGdHx5F3pydK8nQxgghxCUgk5ymmK50ZO2sy5ntEN2SJOvFGNfW85idZZ3v
	4J0fBg+R8FZ2+N2DwNznLy0RTDCgB7x9Nk05JXgBzV74jwjUKaj4mm1HTtcQhuAkx/Gd3FyzKac
	Rp2BJGbABC42BYWkMasoi0EIzKwtg8nHvb91v7yol3BU0OS4HEPEyF+c8XoNZ64e698hpFmrmhG
	bpl67fLrUwlu4XPxHSBe6Lc8yib9QOYXdgsl3jZUw5aDd8uFj9FVk7fIRid0gw==
X-Received: by 2002:ac2:4f05:0:b0:5ae:aff3:3eab with SMTP id
 2adb3069b0e04-5b00ad136f4mr95410e87.3.1783408894149; Tue, 07 Jul 2026
 00:21:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707064235.1386552-1-souravpanda@google.com> <20260707024744-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260707024744-mutt-send-email-mst@kernel.org>
From: Sourav Panda <souravpanda@google.com>
Date: Tue, 7 Jul 2026 00:21:22 -0700
X-Gm-Features: AVVi8CfKV_0_sx6GsBkVajWa1tfSd9GrFQw1r5LpgNz3KY7jvpoCzYNvR5XKQh4
Message-ID: <CANruzcTiDCi_xg=FyykAgnrstvwGqzRDOeHQxu6LAJ_LdYDygw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] mm/hugetlb: Dynamic, NUMA-aware HugePage Cache &
 Free Page Reporting
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: muchun.song@linux.dev, osalvador@suse.de, akpm@linux-foundation.org, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, mhklinux@outlook.com, 
	fvdl@google.com, gthelen@google.com, mike.kravetz@oracle.com, 
	pasha.tatashin@soleen.com, rientjes@google.com, riel@surriel.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mst@redhat.com,m:muchun.song@linux.dev,m:osalvador@suse.de,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:mhklinux@outlook.com,m:fvdl@google.com,m:gthelen@google.com,m:mike.kravetz@oracle.com,m:pasha.tatashin@soleen.com,m:rientjes@google.com,m:riel@surriel.com,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-95313-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[souravpanda@google.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux.dev,suse.de,linux-foundation.org,kernel.org,infradead.org,google.com,suse.com,outlook.com,oracle.com,soleen.com,surriel.com,kvack.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[souravpanda@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE894718761

On Mon, Jul 6, 2026 at 11:57=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Tue, Jul 07, 2026 at 06:42:29AM +0000, Sourav Panda wrote:
> > Overview
> > This patch series introduces a dynamic, NUMA-aware HugePage Cache,
> > backed by a kernel shrinker to safely return memory under pressure, and
> > integrates it with Free Page Reporting (virtio-balloon) for HugeTLB,
> > specifically targeting gigantic (1GB) hugepages. The goal is to solve
> > the tradeoff between allocation latency and memory
> > fungibility in virtualized and heterogeneous cloud environments.
> >
> > ---
> >
> > The Core Problem: Allocation Latency vs. Memory Fungibility
> >
> > With highly heterogeneous workloads, latency-critical applications dema=
nd
> > gigantic hugepages. However, dynamic runtime allocation of 1GB pages
> > from the buddy allocator (via CMA) is slow.
> >
> > To bypass this latency, operators often pre-allocate hugepages
> > statically. However, this locks up the memory: when the HugeTLB
> > workloads are idle, that memory is completely unavailable for other
> > buddy-allocator workloads (e.g., page cache, anonymous memory). If budd=
y
> > memory is exhausted, the system will OOM even if gigabytes of HugeTLB
> > pages are sitting idle.
> >
> > This series resolves this challenge by delivering Dynamic Fungibility:
> >
> > 1.  Dynamic Caching: Intercepts freed surplus hugepages and recycles
> >     them into a NUMA-aware cache instead of dissolving them immediately=
.
> > 2.  Fast Allocations: Satisfies subsequent dynamic allocations
> >     instantly from this warm, local hugepage cache.
> > 3.  Kernel Shrinker Integration: Registers a NUMA-aware kernel shrinker
> >     to dynamically dissolve cached pages back to the buddy allocator
> >     under memory pressure, restoring host/guest memory fungibility.
> > 4.  Free Page Reporting Integration: For virtualized environments (Gues=
t
> >     VMs),
>
> I was going to look into this part, thanks for working on this.
>
> > cached pages trigger background Free Page Reporting via
> >     virtio-balloon. This allows the host to reclaim the physical memory
> >     while the guest retains its Vmemmap Optimization (HVO) metadata
> >     savings (~14GB saved per 1TB VM)!
>
> Why "!" - that's 1.5%, seems surprisingly modest.
> Are you sure it's working as intended?

I phrased it poorly, my bad! Thanks for pointing out Michael :)

That ~14GB is only the guest struct page savings. Meanwhile, the host
is reclaiming the full underlying physical memory of the cached
hugepages via FPR. I do not have a number for this yet.

Let me reword this in the next iteration.


>
> >   +---------------+   Slow Allocate  +---------------------+
> >   | Buddy         | ---------------> | Active HugeTLB Page |
> >   | Allocator     |                  +---------------------+
> >   +---------------+                    |                ^
> >     ^                                  | (1) Free to    | (2) Fast
> >     | (3) Under                        v     Cache      |     Allocate
> >     | Pressure                       +---------------------+
> >     | Shrink()  <------------------- | HugeTLB Cache       |
> >                                      +---------------------+
> >                                        |
> >                                        v (4) Free Page Reporting
> >                                          (Host Reclaim in the case
> >                                           of virtualization)
> >
> > ---
> >
> > Patch Series Structure
> >
> > Patch 1/6: mm/hugetlb: add Kconfig and basic cache infrastructure
> >   - Introduces the CONFIG_HUGETLB_CACHE option, hstate tracking fields,
> >     and the HPG_cached page flag.
> >   - Establishes the clean helper API (hugetlb_folio_is_cached(),
> >     hugetlb_cache_remove(), hugetlb_cache_add()) and updates
> >     remove_hugetlb_folio() to be cache-aware, eliminating inline #ifdef
> >     blocks.
> > Patch 2/6: mm/hugetlb: implement cache recycling and allocation
> >   - Hooks up recycling in free_huge_folio() (up to the cache limit) and
> >     allocation in alloc_surplus_hugetlb_folio().
> >   - Implements MRU allocation policy for maximum warmth, poison safety
> >     checks, and MTE/dcache cleaning.
> > Patch 3/6: mm/hugetlb: add sysfs interfaces for cache
> >   - Exposes global and per-node sysfs attributes (max_cached_huge_pages=
,
> >     nr_cached_hugepages) for dynamic userspace control, including NUMA
> >     memory policy scaling.
> >   - Supports dynamic delta adjustments (+1/-1) to safely scale cache
> >     sizes alongside concurrent background reclaim operations.
> > Patch 4/6: mm/hugetlb: add memory shrinker for cache
> >   - Registers a NUMA-aware kernel shrinker to evict and dissolve cached
> >     gigantic pages back to buddy under memory pressure.
> > Patch 5/6: Documentation/admin-guide/mm/hugetlbpage.rst: document cache
> >     interfaces
> >   - Documents the Kconfig option, sysfs attributes, and shrinker
> >     behavior in the admin guide.
> > Patch 6/6: mm/hugetlb: support free page reporting for cached hugepages
> >   - Integrates the cache with the Free Page Reporting framework (virtio=
-
> >     balloon), introducing the HPG_reported flag and the
> >     reporting/isolation/draining lifecycle.
> > Sourav Panda (6):
> >   mm/hugetlb: add Kconfig and basic cache infrastructure
> >   mm/hugetlb: implement cache recycling and allocation
> >   mm/hugetlb: add sysfs interfaces for cache
> >   mm/hugetlb: add memory shrinker for cache
> >   Documentation/admin-guide/mm/hugetlbpage.rst: document cache
> >     interfaces
> >   mm/hugetlb: support free page reporting for cached hugepages
> >
> >  Documentation/admin-guide/mm/hugetlbpage.rst |  34 +-
> >  fs/Kconfig                                   |   9 +
> >  include/linux/hugetlb.h                      |  45 ++
> >  include/linux/page_reporting.h               |   1 +
> >  mm/hugetlb.c                                 | 590 ++++++++++++++++++-
> >  mm/hugetlb_internal.h                        |   9 +
> >  mm/hugetlb_sysfs.c                           | 158 +++++
> >  mm/page_reporting.c                          |  10 +-
> >  mm/page_reporting.h                          |   6 +
> >  9 files changed, 844 insertions(+), 18 deletions(-)
> >
> > --
> > 2.55.0.rc0.799.gd6f94ed593-goog
>

