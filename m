Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52AA3122DAD
	for <lists+linux-doc@lfdr.de>; Tue, 17 Dec 2019 14:56:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728723AbfLQN4k (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 17 Dec 2019 08:56:40 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:8137 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728554AbfLQN4k (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 17 Dec 2019 08:56:40 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 862194F98DDFFED6A2E0;
        Tue, 17 Dec 2019 21:56:30 +0800 (CST)
Received: from DESKTOP-1NISPDV.china.huawei.com (10.173.221.248) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.439.0; Tue, 17 Dec 2019 21:56:23 +0800
From:   <yezengruan@huawei.com>
To:     <yezengruan@huawei.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <kvmarm@lists.cs.columbia.edu>, <kvm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>,
        <virtualization@lists.linux-foundation.org>
CC:     <maz@kernel.org>, <james.morse@arm.com>, <linux@armlinux.org.uk>,
        <suzuki.poulose@arm.com>, <julien.thierry.kdev@gmail.com>,
        <catalin.marinas@arm.com>, <mark.rutland@arm.com>,
        <will@kernel.org>, <steven.price@arm.com>,
        <daniel.lezcano@linaro.org>
Subject: [PATCH 3/5] KVM: arm64: Support pvlock preempted via shared structure
Date:   Tue, 17 Dec 2019 21:55:47 +0800
Message-ID: <20191217135549.3240-4-yezengruan@huawei.com>
X-Mailer: git-send-email 2.23.0.windows.1
In-Reply-To: <20191217135549.3240-1-yezengruan@huawei.com>
References: <20191217135549.3240-1-yezengruan@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.173.221.248]
X-CFilter-Loop: Reflected
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Zengruan Ye <yezengruan@huawei.com>

Implement the service call for configuring a shared structure between a
vcpu and the hypervisor in which the hypervisor can tell the vcpu is
running or not.

The preempted field is zero if 1) some old KVM deos not support this filed.
2) the vcpu is not preempted. Other values means the vcpu has been preempted.

Signed-off-by: Zengruan Ye <yezengruan@huawei.com>
---
 arch/arm/include/asm/kvm_host.h   | 13 +++++++++++++
 arch/arm64/include/asm/kvm_host.h | 17 +++++++++++++++++
 arch/arm64/kvm/Makefile           |  1 +
 virt/kvm/arm/arm.c                |  8 ++++++++
 virt/kvm/arm/hypercalls.c         |  4 ++++
 virt/kvm/arm/pvlock.c             | 21 +++++++++++++++++++++
 6 files changed, 64 insertions(+)
 create mode 100644 virt/kvm/arm/pvlock.c

diff --git a/arch/arm/include/asm/kvm_host.h b/arch/arm/include/asm/kvm_host.h
index 556cd818eccf..098375f1c89e 100644
--- a/arch/arm/include/asm/kvm_host.h
+++ b/arch/arm/include/asm/kvm_host.h
@@ -356,6 +356,19 @@ static inline bool kvm_arm_is_pvtime_enabled(struct kvm_vcpu_arch *vcpu_arch)
 	return false;
 }
 
+static inline void kvm_arm_pvlock_preempted_init(struct kvm_vcpu_arch *vcpu_arch)
+{
+}
+
+static inline bool kvm_arm_is_pvlock_preempted_ready(struct kvm_vcpu_arch *vcpu_arch)
+{
+	return false;
+}
+
+static inline void kvm_update_pvlock_preempted(struct kvm_vcpu *vcpu, u64 preempted)
+{
+}
+
 void kvm_mmu_wp_memory_region(struct kvm *kvm, int slot);
 
 struct kvm_vcpu *kvm_mpidr_to_vcpu(struct kvm *kvm, unsigned long mpidr);
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index c61260cf63c5..d9b2a21a87ac 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -354,6 +354,11 @@ struct kvm_vcpu_arch {
 		u64 last_steal;
 		gpa_t base;
 	} steal;
+
+	/* Guest PV lock state */
+	struct {
+		gpa_t base;
+	} pv;
 };
 
 /* Pointer to the vcpu's SVE FFR for sve_{save,load}_state() */
@@ -515,6 +520,18 @@ static inline bool kvm_arm_is_pvtime_enabled(struct kvm_vcpu_arch *vcpu_arch)
 	return (vcpu_arch->steal.base != GPA_INVALID);
 }
 
