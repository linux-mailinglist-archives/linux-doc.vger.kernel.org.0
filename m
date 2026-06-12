Return-Path: <linux-doc+bounces-92199-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zln6I3ZfLGpfQAQAu9opvQ
	(envelope-from <linux-doc+bounces-92199-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 21:35:18 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DC46467C113
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 21:35:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=m7ppru7Z;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92199-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-92199-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9ED3E32DA9A3
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 19:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 903B13ED125;
	Fri, 12 Jun 2026 19:29:34 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f201.google.com (mail-oi1-f201.google.com [209.85.167.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82923D0BF3
	for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 19:29:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781292574; cv=none; b=l4uirr9xJwWPc8WLAOMMaOQqkXGui7w8ugAuD2zZE+oV5G7WFQ2bPvTyjBdf93KWCs0ICCULkpG9QhAMVG7W2OcO3SooIQi5tgEgyg9vV7SQfdR2qk9RoysYeFmSMAOYtbZdy3mu3FxwGQkY0vcCot7Ed5cp0eEHQ5MLmlKk1fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781292574; c=relaxed/simple;
	bh=TjYRd0nJW/jKNkkVM+Lek1arEtrbddhEOegCE5t4QhE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=p67ijzaCFTe8V++A8xxbKk/iZKd1qhw4skbB/reLTDKDd+JhkFpCx8YnvS4jAzKVnSYYmL/SZCvdHHYcggjP3LnCVi4azNY86exeOQP56VYT2OXOc53+HpmD0gEo41w4zn5YQqUTOwkG1onn4egDNNKeKUeLx6GnzIW0rsDBJnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m7ppru7Z; arc=none smtp.client-ip=209.85.167.201
Received: by mail-oi1-f201.google.com with SMTP id 5614622812f47-48638da0e05so1169456b6e.3
        for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 12:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781292566; x=1781897366; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mefc4hk7l8V5q1+Ri7ebgTL5CsdX634wsG3um/9LWKo=;
        b=m7ppru7Zl3Qp242F/KSsbNc3LmbhrqzGkg0gUi9pl/7MS6jEKcLJ+W4ftQ80h4FvAz
         vmN3+sOgUIdxdrXutzrFLE+jTdcFyGLIMJQ+y049VZ+kYXrujDSXWavP+lCnJdyCNaHF
         EU5Dceadf1StqfR8uZNvIP1qwhZQKUyer3Ag3zNKyx6ITNubeFCOOZCYsy79MuA33VeV
         XId3ElqGboZdhW1A3Xd6fF80k/frqBr65lG4F75IKdM2zHg5efwIPA1BWTEbxYM9v3g0
         ZP5rGJjA5Yoy4k8+OLTWczfErCeITdMLZkvKG8HCCGX6XH4ydzsjqrlzhG/fW8bcDc/Z
         qZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781292566; x=1781897366;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mefc4hk7l8V5q1+Ri7ebgTL5CsdX634wsG3um/9LWKo=;
        b=ltnVRZgriP6YMNjLtOGQesWDLM5+GxANO3giRPlw7C0lcN4ZO9dUMq4NiUJG4zbnyl
         j8wkQlet+h+Nru2UEtuSi/0FeHa+Mxp9YfPAfNPWFLaal4MpapQU1MktqWQp8IDdAMy6
         nRpJHq8/BkuYrNGlVhM50a1LEXIl4MiMtgSJRd8FMDrRuJ473kLPEjlL+vJn65P73Byu
         3qQb1FW2KDygjIjF47Icdu1nq/aXF3J6pWY+5O6LfCcEsxsCftvYXzeBPnaGlVcobmu3
         ramQsO5QHNflymdENYbKoeWOHn2oFOHp8ziX8uivTa16SAoz7O4jzq4kVKlLrh0anJqY
         fwjQ==
X-Forwarded-Encrypted: i=1; AFNElJ/K59MkXj3G75/j0cyQxr5fGrGVDUvDKHrbRKyHgDQq68mGGrZ7aizXf0oIfEE6SeoPJk7WJsyIiuU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW80T9K1mPwFGiaHyIiS0hNCHSPt5nLEp4XW3uXD4/u4/smBtC
	ZY/HzdPcACZYrnzzuDkzeLwviIoNlQuv6MZV+IVQt/XovJj+zM+f/04ipxf+NlFC1rFM22vorlX
	ChUSOHcuxTdOwhVnh5u1FTPnpvA==
X-Received: from iloo20-n1.prod.google.com ([2002:a05:6e02:6114:10b0:4fe:69b2:404b])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:3a15:b0:485:d6e7:9dbf with SMTP id 5614622812f47-4872f11d549mr2509778b6e.0.1781292566143;
 Fri, 12 Jun 2026 12:29:26 -0700 (PDT)
Date: Fri, 12 Jun 2026 19:29:05 +0000
In-Reply-To: <20260612192909.1153907-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260612192909.1153907-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612192909.1153907-18-coltonlewis@google.com>
Subject: [PATCH 17/21] KVM: arm64: Detect overflows for the Partitioned PMU
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mingwei Zhang <mizhang@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	James Clark <james.clark@linaro.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:kvm@vger.kernel.org,m:alexandru.elisei@arm.com,m:pbonzini@redhat.com,m:corbet@lwn.net,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:maz@kernel.org,m:oliver.upton@linux.dev,m:mizhang@google.com,m:joey.gouly@arm.com,m:suzuki.poulose@arm.com,m:yuzenghui@huawei.com,m:mark.rutland@arm.com,m:shuah@kernel.org,m:gankulkarni@os.amperecomputing.com,m:james.clark@linaro.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:kvmarm@lists.linux.dev,m:linux-perf-users@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:coltonlewis@google.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[coltonlewis@google.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-92199-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[coltonlewis@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DC46467C113

When we re-enter the VM after handling a PMU interrupt, calculate
whether it was any of the guest counters that overflowed and inject an
interrupt into the guest if so.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu-direct.c | 48 +++++++++++++++++++++++++++++++++++++
 arch/arm64/kvm/pmu-emul.c   |  4 ++--
 arch/arm64/kvm/pmu.c        |  6 ++++-
 include/kvm/arm_pmu.h       |  2 ++
 4 files changed, 57 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 64f40cfb31012..0062d1d8e1999 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -426,4 +426,52 @@ void kvm_pmu_handle_guest_irq(struct arm_pmu *pmu, u64 pmovsr)
 		return;
 
 	__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, |=, govf);
+
+	if (kvm_pmu_part_overflow_status(vcpu)) {
+		kvm_make_request(KVM_REQ_IRQ_PENDING, vcpu);
+
+		if (!in_nmi())
+			kvm_vcpu_kick(vcpu);
+		else
+			irq_work_queue(&vcpu->arch.pmu.overflow_work);
+	}
+}
+
+/**
+ * kvm_pmu_part_overflow_status() - Determine if any guest counters have overflowed
+ * @vcpu: Pointer to struct kvm_vcpu
+ *
+ * Determine if any guest counters have overflowed and therefore an
+ * IRQ needs to be injected into the guest. If access is still free,
+ * then the guest hasn't accessed the PMU yet so we know the guest
+ * context is not loaded onto the pCPU and an overflow is impossible.
+ *
+ * Return: True if there was an overflow, false otherwise
+ */
+bool kvm_pmu_part_overflow_status(struct kvm_vcpu *vcpu)
+{
+	struct arm_pmu *pmu;
+	u64 mask, pmovs, pmint, pmcr;
+	bool overflow;
+
+	pmu = vcpu->kvm->arch.arm_pmu;
+	mask = kvm_pmu_guest_counter_mask(pmu);
+
+	if (vcpu->arch.pmu.access == VCPU_PMU_ACCESS_FREE) {
+		pmovs = __vcpu_sys_reg(vcpu, PMOVSSET_EL0);
+		pmint = __vcpu_sys_reg(vcpu, PMINTENSET_EL1);
+		pmcr = __vcpu_sys_reg(vcpu, PMCR_EL0);
+
+		if ((pmcr & ARMV8_PMU_PMCR_E) && (mask & pmovs & pmint))
+			kvm_pmu_set_guest_owned(vcpu);
+		else
+			return false;
+	}
+
+	pmovs = __vcpu_sys_reg(vcpu, PMOVSSET_EL0);
+	pmint = read_pmintenset();
+	pmcr = read_pmcr();
+	overflow = (pmcr & ARMV8_PMU_PMCR_E) && (mask & pmovs & pmint);
+
+	return overflow;
 }
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index d1110febe7436..ebc68090bdb26 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -268,7 +268,7 @@ void kvm_pmu_reprogram_counter_mask(struct kvm_vcpu *vcpu, u64 val)
  * counter where the values of the global enable control, PMOVSSET_EL0[n], and
  * PMINTENSET_EL1[n] are all 1.
  */
-bool kvm_pmu_overflow_status(struct kvm_vcpu *vcpu)
+bool kvm_pmu_emul_overflow_status(struct kvm_vcpu *vcpu)
 {
 	u64 reg = __vcpu_sys_reg(vcpu, PMOVSSET_EL0);
 
@@ -405,7 +405,7 @@ static void kvm_pmu_perf_overflow(struct perf_event *perf_event,
 		kvm_pmu_counter_increment(vcpu, BIT(idx + 1),
 					  ARMV8_PMUV3_PERFCTR_CHAIN);
 
-	if (kvm_pmu_overflow_status(vcpu)) {
+	if (kvm_pmu_emul_overflow_status(vcpu)) {
 		kvm_make_request(KVM_REQ_IRQ_PENDING, vcpu);
 
 		if (!in_nmi())
diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index 55cda8021400a..f5ee18b4dfae7 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -409,7 +409,11 @@ static void kvm_pmu_update_state(struct kvm_vcpu *vcpu)
 	struct kvm_pmu *pmu = &vcpu->arch.pmu;
 	bool overflow;
 
-	overflow = kvm_pmu_overflow_status(vcpu);
+	if (kvm_pmu_is_partitioned(vcpu->kvm))
+		overflow = kvm_pmu_part_overflow_status(vcpu);
+	else
+		overflow = kvm_pmu_emul_overflow_status(vcpu);
+
 	if (pmu->irq_level == overflow)
 		return;
 
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 25163a689ae80..f72d080ee7ba2 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -93,6 +93,8 @@ bool kvm_set_pmuserenr(u64 val);
 void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_resync_el0(void);
+bool kvm_pmu_emul_overflow_status(struct kvm_vcpu *vcpu);
+bool kvm_pmu_part_overflow_status(struct kvm_vcpu *vcpu);
 
 #define kvm_vcpu_has_pmu(vcpu)					\
 	(vcpu_has_feature(vcpu, KVM_ARM_VCPU_PMU_V3))
-- 
2.54.0.1136.gdb2ca164c4-goog


