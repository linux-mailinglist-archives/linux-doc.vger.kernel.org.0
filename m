Return-Path: <linux-doc+bounces-38034-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C63A35171
	for <lists+linux-doc@lfdr.de>; Thu, 13 Feb 2025 23:47:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 580DD188FAB4
	for <lists+linux-doc@lfdr.de>; Thu, 13 Feb 2025 22:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C1426FA61;
	Thu, 13 Feb 2025 22:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Mdh376yz"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oa1-f73.google.com (mail-oa1-f73.google.com [209.85.160.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A58820E011
	for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 22:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739486823; cv=none; b=bY5erDQe7V7MGMYFXcU4tMCe6a1jUg/SoUAEhgTytQ03GRp0aOnAjqpxBgZZEYWPWfvogafbHPzgWjIsRTZAfB6B5qw8kbhxkB8JhfCZzGp+MmXjRdBq31MA/1lGgop/vio5PwLqZWeBs9ORZ9/1Vc448E8lq3f8ZGuDgOGsbeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739486823; c=relaxed/simple;
	bh=SHLJBgWug39ARmk3hQ6ve9K9gtg1ZCru0n/dRfpTUhs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=W4MbnORJvsLn3gjFoKmhoDkJdhl1Sew4G6vXTLsYzPsO/L6+fXqvWvLCCjLoMjGBNUX3WH/m09dfr6MJHROaTW6Bp9yls2q4aC38SmQuFo7KOSq7dyTRuuopHBfls8Ybsuoc+rK9pgQLFiOc8PKU081B3680r/ciKO7NbSSu/mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Mdh376yz; arc=none smtp.client-ip=209.85.160.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Received: by mail-oa1-f73.google.com with SMTP id 586e51a60fabf-2bc72df8fa5so546973fac.3
        for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 14:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739486819; x=1740091619; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=27VMvYX+XeIZWrw3x5wMgd7xnhB8ftl1Uxw2ee/Q3DE=;
        b=Mdh376yzTnr6sCdGwryFLWJjTb28N82fHD9/PsCmnklqsKnbbE7QfdNhnboZVvRO/w
         JlPoH5BYKV2mFh/WkeI50mxRRCq8ES7suxYdKCsQcKtSGWqre9Qnv3wAb5JUeXR+t+Jd
         tuOKrOZX3vF5oHGv32EBElQrisoMYIkaPgra6NMM5BwhD4ttfpCm6RYkDdgSTbWxARbk
         igoR46Yg+axZHVFsBJ/Pgkp7R1ihVr18RR8s1NVTn6NO0bqjhsCWyrDyUkZIDFUaNdu9
         G97/ErrxK34w9KHijohl2dYW9B8JtYxgi4KXiic6VXafQojDk6NyRKtdR/2X9wiyLs+X
         r1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739486819; x=1740091619;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=27VMvYX+XeIZWrw3x5wMgd7xnhB8ftl1Uxw2ee/Q3DE=;
        b=KrM8JMokTdwcsneLmnZrJPNv+VXvD09pXKedCQG9dugH1nJVNFE711NwY2qu/3ggN+
         3TV8NQ6j2PiojvdVAAd33yJOkA005VpEg/n/7E82IJQX8jAeJMxSXFvip9nk5EAmO/Tn
         V5Gai0y1iNifscGoxxifsOjtkNBrgzFeLtLIl8GZlFo8KhgaYEBVrHC8PowVAMLmFFQo
         96XjpHy6XVfPUhkVvL0LPJ3+Oc8AjBgrR0yNAuvnUMfoFw9Ift8m4Acn+FO28tFjXztH
         rhf6ODhOD8WwxRPwOSDmd8lsNqc7aR0sKXyzV/bHKKFNCQ/bb85yFuCLZqVmQ/F5Y2mW
         f96A==
X-Forwarded-Encrypted: i=1; AJvYcCUZCfMnNJqH+utk6onHPvPvDU//dcUwAtYTj8M1XtFV6RqAC3Hbs8b/7HFaGdd42BwY2IoO9rUM0Zw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1PMQmKAEZbuZuQKNSn7ormXCj0SptTtZql2j+xCMK7qrYkr/0
	y/UuMF2QjjA8ZE8Q92M/YnwnmPTwoetCIU6ixf8IERSLIBYiBU8korqLmRPiECBxZkNH9NbgYMW
	EeQ==
