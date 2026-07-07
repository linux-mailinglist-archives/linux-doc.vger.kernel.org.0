Return-Path: <linux-doc+bounces-95295-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bGy9FDCgTGoFnQEAu9opvQ
	(envelope-from <linux-doc+bounces-95295-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 08:44:00 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F86C718152
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 08:43:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b="MKfxB/qE";
	dmarc=pass (policy=reject) header.from=google.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95295-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95295-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 10FD33018629
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 06:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F89C3AB285;
	Tue,  7 Jul 2026 06:42:39 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF0E3AA4E1
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 06:42:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783406559; cv=none; b=X/jjVMr7+XlWk9ZAw8PVTg3V8bXLgzwhyl0PLYTO9TNyRkNIIfI2Q2X44ykLv+oawiF96sCcfWixOuBjqs09sCj4YWOcGkeob6ioJDPXiHCzRS2KPK/K0XQbu1ANjF0AYRVk0xj6Y2sRUfdaeifBMCUfQX8jnL1ufVAkSyUnBJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783406559; c=relaxed/simple;
	bh=B/v3yD3THr5KLSeciELWEn01erDJ+vQR61nouTY3vQs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=LaVwOBsp+/Al1v/sxSx3EawZOqhPHcZrVGHp1S5hwhLwxi6TLPWk03TXq5qDqBohB2MIYENmW3MFd5Hdy2MwRfAjDVFCa26pAUN/4B8a14RJbVdAMxn8VJ549YSy4MnxXDvl09j7WxKW/1gkSUlLtLd6GZOCGUrDPyor9BFKemc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--souravpanda.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MKfxB/qE; arc=none smtp.client-ip=209.85.214.201
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2c6a20348ceso56598215ad.1
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 23:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783406557; x=1784011357; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xeJmdcEDb3hj4kjTojGe7izWAUg4e6NWPJspG9L+qV0=;
        b=MKfxB/qE5Uhvgr4iMlZw+NshbtkAaGXjtxwexssYpIbyaVTYUtZgGUrlUQ4Y+8XbVp
         Ik/BHEkvqiOlF67bRAm3T/iYk7WZNzPUptKl+wN+Dqonkc8WReQcgNlla/vF9IZFdlxO
         WoCGSAqjG0kdvqFcYMXBoWKy9h3fTv3gqX7T+7GmLvg74+cMpfvrCrIFRVlXK1rFrcOx
         6jRXaRfjMmz2nIfbY2vjmfvxnEUMJkf0jk6WEpjWWflv6C7+PKDx9TNHE/IAtdHQjkvJ
         PVyJlaismplp+yxcI1h3Bmp1Rk3tilzCHbjw08H4QsyswO581OJcj1pbUSZtZxo6KqeO
         R0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783406557; x=1784011357;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xeJmdcEDb3hj4kjTojGe7izWAUg4e6NWPJspG9L+qV0=;
        b=oDe8OjVZDiixS7+qqUopAWmmh4tJQabwSygVz6N8NXnoVxad3Fo+yf1/W6GkwZGmRE
         O4EqRlQEDOdHhMPXX9YhW81b5z4KZtDGiQ+lHAeJFNFK+Q7sAH+f82Iwmdpo2DVF8MhL
         Qs2JTpMDn5nt/GNyN5pgPyjfjmE4y2ZaGRwL3S4nsVphnQEDgIDpQBXN9g1TWASw7JfM
         lkCE2NA8dqYrF33exx/xbfZdx4ZiVD2GCOrvvTzLkDY47ns1qX3Kd5TnpxdBwJorUbJu
         pSW+p/DQxrQlGKSnRH8ng6cZAlxAXbunVRWCBd48Glts+4B+QA2i/qonlJCVgGyTZqeT
         0LcA==
X-Forwarded-Encrypted: i=1; AHgh+RozRluapKLma2YTnhAoRcEXq3JLPg5Fi3AQc/A3IgRtilj8C1VpGVtLgqF5FxnNRt9AtcmwuJ4J3po=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6l67y7p4EPNjep/w5JOpSJVSuM4g+01Vm9p/rmgfUJ0k2cyPs
	AC3Xg2fkuwDzRyV5d2CHz5FQDxuqhNMgIHPt1pvczXk1SwpHNrJ29RZ8pw4l1GtIcX4X6/hvxhD
	lINrY1ulT3tkpd4XoFIbs4x77tw==
X-Received: from plblk15.prod.google.com ([2002:a17:903:8cf:b0:2c6:bce1:2477])
 (user=souravpanda job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:388b:b0:2ca:d463:27fc with SMTP id d9443c01a7336-2ccbf076ebdmr41254245ad.45.1783406556649;
 Mon, 06 Jul 2026 23:42:36 -0700 (PDT)
Date: Tue,  7 Jul 2026 06:42:29 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <20260707064235.1386552-1-souravpanda@google.com>
Subject: [RFC PATCH 0/6] mm/hugetlb: Dynamic, NUMA-aware HugePage Cache & Free
 Page Reporting
From: Sourav Panda <souravpanda@google.com>
To: muchun.song@linux.dev, osalvador@suse.de, akpm@linux-foundation.org
Cc: david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, mst@redhat.com, 
	mhklinux@outlook.com, souravpanda@google.com, fvdl@google.com, 
	gthelen@google.com, mike.kravetz@oracle.com, pasha.tatashin@soleen.com, 
	rientjes@google.com, riel@surriel.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-95295-lists,linux-doc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,infradead.org,google.com,suse.com,redhat.com,outlook.com,oracle.com,soleen.com,surriel.com,kvack.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:muchun.song@linux.dev,m:osalvador@suse.de,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:mst@redhat.com,m:mhklinux@outlook.com,m:souravpanda@google.com,m:fvdl@google.com,m:gthelen@google.com,m:mike.kravetz@oracle.com,m:pasha.tatashin@soleen.com,m:rientjes@google.com,m:riel@surriel.com,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[souravpanda@google.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[souravpanda@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4F86C718152

Overview
This patch series introduces a dynamic, NUMA-aware HugePage Cache,
backed by a kernel shrinker to safely return memory under pressure, and
integrates it with Free Page Reporting (virtio-balloon) for HugeTLB,
specifically targeting gigantic (1GB) hugepages. The goal is to solve
the tradeoff between allocation latency and memory
fungibility in virtualized and heterogeneous cloud environments.

---

The Core Problem: Allocation Latency vs. Memory Fungibility

With highly heterogeneous workloads, latency-critical applications demand
gigantic hugepages. However, dynamic runtime allocation of 1GB pages
from the buddy allocator (via CMA) is slow.

To bypass this latency, operators often pre-allocate hugepages
statically. However, this locks up the memory: when the HugeTLB
workloads are idle, that memory is completely unavailable for other
buddy-allocator workloads (e.g., page cache, anonymous memory). If buddy
memory is exhausted, the system will OOM even if gigabytes of HugeTLB
pages are sitting idle.

This series resolves this challenge by delivering Dynamic Fungibility:

1.  Dynamic Caching: Intercepts freed surplus hugepages and recycles
    them into a NUMA-aware cache instead of dissolving them immediately.
2.  Fast Allocations: Satisfies subsequent dynamic allocations
    instantly from this warm, local hugepage cache.
3.  Kernel Shrinker Integration: Registers a NUMA-aware kernel shrinker
    to dynamically dissolve cached pages back to the buddy allocator
    under memory pressure, restoring host/guest memory fungibility.
4.  Free Page Reporting Integration: For virtualized environments (Guest
    VMs), cached pages trigger background Free Page Reporting via
    virtio-balloon. This allows the host to reclaim the physical memory
    while the guest retains its Vmemmap Optimization (HVO) metadata
    savings (~14GB saved per 1TB VM)!

  +---------------+   Slow Allocate  +---------------------+
  | Buddy         | ---------------> | Active HugeTLB Page |
  | Allocator     |                  +---------------------+
  +---------------+                    |                ^
    ^                                  | (1) Free to    | (2) Fast
    | (3) Under                        v     Cache      |     Allocate
    | Pressure                       +---------------------+
    | Shrink()  <------------------- | HugeTLB Cache       |
                                     +---------------------+
                                       |
                                       v (4) Free Page Reporting
                                         (Host Reclaim in the case
                                          of virtualization)

---

Patch Series Structure

Patch 1/6: mm/hugetlb: add Kconfig and basic cache infrastructure
  - Introduces the CONFIG_HUGETLB_CACHE option, hstate tracking fields,
    and the HPG_cached page flag.
  - Establishes the clean helper API (hugetlb_folio_is_cached(),
    hugetlb_cache_remove(), hugetlb_cache_add()) and updates
    remove_hugetlb_folio() to be cache-aware, eliminating inline #ifdef
    blocks.
Patch 2/6: mm/hugetlb: implement cache recycling and allocation
  - Hooks up recycling in free_huge_folio() (up to the cache limit) and
    allocation in alloc_surplus_hugetlb_folio().
  - Implements MRU allocation policy for maximum warmth, poison safety
    checks, and MTE/dcache cleaning.
Patch 3/6: mm/hugetlb: add sysfs interfaces for cache
  - Exposes global and per-node sysfs attributes (max_cached_huge_pages,
    nr_cached_hugepages) for dynamic userspace control, including NUMA
    memory policy scaling.
  - Supports dynamic delta adjustments (+1/-1) to safely scale cache
    sizes alongside concurrent background reclaim operations.
Patch 4/6: mm/hugetlb: add memory shrinker for cache
  - Registers a NUMA-aware kernel shrinker to evict and dissolve cached
    gigantic pages back to buddy under memory pressure.
Patch 5/6: Documentation/admin-guide/mm/hugetlbpage.rst: document cache
    interfaces
  - Documents the Kconfig option, sysfs attributes, and shrinker
    behavior in the admin guide.
Patch 6/6: mm/hugetlb: support free page reporting for cached hugepages
  - Integrates the cache with the Free Page Reporting framework (virtio-
    balloon), introducing the HPG_reported flag and the
    reporting/isolation/draining lifecycle.
Sourav Panda (6):
  mm/hugetlb: add Kconfig and basic cache infrastructure
  mm/hugetlb: implement cache recycling and allocation
  mm/hugetlb: add sysfs interfaces for cache
  mm/hugetlb: add memory shrinker for cache
  Documentation/admin-guide/mm/hugetlbpage.rst: document cache
    interfaces
  mm/hugetlb: support free page reporting for cached hugepages

 Documentation/admin-guide/mm/hugetlbpage.rst |  34 +-
 fs/Kconfig                                   |   9 +
 include/linux/hugetlb.h                      |  45 ++
 include/linux/page_reporting.h               |   1 +
 mm/hugetlb.c                                 | 590 ++++++++++++++++++-
 mm/hugetlb_internal.h                        |   9 +
 mm/hugetlb_sysfs.c                           | 158 +++++
 mm/page_reporting.c                          |  10 +-
 mm/page_reporting.h                          |   6 +
 9 files changed, 844 insertions(+), 18 deletions(-)

-- 
2.55.0.rc0.799.gd6f94ed593-goog


