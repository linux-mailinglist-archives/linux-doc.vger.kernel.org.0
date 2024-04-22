Return-Path: <linux-doc+bounces-14781-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 057998AD3C5
	for <lists+linux-doc@lfdr.de>; Mon, 22 Apr 2024 20:18:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 297631C20D25
	for <lists+linux-doc@lfdr.de>; Mon, 22 Apr 2024 18:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70373154449;
	Mon, 22 Apr 2024 18:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pKbnRnEV"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80962153BCD
	for <linux-doc@vger.kernel.org>; Mon, 22 Apr 2024 18:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713809887; cv=none; b=GHVGKB74aixX6D+//tyoMRfBJx3/I6ac+5we2VWmP9cJWpaok2bxxu2/J0ypukLmoJxmJSARhNrRXYQJ6sZzPi24B57Lnfc/xY39cRLvr6caVfky4odH54Q+xbZznkX8UJB2Hj2ZKxhzriuwitfBmMI8kurItZL2mCDLp1icCRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713809887; c=relaxed/simple;
	bh=EqSTPNMowwCgymn+v0WtAz03SumIq2vQhNLhAloGFtY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=GcmVvPQtLd2VO71lZ3avWV817V3mmEEm7g5m+FtKaB9cj+0f2m0zbbLP8NC15ngIzJlaotc8qqjLBh1J80FFsIjWLqAfZQx+aV75j3RzLBC1IP3pxYuJlmGKkDt2q0r0azPF4u7TFpqRAPnqZg1xAkJCgrqJUv4U6Sv9Me10vCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pKbnRnEV; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-de0b4063e59so4180241276.3
        for <linux-doc@vger.kernel.org>; Mon, 22 Apr 2024 11:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713809883; x=1714414683; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oI5PsFH5OqKQcxn/PnstoUW6QKwHJtSKvuBDm6LMOPQ=;
        b=pKbnRnEV65ACHdGVwgFVSUZzRLua3oGnFQMaL2/i4rbgRF51NDYA18+BcNwylo9hNU
         XWlhNR3iD52iUng3JBx7RTqc9mcK5LBXJWs50pkm8vqAeOOmZTerUqj6zydKrCQTFzAd
         qPjYK0uB7VgUigjnRZ2urSNTGAVE8NyQEnUhK+jzyJ1DC1fdxk9Y6yj2Zr7myQ2whFl3
         UQJ7NtYgJtL9CFBaocVMIjaD90QBIQLAJoZlbjcPZE0MOqN/Dsb3Zppk9SKzzIqUuEcK
         Cv+o5aagoChNb3AIeSyD4eQ0B6LY0iu7OBbHQ55OkPGjikbnUnoDqZEQZQ/oDJLnJ2Pg
         skdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713809883; x=1714414683;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oI5PsFH5OqKQcxn/PnstoUW6QKwHJtSKvuBDm6LMOPQ=;
        b=IkUvHP7SHor1dbFqx9is4ENSRRy2ylqSrePQh2lrLWNXjVEP3j6sxoudKeC4cNdY9Q
         ieH0/kthUodQhg6t/q81NVt7Nerjtjsy3eEleFRybJTwi6S+gW584S7SGHEFix0AAHdn
         zwH25v5OyrNt0ktlt+hYqOfYH3aNZxTn0Q2WZsoQ8CmcMmsx7HySq7DrO0XYB2G6eJsa
         eAvZOPNVF1wCc1Bgv6s8KdtKLc963XMp2N/y4dettzMrZVG+rbtbj4YOx0IHzogKXicr
         6R86MZwsQiWCH0xAV51UVT27MjlkIQqinZw0WWX6TbsNqnwb0QgE12poZsPZenO0DTq8
         yGJw==
X-Forwarded-Encrypted: i=1; AJvYcCU2fsck5KyzMFbRCrLjx1nP9/7CCJyldXzmVOOYozORk6aNITu0WLypY7yenFlMZzCLqPSbgpVZI/OdwAUDWylbJZMb9A+EUWg/
X-Gm-Message-State: AOJu0Yxh4yVaoZazVCg2YdQueAfAJ4I0L4MRxzFjku3adjEvKP3wZoCT
	MGcK/ohoitcSpj5Mmcxeyd/SSbdA1i9UsFgRwbKTzDnx2YPWsKf8G4/WM8EHr3+OMgTlFOCHXk4
	yg0Wz9130wf33WpGEsFnfyw==
