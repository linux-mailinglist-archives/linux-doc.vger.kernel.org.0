Return-Path: <linux-doc+bounces-53070-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 855F1B04B49
	for <lists+linux-doc@lfdr.de>; Tue, 15 Jul 2025 01:02:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A96D04A662F
	for <lists+linux-doc@lfdr.de>; Mon, 14 Jul 2025 23:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A246D28C5AD;
	Mon, 14 Jul 2025 22:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T8+BOZ1L"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-io1-f74.google.com (mail-io1-f74.google.com [209.85.166.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC8B2877D5
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 22:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752533986; cv=none; b=U95UesdOfWKU4R1W97ITR7fV0cjgkvH1vltBmgNCcB3nCfROOmJWo+7o6CseRebnsKuTN90h4eN/4m/9HiuQ++YmDPT06RLAZmQH2xZKH+/E+hoD7kZViaJZ5fszkgMcuy/vsByHVSNq/bE0A17KDQxiImj0UECWDD2GD3SUGgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752533986; c=relaxed/simple;
	bh=CDjTj8cWCX5w5VetZUMx8OnPfitI8X2G7iAMJ7bz63E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mt6jFfZnsWg4L2p3vMN3uBKgpkcN2m7wKdL1SIh9jqOwo2tGSrI8OOEVRw9vaOKnNCcJ/aaIeYkN8LozygcZi53hBwRGPxyP95kionWR+8XhZmeWnhLIygRLXiNy/K9QPhrca2FBliHwORckCC0+qYzqpf23SdOvWXTIeR+XHjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T8+BOZ1L; arc=none smtp.client-ip=209.85.166.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Received: by mail-io1-f74.google.com with SMTP id ca18e2360f4ac-869e9667f58so1104130539f.3
        for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 15:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752533979; x=1753138779; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ruhxYZHp5lLB8yelcchT9klIB68L+DKTdiF6okoujCY=;
        b=T8+BOZ1LzUsaNS6c8agkirXf5bNdFndie5MD26aOYP45zX0V5TxVBAUajO26AJaP60
         ei0O++jIYTfId0ROwoacSfs0vbogK7qugoKh2UG9C/fxb8EtPuVVBMM3xqL+k37HENkW
         sLZffQW7WVWlTTNiaBxk4oT8IO0jH+V23AhfDVfigYLIaXdiC7ZJMRO8U6R+q+eV5Wov
         9e70CXdm9i5leatl7PeqhQGtxAgvRq8hPml5OEVL/Z4FhhSI36eqAeoyBZreB8xyAWgy
         jy0c1xe1/zQQQDwbs2k87dHNPkiZA50YPhyKsH5jFIkwuxLyw2RXfv4WDMklL3nm9PnO
         7oTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752533979; x=1753138779;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ruhxYZHp5lLB8yelcchT9klIB68L+DKTdiF6okoujCY=;
        b=DnUOotIA0GvvzplfEsspC3+4YFpVSr6HKKS1hFx+ol9ORW+TlknhkttqOoRdFHvO0a
         Qk3/SEFZrGunH6yb4r4LBdeeNRskpy0ymVry+qqfgXA8sEkbxecAV0+E2VSefaC7BsPr
         AOcuL0W5+nIecwtedOx5+RfLy74Cv1IHf8YNo5BWaePjCkVR7tmPcmHycFvsfUqIBU0b
         G0oSuKFoz+KMiK24AMaaOIhOUCphATAx42Xgy2KNh/vaa51tWdR/m0Xsh+Gr4tVBG67G
         NfCy0+tkeyu2v1Ois/xQSXbdHx8gLt1R6St0XKh0WXkAgFYBclnabpR5FbLfUL3GwSeK
         xvjA==
X-Forwarded-Encrypted: i=1; AJvYcCWkG0Xo4SsfItHJ0Nw4fidTemNhO2q/b7gZXJOx4sLbUG1SR68TyKcvSJq1F+MfAy0A88K1meRGvI0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzASB7pekKsEDgorIe6kswLCCQ8X2/3Nk64v4E0Nuc9cOITivlf
	Nj8ol23D/EKyNmgG8VQiJSffE78GEfmRjuKx0cON7r6/V9y03UyhX3JiXYnl9oHKC7gzdNlN0+o
	GaXLduffeK89dQcCsksfdKGHsSA==