+static inline void kvm_arm_pvlock_preempted_init(struct kvm_vcpu_arch *vcpu_arch)
+{
+	vcpu_arch->pv.base = GPA_INVALID;
+}
+
+static inline bool kvm_arm_is_pvlock_preempted_ready(struct kvm_vcpu_arch *vcpu_arch)
+{
+	return (vcpu_arch->pv.base != GPA_INVALID);
+}
+
+void kvm_update_pvlock_preempted(struct kvm_vcpu *vcpu, u64 preempted);
+
 void kvm_set_sei_esr(struct kvm_vcpu *vcpu, u64 syndrome);
 
 struct kvm_vcpu *kvm_mpidr_to_vcpu(struct kvm *kvm, unsigned long mpidr);
diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index 5ffbdc39e780..e4591f56d5f1 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -15,6 +15,7 @@ kvm-$(CONFIG_KVM_ARM_HOST) += $(KVM)/arm/arm.o $(KVM)/arm/mmu.o $(KVM)/arm/mmio.
 kvm-$(CONFIG_KVM_ARM_HOST) += $(KVM)/arm/psci.o $(KVM)/arm/perf.o
 kvm-$(CONFIG_KVM_ARM_HOST) += $(KVM)/arm/hypercalls.o
 kvm-$(CONFIG_KVM_ARM_HOST) += $(KVM)/arm/pvtime.o
+kvm-$(CONFIG_KVM_ARM_HOST) += $(KVM)/arm/pvlock.o
 
 kvm-$(CONFIG_KVM_ARM_HOST) += inject_fault.o regmap.o va_layout.o
 kvm-$(CONFIG_KVM_ARM_HOST) += hyp.o hyp-init.o handle_exit.o
diff --git a/virt/kvm/arm/arm.c b/virt/kvm/arm/arm.c
index 12e0280291ce..c562f62fdd45 100644
--- a/virt/kvm/arm/arm.c
+++ b/virt/kvm/arm/arm.c
@@ -383,6 +383,8 @@ int kvm_arch_vcpu_init(struct kvm_vcpu *vcpu)
 
 	kvm_arm_pvtime_vcpu_init(&vcpu->arch);
 
+	kvm_arm_pvlock_preempted_init(&vcpu->arch);
+
 	return kvm_vgic_vcpu_init(vcpu);
 }
 
@@ -421,6 +423,9 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 		vcpu_set_wfx_traps(vcpu);
 
 	vcpu_ptrauth_setup_lazy(vcpu);
+
+	if (kvm_arm_is_pvlock_preempted_ready(&vcpu->arch))
+		kvm_update_pvlock_preempted(vcpu, 0);
 }
 
 void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
@@ -434,6 +439,9 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 	vcpu->cpu = -1;
 
 	kvm_arm_set_running_vcpu(NULL);
+
+	if (kvm_arm_is_pvlock_preempted_ready(&vcpu->arch))
+		kvm_update_pvlock_preempted(vcpu, 1);
 }
 
 static void vcpu_power_off(struct kvm_vcpu *vcpu)
diff --git a/virt/kvm/arm/hypercalls.c b/virt/kvm/arm/hypercalls.c
index ff13871fd85a..5964982ccd05 100644
--- a/virt/kvm/arm/hypercalls.c
+++ b/virt/kvm/arm/hypercalls.c
@@ -65,6 +65,10 @@ int kvm_hvc_call_handler(struct kvm_vcpu *vcpu)
 		if (gpa != GPA_INVALID)
 			val = gpa;
 		break;
+	case ARM_SMCCC_HV_PV_LOCK_PREEMPTED:
+		vcpu->arch.pv.base = smccc_get_arg1(vcpu);
+		val = SMCCC_RET_SUCCESS;
+		break;
 	default:
 		return kvm_psci_call(vcpu);
 	}
diff --git a/virt/kvm/arm/pvlock.c b/virt/kvm/arm/pvlock.c
new file mode 100644
index 000000000000..c3464958b0f5
--- /dev/null
+++ b/virt/kvm/arm/pvlock.c
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright(c) 2019 Huawei Technologies Co., Ltd
+ * Author: Zengruan Ye <yezengruan@huawei.com>
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/kvm_host.h>
+
+#include <kvm/arm_hypercalls.h>
+
+void kvm_update_pvlock_preempted(struct kvm_vcpu *vcpu, u64 preempted)
+{
+	u64 preempted_le;
+	u64 base;
+	struct kvm *kvm = vcpu->kvm;
+
+	base = vcpu->arch.pv.base;
+	preempted_le = cpu_to_le64(preempted);
+	kvm_put_guest(kvm, base, preempted_le, u64);
+}
-- 
2.19.1