X-Google-Smtp-Source: AGHT+IEKODLHt0IICOPUeVBmNrFEXzRI0P6fCZGRCIutCpq1JEBl/VDOZ6TtUkQgtYk3XxRPPL+MJTGy5Ijvtnur4w==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:14ce])
 (user=coltonlewis job=sendgmr) by 2002:a05:6902:1146:b0:dc7:49a9:6666 with
 SMTP id p6-20020a056902114600b00dc749a96666mr3364862ybu.3.1713809883531; Mon,
 22 Apr 2024 11:18:03 -0700 (PDT)
Date: Mon, 22 Apr 2024 18:17:16 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240422181716.237284-1-coltonlewis@google.com>
Subject: [PATCH v4] KVM: arm64: Add early_param to control WFx trapping
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

Add an early_params to control WFI and WFE trapping. This is to
control the degree guests can wait for interrupts on their own without
being trapped by KVM. Options for each param are trap, notrap, and
default. trap enables the trap. notrap disables the trap. default
preserves current behavior, disabling the trap if only a single task
is running and enabling otherwise.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
v4:

* Fixed inaccurate names that incorrectly implied this controls interrupts
  themselves instead of instructions waiting for interrupts and events
* Split into two separate params as interrupts (WFI) and events (WFE) do
  different things and may warrant separate controls.
* Document new params in Documentation/admin-guide/kernel-parameters.txt


v3:
https://lore.kernel.org/kvmarm/20240410175437.793508-1-coltonlewis@google.com/

v2:
https://lore.kernel.org/kvmarm/20240319164341.1674863-1-coltonlewis@google.com/

v1:
https://lore.kernel.org/kvmarm/20240129213918.3124494-1-coltonlewis@google.com/

 .../admin-guide/kernel-parameters.txt         | 22 +++++++-
 arch/arm64/include/asm/kvm_emulate.h          | 24 ++++++++-
 arch/arm64/include/asm/kvm_host.h             |  7 +++
 arch/arm64/kvm/arm.c                          | 54 +++++++++++++++++--
 4 files changed, 101 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 31b3a25680d0..f8d16c792e66 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2653,6 +2653,27 @@
 			[KVM,ARM] Allow use of GICv4 for direct injection of
 			LPIs.

+	kvm-arm.wfe_trap_policy=
+			[KVM,ARM] Control when to set wfe instruction trap.
+
+			trap: set wfe instruction trap
+
+			notrap: clear wfe instruction trap
+
+			default: set wfe instruction trap only if multiple
+				 tasks are running on the CPU
+
+	kvm-arm.wfi_trap_policy=
+			[KVM,ARM] Control when to set wfi instruction trap.
+
+			trap: set wfi instruction trap
+
+			notrap: clear wfi instruction trap
+
+			default: set wfi instruction trap only if multiple
+				 tasks are running on the CPU
+
+
 	kvm_cma_resv_ratio=n [PPC]
 			Reserves given percentage from system memory area for
 			contiguous memory allocation for KVM hash pagetable
@@ -7394,4 +7415,3 @@
 				memory, and other data can't be written using
 				xmon commands.
 			off	xmon is disabled.
-
diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index b804fe832184..efd0a3fb6f00 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -109,9 +109,13 @@ static inline unsigned long *vcpu_hcr(struct kvm_vcpu *vcpu)
 	return (unsigned long *)&vcpu->arch.hcr_el2;
 }

-static inline void vcpu_clear_wfx_traps(struct kvm_vcpu *vcpu)
+static inline void vcpu_clear_wfe_trap(struct kvm_vcpu *vcpu)
 {
 	vcpu->arch.hcr_el2 &= ~HCR_TWE;
+}
+
+static inline void vcpu_clear_wfi_trap(struct kvm_vcpu *vcpu)
+{
 	if (atomic_read(&vcpu->arch.vgic_cpu.vgic_v3.its_vpe.vlpi_count) ||
 	    vcpu->kvm->arch.vgic.nassgireq)
 		vcpu->arch.hcr_el2 &= ~HCR_TWI;
@@ -119,12 +123,28 @@ static inline void vcpu_clear_wfx_traps(struct kvm_vcpu *vcpu)
 		vcpu->arch.hcr_el2 |= HCR_TWI;
 }

-static inline void vcpu_set_wfx_traps(struct kvm_vcpu *vcpu)
+static inline void vcpu_clear_wfx_traps(struct kvm_vcpu *vcpu)
+{
+	vcpu_clear_wfe_trap(vcpu);
+	vcpu_clear_wfi_trap(vcpu);
+}
+
+static inline void vcpu_set_wfe_trap(struct kvm_vcpu *vcpu)
 {
 	vcpu->arch.hcr_el2 |= HCR_TWE;
+}
+
+static inline void vcpu_set_wfi_trap(struct kvm_vcpu *vcpu)
+{
 	vcpu->arch.hcr_el2 |= HCR_TWI;
 }

