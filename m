Return-Path: <linux-doc+bounces-50880-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BAFAEA7F0
	for <lists+linux-doc@lfdr.de>; Thu, 26 Jun 2025 22:10:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 833013A47D1
	for <lists+linux-doc@lfdr.de>; Thu, 26 Jun 2025 20:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91D02FE314;
	Thu, 26 Jun 2025 20:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c03+PxfS"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-il1-f201.google.com (mail-il1-f201.google.com [209.85.166.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A302FCFC6
	for <linux-doc@vger.kernel.org>; Thu, 26 Jun 2025 20:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750968374; cv=none; b=K2vspUFIJFmBZQGC0cnxYZ/WKGX+QXRMwsHDRY/4lBx9gjN6vtd1fdiLix6hBg7iNzJyTaBAyJ11BtJin9w+MJgF6GIA3NmVLFuYlnFEdrswVjo86IwRy96K/2q+dO4Uqczv0g4DZ6aTGB+GMAGki4UZ/AYcLvBJBDkPcK6Yu4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750968374; c=relaxed/simple;
	bh=r9ks6Gk9YbqV8jpdii7wfr1xMzIClUFml1wYw6+d3fA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=boK4pqwQJJppdaensjjQ+5ljvEXMGBeQfmEYHrwyj3+7NH640fLSPIOJnchbd2Zvulktw+NLHuqDz0S2aIIoDi+Da6gKDCTmtBhzDK1s3oid1xHKqx4dTgfxu/VK6LGZH07qBafsQQmtbt6jDiP8vAw0Ewh/DXa6cxE+XuyHb84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c03+PxfS; arc=none smtp.client-ip=209.85.166.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Received: by mail-il1-f201.google.com with SMTP id e9e14a558f8ab-3ddd5cd020dso23824785ab.0
        for <linux-doc@vger.kernel.org>; Thu, 26 Jun 2025 13:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750968369; x=1751573169; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aRlId8j6LCdYrirtMZ0W4g5cwi8ZnWeFsohFg4IJ6SY=;
        b=c03+PxfSPWfjnIkH0gRkV6Sr39GOHPfsiE38yXKjIk0GrQVpI2XbzRKdevfDY33Tsf
         oP1nK6vLVrevcLEHpKAl9eACLeqf5yXD2whCQVVj5MJgvg/8pL2DjkXLgjAUuDjw56M7
         Q2V9xPqsZJLKt4kByvTOR33AzxLO3qrY8OLXtDlFHZRXz1R2q9wz5bbenzpaN6w2GoNv
         OJkIbTeh07Vw0aVbhOiBnWgE9alAjQQA6UsKXrNriMFfjMZrvLiMcXM39Ajy1xFPIFdI
         8V47hYNZjkE6EBFfebQ43G+lRxp8I0Xscq2qV/WnT4JPenEs1RBQ0wMaSr5o7oiDDHMw
         SoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750968369; x=1751573169;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aRlId8j6LCdYrirtMZ0W4g5cwi8ZnWeFsohFg4IJ6SY=;
        b=NMZmp1wYgwq6ggj7FsE3RfxLNvsBUOw23rpJ5Y9OxlJgKD+c1Fq2LtubJ0AHgf+yGt
         vzjm2MuXl6dZH9JSPBxa6PhZBYnwvwOOutjqA7ERmUFITvGj/GKse3lJnatZlL4SQQCW
         2M8ajGQDEYGLHIZ4i4Ht6YzOe+p98nusu4X6YuhA0BUv4A+yiVHNy8+9CEZNpdJFilL2
         46Yvv7r8VF341BlnVM26tz6lRTpN9vyeAVFGGAPv2x3sAXYwyYAzgeYG2zKKBXoxDxK7
         ufAZG8tizXVnH+hrXPasImlvA75RQctxbVOHwo6Bv5hrO9MAOJh6qy6vDZ7cVTEhgIMm
         a5fQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLndMKVHBsteUEQX4UqpYtEJuryrcw8EIomDpHc+jvOxIsJuMs3JFs//t0ivUy71hOymin6VwCgwk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhvIHJ9E1wQtEN1WAYuySIIaETfq8tlFAhcJg9BMX4324cRS38
	eI2enx18OHLJQCrFSzausp9y9J1gImxEbuLFzrxR39x99HWunKyoy/bdVJtHrlyLMhuDuh7uxZM
	Vbm6SQxGFpIy5vvZ7rKk3DlEA8w==
