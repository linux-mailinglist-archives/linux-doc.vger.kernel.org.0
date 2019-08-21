Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD4697F0B
	for <lists+linux-doc@lfdr.de>; Wed, 21 Aug 2019 17:39:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730204AbfHUPhv (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 21 Aug 2019 11:37:51 -0400
Received: from foss.arm.com ([217.140.110.172]:60462 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730161AbfHUPh3 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 21 Aug 2019 11:37:29 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3829C1596;
        Wed, 21 Aug 2019 08:37:29 -0700 (PDT)
Received: from e112269-lin.arm.com (e112269-lin.cambridge.arm.com [10.1.196.133])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 366A03F718;
        Wed, 21 Aug 2019 08:37:27 -0700 (PDT)
From:   Steven Price <steven.price@arm.com>
To:     Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu
Cc:     Steven Price <steven.price@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>,
        Russell King <linux@armlinux.org.uk>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Pouloze <suzuki.poulose@arm.com>,
        Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/10] KVM: arm64: Provide a PV_TIME device to user space
Date:   Wed, 21 Aug 2019 16:36:53 +0100
Message-Id: <20190821153656.33429-8-steven.price@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821153656.33429-1-steven.price@arm.com>
References: <20190821153656.33429-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Allow user space to inform the KVM host where in the physical memory
map the paravirtualized time structures should be located.

A device is created which provides the base address of an array of
Stolen Time (ST) structures, one for each VCPU. There must be (64 *
total number of VCPUs) bytes of memory available at this location.

The address is given in terms of the physical address visible to
the guest and must be page aligned. The guest will discover the address
via a hypercall.

Signed-off-by: Steven Price <steven.price@arm.com>
---
 arch/arm/include/asm/kvm_host.h   |  4 ++
 arch/arm64/include/asm/kvm_host.h |  1 +
 arch/arm64/include/uapi/asm/kvm.h |  8 +++
 include/uapi/linux/kvm.h          |  2 +
 virt/kvm/arm/arm.c                |  1 +
 virt/kvm/arm/pvtime.c             | 94 +++++++++++++++++++++++++++++++
 6 files changed, 110 insertions(+)

diff --git a/arch/arm/include/asm/kvm_host.h b/arch/arm/include/asm/kvm_host.h
index 47d2ced99421..b6c8dbc0556b 100644
--- a/arch/arm/include/asm/kvm_host.h
+++ b/arch/arm/include/asm/kvm_host.h
@@ -325,6 +325,10 @@ static inline int kvm_arch_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 int kvm_perf_init(void);
 int kvm_perf_teardown(void);
 
+static inline void kvm_pvtime_init(void)
+{
+}
+
 static inline int kvm_hypercall_pv_features(struct kvm_vcpu *vcpu)
 {
 	return SMCCC_RET_NOT_SUPPORTED;
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index b6fa7beffd8a..7b2147f62c16 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -489,6 +489,7 @@ void handle_exit_early(struct kvm_vcpu *vcpu, struct kvm_run *run,
 int kvm_perf_init(void);
 int kvm_perf_teardown(void);
 
+void kvm_pvtime_init(void);
 int kvm_hypercall_pv_features(struct kvm_vcpu *vcpu);
 int kvm_hypercall_stolen_time(struct kvm_vcpu *vcpu);
 int kvm_update_stolen_time(struct kvm_vcpu *vcpu, bool init);
diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
index 9a507716ae2f..209c4de67306 100644
--- a/arch/arm64/include/uapi/asm/kvm.h
+++ b/arch/arm64/include/uapi/asm/kvm.h
@@ -367,6 +367,14 @@ struct kvm_vcpu_events {
 #define KVM_PSCI_RET_INVAL		PSCI_RET_INVALID_PARAMS
 #define KVM_PSCI_RET_DENIED		PSCI_RET_DENIED
 
+/* Device Control API: PV_TIME */
+#define KVM_DEV_ARM_PV_TIME_REGION	0
+#define  KVM_DEV_ARM_PV_TIME_ST		0
+struct kvm_dev_arm_st_region {
+	__u64 gpa;
+	__u64 size;
+};
+
 #endif
 
 #endif /* __ARM_KVM_H__ */
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 5e3f12d5359e..265156a984f2 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1222,6 +1222,8 @@ enum kvm_device_type {
 #define KVM_DEV_TYPE_ARM_VGIC_ITS	KVM_DEV_TYPE_ARM_VGIC_ITS
 	KVM_DEV_TYPE_XIVE,
 #define KVM_DEV_TYPE_XIVE		KVM_DEV_TYPE_XIVE
+	KVM_DEV_TYPE_ARM_PV_TIME,
+#define KVM_DEV_TYPE_ARM_PV_TIME	KVM_DEV_TYPE_ARM_PV_TIME
 	KVM_DEV_TYPE_MAX,
 };
 
diff --git a/virt/kvm/arm/arm.c b/virt/kvm/arm/arm.c
index 5e8343e2dd62..bfb5a842e6ab 100644
--- a/virt/kvm/arm/arm.c
+++ b/virt/kvm/arm/arm.c
@@ -1494,6 +1494,7 @@ static int init_subsystems(void)
 
 	kvm_perf_init();
 	kvm_coproc_table_init();
+	kvm_pvtime_init();
 
 out:
 	on_each_cpu(_kvm_arch_hardware_disable, NULL, 1);
diff --git a/virt/kvm/arm/pvtime.c b/virt/kvm/arm/pvtime.c
index 28603689f6e0..3e55c1fb6a49 100644
--- a/virt/kvm/arm/pvtime.c
+++ b/virt/kvm/arm/pvtime.c
@@ -2,7 +2,9 @@
 // Copyright (C) 2019 Arm Ltd.
 
 #include <linux/arm-smccc.h>
+#include <linux/kvm_host.h>
 
+#include <asm/kvm_mmu.h>
 #include <asm/pvclock-abi.h>
 
 #include <kvm/arm_hypercalls.h>
@@ -86,3 +88,95 @@ int kvm_hypercall_stolen_time(struct kvm_vcpu *vcpu)
 
 	return ret;
 }
+
+static int kvm_arm_pvtime_create(struct kvm_device *dev, u32 type)
+{
+	return 0;
+}
+
+static void kvm_arm_pvtime_destroy(struct kvm_device *dev)
+{
+	struct kvm_arch_pvtime *pvtime = &dev->kvm->arch.pvtime;
+
+	pvtime->st_base = GPA_INVALID;
+	kfree(dev);
+}
+
+static int kvm_arm_pvtime_set_attr(struct kvm_device *dev,
+				   struct kvm_device_attr *attr)
+{
+	struct kvm *kvm = dev->kvm;
+	struct kvm_arch_pvtime *pvtime = &kvm->arch.pvtime;
+	u64 __user *user = (u64 __user *)attr->addr;
+	struct kvm_dev_arm_st_region region;
+
+	switch (attr->group) {
+	case KVM_DEV_ARM_PV_TIME_REGION:
+		if (copy_from_user(&region, user, sizeof(region)))
+			return -EFAULT;
+		if (region.gpa & ~PAGE_MASK)
+			return -EINVAL;
+		if (region.size & ~PAGE_MASK)
+			return -EINVAL;
+		switch (attr->attr) {
+		case KVM_DEV_ARM_PV_TIME_ST:
+			if (pvtime->st_base != GPA_INVALID)
+				return -EEXIST;
+			pvtime->st_base = region.gpa;
+			pvtime->st_size = region.size;
+			return 0;
+		}
+		break;
+	}
+	return -ENXIO;
+}
+
+static int kvm_arm_pvtime_get_attr(struct kvm_device *dev,
+				   struct kvm_device_attr *attr)
+{
+	struct kvm_arch_pvtime *pvtime = &dev->kvm->arch.pvtime;
+	u64 __user *user = (u64 __user *)attr->addr;
+	struct kvm_dev_arm_st_region region;
+
+	switch (attr->group) {
+	case KVM_DEV_ARM_PV_TIME_REGION:
+		switch (attr->attr) {
+		case KVM_DEV_ARM_PV_TIME_ST:
+			region.gpa = pvtime->st_base;
+			region.size = pvtime->st_size;
+			if (copy_to_user(user, &region, sizeof(region)))
+				return -EFAULT;
+			return 0;
+		}
+		break;
+	}
+	return -ENXIO;
+}
+
+static int kvm_arm_pvtime_has_attr(struct kvm_device *dev,
+				   struct kvm_device_attr *attr)
+{
+	switch (attr->group) {
+	case KVM_DEV_ARM_PV_TIME_REGION:
+		switch (attr->attr) {
+		case KVM_DEV_ARM_PV_TIME_ST:
+			return 0;
+		}
+		break;
+	}
+	return -ENXIO;
+}
+
+static const struct kvm_device_ops pvtime_ops = {
+	"Arm PV time",
+	.create = kvm_arm_pvtime_create,
+	.destroy = kvm_arm_pvtime_destroy,
+	.set_attr = kvm_arm_pvtime_set_attr,
+	.get_attr = kvm_arm_pvtime_get_attr,
+	.has_attr = kvm_arm_pvtime_has_attr
+};
+
+void kvm_pvtime_init(void)
+{
+	kvm_register_device_ops(&pvtime_ops, KVM_DEV_TYPE_ARM_PV_TIME);
+}
-- 
2.20.1

