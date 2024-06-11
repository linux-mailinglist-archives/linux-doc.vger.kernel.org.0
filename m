Return-Path: <linux-doc+bounces-18224-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA7D902D84
	for <lists+linux-doc@lfdr.de>; Tue, 11 Jun 2024 02:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2816D1F22AF7
	for <lists+linux-doc@lfdr.de>; Tue, 11 Jun 2024 00:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ACB5BA4B;
	Tue, 11 Jun 2024 00:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qHSmKlUg"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6264C99
	for <linux-doc@vger.kernel.org>; Tue, 11 Jun 2024 00:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718065324; cv=none; b=r98W+GYgTdlvv/1hl8tnGX+hHhnXrqSd+ZxASeUA+m2SwBRX4JTEG5gQQ2TAhbTw2FEOi8OhtGzIKHLYB4xKfWs4YOWNTT8BRYnTSFn5W5bHxretLbZSIjM/EHVfO52w5+zH7ibR16AQiT6S4wqgQClpXpcIpOD/8LS+wVo7RIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718065324; c=relaxed/simple;
	bh=X0aJuerMySwWEyOImz8FDWK4xkhRvTlVTnaqD8v70CY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n9+SjPNLUJjpdCjY4yzoXRVm5H6m825oiAaDaTxeS7+Ypz7FWefZDLtV4CiWFfCnpZ67+CcaYBnpm0SqqjFOrPitioxDYH1d35nJv3dkgiFb4Fyp509bq85Obv1XGW/EQGVBX7kzUKURClnEFltcLxb2mWmQ/mQuXMS47VTWWT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qHSmKlUg; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dfa7a8147c3so8459913276.3
        for <linux-doc@vger.kernel.org>; Mon, 10 Jun 2024 17:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718065321; x=1718670121; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2WPKTEITGM8+K86UxPq3iqbgD4SGKZWY5JBo64AhYsQ=;
        b=qHSmKlUgjKi0CqRwDCES9k3uNlqCBz6rFHfp8OgisCFvxY2Bm6j3rd+etU1ArUlNpz
         LKj29EKFXjgu7sYeZpBkXH6dWBc8pBHCwrYulGXQsVzqTlZakYCR5mmCq/N14G1UJCUk
         +R+9DwZUF5rzRPGEgfBXbg7bLJKv85LRjyMhI85neWi1Fz055AlpjxhtcyfH5CUgsf73
         nKK/kEulynqr88b5HGH2HV6dibhndZWO9xFWlEcQvPLiCNAf2ZOPSoRSbzKK14RS8Ot9
         AMkd14a1eaHt1QRh/Ez37WEyDIpJ4C9u1E6shBVR7NxXRuu5cWBEtEyOXrIXxWMyai49
         JBpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718065321; x=1718670121;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2WPKTEITGM8+K86UxPq3iqbgD4SGKZWY5JBo64AhYsQ=;
        b=F4Y55DtdStgC27gE+IaZ6aNCG1ZhOusqeYrkej407/2Nr6ubiUpBenlrXgw5sWeVgF
         p+w5sMDMIGzQ/uXBPVoWllJOYMJLYpYK5wY82vm6XxX9gH17qDyutaxZkUbifj9RtlmG
         asDJkyyqIdsPt3TRP8zL6/MayLopbkEuR0a/BJzNrpc8Lh0vectjeIL7qEG7UC+lf0f9
         nc+8BZ4AK37JVD8PB73RSXRx5CPa8sSW9gI0ZPL+OEvEx3d8POmRSYcXYo9khPnZkCqr
         amLieX53RWZhCQ0LvrUt7Dwj/eN02BDIlpVMMnAHJs4C/BoXJQA6h0GGASxop8Lq4SQ6
         Sjaw==
X-Forwarded-Encrypted: i=1; AJvYcCUnpDjxuKJO3U2R5ZiWxsXLgIy4lascAl8RsArQZWp8WOE8NADGjxvFr0x7gM0mVS3hINcUd1vL/moxlWLuJ2iOH6t5nXBXaiLS
X-Gm-Message-State: AOJu0YyN52EfvpOCD/AuvR1A1dHtHl01Gs4TZ0+HGpt4eyhCsNeA1KwE
	kl0zX5N1AbCX+SQtdZZ0ImMS4pYzwL0X0bihzuHl3Ve8Yw8O+geeESxyyII9OeSDE5u/Xcs1GAR
	kawWj7ri/vdoWKzocDA==