X-Google-Smtp-Source: AGHT+IHR2ZhdLDHriP6gMQRHpCn5DY2/9jV0IQOfUZpsLR5icoK2dSXpYkQ3aztL0DPxSOPRUiuKqvoDOj4y5jOVPw==
X-Received: from iov28.prod.google.com ([2002:a05:6602:751c:b0:875:b927:6c0a])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6602:27c1:b0:86d:1218:de96 with SMTP id ca18e2360f4ac-8797886bf8fmr1673502139f.12.1752533979057;
 Mon, 14 Jul 2025 15:59:39 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:59:03 +0000
In-Reply-To: <20250714225917.1396543-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250714225917.1396543-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250714225917.1396543-10-coltonlewis@google.com>
Subject: [PATCH v4 09/23] KVM: arm64: Set up FGT for Partitioned PMU
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

In order to gain the best performance benefit from partitioning the
PMU, utilize fine grain traps (FEAT_FGT and FEAT_FGT2) to avoid
trapping common PMU register accesses by the guest to remove that
overhead.

Untrapped:
* PMCR_EL0
* PMUSERENR_EL0
* PMSELR_EL0
* PMCCNTR_EL0
* PMCNTEN_EL0
* PMINTEN_EL1
* PMEVCNTRn_EL0

These are safe to untrap because writing MDCR_EL2.HPMN as this series
will do limits the effect of writes to any of these registers to the
partition of counters 0..HPMN-1. Reads from these registers will not
leak information from between guests as all these registers are
context swapped by a later patch in this series. Reads from these
registers also do not leak any information about the host's hardware
beyond what is promised by PMUv3.

Trapped:
* PMOVS_EL0
* PMEVTYPERn_EL0
* PMCCFILTR_EL0
* PMICNTR_EL0
* PMICFILTR_EL0
* PMCEIDn_EL0
* PMMIR_EL1

PMOVS remains trapped so KVM can track overflow IRQs that will need to
be injected into the guest.

PMICNTR and PMIFILTR remain trapped because KVM is not handling them
yet.

PMEVTYPERn remains trapped so KVM can limit which events guests can
count, such as disallowing counting at EL2. PMCCFILTR and PMCIFILTR
are special cases of the same.

PMCEIDn and PMMIR remain trapped because they can leak information
specific to the host hardware implementation.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/kvm_host.h |  1 +
 arch/arm64/include/asm/kvm_pmu.h  | 23 ++++++++++++++++++
 arch/arm64/kvm/pmu-direct.c       | 32 +++++++++++++++++++++++++
 arch/arm64/kvm/sys_regs.c         | 39 +++++++++++++++++++++++++++++++
 4 files changed, 95 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index f705eb4538c3..463dbf7f0821 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1347,6 +1347,7 @@ int __init populate_sysreg_config(const struct sys_reg_desc *sr,
 				  unsigned int idx);
 int __init populate_nv_trap_config(void);
 
+void kvm_calculate_pmu_traps(struct kvm_vcpu *vcpu);
 void kvm_calculate_traps(struct kvm_vcpu *vcpu);
 
 /* MMIO helpers */
diff --git a/arch/arm64/include/asm/kvm_pmu.h b/arch/arm64/include/asm/kvm_pmu.h
index 6328e90952ba..73b7161e3f4e 100644
--- a/arch/arm64/include/asm/kvm_pmu.h
+++ b/arch/arm64/include/asm/kvm_pmu.h
@@ -94,6 +94,21 @@ u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu);
 void kvm_pmu_host_counters_enable(void);
 void kvm_pmu_host_counters_disable(void);
 
