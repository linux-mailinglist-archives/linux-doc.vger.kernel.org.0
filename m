Return-Path: <linux-doc+bounces-32029-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F709E4442
	for <lists+linux-doc@lfdr.de>; Wed,  4 Dec 2024 20:14:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A4E0286A7C
	for <lists+linux-doc@lfdr.de>; Wed,  4 Dec 2024 19:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D4291C3C13;
	Wed,  4 Dec 2024 19:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3ASAAo2Y"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-f202.google.com (mail-qk1-f202.google.com [209.85.222.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1011C3BF4
	for <linux-doc@vger.kernel.org>; Wed,  4 Dec 2024 19:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733339659; cv=none; b=KjPKoCrrYzH8DTkjwB9jeKSt3PlhNyyKwPMcX9ij+6KGwPmeZ5//8t6DPgejmZJ3s+Tz1UPN+o3CagC0PuUTyy/77uGO1jFZjPvaZfbehgH29Zpg6nUZiLWBpRfSxDeVaIh3FHjIKhVVOY+8Z/LZpVebXv8QOBVPG2jqL9BSE94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733339659; c=relaxed/simple;
	bh=c0rr8TXquNcORgcEqiRhpBJYz8YSK62+12i246a2psY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lYt9iPKlSdw8rm3LQLF3QjB+h6O96rlyS8Dmukm2nWP/EpPttu1pbDTtEQrXOzo/rAJfPTuLbO4mhoQGe21nF4vesSFrZeLLbkyQWVAS2qrGcHwajLjIRqkauuppToM386TvsENq75ghHpjne3c9wfwDJI6v/N204kTy03fwEBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3ASAAo2Y; arc=none smtp.client-ip=209.85.222.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Received: by mail-qk1-f202.google.com with SMTP id af79cd13be357-7b67a8cd4d2so19513185a.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Dec 2024 11:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733339656; x=1733944456; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zrj0l+L1/XMejjcdAt6Cg23oGRx5OMh6hw9EKc02Jsg=;
        b=3ASAAo2Y6Q32t9MXSrcYfZOAa50WFDxmtoN1qwrCLDCq/DzGJZh5lo7DH4EjK/sJ3Y
         +wqS3W96Fxzek4+V4Pw1sA8xstABIptzWLPaWdOQBk1sJ0H0lh5R26Na5mHy3xZ7ilod
         hY1XDycUeCotGs36F2HeCbGm7d9TQ+BqlsgPZdbGOKR78SbAzsTbMx56NvATEuCY4fxH
         n/+MfqdapFpFRVKa+7zIOP6lejaSNRA/dntmxn0LoG8LpvN69E9Wpy/L+obI49D7Ldnt
         1+HNBxj5LStUVRbA+gehk2YaDB4nmwu0qyem9Ws2eSDe7CvxCepCEIsGwSnnurPj/yED
         bK/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733339656; x=1733944456;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zrj0l+L1/XMejjcdAt6Cg23oGRx5OMh6hw9EKc02Jsg=;
        b=ZL18C7hAKdhUuTEpT+W73JbVIuS4HLCfWgWQbXHf+mRVpR+PN8yjwsLxFb53n9eD0e
         c0jZne6WwpcEiN4heyzucuHJCwetJVfBQAQ6XDi7Z/EVjKmXxfoSeLOnncLN0yJnN7+U
         1elCxs25Us08yz/CQwNthRRViciH3MFqkcP+gRHoq+Lg0Pq1lDRwKipn86Ib9bhM1Vyy
         8sAqPWfXLjpUpNB2UZHDWM4qLNlblWXr9jnTQ6gIegT5sBSsvMPsaYySc4O98/2rOxcE
         +QHmEltTIwGVLyAquh6fjhoDoGJ443PHcbmdguf/SWQd1ZXvgJIplU4gmXSKCNxlAtqM
         BbRw==
X-Forwarded-Encrypted: i=1; AJvYcCV2UA3b6LjJFmvOU0UIEcJ8JLyYeVfLRDEeHTcaaCBRrLoq1GfOOzsbeCzPmZkhc3Dv1A7jOQzLyMY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTZ92/gBcSrhgndQPVy5ftfda3YiVGD73WdM2dE9fReycCe1S7
	zFP8ksAHb+dhftLBdYZpbUJ3kxnQ2+CBe2FttDEXr02QjfvhjeTXCsmHQOmdRcXLviB4JYnqbUO
	Bzw+ZOiQ7tbRcUz9s3Q==
X-Google-Smtp-Source: AGHT+IEsH4AhFxEPswA6HSpr3bvQoscIWPYhswjH6B0ZmAUwG6NVAuJoyTvkHIFeYc2jG+fxyhqARW7A5Wn5aFvO
X-Received: from uabib8.prod.google.com ([2002:a05:6130:1c88:b0:85b:d490:f925])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:2685:b0:7a9:acd5:1b21 with SMTP id af79cd13be357-7b6a61cb6e2mr738681685a.50.1733339656100;
 Wed, 04 Dec 2024 11:14:16 -0800 (PST)
