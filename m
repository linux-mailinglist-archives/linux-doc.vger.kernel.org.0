Return-Path: <linux-doc+bounces-34646-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C27AA081A2
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jan 2025 21:50:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A38DF169561
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jan 2025 20:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1809220551A;
	Thu,  9 Jan 2025 20:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LiAyCuwj"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ua1-f74.google.com (mail-ua1-f74.google.com [209.85.222.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F056B2054E2
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 20:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736455800; cv=none; b=CuLdMn8ybkDOxME9970nvQ84h1aFSf2AmpBlMHavC/UC2vsmJ5fRiXimx/unBVZYI4dY8Mizq6ZVv6SvK1NqXAbeVFa4/6mQO6aDxbPPBBFnyC0c2s+z520l0MB+Q6olHUcNwJF7MH7XvUWQs6MY3vPKys2MZXlFEyadMQTZCeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736455800; c=relaxed/simple;
	bh=HNfpPbc0B5+oiokqFlBEDy9D4Azs1/AaYZmxA0SH3Sc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ws3ZRyLqMHz1zWEpeanrsVUTq/OXN9QYbazuAxrHBrOpxa7G0Qmu/hHpkAzU/ZOKCBj2vyyDdibph5PqazWtBP1Ey0tYaWJHH+6VgPa+DE01wyZFPnvMk2QXrEZofsBNn/AEwtGeQN8iQjjhdefkOumD1v3VvuY9ElUAZztw11s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LiAyCuwj; arc=none smtp.client-ip=209.85.222.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Received: by mail-ua1-f74.google.com with SMTP id a1e0cc1a2514c-85bbbba5b59so331041241.0
        for <linux-doc@vger.kernel.org>; Thu, 09 Jan 2025 12:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736455798; x=1737060598; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sy46ZKdMOYPNfFozinwrK5U4YnAl6mgCHSprJv2I5EE=;
        b=LiAyCuwjezVniwNKKASD5bBlkD7sA4eWP3Jg1YTyIlzNR1+HrBnfpLHFRCHADZcE7V
         xDsN8VNRWnN5JHAOMDPNV+pUHviJR6bl5DhyXnHmD4GKHpZsJE1L0BE3odnB3jtYFjhi
         +cFTsSmnmiDWuXFuy2UlDHnXY3m+2mmSIZbOfXrD9qAv8Ila4AipFifEtafpnror4Q3y
         rF21EUWJihAFlG8ISK00ovsfuaMc+xHzVEpPYktVcpNmXbIsgqemMxdaw4Nz7ZN9HTYS
         bsFxMIxeXRZQqh3+X7tHmx97R6cGyr4ae1WtnAB2Q5VrWbN/LhjS3jcAPwu3pQ9za3cS
         hnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736455798; x=1737060598;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sy46ZKdMOYPNfFozinwrK5U4YnAl6mgCHSprJv2I5EE=;
        b=e5dBCp3gbao5/YUs8PPx6inOorZ6aXipNzehCj5h8D2Shefwa57esQt36s9t6JFcXG
         wd/GCKDoL/Gk0l2ONKIacLSRPB0QeGYZgZbCeL7P4Ct6DPqnCMxh1zjlxdaefXI1UfXu
         amvjkwu+qUVyUd/v2P+3RTonPDC8dlN+Jk4JsGjhG5CeWLwkCpdX+Pqxw1DXkqUSksca
         ETb2rvpE006MfRb2GCCDqyEoKEAb+nGY5ct+zT4TiDxICp0W9RPjS77iz6tap6sWdrt0
         U7KEk0KVrd3g1EHt3VThxb6HXLzITNZwfiUmapyswSSlAe+ldKfeKPwu5SRysb61BKRI
         4TEw==
X-Forwarded-Encrypted: i=1; AJvYcCUaA8F34pStxW6OO7Ak+88O5GbaEJ9IeeVfEHRQc3AJQ6ddNIjz/JVmiXCH5BmwMDLMFkci+ey9pZM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwABaftnDPTnNt/SNmFV5G0+LFdlwJuVhUTny1IpZ41DwDIhTd6
	wNxwfrtncs/wh2hB9EgVdo1qy3+6YwuyAJWP7ag4XXEi6zqY6wB0yfXs9TiVq3E4WdDmViZyJO9
	9u5s3m5gvKbqpREqWxw==
X-Google-Smtp-Source: AGHT+IGxjoRseI0ptp1PpNGkamYSZpMVzGlMOrPqkiBhNVZ0uPSquo0Jh6/07xFgWyNiCB/pmTP7I9swsH2tkGpZ
X-Received: from vsvj16.prod.google.com ([2002:a05:6102:3e10:b0:4b4:f067:c6f])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:c12:b0:4b1:1a11:fe3 with SMTP id ada2fe7eead31-4b3d0f15e35mr7763898137.8.1736455797824;
 Thu, 09 Jan 2025 12:49:57 -0800 (PST)
Date: Thu,  9 Jan 2025 20:49:19 +0000
In-Reply-To: <20250109204929.1106563-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109204929.1106563-4-jthoughton@google.com>
Subject: [PATCH v2 03/13] KVM: Allow late setting of KVM_MEM_USERFAULT on
 guest_memfd memslot
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Currently guest_memfd memslots can only be deleted. Slightly change the
logic to allow KVM_MR_FLAGS_ONLY changes when the only flag being
changed is KVM_MEM_USERFAULT.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 virt/kvm/kvm_main.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 4bceae6a6401..882c1f7b4aa8 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2015,9 +2015,6 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		if ((kvm->nr_memslot_pages + npages) < kvm->nr_memslot_pages)
 			return -EINVAL;
 	} else { /* Modify an existing slot. */
-		/* Private memslots are immutable, they can only be deleted. */
-		if (mem->flags & KVM_MEM_GUEST_MEMFD)
-			return -EINVAL;
 		if ((mem->userspace_addr != old->userspace_addr) ||
 		    (npages != old->npages) ||
 		    ((mem->flags ^ old->flags) & KVM_MEM_READONLY))
@@ -2031,6 +2028,16 @@ int __kvm_set_memory_region(struct kvm *kvm,
 			return 0;
 	}
 
+	/*
+	 * Except for being able to set KVM_MEM_USERFAULT, private memslots are
+	 * immutable, they can only be deleted.
+	 */
+	if (mem->flags & KVM_MEM_GUEST_MEMFD &&
+	    !(change == KVM_MR_CREATE ||
+	      (change == KVM_MR_FLAGS_ONLY &&
+	       (mem->flags ^ old->flags) == KVM_MEM_USERFAULT)))
+		return -EINVAL;
+
 	if ((change == KVM_MR_CREATE || change == KVM_MR_MOVE) &&
 	    kvm_check_memslot_overlap(slots, id, base_gfn, base_gfn + npages))
 		return -EEXIST;
@@ -2046,7 +2053,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	new->npages = npages;
 	new->flags = mem->flags;
 	new->userspace_addr = mem->userspace_addr;
-	if (mem->flags & KVM_MEM_GUEST_MEMFD) {
+	if (mem->flags & KVM_MEM_GUEST_MEMFD && change == KVM_MR_CREATE) {
 		r = kvm_gmem_bind(kvm, new, mem->guest_memfd, mem->guest_memfd_offset);
 		if (r)
 			goto out;
-- 
2.47.1.613.gc27f4b7a9f-goog


