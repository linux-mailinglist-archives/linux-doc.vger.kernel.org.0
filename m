Return-Path: <linux-doc+bounces-17225-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F9B8D3DF5
	for <lists+linux-doc@lfdr.de>; Wed, 29 May 2024 20:06:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 867671F241BB
	for <lists+linux-doc@lfdr.de>; Wed, 29 May 2024 18:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0B511C68BD;
	Wed, 29 May 2024 18:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EdwmZSoX"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365551C2316
	for <linux-doc@vger.kernel.org>; Wed, 29 May 2024 18:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717005926; cv=none; b=YdCwAHjqbMsj8UEsvD4+Kyru3Es7cnGqzHb2bImqK91WeWWuwYier27oVMvI9+pr4/1xVHNj1PajQBqKkoQj/b1S8y506NfFrkxOub7jF++0s1PDpegOb7BjTl7iTMM0fr6SPcQXGgzFNSK26QAfQM1bObzX5Qh9rafW7oYTYpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717005926; c=relaxed/simple;
	bh=qTgSsDtdVZ+dwqZdm4QKshcvn/0b7ZtYjvzgdhBVuqg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FbfzCtVOo0lw+8R7YoyjtAiLU2axefcad0F1PFLt8saQOkd48E42Np5VrV3nHM021uyC27je/757KumH4mAru/eC2SasfyG5b74hnnENQH34ZM1m2NivwCGeqaHlK0PR0Uyu2XF/Sz4Nwn1eAOyUWx+7TlawaNGgUGmiaDriSzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EdwmZSoX; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-df771b4eacbso4149699276.2
        for <linux-doc@vger.kernel.org>; Wed, 29 May 2024 11:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717005922; x=1717610722; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bhng0mHOZ4irF/CjBRL9b9lRPnBOuiSl+dtfP+mXSOo=;
        b=EdwmZSoXdj1gFUoUE9+fGDKF3Aj19v17OcE6itdMJ/ukBxVSGnd8if+LOGevh5It2s
         weVxYW4jHqPYGbQECb7Ejmj9cvbiI8cTZKljFgJAEtWDsYe97fwIkhOcmR2CgCVAUmoi
         yz7upr72s/d0ZmBRylivS11LFDhV33HTNWDlkpy9cdV4sSf1fy2DFDo4FR4Ji3XPIbvc
         IuHiuPhozvsTOWWabGgbYfBJCaTFtlovZllJhwVQ6FwPPiQ1jCzZr9ZJdQa0RGHIgDV6
         xVoyrR+DdhEfS+CWknUMcg8XqlfjkFPesKeied84aoaMdyKuJI+UBBSqIxmtfU0dlp68
         U9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717005922; x=1717610722;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bhng0mHOZ4irF/CjBRL9b9lRPnBOuiSl+dtfP+mXSOo=;
        b=Z3LAGwcfmWXs43VC+CthRFbEjfzcC94m7PBwAm5AiuL0UzPoWPQSp9XjZY7R9piQDw
         0vxOpXMlheEeGqIYY5wwNQmxP/ullCI7Cx3nn7CAvWuvb3S2gezN/F2iXLv/8k7n4ZUs
         HgkM8W0dK+B3M8w1sr/MyIaZeIN48qgR3oo1revRHY1s2jVxII2O8ZDU2uXuMSReZDvm
         FPbrLTY+V+WKOUpdqEIoffbmNtuW7EWg6LrGx1Fh5G0sAFYqulDQNrhPwk0FdDuuF79g
         wLuf2kXTWgxEejZVMt0/d5/O1yucfUiJiJpuUgtZG4keV21BGilYzRJBGyVBVoIJTcVm
         w30Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/h2WBua/Omkdz5rJK6IONa5uJhCEtraMMrmycT91dITgtQnH3lBjASIXgFXGYDBAtpNzBpG93vluDhzlQK1wnKIPrSp7/dz4Q
X-Gm-Message-State: AOJu0YyySE+e1j0ozg80RiBewoAfy6ENpyZaevCIvRunazA4m4M67L9F
	+Gaj0QxkrsJrmLPKsdJtpSZFzHr9dMNaIWctPy8++FBJykL1GLydpSBXKxZsNIMqnvTOB4321CP
	rgLNWU1S6sjlnm5f3jg==
