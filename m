Return-Path: <linux-doc+bounces-18223-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AACC6902D82
	for <lists+linux-doc@lfdr.de>; Tue, 11 Jun 2024 02:22:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19E82B21994
	for <lists+linux-doc@lfdr.de>; Tue, 11 Jun 2024 00:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0160D63B8;
	Tue, 11 Jun 2024 00:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TQ1W1hNF"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFF5EDF
	for <linux-doc@vger.kernel.org>; Tue, 11 Jun 2024 00:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718065322; cv=none; b=EYUSxMr0mO6BOPaw1z/cc8Lwc/pQjhIY9lWoB75TSW//dDkNnVavK37AOTitsRyRW+jQMW/xRovQWxwX1DTM1hIH+inF8wb/hGCDflt9ayQb8rdyGOgQ4DcmOF6R1PZh28VFBKDkiNjWaFCGw1v59eR5WeGcmF3NCowtuLq4maY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718065322; c=relaxed/simple;
	bh=IMzEBBV4IPFmaMdvHVInrQZr7OKJx2Kta2GVtSnPoRs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eztEpvvcL59y/csYv/2fdIiAqvHkquUmMX63+nYweR9WC5RRZwkzpozXdpdQUKHc9GCejxNFNztm8c1k5dntugY/F4OKK59x6ZEiWDiaEZFyT/wP8g9uPs0CNJ8+YG6SuX+UMv1hsUmea5axtWIGyMld1uGKqA1k+fiNuAvAhtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TQ1W1hNF; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-62cf0ed7761so30292157b3.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Jun 2024 17:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718065320; x=1718670120; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UYg8xBfSHgODLvTlV3mxh03y8s3TyTlow0j+6oXRZyE=;
        b=TQ1W1hNFMy7cNANL+VpkoZgQ7JSKRKZ4OcC5WoaHK4RSOMZkBMq5+OXXEvZfvaiSKj
         MwAIq+V69sfqHZAQDZDHt4/PDHGzlcQNtZG5tEVbV0JCx62dq1X+w80V4HKLCvvpmf1i
         /iIItw0K/V4ByA1fepeR6LjAFVNlWu8xO5ygP+aSMTwy+gsVXUATnx4UNDlMIkEQ10sU
         J9FqGQipxQtPCBcj1UKKtiyVz8er0OCazq5wzPjuSUFWqdYdi98RUrDWOImPfN/WOg1F
         cS/Gky0kIlDR3lGPXEz+yqXltWIUV4JfwBrli7EyKkDRuXQsMw8mDdiSaXe0U4vw3Zue
         0L3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718065320; x=1718670120;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UYg8xBfSHgODLvTlV3mxh03y8s3TyTlow0j+6oXRZyE=;
        b=QMaD4g27pf/qr6KKZ9az+TL7t2zSaWlYK5PDAUsjuGHJLBTuSJ8CJnC3FXFEMZouxH
         w1u1jtHzON1wuJxj5sT0wczhrvm1sr2pMHKs9sL6M7N9euko2xJQGL3BIUY6yoynprb5
         lZ2z3seXmPdd2qvyMeOVSqy5E1cna2/Wnj2A+ATtN/ADkPL69ACDfQNoN82wr3J3Fk2x
         4y+UOXMjBFi+HUZKYZWScOw5m73fdSx1GsqavJZH4t/OzZQe+D9/7bG0JQFNq17xMPGC
         69CaumwA2QOynn5CXJWEopulN/g+7DNvTXJu4Qci4f/XMq4cOgYf7umv7wzAQlrLPIpS
         /7hA==
X-Forwarded-Encrypted: i=1; AJvYcCUFDrRniFpFOWh2L5/UB40wFK5Mcq7A6GnXi8xp3AY04Add1Pf+CL1ZR1Pmoj6KRrcSu7alylc9w68C5a6MtnmS5UzGU8I7mTBt
X-Gm-Message-State: AOJu0Yxlz/kyJA854Pk5ba4szwIxcIWzktdIEhV+g4B2L8TKuvheJswD
	xVy1BD+zTew3xycNDTOS7KEgLK9rKfBkXkbwpV0REKwmMpPFCtANE2lJ03uQep6h46xNSP4MThQ
	DMSlipZN2jPKHVz2aAg==
X-Google-Smtp-Source: AGHT+IEGsmdXMyxgJ1Cj/3hdc6/ErG88swxZnK/rdFuCwoqmhzkdtuuICPRcxc2axyqsks7ulwYmlzACcQfHnSLC
X-Received: from jthoughton.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2a4f])
 (user=jthoughton job=sendgmr) by 2002:a05:6902:1003:b0:dd9:20c1:85b6 with
 SMTP id 3f1490d57ef6-dfd9fcb617bmr288182276.2.1718065319751; Mon, 10 Jun 2024
 17:21:59 -0700 (PDT)
