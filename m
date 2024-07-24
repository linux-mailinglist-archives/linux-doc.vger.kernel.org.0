Return-Path: <linux-doc+bounces-21238-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C1993AA55
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jul 2024 03:11:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 967E31F23C1F
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jul 2024 01:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92DCB67E;
	Wed, 24 Jul 2024 01:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xrgjaWBA"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ua1-f73.google.com (mail-ua1-f73.google.com [209.85.222.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37074522A
	for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2024 01:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721783476; cv=none; b=Xv15syCb4dBIVPyAA0WKUYjEuBaZyQMIpTFk8Dy7/eY2XETkedRodrXvahLLlBKOrlRSu+gfvjRHlDmKXZhyzh8YgJjaNbO+biPdFpSE/uwLqBBcdorpq/abztEKmtDVmzOJ2UHWUDRU6O3O8KK2pTwfoi+H0yNGyDCHVSErKoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721783476; c=relaxed/simple;
	bh=RKSd1y7ax+bYPdsM5caHwSz9TwOwV9CPseDLSIS736s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LGEO8eXfol3NPGvcelem7rJCrG4ZVSuCUQ+Apu2MkzxeTLbRcBF4/4WO/p7Qlqe0deNM5aPJE3ZsvZJcGOkNjQPOEw0S6FiS32DZFEg/gOFqKPGDWJ+ioeaJVT3CDVI8XZQ20UK3hYTtnjUno1jmTwJsL1BIGICMBlVd27/lhSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xrgjaWBA; arc=none smtp.client-ip=209.85.222.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Received: by mail-ua1-f73.google.com with SMTP id a1e0cc1a2514c-82018e3c449so1882303241.1
        for <linux-doc@vger.kernel.org>; Tue, 23 Jul 2024 18:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721783474; x=1722388274; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cbTYml8WJPEGh8qSfIdK1VudaJalVARhAdPc06J+ALw=;
        b=xrgjaWBAvrVcofpzuhD0+nN3rsAk6PmOP6IeP2vMugcggg3njhqG0Z+wc/yq9UCoO9
         NzlO+6u4CDXCO+1WlS6Vgz0D6lCVT4cLzhe9PEDItJuvzt73OaIyReawbrOsSP9QXbTq
         MtVMff1MOIGrMSygnM1WbGpD7/a2eOrtxdvuMwK+KzgIZFgoNzGBXzzVLqaeLXkqM0kF
         1G2UaHbsna6/+ZMtFhZUZ6d5tD4LD245sfr5Svop6e5njgJHG7zLnlecJhu8ksWlUAjq
         wdNsw5y2g+YH4cWEaoMkeqclqvhuvkPYxlOjnC0GzLO20YZPHCMiTynU+oWDfXX91lcm
         S/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721783474; x=1722388274;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cbTYml8WJPEGh8qSfIdK1VudaJalVARhAdPc06J+ALw=;
        b=S+tIlpzI1/5RXkQ1+alyC7xMHd/frSnVMMroUQsFR7fH8AyY2nEhMaszvTW2Xl8tux
         gjLDHz1z8S7ykDWBXtFWWzlfZqh+K3fIqL+GGX+xW6L7+udFaM7BcxxxBJUuLRPW3wEw
         EyRNgR3cnjFhA5eR5/bheSZfTifqx4bJNY4ePeHEsDTrXT0N9+RfXX8WypSet+ehC3Wm
         xHj9HYBGpAkufzmoIInBNcJQIPGGGPFCQcwOGxZg+OHg9JaU6n/ubOoQTaKD6mCUwBZh
         jpGrbLG7e7U4JZhsD6/3pANRO2shtRG0DzTDnIbzZI/D8VRZcYx6DmdF/TYsPPGDNKth
         q6pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYt9DPUeu4lqmShXFLdRyI9PWiqRrdJRFc7oQd8TZNTC1JCCdOi0pkS/CwyDPdbX9NnheH5kQpEzsBH3nNdIzB+uko00JPVYRv