X-Google-Smtp-Source: AGHT+IFl5lukvkJapjmD8BrK9XgC8y+z1iCBS2V0LEPnDYbEA7FDCv/+pHP9QoDJj8/gGxgiQnMalGajsFFn6V8U
X-Received: from jthoughton.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2a4f])
 (user=jthoughton job=sendgmr) by 2002:a05:6902:72d:b0:dee:60e9:69f4 with SMTP
 id 3f1490d57ef6-df77239930emr4274727276.10.1717005921915; Wed, 29 May 2024
 11:05:21 -0700 (PDT)
Date: Wed, 29 May 2024 18:05:08 +0000
In-Reply-To: <20240529180510.2295118-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240529180510.2295118-6-jthoughton@google.com>
Subject: [PATCH v4 5/7] KVM: x86: Relax locking for kvm_test_age_gfn and kvm_age_gfn
From: James Houghton <jthoughton@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Ankit Agrawal <ankita@nvidia.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Bibo Mao <maobibo@loongson.cn>, 
	Catalin Marinas <catalin.marinas@arm.com>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, Huacai Chen <chenhuacai@kernel.org>, 
	James Houghton <jthoughton@google.com>, James Morse <james.morse@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Raghavendra Rao Ananta <rananta@google.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Sean Christopherson <seanjc@google.com>, Shaoqin Huang <shahuang@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Will Deacon <will@kernel.org>, Yu Zhao <yuzhao@google.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Walk the TDP MMU in an RCU read-side critical section. This requires a
way to do RCU-safe walking of the tdp_mmu_roots; do this with a new
macro. The PTE modifications are now done atomically, and
kvm_tdp_mmu_spte_need_atomic_write() has been updated to account for the
fact that kvm_age_gfn can now lockless update the accessed bit and the
R/X bits).

If the cmpxchg for marking the spte for access tracking fails, we simply
retry if the spte is still a leaf PTE. If it isn't, we return false
to continue the walk.

Harvesting age information from the shadow MMU is still done while
holding the MMU write lock.

Suggested-by: Yu Zhao <yuzhao@google.com>
Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/x86/include/asm/kvm_host.h |  1 +
 arch/x86/kvm/mmu/mmu.c          | 18 ++++-----
 arch/x86/kvm/mmu/tdp_iter.h     | 27 +++++++------
 arch/x86/kvm/mmu/tdp_mmu.c      | 67 +++++++++++++++++++++++++--------
 4 files changed, 76 insertions(+), 37 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index ece45b3f6f20..48fb29bb782f 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1438,6 +1438,7 @@ struct kvm_arch {
 	 * tdp_mmu_page set.
 	 *
 	 * For reads, this list is protected by:
+	 *	RCU alone or
 	 *	the MMU lock in read mode + RCU or
 	 *	the MMU lock in write mode
 	 *
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 6a2a557c2c31..956834da8a0e 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -1630,16 +1630,15 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	bool young = false;
 
-	write_lock(&kvm->mmu_lock);
-
-	if (kvm_memslots_have_rmaps(kvm))
+	if (kvm_memslots_have_rmaps(kvm)) {
+		write_lock(&kvm->mmu_lock);
 		young = kvm_handle_gfn_range(kvm, range, kvm_age_rmap);
+		write_unlock(&kvm->mmu_lock);
+	}
 
 	if (tdp_mmu_enabled)
 		young |= kvm_tdp_mmu_age_gfn_range(kvm, range);
 
-	write_unlock(&kvm->mmu_lock);
-
 	return young;
 }
 
@@ -1647,16 +1646,15 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	bool young = false;
 
-	write_lock(&kvm->mmu_lock);
-
-	if (kvm_memslots_have_rmaps(kvm))
+	if (kvm_memslots_have_rmaps(kvm)) {
+		write_lock(&kvm->mmu_lock);
 		young = kvm_handle_gfn_range(kvm, range, kvm_test_age_rmap);
+		write_unlock(&kvm->mmu_lock);
+	}
 
 	if (tdp_mmu_enabled)
 		young |= kvm_tdp_mmu_test_age_gfn(kvm, range);
 
-	write_unlock(&kvm->mmu_lock);
-
 	return young;
 }
 