Date: Tue, 11 Jun 2024 00:21:37 +0000
In-Reply-To: <20240611002145.2078921-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240611002145.2078921-1-jthoughton@google.com>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
Message-ID: <20240611002145.2078921-2-jthoughton@google.com>
Subject: [PATCH v5 1/9] KVM: Add lockless memslot walk to KVM
From: James Houghton <jthoughton@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Ankit Agrawal <ankita@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	James Morse <james.morse@arm.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Raghavendra Rao Ananta <rananta@google.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Sean Christopherson <seanjc@google.com>, 
	Shaoqin Huang <shahuang@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Wei Xu <weixugc@google.com>, Will Deacon <will@kernel.org>, Yu Zhao <yuzhao@google.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Provide flexibility to the architecture to synchronize as optimally as
they can instead of always taking the MMU lock for writing.

Architectures that do their own locking must select
CONFIG_KVM_MMU_NOTIFIER_YOUNG_LOCKLESS.

The immediate application is to allow architectures to implement the
test/clear_young MMU notifiers more cheaply.

Suggested-by: Yu Zhao <yuzhao@google.com>
Signed-off-by: James Houghton <jthoughton@google.com>
---
 include/linux/kvm_host.h |  1 +
 virt/kvm/Kconfig         |  3 +++
 virt/kvm/kvm_main.c      | 26 +++++++++++++++++++-------
 3 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 692c01e41a18..4d7c3e8632e6 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -266,6 +266,7 @@ struct kvm_gfn_range {
 	gfn_t end;
 	union kvm_mmu_notifier_arg arg;
 	bool may_block;
+	bool lockless;
 };
 bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
 bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 29b73eedfe74..0404857c1702 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -97,6 +97,9 @@ config KVM_GENERIC_MMU_NOTIFIER
        select MMU_NOTIFIER
        bool
 
+config KVM_MMU_NOTIFIER_YOUNG_LOCKLESS
+       bool
+
 config KVM_GENERIC_MEMORY_ATTRIBUTES
        depends on KVM_GENERIC_MMU_NOTIFIER
        bool
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 14841acb8b95..d8fa0d617f12 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -558,6 +558,7 @@ struct kvm_mmu_notifier_range {
 	on_lock_fn_t on_lock;
 	bool flush_on_ret;
 	bool may_block;
+	bool lockless;
 };
 
 /*
@@ -612,6 +613,10 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
 			 IS_KVM_NULL_FN(range->handler)))
 		return r;
 
+	/* on_lock will never be called for lockless walks */
+	if (WARN_ON_ONCE(range->lockless && !IS_KVM_NULL_FN(range->on_lock)))
+		return r;
+
 	idx = srcu_read_lock(&kvm->srcu);
 
 	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
@@ -643,15 +648,18 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
 			gfn_range.start = hva_to_gfn_memslot(hva_start, slot);
 			gfn_range.end = hva_to_gfn_memslot(hva_end + PAGE_SIZE - 1, slot);
 			gfn_range.slot = slot;
+			gfn_range.lockless = range->lockless;
 
 			if (!r.found_memslot) {
 				r.found_memslot = true;
-				KVM_MMU_LOCK(kvm);
-				if (!IS_KVM_NULL_FN(range->on_lock))
-					range->on_lock(kvm);
-
-				if (IS_KVM_NULL_FN(range->handler))
-					break;
+				if (!range->lockless) {
+					KVM_MMU_LOCK(kvm);
+					if (!IS_KVM_NULL_FN(range->on_lock))
+						range->on_lock(kvm);
+
+					if (IS_KVM_NULL_FN(range->handler))
+						break;
+				}
 			}
 			r.ret |= range->handler(kvm, &gfn_range);
 		}
@@ -660,7 +668,7 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
 	if (range->flush_on_ret && r.ret)
 		kvm_flush_remote_tlbs(kvm);
 
-	if (r.found_memslot)
+	if (r.found_memslot && !range->lockless)
 		KVM_MMU_UNLOCK(kvm);
 
 	srcu_read_unlock(&kvm->srcu, idx);
@@ -681,6 +689,8 @@ static __always_inline int kvm_handle_hva_range(struct mmu_notifier *mn,
 		.on_lock	= (void *)kvm_null_fn,
 		.flush_on_ret	= true,
 		.may_block	= false,
+		.lockless	=
+			IS_ENABLED(CONFIG_KVM_MMU_NOTIFIER_YOUNG_LOCKLESS),
 	};
 
 	return __kvm_handle_hva_range(kvm, &range).ret;
@@ -699,6 +709,8 @@ static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_notifier *mn
 		.on_lock	= (void *)kvm_null_fn,
 		.flush_on_ret	= false,
 		.may_block	= false,
+		.lockless	=
+			IS_ENABLED(CONFIG_KVM_MMU_NOTIFIER_YOUNG_LOCKLESS),
 	};
 
 	return __kvm_handle_hva_range(kvm, &range).ret;
-- 
2.45.2.505.gda0bf45e8d-goog