X-Google-Smtp-Source: AGHT+IFqU1mAmYOjarqaEBcrctfJ39DVCGZvcnhZHusudh7jNm8NK23hT9sU/SxfoGJNKCasg65TO0nhtlQ=
X-Received: from oabpu8.prod.google.com ([2002:a05:6870:9e88:b0:294:c73f:1037])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6871:67c2:b0:2bc:7c3d:18d8
 with SMTP id 586e51a60fabf-2bc7c3d685cmr120712fac.33.1739486819281; Thu, 13
 Feb 2025 14:46:59 -0800 (PST)
Date: Thu, 13 Feb 2025 14:46:37 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250213224655.1680278-1-surenb@google.com>
Subject: [PATCH v10 00/18] reimplement per-vma lock as a refcount
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, david.laight.linux@gmail.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, surenb@google.com
Content-Type: text/plain; charset="UTF-8"

Back when per-vma locks were introduces, vm_lock was moved out of
vm_area_struct in [1] because of the performance regression caused by
false cacheline sharing. Recent investigation [2] revealed that the
regressions is limited to a rather old Broadwell microarchitecture and
even there it can be mitigated by disabling adjacent cacheline
prefetching, see [3].
Splitting single logical structure into multiple ones leads to more
complicated management, extra pointer dereferences and overall less
maintainable code. When that split-away part is a lock, it complicates
things even further. With no performance benefits, there are no reasons
for this split. Merging the vm_lock back into vm_area_struct also allows
vm_area_struct to use SLAB_TYPESAFE_BY_RCU later in this patchset.
This patchset:
1. moves vm_lock back into vm_area_struct, aligning it at the cacheline
boundary and changing the cache to be cacheline-aligned to minimize
cacheline sharing;
2. changes vm_area_struct initialization to mark new vma as detached until
it is inserted into vma tree;
3. replaces vm_lock and vma->detached flag with a reference counter;
4. regroups vm_area_struct members to fit them into 3 cachelines;
5. changes vm_area_struct cache to SLAB_TYPESAFE_BY_RCU to allow for their
reuse and to minimize call_rcu() calls.

Pagefault microbenchmarks show performance improvement:
Hmean     faults/cpu-1    507926.5547 (   0.00%)   506519.3692 *  -0.28%*
Hmean     faults/cpu-4    479119.7051 (   0.00%)   481333.6802 *   0.46%*
Hmean     faults/cpu-7    452880.2961 (   0.00%)   455845.6211 *   0.65%*
Hmean     faults/cpu-12   347639.1021 (   0.00%)   352004.2254 *   1.26%*
Hmean     faults/cpu-21   200061.2238 (   0.00%)   229597.0317 *  14.76%*
Hmean     faults/cpu-30   145251.2001 (   0.00%)   164202.5067 *  13.05%*
Hmean     faults/cpu-48   106848.4434 (   0.00%)   120641.5504 *  12.91%*
Hmean     faults/cpu-56    92472.3835 (   0.00%)   103464.7916 *  11.89%*
Hmean     faults/sec-1    507566.1468 (   0.00%)   506139.0811 *  -0.28%*
Hmean     faults/sec-4   1880478.2402 (   0.00%)  1886795.6329 *   0.34%*
Hmean     faults/sec-7   3106394.3438 (   0.00%)  3140550.7485 *   1.10%*
Hmean     faults/sec-12  4061358.4795 (   0.00%)  4112477.0206 *   1.26%*
Hmean     faults/sec-21  3988619.1169 (   0.00%)  4577747.1436 *  14.77%*
Hmean     faults/sec-30  3909839.5449 (   0.00%)  4311052.2787 *  10.26%*
Hmean     faults/sec-48  4761108.4691 (   0.00%)  5283790.5026 *  10.98%*
Hmean     faults/sec-56  4885561.4590 (   0.00%)  5415839.4045 *  10.85%*

Changes since v9 [4]:
PATCH [4/18]
- Change VM_BUG_ON_VMA() to WARN_ON_ONCE() in vma_assert_{attached|detached},
per Lorenzo Stoakes
- Rename vma_iter_store() into vma_iter_store_new(), per Lorenzo Stoakes
- Expand changelog, per Lorenzo Stoakes
- Update vma tests to check for vma detached state correctness,
per Lorenzo Stoakes

PATCH [5/18]
- Add Reviewed-by, per Lorenzo Stoakes

PATCH [6/18]
- Add Acked-by, per Lorenzo Stoakes

PATCH [7/18]
- Refactor the code, per Lorenzo Stoakes
- Remove Vlastimil's Acked-by since code is changed

PATCH [8/18]
- Drop inline for mmap_init_lock(), per Lorenzo Stoakes
- Add Reviewed-by, per Lorenzo Stoakes

PATCH [9/18]
- Add Reviewed-by, per Lorenzo Stoakes