diff --git a/arch/x86/kvm/mmu/tdp_iter.h b/arch/x86/kvm/mmu/tdp_iter.h
index fae559559a80..f558ae9054af 100644
--- a/arch/x86/kvm/mmu/tdp_iter.h
+++ b/arch/x86/kvm/mmu/tdp_iter.h
@@ -24,16 +24,24 @@ static inline u64 kvm_tdp_mmu_write_spte_atomic(tdp_ptep_t sptep, u64 new_spte)
 	return xchg(rcu_dereference(sptep), new_spte);
 }
 
+static inline u64 tdp_mmu_clear_spte_bits_atomic(tdp_ptep_t sptep, u64 mask)
+{
+	atomic64_t *sptep_atomic = (atomic64_t *)rcu_dereference(sptep);
+
+	return (u64)atomic64_fetch_and(~mask, sptep_atomic);
+}
+
 static inline void __kvm_tdp_mmu_write_spte(tdp_ptep_t sptep, u64 new_spte)
 {
 	WRITE_ONCE(*rcu_dereference(sptep), new_spte);
 }
 
 /*
- * SPTEs must be modified atomically if they are shadow-present, leaf
- * SPTEs, and have volatile bits, i.e. has bits that can be set outside
- * of mmu_lock.  The Writable bit can be set by KVM's fast page fault
- * handler, and Accessed and Dirty bits can be set by the CPU.
+ * SPTEs must be modified atomically if they have bits that can be set outside
+ * of the mmu_lock. This can happen for any shadow-present leaf SPTEs, as the
+ * Writable bit can be set by KVM's fast page fault handler, the Accessed and
+ * Dirty bits can be set by the CPU, and the Accessed and R/X bits can be
+ * cleared by age_gfn_range.
  *
  * Note, non-leaf SPTEs do have Accessed bits and those bits are
  * technically volatile, but KVM doesn't consume the Accessed bit of
@@ -44,8 +52,7 @@ static inline void __kvm_tdp_mmu_write_spte(tdp_ptep_t sptep, u64 new_spte)
 static inline bool kvm_tdp_mmu_spte_need_atomic_write(u64 old_spte, int level)
 {
 	return is_shadow_present_pte(old_spte) &&
-	       is_last_spte(old_spte, level) &&
-	       spte_has_volatile_bits(old_spte);
+	       is_last_spte(old_spte, level);
 }
 
 static inline u64 kvm_tdp_mmu_write_spte(tdp_ptep_t sptep, u64 old_spte,
@@ -61,12 +68,8 @@ static inline u64 kvm_tdp_mmu_write_spte(tdp_ptep_t sptep, u64 old_spte,
 static inline u64 tdp_mmu_clear_spte_bits(tdp_ptep_t sptep, u64 old_spte,
 					  u64 mask, int level)
 {
-	atomic64_t *sptep_atomic;
-
-	if (kvm_tdp_mmu_spte_need_atomic_write(old_spte, level)) {
-		sptep_atomic = (atomic64_t *)rcu_dereference(sptep);
-		return (u64)atomic64_fetch_and(~mask, sptep_atomic);
-	}
+	if (kvm_tdp_mmu_spte_need_atomic_write(old_spte, level))
+		return tdp_mmu_clear_spte_bits_atomic(sptep, mask);
 
 	__kvm_tdp_mmu_write_spte(sptep, old_spte & ~mask);
 	return old_spte;
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 1259dd63defc..c74b0221dae0 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -29,6 +29,11 @@ static __always_inline bool kvm_lockdep_assert_mmu_lock_held(struct kvm *kvm,
 
 	return true;
 }
+static __always_inline bool kvm_lockdep_assert_rcu_read_lock_held(void)
+{
+	WARN_ON_ONCE(!rcu_read_lock_held());
+	return true;
+}
 
 void kvm_mmu_uninit_tdp_mmu(struct kvm *kvm)
 {
@@ -178,6 +183,15 @@ static struct kvm_mmu_page *tdp_mmu_next_root(struct kvm *kvm,
 		     ((_only_valid) && (_root)->role.invalid))) {		\
 		} else
 
+/*
+ * Iterate over all TDP MMU roots in an RCU read-side critical section.
+ */
+#define for_each_tdp_mmu_root_rcu(_kvm, _root, _as_id)				\
+	list_for_each_entry_rcu(_root, &_kvm->arch.tdp_mmu_roots, link)		\
+		if (kvm_lockdep_assert_rcu_read_lock_held() &&			\
+		    (_as_id >= 0 && kvm_mmu_page_as_id(_root) != _as_id)) {	\
+		} else
+
 #define for_each_tdp_mmu_root(_kvm, _root, _as_id)			\
 	__for_each_tdp_mmu_root(_kvm, _root, _as_id, false)
 
