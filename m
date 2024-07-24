Return-Path: <linux-doc+bounces-21239-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F01A893AA57
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jul 2024 03:11:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A4FD282F08
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jul 2024 01:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D83BDDAD;
	Wed, 24 Jul 2024 01:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ST7bC6PX"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389AB5221
	for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2024 01:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721783477; cv=none; b=RVaaxW5azKonpzUe/+FLMA7QRw66U1wWM+QXaph3QeQ2KkQcDH0SPJwlIIl9Z4+MBGugIL79bXmvuFdSgzhzZdUpNFpaxmOz+2JMOpwJDWMon9O8SiewxFMOrhV9UdzWHd41QNkFjeXxM4P6YMqg6Nxvup4rzyUcSUSeXCDFVlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721783477; c=relaxed/simple;
	bh=xB/HZWznHKcMWgXIB+wI31jSoGcHZFlKoHxpW+3YZZ4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=VFOD0HjT4IsAFANGBAy8O9kcgLSWKaKKOxdz9c9UeLjDvX/mKLPgd7TGEgQem7Vh9BfYU1GQyDMoouK1YS+aGGxufJVudG6l0NPqy81FwADGh6mpaN1TCTjwlSeIgdC/q8+a5zICmBvuuJsOJIjrXW32jpnmLqQ2lYf/jpCvdf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ST7bC6PX; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-650fccfd1dfso170838317b3.0
        for <linux-doc@vger.kernel.org>; Tue, 23 Jul 2024 18:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721783473; x=1722388273; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4cSOuBWS+C1ycbtiGXOUNR2uU8fUZDxisEhVyZ4yNKI=;
        b=ST7bC6PXAKw5k66q3GDQy7G2hwyROXVvlJwIjyXzd/dhUZQoY7ccpsvcUq8omrXQqK
         hJS20WOrX9cNY3U74zA4dvubkPoZKIa/2d85jZ22AiyCCEgoxEzVn990dA5LToxy+GKU
         hF0N9dt/tO9ZIfr6UEJVYDLjc/R8QY2ObSWT7Aj5IP0V6FLPpqbk5HM7gDhJ3ZGFi6lV
         AHBkPB8/we7xA9vNTt4u/LUqphGhMj5eVdQ6ZK/fRV6jbZMC2SpbPLfuNq5+Iq2DriWH
         wIxSJv6kZp8YRzSGbbZH9ZdhvE2E2khpUV5l+5YW1kKPHlSSnsCd6/DOgKK/SX3NzJnq
         C8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721783473; x=1722388273;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4cSOuBWS+C1ycbtiGXOUNR2uU8fUZDxisEhVyZ4yNKI=;
        b=oZ1KKjeaP5NB73F9H3MyW5IreQOQQEqlUAdlFB4ptf8aP8Frxr4qKPNmKljUo2ZlHU
         xr734QcQGC2CIXxcTncmFBqN6Xdw+k3ON2jk2o4puOHHdbuZax5rUKM7BlLL1gse2DXh
         7jH9zhLMmG9YB084sCL/N5Hi8d6M+2BrA3Xr6X9P0eM6BP1b7+MOVtdrBFq9K+Ll6v3B
         rGK6jiS5AcfyLefP+LuuNDIS7n8NZ/2ZgNSnEwo7nQ0iYjpgHiPvd92Hr2SB1kk8/vP2
         8lGQ6Ur1T+XnPVmVotpT32rD4gz3mL8jtrYa6XYmtQ1CPOftxpQe+D5miXXmcD5lTmRW
         TS9g==
X-Forwarded-Encrypted: i=1; AJvYcCXSF+wkCdAbRzOiXR963tduoSzYn4LGFcY6QrxseDGI9xIUYWb2VDJ1qfAgoBqF/xQg4Q0Vw4OSEITufgT176J/Sh3/Qd12sElD
X-Gm-Message-State: AOJu0YwNbygKMFl6FNx32mzepnmOCxPvotpN9zDmTSbtQbaRC0Fq8yrj
	tSo4Sy3oJd8cW52hDB29EKLAjncQqHVHoSOmSEnNQf+n+wiJ1iWr5nicOXRL04EabrJgaSUYNxO
	TNhOs/0r+IRwKpIFnjw==
