Return-Path: <linux-doc+bounces-25786-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FDC986A71
	for <lists+linux-doc@lfdr.de>; Thu, 26 Sep 2024 03:35:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF705284903
	for <lists+linux-doc@lfdr.de>; Thu, 26 Sep 2024 01:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 385031741C6;
	Thu, 26 Sep 2024 01:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VZmOHiVf"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CF413C9C7
	for <linux-doc@vger.kernel.org>; Thu, 26 Sep 2024 01:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727314519; cv=none; b=Gudz4xWga6eKScbLYSAgRiDj/LCmJusgbOAeJPYJBg+jCtNgSDYFBZKFrbq2++vvtqr/1iLbqnlzBjnMFMevWlH5zMixaCOmTVDyRlTOfu7V6sqxMuKs4HJlHoLndTNCsPOaqpuhj/KBnfAluXqq/mrvkPJy1wSFUBpzpxWtaio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727314519; c=relaxed/simple;
	bh=KYU/GVdx2SffFJn1dliltWJ7zMQtOV4x+z6L79CjWmU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SHfpVdGlg5GN1oYqJ2HNOmfxQJ/GrAoMhhM9Z/Hrg2x4dz94Q7dBDB3SdT7aQJ7DkwvI1juiiOx+5bQY7kkBgs1IjKP4KdyCI5KVYJQ+z05mtn2ih6wTo5+/DXyvTSwqFmdWtkkKADD2/jyShbPUJYOCesZckDtX0AdxOpQjTnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VZmOHiVf; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e25cfee6581so84919276.2
        for <linux-doc@vger.kernel.org>; Wed, 25 Sep 2024 18:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727314516; x=1727919316; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xCPXKlvg3fvHTzjtwRf5eteIHvTFuMld4Zvbq5X/Dxs=;
        b=VZmOHiVfNd1RolPuPyxc6uAaDapZZplAb7NfyZw2j4eZYQ/pmxD9ihsZ2ITrHV6z4C
         ah3HzNoBaumc049He3aL653VgUMQOJbXctfNC2kzLxXd4FA4ZXohiVf5az+dU6uEE+6n
         axO6NdBWAqDvtLNhhK6OArKxT178f0ntaTnnLKUe5AiifgOGqlrNgkaxWYhh+IticjYt
         TzNk5e+NvFYzI52eZtgZUDFuxc9Y22vOGfV57fPkmd4rZMpaHDC3Sb411WRhYsUDGykY
         D9Ktj2hf3r3UyFbtjNiOwJqIbjMr1Yts2SU5KVR7K/zzed42CnxWl2uPHPDULYPdiAUb
         xyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727314516; x=1727919316;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xCPXKlvg3fvHTzjtwRf5eteIHvTFuMld4Zvbq5X/Dxs=;
        b=GdciGUgZRdOL1IASmrD9MpglARMhAPKKR0FWRWz97I3ncKBeJBeXQ0drKtRJYNyOQX
         ZA2GdsJwRVHVW0zPgEwnSQylQvTDIehNlWnfF49E0rF5DWxKeajlxu/KhOh7fpOVhzmu
         H1k6vbiJPUy5qJ+BkTQqPNv23OSZhKSSq2/hVTaH/RVvBRxgywBFGKPcdMKsv6/ynF/I
         yFXVBjcFdYr5D5TpuuSYMr5VxiKzpLQINaHhYSNjj58tJr36zBUeZBet+U1grRjHTGPd
         frYXPonl0UQo29Vt+tgA5KRpdYWG8c9SLNTQcq3m9U8mWk+orUtuHQZBiBJugKxA6E8/
         rp8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUbCnd/XN/3Poid7bs4Jc77M1RX5c+lYf/Ies4RJptyKwBgZO/0NUvNMNoeo+OXT8xMVdJz1DoH5cM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzvN7EjJenh0ZLtegeYZnj6Z5q7o5Y7lWHOgqSuBrhId3dkGJ4
	bsCHX64EXfTyrKGMsc2EPEXNw6+lCrMJ4dq3F3MTiwNQmw5jcq3EzqJel3IB5jbzw2guLMKKtHu
	0AcaxfXOQ72JRHYOFDw==
X-Google-Smtp-Source: AGHT+IHCtBDgdi+XBFMofkXIkzVJkl+teLSBao9sOlv55Q8B7jZN9hLVgp83Pu834/Q28A3MUQoEEh6YXmiO2wqz
X-Received: from jthoughton.c.googlers.com ([fda3:e722:ac3:cc00:13d:fb22:ac12:a84b])
 (user=jthoughton job=sendgmr) by 2002:a25:97c7:0:b0:e25:c8fc:b78c with SMTP
 id 3f1490d57ef6-e25c8fcbb92mr1586276.9.1727314516206; Wed, 25 Sep 2024
 18:35:16 -0700 (PDT)
Date: Thu, 26 Sep 2024 01:34:49 +0000
In-Reply-To: <20240926013506.860253-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240926013506.860253-1-jthoughton@google.com>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240926013506.860253-2-jthoughton@google.com>
Subject: [PATCH v7 01/18] KVM: Remove kvm_handle_hva_range helper functions
From: James Houghton <jthoughton@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Wei Xu <weixugc@google.com>, Yu Zhao <yuzhao@google.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

kvm_handle_hva_range is only used by the young notifiers. In a later
patch, it will be even further tied to the young notifiers. Instead of
renaming kvm_handle_hva_range to something like
kvm_handle_hva_range_young, simply remove kvm_handle_hva_range. This
seems slightly more readable, though there is slightly more code
duplication.

Finally, rename __kvm_handle_hva_range to kvm_handle_hva_range, now that
the name is available.

