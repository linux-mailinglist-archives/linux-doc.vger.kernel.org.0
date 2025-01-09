Return-Path: <linux-doc+bounces-34453-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F5EA06AFC
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jan 2025 03:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9096E163313
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jan 2025 02:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CBB5537E9;
	Thu,  9 Jan 2025 02:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kjukbdXK"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8302486334
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 02:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736389831; cv=none; b=oTQbLzv/leslcdsck7yMom+V3lCvmlT/06EdOpLE08bJ8WCuyNzHTle40qstq0Vg3D7K63D545AjnBkgLEOTw2g4BE1eB+2isMz6tPiBplkDZnOx6OmwY+aHsDgCwqtnaAp5Cu71UMpWf6U6OZVZMeyyTBnn4iSih80cC/p/lOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736389831; c=relaxed/simple;
	bh=0L2k9PDqLJwLoeEJmi5dGskV69cyESphdNQuyIPB6V0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=d+XdKIwC6jywMM3BCtD9IZC8ZGeBrsOGoMsoUdCNYdHyrRcIQmRM7xBNdftnkHAD//JeOpyzhhfWgWX2EdhWOa1LvAzhPDSB6+vhSDoG53Qt78xCqrhzIamBerwi36Z9AoAogmTt7VutagjlcJKiUGEgxmAKhf+ddoyvYKsDJoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kjukbdXK; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2f550d28f7dso766753a91.3
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 18:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736389829; x=1736994629; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Cpo3070ozIigd1UD5sogM22USQlvAcQS+SrPZOPOiVU=;
        b=kjukbdXKSQ1+q97iL3M5kWteh1keQinQ4j7yloBxH6rcrKGASLhulEkNMlZrlCLKLd
         4r9jTnnZOwznSdxpmk3Zw/Y5Lo0Ug4QKJ12X87PT0sh+2vC8QPKrvvoTznUt+aGdup4F
         CrGEqOQ2RjV+khLNqGYZpNO2oRkLUGGXwvXKfbExQ7KimxEfTAo1AeF9+RggvBuVKLcq
         A/vP1/ncbLQVpSH9TrdX1U+XkuoIVSUwBsmf0qgnfdXuNXp02rVqxyyzPdF1W/nSZl8Q
         F57PNWwgFpLF5WxrGskmR3pfPgxRoYEb3jvwKHGEilcztRhiSn3FbuupMX4ZkcG7Y9tv
         EHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736389829; x=1736994629;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cpo3070ozIigd1UD5sogM22USQlvAcQS+SrPZOPOiVU=;
        b=Xc3hzH/6xMg4Exyr6VCYgkyIGfM6uvmVwoLrfS2LtKZqksZDzwt/uvhU1km7hrT0Zu
         REVdIa4AJUrVE+hKw9v9WFXB63FemMhb1eayLrt18lC8RhkdRw+ryBoFE/uhGdKlov2s
         vxqEz4ap6hl0iplisi3oP+T8FXclrilBfBdFhR9QQNTm1cGguH/kgvU7cHmmUSV2lhs7
         GlIMld0DCkPEmkYI2s4duu0r+9llqI66FjttdPASSzCCaCaGzjqZu1yLfh2tWdU8+Lg8
         bYF+JeW/UsnehDyuJ8jcz7v1XnfRJ2P8WwwxdPOv1Ui/lu6qFM+5qAkHgnYcCaIWkODR
         kryw==
X-Forwarded-Encrypted: i=1; AJvYcCVe0KKcanrgXZHPWlZ+uRDpcSx5zakYRrO4uYWCWvxEDNhOnlRgPWoc85gAza1/hZLJbNGr1YUUzHY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRQLagBNG0HNAb42Cnof3OdwKYLtJK5aLG2fCi9q5S+5I4uX5k
	QFZ9PGlc3ZEGm3JXiaNg+sPPbOyep2qxxKN6s3djC6/XWzpOq+KBX7CtdSMwfA/SBOD4W7bHbXL
	JCA==
X-Google-Smtp-Source: AGHT+IFWRwQyRHtcEUyRY/wfEsf25Xa6VuwC5jEhGExKs0dL9+I/VX06a6PUWB7b7J8ztc5+nZicWF+9Xfs=
X-Received: from pfbca11.prod.google.com ([2002:a05:6a00:418b:b0:725:936f:c305])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1942:b0:725:d956:aa6f
 with SMTP id d2e1a72fcca58-72d21f7f5a6mr7847896b3a.5.1736389828787; Wed, 08
 Jan 2025 18:30:28 -0800 (PST)
