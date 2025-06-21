Return-Path: <linux-doc+bounces-49945-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9607FAE2545
	for <lists+linux-doc@lfdr.de>; Sat, 21 Jun 2025 00:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86EE51791BD
	for <lists+linux-doc@lfdr.de>; Fri, 20 Jun 2025 22:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2CB8259CB3;
	Fri, 20 Jun 2025 22:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0gt7J+bX"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-il1-f202.google.com (mail-il1-f202.google.com [209.85.166.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96654253F2D
	for <linux-doc@vger.kernel.org>; Fri, 20 Jun 2025 22:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750457939; cv=none; b=NIy+OiBj6H4sLnPL9YLTsPgTidG4eijvjpKPXX96lv/XHUSESAd307bGb/iAr9ziAlzjdmul2GlI8IMfHRo9Yc3gXy6Je1RCxqJX4v8Dqx0JHtrYI4GsvfdC630Ijv/f0ALeI7MvsiioZ96weXYQU7V1rqvFnAPgy2UlFM3eWE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750457939; c=relaxed/simple;
	bh=y1VZ87bDMvhFxKKb8KOnkNsslQVDRlVgHyTOA2XQMHw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ONMuJumqS0yg39lMT4eytj7qmEGMPSlnk4jiRbbQ0NHDUgax8rsAAtmAZzIL2p5wl27AmT3Iu4dlF0GN3kYrxZVuW87WCxJM7qpA2NHET5pXtPtu/4pHqgbNWfzvQVeb73qSWl1DoNfTvDGm228Uw5UfM+2tQqYqdeX4EgjuVXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0gt7J+bX; arc=none smtp.client-ip=209.85.166.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Received: by mail-il1-f202.google.com with SMTP id e9e14a558f8ab-3ddafe52d04so70004495ab.1
        for <linux-doc@vger.kernel.org>; Fri, 20 Jun 2025 15:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750457935; x=1751062735; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lCeKccnUmGK0t6piLYL2X+QAR4eGmRxuwVO46fLii9o=;
        b=0gt7J+bXZsmFNHsm/F54vSpepp6/EUdA0ClcoHg+lAPPgvxhRJgk6DvVT/M1jwGEuj
         2YiNfomAX3Y7MLDW2mndyrlxpKChvWVz6stq3XXi2qfe9smH18Rna15x+fGAjo8EWNTV
         dnEiyaZm7kBaYRR3xGRIcJd9K2zrwM2m5qWHIJ8mVQ83jqVmjZIrHb00eYBWNez0IWfa
         jx3ZmMkvdFGspLLbwPzsVw/gYEEO1Ztumzoon8c9HDTgj7qkU6e7bzB+UuU/GfC9SD7S
         3OWlSol3iC6tcZ/uD4oUE8aIQu4QFcG5GbW4yCFni1pIHyLYV9UeauWjUFZjWjycBhMn
         PgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750457935; x=1751062735;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lCeKccnUmGK0t6piLYL2X+QAR4eGmRxuwVO46fLii9o=;
        b=fLkc0OCnLsC1alIdu/aUGO3iy8BpbhZbD19IaFcPAbLGkLgjjtOmxutTTz4gZSJnps
         XKLag+SQw3Fr0+H1kTRBqL02XQM3V0ce2dzAXny1v2DrG+/LC3RL5W+sXpNpTZ9oULHT
         5YXcGzJHs9UIfRo5s568lQb7cq9senH11zLCuHXcvx9zKyxIJ0KuRUsy4A61caMr/R8N
         3fmNNQaBIFSRYmx38pp5h1Uh8bT/b4FwpsxN1H4VTPNNXRwtwkS6uJUoXyhqTKN5wZk3
         sj3/40NiBBnJc3GGbueXEB/6aAEYQz8fFPfFTE5+qpsnRRHRmAN6w/ppA/QwGb5qZ+pM
         HU+A==
X-Forwarded-Encrypted: i=1; AJvYcCVx/1ctL9Ur8w+mTh1p7yztjDNDR/qIEQZBfbm8iTqHCtSiaq4sPvf/3N632SfMbC5peQl3tc9vcPw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoHbIftucHWwTUsb8GQ+LgbcLFUx1gKyAAyeJ2DeTSWdVHtmjg
	biMrfZDcWv6Nxhi3OHgeKbWKQmaXbEnEpWB+xEepCR2BtCtk/OY120lrhEyRWhZCnYWVbHL2FXH
	6N7cGdqL+C7qaO+uRDIzZqCF+zg==
X-Google-Smtp-Source: AGHT+IGAgAXt4VAt9nwcok51fvIV/dFkwYe009yCTofFAGBTMKz3erZRuxZTNNWRigmqT+1olC2QwZa0BzFYekCXXQ==
X-Received: from ilbdi5.prod.google.com ([2002:a05:6e02:1f85:b0:3dd:754f:1dc4])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:1fc9:b0:3dd:edef:894c with SMTP id e9e14a558f8ab-3de38cc04cfmr43152805ab.14.1750457935204;
 Fri, 20 Jun 2025 15:18:55 -0700 (PDT)
Date: Fri, 20 Jun 2025 22:13:18 +0000
In-Reply-To: <20250620221326.1261128-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250620221326.1261128-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250620221326.1261128-19-coltonlewis@google.com>
Subject: [PATCH v2 17/23] KVM: arm64: Account for partitioning in PMCR_EL0 access
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

For some reason unknown to me, KVM allows writes to PMCR_EL0.N even
though the architecture specifies that field as RO. Make sure these
accesses conform to additional constraints imposed when the PMU is
partitioned.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu.c      | 2 +-
 arch/arm64/kvm/sys_regs.c | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index 90fc088ce3d3..5f0847dc7d53 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -884,7 +884,7 @@ u64 kvm_pmu_accessible_counter_mask(struct kvm_vcpu *vcpu)
 u64 kvm_vcpu_read_pmcr(struct kvm_vcpu *vcpu)
 {
 	u64 pmcr = __vcpu_sys_reg(vcpu, PMCR_EL0);
-	u64 n = kvm_pmu_hpmn(vcpu);
+	u64 n = kvm_pmu_guest_num_counters(vcpu);
 
 	if (vcpu_has_nv(vcpu) && !vcpu_is_el2(vcpu))
 		n = FIELD_GET(MDCR_EL2_HPMN, __vcpu_sys_reg(vcpu, MDCR_EL2));
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 1ea7d092ec59..b64b60e297bd 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1266,7 +1266,9 @@ static int set_pmcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
 	 */
 	if (!kvm_vm_has_ran_once(kvm) &&
 	    !vcpu_has_nv(vcpu)	      &&
-	    new_n <= kvm_arm_pmu_get_max_counters(kvm))
+	    new_n <= kvm_arm_pmu_get_max_counters(kvm) &&
+	    (!kvm_vcpu_pmu_is_partitioned(vcpu) ||
+	     new_n <= kvm->arch.arm_pmu->hpmn_max))
 		kvm->arch.nr_pmu_counters = new_n;
 
 	mutex_unlock(&kvm->arch.config_lock);
-- 
2.50.0.714.g196bf9f422-goog