X-Google-Smtp-Source: AGHT+IFQs2Wwdg/fSES5A58gFSJxMknzSDLNOp4k85bx8hXhl1wyXlz+jCSjhcviMYqna778nTCFvIvjB3UkqOM8qQ==
X-Received: from ilbbm19.prod.google.com ([2002:a05:6e02:3313:b0:3df:3a5e:9ba8])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:2589:b0:3df:460a:ec3c with SMTP id e9e14a558f8ab-3df4acc520fmr11509085ab.22.1750968369104;
 Thu, 26 Jun 2025 13:06:09 -0700 (PDT)
Date: Thu, 26 Jun 2025 20:04:53 +0000
In-Reply-To: <20250626200459.1153955-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250626200459.1153955-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626200459.1153955-18-coltonlewis@google.com>
Subject: [PATCH v3 17/22] KVM: arm64: Context swap Partitioned PMU guest registers
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

Save and restore newly untrapped registers that can be directly
accessed by the guest when the PMU is partitioned.

* PMEVCNTRn_EL0
* PMCCNTR_EL0
* PMICNTR_EL0
* PMUSERENR_EL0
* PMSELR_EL0
* PMCR_EL0
* PMCNTEN_EL0
* PMINTEN_EL1

If the PMU is not partitioned or MDCR_EL2.TPM is set, all PMU
registers are trapped so return immediately.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/kvm_pmu.h |   4 ++
 arch/arm64/kvm/arm.c             |   2 +
 arch/arm64/kvm/pmu-part.c        | 101 +++++++++++++++++++++++++++++++
 3 files changed, 107 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_pmu.h b/arch/arm64/include/asm/kvm_pmu.h
index 35674879aae0..4f0741bf6779 100644
--- a/arch/arm64/include/asm/kvm_pmu.h
+++ b/arch/arm64/include/asm/kvm_pmu.h
@@ -98,6 +98,8 @@ void kvm_pmu_host_counters_disable(void);
 
 u8 kvm_pmu_guest_num_counters(struct kvm_vcpu *vcpu);
 u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu);
+void kvm_pmu_load(struct kvm_vcpu *vcpu);
+void kvm_pmu_put(struct kvm_vcpu *vcpu);
 
 #if !defined(__KVM_NVHE_HYPERVISOR__)
 bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu);
@@ -169,6 +171,8 @@ static inline u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu)
 {
 	return 0;
 }