PATCH [10/18]
- New patch to add refcount_add_not_zero_acquire/refcount_set_release
- Add Acked-by #slab, per Vlastimil Babka

PATCH [11/18]
- Change refcount limit to be used with xxx_acquire functions

PATCH [12/18]
- Use __refcount_inc_not_zero_limited_acquire() in vma_start_read(),
per Hillf Danton
- Refactor vma_assert_locked() to avoid vm_refcnt read when CONFIG_DEBUG_VM=n,
per Mateusz Guzik
- Update changelog, per Wei Yang
- Change vma_start_read() to return EAGAIN if vma got isolated and changed
lock_vma_under_rcu() back to detect this condition, per Wei Yang
- Change VM_BUG_ON_VMA() to WARN_ON_ONCE() when checking vma detached state,
per Lorenzo Stoakes
- Remove Vlastimil's Reviewed-by since code is changed

PATCH [13/18]
- Update vm_area_struct for tests, per Lorenzo Stoakes
- Add Reviewed-by, per Lorenzo Stoakes

PATCH [14/18]
- Minimized duplicate code, per Lorenzo Stoakes

PATCH [15/18]
- Add Reviewed-by, per Lorenzo Stoakes

PATCH [17/18]
- Use refcount_set_release() in vma_mark_attached(), per Will Deacon

PATCH [18/18]
- Updated documenation, per Lorenzo Stoakes
- Add Reviewed-by, per Lorenzo Stoakes

[1] https://lore.kernel.org/all/20230227173632.3292573-34-surenb@google.com/
[2] https://lore.kernel.org/all/ZsQyI%2F087V34JoIt@xsang-OptiPlex-9020/
[3] https://lore.kernel.org/all/CAJuCfpEisU8Lfe96AYJDZ+OM4NoPmnw9bP53cT_kbfP_pR+-2g@mail.gmail.com/
[4] https://lore.kernel.org/all/20250111042604.3230628-1-surenb@google.com/

Patchset applies over mm-unstable

Suren Baghdasaryan (18):
  mm: introduce vma_start_read_locked{_nested} helpers
  mm: move per-vma lock into vm_area_struct
  mm: mark vma as detached until it's added into vma tree
  mm: introduce vma_iter_store_attached() to use with attached vmas
  mm: mark vmas detached upon exit
  types: move struct rcuwait into types.h
  mm: allow vma_start_read_locked/vma_start_read_locked_nested to fail
  mm: move mmap_init_lock() out of the header file
  mm: uninline the main body of vma_start_write()
  refcount: provide ops for cases when object's memory can be reused
  refcount: introduce __refcount_{add|inc}_not_zero_limited_acquire
  mm: replace vm_lock and detached flag with a reference count
  mm: move lesser used vma_area_struct members into the last cacheline
  mm/debug: print vm_refcnt state when dumping the vma
  mm: remove extra vma_numab_state_init() call
  mm: prepare lock_vma_under_rcu() for vma reuse possibility
  mm: make vma cache SLAB_TYPESAFE_BY_RCU
  docs/mm: document latest changes to vm_lock

 Documentation/RCU/whatisRCU.rst               |  10 +
 Documentation/core-api/refcount-vs-atomic.rst |  37 +++-
 Documentation/mm/process_addrs.rst            |  44 +++--
 include/linux/mm.h                            | 176 ++++++++++++++----
 include/linux/mm_types.h                      |  75 ++++----
 include/linux/mmap_lock.h                     |   6 -
 include/linux/rcuwait.h                       |  13 +-
 include/linux/refcount.h                      | 125 +++++++++++++
 include/linux/slab.h                          |  15 +-
 include/linux/types.h                         |  12 ++
 kernel/fork.c                                 | 129 ++++++-------
 mm/debug.c                                    |   6 +
 mm/init-mm.c                                  |   1 +
 mm/memory.c                                   | 106 ++++++++++-
 mm/mmap.c                                     |   3 +-
 mm/nommu.c                                    |   4 +-
 mm/userfaultfd.c                              |  38 ++--
 mm/vma.c                                      |  27 ++-
 mm/vma.h                                      |  15 +-
 tools/include/linux/refcount.h                |   5 +
 tools/testing/vma/linux/atomic.h              |   6 +
 tools/testing/vma/vma.c                       |  42 ++++-
 tools/testing/vma/vma_internal.h              | 127 ++++++-------
 23 files changed, 702 insertions(+), 320 deletions(-)


base-commit: 47aa60e930fe7fc2a945e4406e3ad1dfa73bb47c
-- 
2.48.1.601.g30ceb7b040-goog