Date: Wed,  8 Jan 2025 18:30:09 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109023025.2242447-1-surenb@google.com>
Subject: [PATCH v8 00/16] move per-vma lock into vm_area_struct
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
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
4. changes vm_area_struct cache to SLAB_TYPESAFE_BY_RCU to allow for their
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

Changes since v7 [4]:
- Removed additional parameter for vma_iter_store() and introduced
vma_iter_store_attached() instead, per Vlastimil Babka and
Liam R. Howlett
- Fixed coding style nits, per Vlastimil Babka
- Added Reviewed-bys and Acked-bys, per Vlastimil Babka
- Added Reviewed-bys and Acked-bys, per Liam R. Howlett
- Added Acked-by, per Davidlohr Bueso
- Removed unnecessary patch changeing nommu.c
- Folded a fixup patch [5] into the patch it was fixing
- Changed calculation in __refcount_add_not_zero_limited() to avoid
overflow, to change the limit to be inclusive and to use INT_MAX to
indicate no limits, per Vlastimil Babka and Matthew Wilcox
- Folded a fixup patch [6] into the patch it was fixing
- Added vm_refcnt rules summary in the changelog, per Liam R. Howlett
- Changed writers to not increment vm_refcnt and adjusted VMA_REF_LIMIT
to not reserve one count for a writer, per Liam R. Howlett
- Changed vma_refcount_put() to wake up writers only when the last reader
is leaving, per Liam R. Howlett
- Fixed rwsem_acquire_read() parameters when read-locking a vma to match
the way down_read_trylock() does lockdep, per Vlastimil Babka
- Folded vma_lockdep_init() into vma_lock_init() for simplicity
- Brought back vma_copy() to keep vm_refcount at 0 during reuse,
per Vlastimil Babka

What I did not include in this patchset:
- Liam's suggestion to change dump_vma() output since it's unclear to me
how it should look like. The patch is for debug only and not critical for
the rest of the series, we can change the output later or even drop it if
necessary.

[1] https://lore.kernel.org/all/20230227173632.3292573-34-surenb@google.com/
[2] https://lore.kernel.org/all/ZsQyI%2F087V34JoIt@xsang-OptiPlex-9020/
[3] https://lore.kernel.org/all/CAJuCfpEisU8Lfe96AYJDZ+OM4NoPmnw9bP53cT_kbfP_pR+-2g@mail.gmail.com/
[4] https://lore.kernel.org/all/20241226170710.1159679-1-surenb@google.com/
[5] https://lore.kernel.org/all/20250107030415.721474-1-surenb@google.com/
[6] https://lore.kernel.org/all/20241226200335.1250078-1-surenb@google.com/

Patchset applies over mm-unstable after reverting v7
(current SHA range: 588f0086398e - fb2270654630)

Suren Baghdasaryan (16):
  mm: introduce vma_start_read_locked{_nested} helpers
  mm: move per-vma lock into vm_area_struct
  mm: mark vma as detached until it's added into vma tree
  mm: introduce vma_iter_store_attached() to use with attached vmas
  mm: mark vmas detached upon exit
  types: move struct rcuwait into types.h
  mm: allow vma_start_read_locked/vma_start_read_locked_nested to fail
  mm: move mmap_init_lock() out of the header file
  mm: uninline the main body of vma_start_write()
  refcount: introduce __refcount_{add|inc}_not_zero_limited
  mm: replace vm_lock and detached flag with a reference count
  mm/debug: print vm_refcnt state when dumping the vma
  mm: remove extra vma_numab_state_init() call
  mm: prepare lock_vma_under_rcu() for vma reuse possibility
  mm: make vma cache SLAB_TYPESAFE_BY_RCU
  docs/mm: document latest changes to vm_lock

 Documentation/mm/process_addrs.rst |  44 +++++----
 include/linux/mm.h                 | 152 ++++++++++++++++++++++-------
 include/linux/mm_types.h           |  36 ++++---
 include/linux/mmap_lock.h          |   6 --
 include/linux/rcuwait.h            |  13 +--
 include/linux/refcount.h           |  20 +++-
 include/linux/slab.h               |   6 --
 include/linux/types.h              |  12 +++
 kernel/fork.c                      | 128 +++++++++++-------------
 mm/debug.c                         |  12 +++
 mm/init-mm.c                       |   1 +
 mm/memory.c                        |  94 +++++++++++++++---
 mm/mmap.c                          |   3 +-
 mm/userfaultfd.c                   |  32 +++---
 mm/vma.c                           |  23 ++---
 mm/vma.h                           |  15 ++-
 tools/testing/vma/linux/atomic.h   |   5 +
 tools/testing/vma/vma_internal.h   |  93 ++++++++----------
 18 files changed, 435 insertions(+), 260 deletions(-)

-- 
2.47.1.613.gc27f4b7a9f-goog