X-Google-Smtp-Source: AGHT+IHTWsfjxkFhlZ/efjqoG2otoOld5wqzU0dS4uuWsUR/MGeJLDWGi8tLphMhuDEGJQs1xgmW73pGbIUMunRM
X-Received: from jthoughton.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2a4f])
 (user=jthoughton job=sendgmr) by 2002:a05:690c:289:b0:627:a787:abf4 with SMTP
 id 00721157ae682-671f0bcbd75mr236647b3.3.1721783473255; Tue, 23 Jul 2024
 18:11:13 -0700 (PDT)
Date: Wed, 24 Jul 2024 01:10:25 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240724011037.3671523-1-jthoughton@google.com>
Subject: [PATCH v6 00/11] mm: multi-gen LRU: Walk secondary MMU page tables
 while aging
From: James Houghton <jthoughton@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Ankit Agrawal <ankita@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	James Morse <james.morse@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Raghavendra Rao Ananta <rananta@google.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Sean Christopherson <seanjc@google.com>, Shaoqin Huang <shahuang@redhat.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Wei Xu <weixugc@google.com>, 
	Will Deacon <will@kernel.org>, Yu Zhao <yuzhao@google.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

This patchset makes it possible for MGLRU to consult secondary MMUs
while doing aging, not just during eviction. This allows for more
accurate reclaim decisions, which is especially important for proactive
reclaim.