X-Gm-Message-State: AOJu0Yx6uDUC3pQ8XKHWIrkTPfObRWDhAd7iH+XeIQMo5R7raQVwx3mV
	/DuPiE7OndlNT8280n7sSPQVjUJ+bskCf0Ko1AJMEnPa6P3yKlJ8jvvxMY3LbPxwZPHI8D9+b0H
	sOEZTnbXUPnE0/K5hIw==
X-Google-Smtp-Source: AGHT+IFU0dcKvF1oJPyuhM+g7ff3d/ALiIFFaW2tweOW7lf82u7TeCdfrHDEq+idZRCqJG0SfkAoO+hAK8jfDIhe
X-Received: from jthoughton.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2a4f])
 (user=jthoughton job=sendgmr) by 2002:a05:6102:54a5:b0:492:a760:c94c with
 SMTP id ada2fe7eead31-493c199efb7mr42818137.4.1721783474197; Tue, 23 Jul 2024
 18:11:14 -0700 (PDT)
Date: Wed, 24 Jul 2024 01:10:26 +0000
In-Reply-To: <20240724011037.3671523-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240724011037.3671523-1-jthoughton@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240724011037.3671523-2-jthoughton@google.com>
Subject: [PATCH v6 01/11] KVM: Add lockless memslot walk to KVM
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
index 689e8be873a7..8cd80f969cff 100644
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
index b14e14cdbfb9..632334861001 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -100,6 +100,9 @@ config KVM_GENERIC_MMU_NOTIFIER
        select MMU_NOTIFIER
        bool
 
+config KVM_MMU_NOTIFIER_YOUNG_LOCKLESS
+       bool
+
 config KVM_GENERIC_MEMORY_ATTRIBUTES
        depends on KVM_GENERIC_MMU_NOTIFIER
        bool
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d0788d0a72cc..33f8997a5c29 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -555,6 +555,7 @@ struct kvm_mmu_notifier_range {
 	on_lock_fn_t on_lock;
 	bool flush_on_ret;
 	bool may_block;
+	bool lockless;
 };
 
 /*
@@ -609,6 +610,10 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
 			 IS_KVM_NULL_FN(range->handler)))
 		return r;
 
+	/* on_lock will never be called for lockless walks */
+	if (WARN_ON_ONCE(range->lockless && !IS_KVM_NULL_FN(range->on_lock)))
+		return r;
+
 	idx = srcu_read_lock(&kvm->srcu);
 
 	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
@@ -640,15 +645,18 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
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
-					goto mmu_unlock;
+				if (!range->lockless) {
+					KVM_MMU_LOCK(kvm);
+					if (!IS_KVM_NULL_FN(range->on_lock))
+						range->on_lock(kvm);
+
+					if (IS_KVM_NULL_FN(range->handler))
+						goto mmu_unlock;
+				}
 			}
 			r.ret |= range->handler(kvm, &gfn_range);
 		}
@@ -658,7 +666,7 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
 		kvm_flush_remote_tlbs(kvm);
 
 mmu_unlock:
-	if (r.found_memslot)
+	if (r.found_memslot && !range->lockless)
 		KVM_MMU_UNLOCK(kvm);
 
 	srcu_read_unlock(&kvm->srcu, idx);
@@ -679,6 +687,8 @@ static __always_inline int kvm_handle_hva_range(struct mmu_notifier *mn,
 		.on_lock	= (void *)kvm_null_fn,
 		.flush_on_ret	= true,
 		.may_block	= false,
+		.lockless	=
+			IS_ENABLED(CONFIG_KVM_MMU_NOTIFIER_YOUNG_LOCKLESS),
 	};
 
 	return __kvm_handle_hva_range(kvm, &range).ret;
@@ -697,6 +707,8 @@ static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_notifier *mn
 		.on_lock	= (void *)kvm_null_fn,
 		.flush_on_ret	= false,
 		.may_block	= false,
+		.lockless	=
+			IS_ENABLED(CONFIG_KVM_MMU_NOTIFIER_YOUNG_LOCKLESS),
 	};
 
 	return __kvm_handle_hva_range(kvm, &range).ret;
-- 
2.46.0.rc1.232.g9752f9e123-goog


