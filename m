Return-Path: <linux-doc+bounces-32032-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC12E9E444B
	for <lists+linux-doc@lfdr.de>; Wed,  4 Dec 2024 20:15:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B18A2169415
	for <lists+linux-doc@lfdr.de>; Wed,  4 Dec 2024 19:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 023D51F541A;
	Wed,  4 Dec 2024 19:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k55UV2wp"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ot1-f74.google.com (mail-ot1-f74.google.com [209.85.210.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA3A1F03CE
	for <linux-doc@vger.kernel.org>; Wed,  4 Dec 2024 19:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733339661; cv=none; b=q360B18C0wCR2GluM9M2JLXSXhuBmkuloQR0TBG+ce25w5XENFi4m2VRlVWj5tmLp0GFhDxpS7BG8+R+kM8Q0DH3ODy/Pk93RnT8nDmcrJCRhl3JSqO4e7zoKp9c1OFEFFiwzWO15QoykJKwZL4d1nHd1hFpCWzeW2DJrh4hNos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733339661; c=relaxed/simple;
	bh=TpUkUFBOXODTTMhFPZD2lNGB5T081ke6yKBQcgGS+ss=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=J0X6yxFhyVvJwH7TYMIhPvyaxyc6OAuh8hCOFEvl9lvH1WkNWhEgpjIuYiW3t2Izihp0tp7tt3ZamX6jqHdxYxQOQMxQnSeq2hmLty0kRixXxS/vcn2KZlovNzs04LhRiMetrktzKV+6l8o4Um/SAOqtprJmJ2o05qxtzcKaSs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k55UV2wp; arc=none smtp.client-ip=209.85.210.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Received: by mail-ot1-f74.google.com with SMTP id 46e09a7af769-71d418d1977so128946a34.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Dec 2024 11:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733339659; x=1733944459; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QAQf3CS/PWwFToEYvErsd8wUXXWpCS3gaH7WeW/jjGQ=;
        b=k55UV2wpB+kQRl+gbfTP1ICVDfPAXkFhbcIMhO4AHNV+DHiAr/Uf9O4Vjak5FnOg/a
         r9eU+1BgxJ9M2obz0NIir5XE5kYm/Rke+Bw2iyV1zIzibuYmbaqWA/5DrnFRGLxk3cKE
         2djkRF+B+rzi3dY5mc7nGolIuY96T4owSbcj+HtqgQZZgA2emkWCTiSHghI3X1BuDkH2
         bsvtt1mJl/NeNbLcJod0vqVc6lyUk520gFbB/pTz3+sGrSD8X7mNtFuqNjpcOfUs9ZRd
         rShKitaZQ2Dt2VMaCQNzSin3NriMtegyVz3tIWmV+gBVicOsMua4maJc1zwVh0V6W4LT
         ShEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733339659; x=1733944459;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QAQf3CS/PWwFToEYvErsd8wUXXWpCS3gaH7WeW/jjGQ=;
        b=rNGp8PVJ4dfEgAg2X4DMyZUj2v9e4zD3hCyu3LxNTbMhjHY0lRT1Xw5g7XH1dyM23e
         dEJewGcPJIdWHGHmgKD3syujWgWjp9+cRZQX84I1qBkbLMtn7N5TAs9Cd7bjJJxOxFKg
         CegWyO5MzVy0bwTjR2PHRNRgQno5eTXYUL72Hh8AXAd9Yu7g21RnPW1/Zu80GUsYhl7h
         cNTO+x2mwxys7KkZZQvjdYwto2gM42YG0e6bmJnWQ/OGgIW2GqqWBfi6fNnDAAEtKM0E
         cad58uo+gdGjVkiBPhrZc1/B2Or1SzuZ+74pnvhC+J8Bu42blXtvSHtNaU94wuVlnI4r
         nQAg==
X-Forwarded-Encrypted: i=1; AJvYcCXvapOsMU/5A2r2mCc5D7MeVC2lj271CIQC3U5I2ILw7x42zkLO8I/3rCDfIz9hFOSWIwvwUfNEXSo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3eG8vqAAzh6RVOhdx2jw1Kgc/5OWVosksCu/aiq3ey6HPibWz
	IrKY0QqZyXgPDCoyL0JyZWP68gdn91kmWtMF/zU15BTpgX7FL5tyMtljSyYRVZzgRqQdYOg8REL
	Gfc5beUU33dMJn1JdQA==
X-Google-Smtp-Source: AGHT+IF4lgVNFWtAABhlVyCvDTypvCqwQE4E76pJaa2ei5llPSfzgOLBadwb4XjVCcPSe7j0KBf+vwviXHvnVJ9Y
X-Received: from vsvj2.prod.google.com ([2002:a05:6102:3e02:b0:4af:5a5c:cdaa])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6830:348b:b0:71d:4c3b:f464 with SMTP id 46e09a7af769-71dad63c3e4mr7692549a34.13.1733339659221;
 Wed, 04 Dec 2024 11:14:19 -0800 (PST)
Date: Wed,  4 Dec 2024 19:13:39 +0000
In-Reply-To: <20241204191349.1730936-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241204191349.1730936-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241204191349.1730936-5-jthoughton@google.com>
Subject: [PATCH v1 04/13] KVM: Advertise KVM_CAP_USERFAULT in KVM_CHECK_EXTENSION
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

Advertise support for KVM_CAP_USERFAULT when kvm_has_userfault() returns
true. Currently this is merely IS_ENABLED(CONFIG_HAVE_KVM_USERFAULT), so
it is somewhat redundant.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 include/uapi/linux/kvm.h | 1 +
 virt/kvm/kvm_main.c      | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 641a2e580441..d9a135c895d7 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -936,6 +936,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_PRE_FAULT_MEMORY 236
 #define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
 #define KVM_CAP_X86_GUEST_MODE 238
+#define KVM_CAP_USERFAULT 239
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index fa851704db94..b552cdef2850 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4804,6 +4804,10 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 #ifdef CONFIG_KVM_PRIVATE_MEM
 	case KVM_CAP_GUEST_MEMFD:
 		return !kvm || kvm_arch_has_private_mem(kvm);
+#endif
+#ifdef CONFIG_HAVE_KVM_USERFAULT
+	case KVM_CAP_USERFAULT:
+		return kvm_has_userfault(kvm);
 #endif
 	default:
 		break;
-- 
2.47.0.338.g60cca15819-goog