+#if !defined(__KVM_NVHE_HYPERVISOR__)
+bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu);
+bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu);
+#else
+static inline bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu)
+{
+	return false;
+}
+
+static inline bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu)
+{
+	return false;
+}
+#endif
+
 /*
  * Updates the vcpu's view of the pmu events for this cpu.
  * Must be called before every vcpu run after disabling interrupts, to ensure
@@ -133,6 +148,14 @@ static inline u64 kvm_pmu_get_counter_value(struct kvm_vcpu *vcpu,
 {
 	return 0;
 }
+static inline bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu)
+{
+	return false;
+}
+static inline bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu)
+{
+	return false;
+}
 static inline void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu,
 					     u64 select_idx, u64 val) {}
 static inline void kvm_pmu_set_counter_value_user(struct kvm_vcpu *vcpu,
diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 22e9b2f9e7b6..2eef77e8340d 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -40,6 +40,38 @@ bool kvm_pmu_is_partitioned(struct arm_pmu *pmu)
 		pmu->hpmn_max <= *host_data_ptr(nr_event_counters);
 }
 
+/**
+ * kvm_vcpu_pmu_is_partitioned() - Determine if given VCPU has a partitioned PMU
+ * @vcpu: Pointer to kvm_vcpu struct
+ *
+ * Determine if given VCPU has a partitioned PMU by extracting that
+ * field and passing it to :c:func:`kvm_pmu_is_partitioned`
+ *
+ * Return: True if the VCPU PMU is partitioned, false otherwise
+ */
+bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu)
+{
+	return kvm_pmu_is_partitioned(vcpu->kvm->arch.arm_pmu);
+}
+
+/**
+ * kvm_vcpu_pmu_use_fgt() - Determine if we can use FGT
+ * @vcpu: Pointer to struct kvm_vcpu
+ *
+ * Determine if we can use FGT for direct access to registers. We can
+ * if capabilities permit the number of guest counters requested.
+ *
+ * Return: True if we can use FGT, false otherwise
+ */
+bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu)
+{
+	u8 hpmn = vcpu->kvm->arch.nr_pmu_counters;
+
+	return kvm_vcpu_pmu_is_partitioned(vcpu) &&
+		cpus_have_final_cap(ARM64_HAS_FGT) &&
+		(hpmn != 0 || cpus_have_final_cap(ARM64_HAS_HPMN0));
+}
+
 /**
  * kvm_pmu_host_counter_mask() - Compute bitmask of host-reserved counters
  * @pmu: Pointer to arm_pmu struct
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 76c2f0da821f..b3f97980b11f 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -5212,6 +5212,43 @@ static void vcpu_set_hcr(struct kvm_vcpu *vcpu)
 		vcpu->arch.hcr_el2 |= HCR_TTLBOS;
 }
 
+
+/**
+ * kvm_calculate_pmu_traps() - Calculate fine grain traps for partitioned PMU
+ * @vcpu: Pointer to struct kvm_vcpu
+ *
+ * Calculate which registers still need to be trapped when the
+ * partitioned PMU is available, leaving others untrapped.
+ *
+ * Because this is only recalculated when the VCPU runs on a new
+ * thread, the trap bits should be set iff the partitioned PMU is
+ * supported whether or not it is currently enabled. If it is not
+ * enabled, this doesn't matter because every PMU access is trapped by
+ * MDCR_EL2.TPM anyway.
+ */
+void kvm_calculate_pmu_traps(struct kvm_vcpu *vcpu)
+{
+	struct kvm *kvm = vcpu->kvm;
+
+	if (!kvm_pmu_partition_supported() ||
+	    !cpus_have_final_cap(ARM64_HAS_FGT))
+		return;
+
+	kvm->arch.fgt[HDFGRTR_GROUP] |=
+		HDFGRTR_EL2_PMOVS
+		| HDFGRTR_EL2_PMCCFILTR_EL0
+		| HDFGRTR_EL2_PMEVTYPERn_EL0
+		| HDFGRTR_EL2_PMCEIDn_EL0
+		| HDFGRTR_EL2_PMMIR_EL1;
+
+	if (!cpus_have_final_cap(ARM64_HAS_FGT2))
+		return;
+
+	kvm->arch.fgt[HDFGRTR2_GROUP] |=
+		HDFGRTR2_EL2_nPMICFILTR_EL0
+		| HDFGRTR2_EL2_nPMICNTR_EL0;
+}
+
 void kvm_calculate_traps(struct kvm_vcpu *vcpu)
 {
 	struct kvm *kvm = vcpu->kvm;
@@ -5232,6 +5269,8 @@ void kvm_calculate_traps(struct kvm_vcpu *vcpu)
 	compute_fgu(kvm, HFGITR2_GROUP);
 	compute_fgu(kvm, HDFGRTR2_GROUP);
 
+	kvm_calculate_pmu_traps(vcpu);
+
 	set_bit(KVM_ARCH_FLAG_FGU_INITIALIZED, &kvm->arch.flags);
 out:
 	mutex_unlock(&kvm->arch.config_lock);
-- 
2.50.0.727.gbf7dc18ff4-goog