+static inline void vcpu_set_wfx_traps(struct kvm_vcpu *vcpu)
+{
+	vcpu_set_wfe_trap(vcpu);
+	vcpu_set_wfi_trap(vcpu);
+}
+
 static inline void vcpu_ptrauth_enable(struct kvm_vcpu *vcpu)
 {
 	vcpu->arch.hcr_el2 |= (HCR_API | HCR_APK);
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 21c57b812569..315ee7bfc1cb 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -67,6 +67,13 @@ enum kvm_mode {
 	KVM_MODE_NV,
 	KVM_MODE_NONE,
 };
+
+enum kvm_wfx_trap_policy {
+	KVM_WFX_NOTRAP_SINGLE_TASK, /* Default option */
+	KVM_WFX_NOTRAP,
+	KVM_WFX_TRAP,
+};
+
 #ifdef CONFIG_KVM
 enum kvm_mode kvm_get_mode(void);
 #else
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index a25265aca432..5106ba5a8a39 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -46,6 +46,8 @@
 #include <kvm/arm_psci.h>

 static enum kvm_mode kvm_mode = KVM_MODE_DEFAULT;
+static enum kvm_wfx_trap_policy kvm_wfi_trap_policy = KVM_WFX_NOTRAP_SINGLE_TASK;
+static enum kvm_wfx_trap_policy kvm_wfe_trap_policy = KVM_WFX_NOTRAP_SINGLE_TASK;

 DECLARE_KVM_HYP_PER_CPU(unsigned long, kvm_hyp_vector);

@@ -423,6 +425,12 @@ void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu)

 }

+static bool kvm_should_clear_wfx_trap(enum kvm_wfx_trap_policy p)
+{
+	return (p == KVM_WFX_NOTRAP && kvm_vgic_global_state.has_gicv4)
+		|| (p == KVM_WFX_NOTRAP_SINGLE_TASK && single_task_running());
+}
+
 void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 {
 	struct kvm_s2_mmu *mmu;
@@ -456,10 +464,15 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
 		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);

-	if (single_task_running())
-		vcpu_clear_wfx_traps(vcpu);
+	if (kvm_should_clear_wfx_trap(kvm_wfi_trap_policy))
+		vcpu_clear_wfi_trap(vcpu);
 	else
-		vcpu_set_wfx_traps(vcpu);
+		vcpu_set_wfi_trap(vcpu);
+
+	if (kvm_should_clear_wfx_trap(kvm_wfe_trap_policy))
+		vcpu_clear_wfe_trap(vcpu);
+	else
+		vcpu_set_wfe_trap(vcpu);

 	if (vcpu_has_ptrauth(vcpu))
 		vcpu_ptrauth_disable(vcpu);
@@ -2654,6 +2667,41 @@ static int __init early_kvm_mode_cfg(char *arg)
 }
 early_param("kvm-arm.mode", early_kvm_mode_cfg);

+static int __init early_kvm_wfx_trap_policy_cfg(char *arg, enum kvm_wfx_trap_policy *p)
+{
+	if (!arg)
+		return -EINVAL;
+
+	if (strcmp(arg, "trap") == 0) {
+		*p = KVM_WFX_TRAP;
+		return 0;
+	}
+
+	if (strcmp(arg, "notrap") == 0) {
+		*p = KVM_WFX_NOTRAP;
+		return 0;
+	}
+
+	if (strcmp(arg, "default") == 0) {
+		*p = KVM_WFX_NOTRAP_SINGLE_TASK;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int __init early_kvm_wfi_trap_policy_cfg(char *arg)
+{
+	return early_kvm_wfx_trap_policy_cfg(arg, &kvm_wfi_trap_policy);
+}
+early_param("kvm-arm.wfi_trap_policy", early_kvm_wfi_trap_policy_cfg);
+
+static int __init early_kvm_wfe_trap_policy_cfg(char *arg)
+{
+	return early_kvm_wfx_trap_policy_cfg(arg, &kvm_wfe_trap_policy);
+}
+early_param("kvm-arm.wfe_trap_policy", early_kvm_wfe_trap_policy_cfg);
+
 enum kvm_mode kvm_get_mode(void)
 {
 	return kvm_mode;
--
2.44.0.769.g3c40516874-goog