X-Google-Smtp-Source: AGHT+IEkfpXJhDpYSXj2zWTmc5g4eYevyTxa6JBBNjQgHAzXAToudTEtQid77N/s8K4jHcfyWfR4EDBUwm2H5zD1
X-Received: from jthoughton.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2a4f])
 (user=jthoughton job=sendgmr) by 2002:a05:6902:100a:b0:df4:ece5:2720 with
 SMTP id 3f1490d57ef6-dfaf6608d72mr3353252276.13.1718065321541; Mon, 10 Jun
 2024 17:22:01 -0700 (PDT)
Date: Tue, 11 Jun 2024 00:21:39 +0000
In-Reply-To: <20240611002145.2078921-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240611002145.2078921-1-jthoughton@google.com>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
Message-ID: <20240611002145.2078921-4-jthoughton@google.com>
Subject: [PATCH v5 3/9] KVM: arm64: Relax locking for kvm_test_age_gfn and kvm_age_gfn
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

Replace the MMU write locks (taken in the memslot iteration loop) for
read locks.

Grabbing the read lock instead of the write lock is safe because the
only requirement we have is that the stage-2 page tables do not get
deallocated while we are walking them. The stage2_age_walker() callback
is safe to race with itself; update the comment to reflect the
synchronization change.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/kvm/Kconfig       |  1 +
 arch/arm64/kvm/hyp/pgtable.c | 15 +++++++++------
 arch/arm64/kvm/mmu.c         | 26 ++++++++++++++++++++------
 3 files changed, 30 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 58f09370d17e..7a1af8141c0e 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -22,6 +22,7 @@ menuconfig KVM
 	select KVM_COMMON
 	select KVM_GENERIC_HARDWARE_ENABLING
 	select KVM_GENERIC_MMU_NOTIFIER
+	select KVM_MMU_NOTIFIER_YOUNG_LOCKLESS
 	select HAVE_KVM_CPU_RELAX_INTERCEPT
 	select KVM_MMIO
 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 9e2bbee77491..b1b0f7148cff 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1319,10 +1319,10 @@ static int stage2_age_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	data->young = true;
 
 	/*
-	 * stage2_age_walker() is always called while holding the MMU lock for
-	 * write, so this will always succeed. Nonetheless, this deliberately
-	 * follows the race detection pattern of the other stage-2 walkers in
-	 * case the locking mechanics of the MMU notifiers is ever changed.
+	 * This walk may not be exclusive; the PTE is permitted to change
+	 * from under us. If there is a race to update this PTE, then the
+	 * GFN is most likely young, so failing to clear the AF is likely
+	 * to be inconsequential.
 	 */
 	if (data->mkold && !stage2_try_set_pte(ctx, new))
 		return -EAGAIN;
@@ -1345,10 +1345,13 @@ bool kvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr,
 	struct kvm_pgtable_walker walker = {
 		.cb		= stage2_age_walker,
 		.arg		= &data,
-		.flags		= KVM_PGTABLE_WALK_LEAF,
+		.flags		= KVM_PGTABLE_WALK_LEAF |
+				  KVM_PGTABLE_WALK_SHARED,
 	};
+	int r;
 
-	WARN_ON(kvm_pgtable_walk(pgt, addr, size, &walker));
+	r = kvm_pgtable_walk(pgt, addr, size, &walker);
+	WARN_ON(r && r != -EAGAIN);
 	return data.young;
 }
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 8bcab0cc3fe9..a62c27a347ed 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1773,25 +1773,39 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	u64 size = (range->end - range->start) << PAGE_SHIFT;
+	bool young = false;
+
+	read_lock(&kvm->mmu_lock);
 
 	if (!kvm->arch.mmu.pgt)
 		return false;
 
-	return kvm_pgtable_stage2_test_clear_young(kvm->arch.mmu.pgt,
-						   range->start << PAGE_SHIFT,
-						   size, true);
+	young = kvm_pgtable_stage2_test_clear_young(kvm->arch.mmu.pgt,
+						    range->start << PAGE_SHIFT,
+						    size, true);
+
+out:
+	read_unlock(&kvm->mmu_lock);
+	return young;
 }
 
 bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	u64 size = (range->end - range->start) << PAGE_SHIFT;
+	bool young = false;
+
+	read_lock(&kvm->mmu_lock);
 
 	if (!kvm->arch.mmu.pgt)
 		return false;
 
-	return kvm_pgtable_stage2_test_clear_young(kvm->arch.mmu.pgt,
-						   range->start << PAGE_SHIFT,
-						   size, false);
+	young = kvm_pgtable_stage2_test_clear_young(kvm->arch.mmu.pgt,
+						    range->start << PAGE_SHIFT,
+						    size, false);
+
+out:
+	read_unlock(&kvm->mmu_lock);
+	return young;
 }
 
 phys_addr_t kvm_mmu_get_httbr(void)
-- 
2.45.2.505.gda0bf45e8d-goog