Date: Wed,  4 Dec 2024 19:13:36 +0000
In-Reply-To: <20241204191349.1730936-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241204191349.1730936-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241204191349.1730936-2-jthoughton@google.com>
Subject: [PATCH v1 01/13] KVM: Add KVM_MEM_USERFAULT memslot flag and bitmap
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, Wang@google.com, Wei W <wei.w.wang@intel.com>, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Use one of the 14 reserved u64s in struct kvm_userspace_memory_region2
for the user to provide `userfault_bitmap`.

The memslot flag indicates if KVM should be reading from the
`userfault_bitmap` field from the memslot. The user is permitted to
provide a bogus pointer. If the pointer cannot be read from, we will
return -EFAULT (with no other information) back to the user.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 include/linux/kvm_host.h | 14 ++++++++++++++
 include/uapi/linux/kvm.h |  4 +++-
 virt/kvm/Kconfig         |  3 +++
 virt/kvm/kvm_main.c      | 28 ++++++++++++++++++++++++++++
 4 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 401439bb21e3..f7a3dfd5e224 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -590,6 +590,7 @@ struct kvm_memory_slot {
 	unsigned long *dirty_bitmap;
 	struct kvm_arch_memory_slot arch;
 	unsigned long userspace_addr;
+	unsigned long __user *userfault_bitmap;
 	u32 flags;
 	short id;
 	u16 as_id;
@@ -724,6 +725,11 @@ static inline bool kvm_arch_has_readonly_mem(struct kvm *kvm)
 }
 #endif
 
+static inline bool kvm_has_userfault(struct kvm *kvm)
+{
+	return IS_ENABLED(CONFIG_HAVE_KVM_USERFAULT);
+}
+
 struct kvm_memslots {
 	u64 generation;
 	atomic_long_t last_used_slot;
@@ -2553,4 +2559,12 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
 				    struct kvm_pre_fault_memory *range);
 #endif
 
+int kvm_gfn_userfault(struct kvm *kvm, struct kvm_memory_slot *memslot,
+		      gfn_t gfn);
+
+static inline bool kvm_memslot_userfault(struct kvm_memory_slot *memslot)
+{
+	return memslot->flags & KVM_MEM_USERFAULT;
+}
+
 #endif
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 502ea63b5d2e..94be7e8b46a4 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -40,7 +40,8 @@ struct kvm_userspace_memory_region2 {
 	__u64 guest_memfd_offset;
 	__u32 guest_memfd;
 	__u32 pad1;
-	__u64 pad2[14];
+	__u64 userfault_bitmap;
+	__u64 pad2[13];
 };
 
 /*
@@ -51,6 +52,7 @@ struct kvm_userspace_memory_region2 {
 #define KVM_MEM_LOG_DIRTY_PAGES	(1UL << 0)
 #define KVM_MEM_READONLY	(1UL << 1)
 #define KVM_MEM_GUEST_MEMFD	(1UL << 2)
+#define KVM_MEM_USERFAULT	(1UL << 3)
 
 /* for KVM_IRQ_LINE */
 struct kvm_irq_level {
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 54e959e7d68f..9eb1fae238b1 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -124,3 +124,6 @@ config HAVE_KVM_ARCH_GMEM_PREPARE
 config HAVE_KVM_ARCH_GMEM_INVALIDATE
        bool
        depends on KVM_PRIVATE_MEM
+
+config HAVE_KVM_USERFAULT
+       bool
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index de2c11dae231..23fa3e911c4e 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1541,6 +1541,9 @@ static int check_memory_region_flags(struct kvm *kvm,
 	    !(mem->flags & KVM_MEM_GUEST_MEMFD))
 		valid_flags |= KVM_MEM_READONLY;
 
+	if (kvm_has_userfault(kvm))
+		valid_flags |= KVM_MEM_USERFAULT;
+
 	if (mem->flags & ~valid_flags)
 		return -EINVAL;
 
@@ -2042,6 +2045,8 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		if (r)
 			goto out;
 	}
+	if (mem->flags & KVM_MEM_USERFAULT)
+		new->userfault_bitmap = (unsigned long *)mem->userfault_bitmap;
 
 	r = kvm_set_memslot(kvm, old, new, change);
 	if (r)
@@ -6426,3 +6431,26 @@ void kvm_exit(void)
 	kvm_irqfd_exit();
 }
 EXPORT_SYMBOL_GPL(kvm_exit);
+
+int kvm_gfn_userfault(struct kvm *kvm, struct kvm_memory_slot *memslot,
+		       gfn_t gfn)
+{
+	unsigned long bitmap_chunk = 0;
+	off_t offset;
+
+	if (!kvm_memslot_userfault(memslot))
+		return 0;
+
+	if (WARN_ON_ONCE(!memslot->userfault_bitmap))
+		return 0;
+
+	offset = gfn - memslot->base_gfn;
+
+	if (copy_from_user(&bitmap_chunk,
+			   memslot->userfault_bitmap + offset / BITS_PER_LONG,
+			   sizeof(bitmap_chunk)))
+		return -EFAULT;
+
+	/* Set in the bitmap means that the gfn is userfault */
+	return !!(bitmap_chunk & (1ul << (offset % BITS_PER_LONG)));
+}
-- 
2.47.0.338.g60cca15819-goog