+static inline void kvm_pmu_load(struct kvm_vcpu *vcpu) {}
+static inline void kvm_pmu_put(struct kvm_vcpu *vcpu) {}
 static inline void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu,
 					     u64 select_idx, u64 val) {}
 static inline void kvm_pmu_set_counter_value_user(struct kvm_vcpu *vcpu,
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index e452aba1a3b2..7c007ee44ecb 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -616,6 +616,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 		kvm_vcpu_load_vhe(vcpu);
 	kvm_arch_vcpu_load_fp(vcpu);
 	kvm_vcpu_pmu_restore_guest(vcpu);
+	kvm_pmu_load(vcpu);
 	if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
 		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
 
@@ -658,6 +659,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 	kvm_timer_vcpu_put(vcpu);
 	kvm_vgic_put(vcpu);
 	kvm_vcpu_pmu_restore_host(vcpu);
+	kvm_pmu_put(vcpu);
 	if (vcpu_has_nv(vcpu))
 		kvm_vcpu_put_hw_mmu(vcpu);
 	kvm_arm_vmid_clear_active();
diff --git a/arch/arm64/kvm/pmu-part.c b/arch/arm64/kvm/pmu-part.c
index f954d2d29314..5eb53c6409e7 100644
--- a/arch/arm64/kvm/pmu-part.c
+++ b/arch/arm64/kvm/pmu-part.c
@@ -9,6 +9,7 @@
 #include <linux/perf/arm_pmuv3.h>
 
 #include <asm/arm_pmuv3.h>
+#include <asm/kvm_emulate.h>
 #include <asm/kvm_pmu.h>
 
 /**
@@ -194,3 +195,103 @@ u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu)
 
 	return hpmn;
 }
+
+/**
+ * kvm_pmu_load() - Load untrapped PMU registers
+ * @vcpu: Pointer to struct kvm_vcpu
+ *
+ * Load all untrapped PMU registers from the VCPU into the PCPU. Mask
+ * to only bits belonging to guest-reserved counters and leave
+ * host-reserved counters alone in bitmask registers.
+ */
+void kvm_pmu_load(struct kvm_vcpu *vcpu)
+{
+	struct arm_pmu *pmu = vcpu->kvm->arch.arm_pmu;
+	u64 mask = kvm_pmu_guest_counter_mask(pmu);
+	u8 i;
+	u64 val;
+
+	/*
+	 * If the PMU is not partitioned or we have MDCR_EL2_TPM,
+	 * every PMU access is trapped so don't bother with the swap.
+	 */
+	if (!kvm_pmu_is_partitioned(pmu) || (vcpu->arch.mdcr_el2 & MDCR_EL2_TPM))
+		return;
+
+	for (i = 0; i < pmu->hpmn_max; i++) {
+		val = __vcpu_sys_reg(vcpu, PMEVCNTR0_EL0 + i);
+		write_pmevcntrn(i, val);
+	}
+
+	val = __vcpu_sys_reg(vcpu, PMCCNTR_EL0);
+	write_pmccntr(val);
+
+	val = __vcpu_sys_reg(vcpu, PMUSERENR_EL0);
+	write_pmuserenr(val);
+
+	val = __vcpu_sys_reg(vcpu, PMSELR_EL0);
+	write_pmselr(val);
+
+	val = __vcpu_sys_reg(vcpu, PMCR_EL0);
+	write_pmcr(val);
+
+	/*
+	 * Loading these registers is tricky because of
+	 * 1. Applying only the bits for guest counters (indicated by mask)
+	 * 2. Setting and clearing are different registers
+	 */
+	val = __vcpu_sys_reg(vcpu, PMCNTENSET_EL0);
+	write_pmcntenset(val & mask);
+	write_pmcntenclr(~val & mask);
+
+	val = __vcpu_sys_reg(vcpu, PMINTENSET_EL1);
+	write_pmintenset(val & mask);
+	write_pmintenclr(~val & mask);
+}
+
+/**
+ * kvm_pmu_put() - Put untrapped PMU registers
+ * @vcpu: Pointer to struct kvm_vcpu
+ *
+ * Put all untrapped PMU registers from the VCPU into the PCPU. Mask
+ * to only bits belonging to guest-reserved counters and leave
+ * host-reserved counters alone in bitmask registers.
+ */
+void kvm_pmu_put(struct kvm_vcpu *vcpu)
+{
+	struct arm_pmu *pmu = vcpu->kvm->arch.arm_pmu;
+	u64 mask = kvm_pmu_guest_counter_mask(pmu);
+	u8 i;
+	u64 val;
+
+	/*
+	 * If the PMU is not partitioned or we have MDCR_EL2_TPM,
+	 * every PMU access is trapped so don't bother with the swap.
+	 */
+	if (!kvm_pmu_is_partitioned(pmu) || (vcpu->arch.mdcr_el2 & MDCR_EL2_TPM))
+		return;
+
+	for (i = 0; i < pmu->hpmn_max; i++) {
+		val = read_pmevcntrn(i);
+		__vcpu_assign_sys_reg(vcpu, PMEVCNTR0_EL0 + i, val);
+	}
+
+	val = read_pmccntr();
+	__vcpu_assign_sys_reg(vcpu, PMCCNTR_EL0, val);
+
+	val = read_pmuserenr();
+	__vcpu_assign_sys_reg(vcpu, PMUSERENR_EL0, val);
+
+	val = read_pmselr();
+	__vcpu_assign_sys_reg(vcpu, PMSELR_EL0, val);
+
+	val = read_pmcr();
+	__vcpu_assign_sys_reg(vcpu, PMCR_EL0, val);
+
+	/* Mask these to only save the guest relevant bits. */
+	val = read_pmcntenset();
+	__vcpu_assign_sys_reg(vcpu, PMCNTENSET_EL0, val & mask);
+
+	val = read_pmintenset();
+	__vcpu_assign_sys_reg(vcpu, PMINTENSET_EL1, val & mask);
+}
-- 
2.50.0.727.gbf7dc18ff4-goog