This series does the following:
 1. Improve locking for the existing test/clear_young notifiers for x86
    and arm64.
 2. Add a fast_only parameter into test_young() and clear_young(), and
    add helper functions for using the new parameter (e.g.
    mmu_notifier_clear_young_fast_only(). Non-trivially implement the
    fast-only test_young() and clear_young() for x86_64.
 3. Incorporate mmu_notifier_clear_young_fast_only() into MGLRU aging.
 4. Add an MGLRU mode (-l) to access_tracking_perf_test to show that
    aging is working properly.

Please note that mmu_notifier_test_young_fast_only() is added but not
used in this series. I am happy to remove it if that would be
appropriate.

The fast-only notifiers serve a particular purpose: for aging, we
neither want to delay other operations (e.g. unmapping for eviction)
nor do we want to be delayed by these other operations ourselves. By
default, the implementations of test_young() and clear_young() are meant
to be *accurate*, not fast. The fast-only notifiers will only give age
information that can be gathered fast.

The fast-only notifiers are non-trivially implemented for only x86_64
right now (as the KVM/x86 TDP MMU is the only secondary MMU that
supports lockless Accessed bit harvesting).

To make aging work for more than just x86, the fast-only clear_young()
notifier must be non-trivially implemented by those other architectures
and HAVE_KVM_MMU_NOTIFIER_YOUNG_FAST_ONLY needs to be set.

access_tracking_perf_test now has a mode (-p) to check performance of
MGLRU aging while the VM is faulting memory in. See the v4 cover
letter[2] for performance data collected with this test.

Previous versions of this series included logic in MGLRU and KVM to
support batching the updates to secondary page tables. This version
removes this logic, as it was complex and not necessary to enable
proactive reclaim. This optimization, as well as enabling aging for
arm64 and powerpc, can be done in a later series.

=== Previous Versions ===

Since v5[1]:
 - Reworked test_clear_young_fast_only() into a new parameter for the
   existing notifiers (thanks Sean).
 - Added mmu_notifier.has_fast_aging to tell mm if calling fast-only
   notifiers should be done.
 - Added mm_has_fast_young_notifiers() to inform users if calling
   fast-only notifier helpers is worthwhile (for look-around to use).
 - Changed MGLRU to invoke a single notifier instead of two when
   aging and doing look-around (thanks Yu).
 - For KVM/x86, check indirect_shadow_pages > 0 instead of
   kvm_memslots_have_rmaps() when collecting age information
   (thanks Sean).
 - For KVM/arm, some fixes from Oliver.
 - Small fixes to access_tracking_perf_test.
 - Added missing !MMU_NOTIFIER version of mmu_notifier_clear_young().

Since v4[2]:
 - Removed Kconfig that controlled when aging was enabled. Aging will
   be done whenever the architecture supports it (thanks Yu).
 - Added a new MMU notifier, test_clear_young_fast_only(), specifically
   for MGLRU to use.
 - Add kvm_fast_{test_,}age_gfn, implemented by x86.
 - Fix locking for clear_flush_young().
 - Added KVM_MMU_NOTIFIER_YOUNG_LOCKLESS to clean up locking changes
   (thanks Sean).
 - Fix WARN_ON and other cleanup for the arm64 locking changes
   (thanks Oliver).

Since v3[3]:
 - Vastly simplified the series (thanks David). Removed mmu notifier
   batching logic entirely.
 - Cleaned up how locking is done for mmu_notifier_test/clear_young
   (thanks David).
 - Look-around is now only done when there are no secondary MMUs
   subscribed to MMU notifiers.
 - CONFIG_LRU_GEN_WALKS_SECONDARY_MMU has been added.
 - Fixed the lockless implementation of kvm_{test,}age_gfn for x86
   (thanks David).
 - Added MGLRU functional and performance tests to
   access_tracking_perf_test (thanks Axel).
 - In v3, an mm would be completely ignored (for aging) if there was a
   secondary MMU but support for secondary MMU walking was missing. Now,
   missing secondary MMU walking support simply skips the notifier
   calls (except for eviction).
 - Added a sanity check for that range->lockless and range->on_lock are
   never both provided for the memslot walk.

For the changes since v2[4], see v3.

Based on latest kvm/next.

[1]: https://lore.kernel.org/linux-mm/20240611002145.2078921-1-jthoughton@google.com/
[2]: https://lore.kernel.org/linux-mm/20240529180510.2295118-1-jthoughton@google.com/
[3]: https://lore.kernel.org/linux-mm/20240401232946.1837665-1-jthoughton@google.com/
[4]: https://lore.kernel.org/kvmarm/20230526234435.662652-1-yuzhao@google.com/

James Houghton (11):
  KVM: Add lockless memslot walk to KVM
  KVM: x86: Relax locking for kvm_test_age_gfn and kvm_age_gfn
  KVM: arm64: Relax locking for kvm_test_age_gfn and kvm_age_gfn
  mm: Add missing mmu_notifier_clear_young for !MMU_NOTIFIER
  mm: Add fast_only bool to test_young and clear_young MMU notifiers
  mm: Add has_fast_aging to struct mmu_notifier
  KVM: Pass fast_only to kvm_{test_,}age_gfn
  KVM: x86: Optimize kvm_{test_,}age_gfn a little bit
  KVM: x86: Implement fast_only versions of kvm_{test_,}age_gfn
  mm: multi-gen LRU: Have secondary MMUs participate in aging
  KVM: selftests: Add multi-gen LRU aging to access_tracking_perf_test

 Documentation/admin-guide/mm/multigen_lru.rst |   6 +-
 arch/arm64/kvm/Kconfig                        |   1 +
 arch/arm64/kvm/hyp/pgtable.c                  |  15 +-
 arch/arm64/kvm/mmu.c                          |  30 +-
 arch/x86/include/asm/kvm_host.h               |   1 +
 arch/x86/kvm/Kconfig                          |   2 +
 arch/x86/kvm/mmu/mmu.c                        |  23 +-
 arch/x86/kvm/mmu/tdp_iter.h                   |  27 +-
 arch/x86/kvm/mmu/tdp_mmu.c                    |  67 ++-
 include/linux/kvm_host.h                      |   2 +
 include/linux/mmu_notifier.h                  |  67 ++-
 include/linux/mmzone.h                        |   6 +-
 include/trace/events/kvm.h                    |  19 +-
 mm/damon/vaddr.c                              |   2 -
 mm/mmu_notifier.c                             |  38 +-
 mm/rmap.c                                     |   9 +-
 mm/vmscan.c                                   | 148 +++++--
 tools/testing/selftests/kvm/Makefile          |   1 +
 .../selftests/kvm/access_tracking_perf_test.c | 369 +++++++++++++++--
 .../selftests/kvm/include/lru_gen_util.h      |  55 +++
 .../testing/selftests/kvm/lib/lru_gen_util.c  | 391 ++++++++++++++++++
 virt/kvm/Kconfig                              |   7 +
 virt/kvm/kvm_main.c                           |  73 ++--
 23 files changed, 1194 insertions(+), 165 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/include/lru_gen_util.h
 create mode 100644 tools/testing/selftests/kvm/lib/lru_gen_util.c


base-commit: 332d2c1d713e232e163386c35a3ba0c1b90df83f
-- 
2.46.0.rc1.232.g9752f9e123-goog