@@ -1223,6 +1237,27 @@ static __always_inline bool kvm_tdp_mmu_handle_gfn(struct kvm *kvm,
 	return ret;
 }
 
+static __always_inline bool kvm_tdp_mmu_handle_gfn_lockless(
+		struct kvm *kvm,
+		struct kvm_gfn_range *range,
+		tdp_handler_t handler)
+{
+	struct kvm_mmu_page *root;
+	struct tdp_iter iter;
+	bool ret = false;
+
+	rcu_read_lock();
+
+	for_each_tdp_mmu_root_rcu(kvm, root, range->slot->as_id) {
+		tdp_root_for_each_leaf_pte(iter, root, range->start, range->end)
+			ret |= handler(kvm, &iter, range);
+	}
+
+	rcu_read_unlock();
+
+	return ret;
+}
+
 /*
  * Mark the SPTEs range of GFNs [start, end) unaccessed and return non-zero
  * if any of the GFNs in the range have been accessed.
@@ -1236,28 +1271,30 @@ static bool age_gfn_range(struct kvm *kvm, struct tdp_iter *iter,
 {
 	u64 new_spte;
 
+retry:
 	/* If we have a non-accessed entry we don't need to change the pte. */
 	if (!is_accessed_spte(iter->old_spte))
 		return false;
 
 	if (spte_ad_enabled(iter->old_spte)) {
-		iter->old_spte = tdp_mmu_clear_spte_bits(iter->sptep,
-							 iter->old_spte,
-							 shadow_accessed_mask,
-							 iter->level);
+		iter->old_spte = tdp_mmu_clear_spte_bits_atomic(iter->sptep,
+						shadow_accessed_mask);
 		new_spte = iter->old_spte & ~shadow_accessed_mask;
 	} else {
-		/*
-		 * Capture the dirty status of the page, so that it doesn't get
-		 * lost when the SPTE is marked for access tracking.
-		 */
+		new_spte = mark_spte_for_access_track(iter->old_spte);
+		if (__tdp_mmu_set_spte_atomic(iter, new_spte)) {
+			/*
+			 * The cmpxchg failed. If the spte is still a
+			 * last-level spte, we can safely retry.
+			 */
+			if (is_shadow_present_pte(iter->old_spte) &&
+			    is_last_spte(iter->old_spte, iter->level))
+				goto retry;
+			/* Otherwise, continue walking. */
+			return false;
+		}
 		if (is_writable_pte(iter->old_spte))
 			kvm_set_pfn_dirty(spte_to_pfn(iter->old_spte));
-
-		new_spte = mark_spte_for_access_track(iter->old_spte);
-		iter->old_spte = kvm_tdp_mmu_write_spte(iter->sptep,
-							iter->old_spte, new_spte,
-							iter->level);
 	}
 
 	trace_kvm_tdp_mmu_spte_changed(iter->as_id, iter->gfn, iter->level,
@@ -1267,7 +1304,7 @@ static bool age_gfn_range(struct kvm *kvm, struct tdp_iter *iter,
 
 bool kvm_tdp_mmu_age_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 {
-	return kvm_tdp_mmu_handle_gfn(kvm, range, age_gfn_range);
+	return kvm_tdp_mmu_handle_gfn_lockless(kvm, range, age_gfn_range);
 }
 
 static bool test_age_gfn(struct kvm *kvm, struct tdp_iter *iter,
@@ -1278,7 +1315,7 @@ static bool test_age_gfn(struct kvm *kvm, struct tdp_iter *iter,
 
 bool kvm_tdp_mmu_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
-	return kvm_tdp_mmu_handle_gfn(kvm, range, test_age_gfn);
+	return kvm_tdp_mmu_handle_gfn_lockless(kvm, range, test_age_gfn);
 }
 
 /*
-- 
2.45.1.288.g0e0cd299f1-goog