Suggested-by: David Matlack <dmatlack@google.com>
Signed-off-by: James Houghton <jthoughton@google.com>
---
 virt/kvm/kvm_main.c | 81 +++++++++++++++++++++------------------------
 1 file changed, 37 insertions(+), 44 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d51357fd28d7..090e79e4304f 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -589,8 +589,8 @@ static void kvm_null_fn(void)
 	     node;							     \
 	     node = interval_tree_iter_next(node, start, last))	     \
 
-static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
-							   const struct kvm_mmu_notifier_range *range)
+static __always_inline kvm_mn_ret_t kvm_handle_hva_range(struct kvm *kvm,
+							 const struct kvm_mmu_notifier_range *range)
 {
 	struct kvm_mmu_notifier_return r = {
 		.ret = false,
@@ -666,42 +666,6 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
 	return r;
 }
 
-static __always_inline int kvm_handle_hva_range(struct mmu_notifier *mn,
-						unsigned long start,
-						unsigned long end,
-						gfn_handler_t handler)
-{
-	struct kvm *kvm = mmu_notifier_to_kvm(mn);
-	const struct kvm_mmu_notifier_range range = {
-		.start		= start,
-		.end		= end,
-		.handler	= handler,
-		.on_lock	= (void *)kvm_null_fn,
-		.flush_on_ret	= true,
-		.may_block	= false,
-	};
-
-	return __kvm_handle_hva_range(kvm, &range).ret;
-}
-
-static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_notifier *mn,
-							 unsigned long start,
-							 unsigned long end,
-							 gfn_handler_t handler)
-{
-	struct kvm *kvm = mmu_notifier_to_kvm(mn);
-	const struct kvm_mmu_notifier_range range = {
-		.start		= start,
-		.end		= end,
-		.handler	= handler,
-		.on_lock	= (void *)kvm_null_fn,
-		.flush_on_ret	= false,
-		.may_block	= false,
-	};
-
-	return __kvm_handle_hva_range(kvm, &range).ret;
-}
-
 void kvm_mmu_invalidate_begin(struct kvm *kvm)
 {
 	lockdep_assert_held_write(&kvm->mmu_lock);
@@ -794,7 +758,7 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
 	 * that guest memory has been reclaimed.  This needs to be done *after*
 	 * dropping mmu_lock, as x86's reclaim path is slooooow.
 	 */
-	if (__kvm_handle_hva_range(kvm, &hva_range).found_memslot)
+	if (kvm_handle_hva_range(kvm, &hva_range).found_memslot)
 		kvm_arch_guest_memory_reclaimed(kvm);
 
 	return 0;
@@ -840,7 +804,7 @@ static void kvm_mmu_notifier_invalidate_range_end(struct mmu_notifier *mn,
 	};
 	bool wake;
 
-	__kvm_handle_hva_range(kvm, &hva_range);
+	kvm_handle_hva_range(kvm, &hva_range);
 
 	/* Pairs with the increment in range_start(). */
 	spin_lock(&kvm->mn_invalidate_lock);
@@ -862,9 +826,19 @@ static int kvm_mmu_notifier_clear_flush_young(struct mmu_notifier *mn,
 					      unsigned long start,
 					      unsigned long end)
 {
+	struct kvm *kvm = mmu_notifier_to_kvm(mn);
+	const struct kvm_mmu_notifier_range range = {
+		.start		= start,
+		.end		= end,
+		.handler	= kvm_age_gfn,
+		.on_lock	= (void *)kvm_null_fn,
+		.flush_on_ret	= true,
+		.may_block	= false,
+	};
+
 	trace_kvm_age_hva(start, end);
 
-	return kvm_handle_hva_range(mn, start, end, kvm_age_gfn);
+	return kvm_handle_hva_range(kvm, &range).ret;
 }
 
 static int kvm_mmu_notifier_clear_young(struct mmu_notifier *mn,
@@ -872,6 +846,16 @@ static int kvm_mmu_notifier_clear_young(struct mmu_notifier *mn,
 					unsigned long start,
 					unsigned long end)
 {
+	struct kvm *kvm = mmu_notifier_to_kvm(mn);
+	const struct kvm_mmu_notifier_range range = {
+		.start		= start,
+		.end		= end,
+		.handler	= kvm_age_gfn,
+		.on_lock	= (void *)kvm_null_fn,
+		.flush_on_ret	= false,
+		.may_block	= false,
+	};
+
 	trace_kvm_age_hva(start, end);
 
 	/*
@@ -887,17 +871,26 @@ static int kvm_mmu_notifier_clear_young(struct mmu_notifier *mn,
 	 * cadence. If we find this inaccurate, we might come up with a
 	 * more sophisticated heuristic later.
 	 */
-	return kvm_handle_hva_range_no_flush(mn, start, end, kvm_age_gfn);
+	return kvm_handle_hva_range(kvm, &range).ret;
 }
 
 static int kvm_mmu_notifier_test_young(struct mmu_notifier *mn,
 				       struct mm_struct *mm,
 				       unsigned long address)
 {
+	struct kvm *kvm = mmu_notifier_to_kvm(mn);
+	const struct kvm_mmu_notifier_range range = {
+		.start		= address,
+		.end		= address + 1,
+		.handler	= kvm_test_age_gfn,
+		.on_lock	= (void *)kvm_null_fn,
+		.flush_on_ret	= false,
+		.may_block	= false,
+	};
+
 	trace_kvm_test_age_hva(address);
 
-	return kvm_handle_hva_range_no_flush(mn, address, address + 1,
-					     kvm_test_age_gfn);
+	return kvm_handle_hva_range(kvm, &range).ret;
 }
 
 static void kvm_mmu_notifier_release(struct mmu_notifier *mn,
-- 
2.46.0.792.g87dc391469-goog


