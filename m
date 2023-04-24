Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E01826D126D
	for <lists+linux-doc@lfdr.de>; Fri, 31 Mar 2023 00:44:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbjC3Wo6 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 30 Mar 2023 18:44:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231143AbjC3Woc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Mar 2023 18:44:32 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F48411660
        for <linux-doc@vger.kernel.org>; Thu, 30 Mar 2023 15:44:26 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 8-20020a250508000000b00b7c653a0a4aso12372866ybf.23
        for <linux-doc@vger.kernel.org>; Thu, 30 Mar 2023 15:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680216265;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sxm82ULq9HWZFwrrpsKKW1Wi+ka2XfyIhyEC8wmryEE=;
        b=JFa4+7SBBm70AwsjA2qDEb8H6264qe0jsdOabWpuBQpeTA8q1Dwptf304Pfb4FDSjE
         HcQd6xgrWtSNmiWha8BOMFD++Iy45eTglljvLnQ0nrIc7yQU8sapLJvfBcLKx9YfyclC
         ASIfRlN7d7DrWabNir+/aeKQFtM3hHgY38RthgmPRJEmPk0WEVSC60mctZSpMkYTabWl
         ejxe7TmLEYGIsppkU2JnuNYVVeEiKJrpJHt5uDVUPn7a6rF1gKWVCsZvuyzl+DANT3ti
         wiDOU468U4DxaYrfVr4mD2Z2GyAdNNwNYJXkcanlwlU4RwsMeOFdhrXdnzTA6WE9OFOs
         M1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680216265;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sxm82ULq9HWZFwrrpsKKW1Wi+ka2XfyIhyEC8wmryEE=;
        b=tfxnxFDaR7keR1GuQLYvBuLaHpsR1fQ3myrANA/2PiWf834FmMleEgmgLmqf1r5tws
         4rhTAl2FHBL3EXsRFHGIOL3qzJE21v40k8SczDiy61ra/ynEJyHVo2xNF7SEWm8NtuGI
         4gfZbl4rAiBtk2yQmiv0LrifP8VDwMP6fV1Dje3vO8VRbGKjhaeoXV4xfrsWvaShu6Jy
         DKTLzptLrWeuVfu3p8cxVr9s2IbIcpBNmQHUpuzMBDc0YAHfLJqhVjPuASp3Vga1FeM7
         Y5H+FLAA0Cr8hKDpTBsBzgq6PiryYeB5e9hGYSvfL39WoKBbBTy3JBTeutNLNw3D8Vc6
         Jjag==
X-Gm-Message-State: AAQBX9dsIUVQHJ8GGiq9oIsHBPXrb2dP9g66tKDlpITnWq6L4RJCXF80
        HW2my2xFdiEFjoMT0HRGHAMhd+SvzcR3
X-Google-Smtp-Source: AKy350YHU6ZjYfEssO+g7LMMzmSGhcnh1/DfYDsYy/ADjxPdUuHdSC5u6XcbgYvLRZf8eBu8n/7ZDdQOf4s7
X-Received: from davidai2.mtv.corp.google.com ([2620:15c:211:201:c162:24e8:ec5e:d520])
 (user=davidai job=sendgmr) by 2002:a05:6902:18c6:b0:b78:4788:525b with SMTP
 id ck6-20020a05690218c600b00b784788525bmr16043899ybb.0.1680216265743; Thu, 30
 Mar 2023 15:44:25 -0700 (PDT)
Date:   Thu, 30 Mar 2023 15:43:39 -0700
In-Reply-To: <20230330224348.1006691-1-davidai@google.com>
Mime-Version: 1.0
References: <20230330224348.1006691-1-davidai@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230330224348.1006691-5-davidai@google.com>
Subject: [RFC PATCH 4/6] kvm: arm64: Add support for get_freqtbl service
From:   David Dai <davidai@google.com>
To:     Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>
Cc:     David Dai <davidai@google.com>,
        Saravana Kannan <saravanak@google.com>,
        kernel-team@android.com, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This service allows guests to query the host for the frequency table
of the CPU that the vCPU is currently running on.

Co-developed-by: Saravana Kannan <saravanak@google.com>
Signed-off-by: Saravana Kannan <saravanak@google.com>
Signed-off-by: David Dai <davidai@google.com>
---
 Documentation/virt/kvm/api.rst             |  8 ++++++++
 Documentation/virt/kvm/arm/get_freqtbl.rst | 23 ++++++++++++++++++++++
 Documentation/virt/kvm/arm/index.rst       |  1 +
 arch/arm64/include/uapi/asm/kvm.h          |  1 +
 arch/arm64/kvm/arm.c                       |  1 +
 arch/arm64/kvm/hypercalls.c                | 22 +++++++++++++++++++++
 include/linux/arm-smccc.h                  |  7 +++++++
 include/uapi/linux/kvm.h                   |  1 +
 tools/arch/arm64/include/uapi/asm/kvm.h    |  1 +
 9 files changed, 65 insertions(+)
 create mode 100644 Documentation/virt/kvm/arm/get_freqtbl.rst

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 38ce33564efc..8f905456e2b4 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -8400,6 +8400,14 @@ after normalizing for architecture. This is useful when guests are tracking
 workload on its vCPUs. Util hints allow the host to make more accurate
 frequency selections and task placement for vCPU threads.
 
+8.42 KVM_CAP_GET_CPUFREQ_TBL
+---------------------------
+
+:Architectures: arm64
+
+This capability indicates that the KVM supports getting the
+frequency table of the current CPU that the vCPU thread is running on.
+
 9. Known KVM API problems
 =========================
 
diff --git a/Documentation/virt/kvm/arm/get_freqtbl.rst b/Documentation/virt/kvm/arm/get_freqtbl.rst
new file mode 100644
index 000000000000..f6832d7566e7
--- /dev/null
+++ b/Documentation/virt/kvm/arm/get_freqtbl.rst
@@ -0,0 +1,23 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+get_freqtbl support for arm/arm64
+=============================
+
+Allows guest to query the frequency(in KHz) table of the current CPU that
+the vCPU thread is running on.
+
+* ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID: 0x86000042
+
+This hypercall uses the SMC32/HVC32 calling convention:
+
+ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID
+    ==============    ========    =====================================
+    Function ID:      (uint32)    0x86000042
+    Arguments:        (uint32)    index of the current CPU's frequency table
+    Return Values:    (int32)     NOT_SUPPORTED(-1) on error, or
+                      (uint32)    Frequency table entry of requested index
+                                  in KHz
+                                  of current CPU(r1)
+    Endianness:                   Must be the same endianness
+                                  as the host.
+    ==============    ========    =====================================
diff --git a/Documentation/virt/kvm/arm/index.rst b/Documentation/virt/kvm/arm/index.rst
index f83877663813..e2e56bb41491 100644
--- a/Documentation/virt/kvm/arm/index.rst
+++ b/Documentation/virt/kvm/arm/index.rst
@@ -13,3 +13,4 @@ ARM
    ptp_kvm
    get_cur_cpufreq
    util_hint
+   get_freqtbl
diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
index 61309ecb7241..ed6f593264bd 100644
--- a/arch/arm64/include/uapi/asm/kvm.h
+++ b/arch/arm64/include/uapi/asm/kvm.h
@@ -369,6 +369,7 @@ enum {
 	KVM_REG_ARM_VENDOR_HYP_BIT_PTP		= 1,
 	KVM_REG_ARM_VENDOR_HYP_BIT_GET_CUR_CPUFREQ	= 2,
 	KVM_REG_ARM_VENDOR_HYP_BIT_UTIL_HINT		= 3,
+	KVM_REG_ARM_VENDOR_HYP_BIT_GET_CPUFREQ_TBL	= 4,
 #ifdef __KERNEL__
 	KVM_REG_ARM_VENDOR_HYP_BMAP_BIT_COUNT,
 #endif
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index bf3c4d4b9b67..cd76128e4af4 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -222,6 +222,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_ARM_SYSTEM_SUSPEND:
 	case KVM_CAP_GET_CUR_CPUFREQ:
 	case KVM_CAP_UTIL_HINT:
+	case KVM_CAP_GET_CPUFREQ_TBL:
 		r = 1;
 		break;
 	case KVM_CAP_SET_GUEST_DEBUG2:
diff --git a/arch/arm64/kvm/hypercalls.c b/arch/arm64/kvm/hypercalls.c
index 01dba07b5183..6f96579dda80 100644
--- a/arch/arm64/kvm/hypercalls.c
+++ b/arch/arm64/kvm/hypercalls.c
@@ -42,6 +42,22 @@ static void kvm_sched_set_util(struct kvm_vcpu *vcpu, u64 *val)
 	val[0] = (u64)ret;
 }
 
+static void kvm_sched_get_cpufreq_table(struct kvm_vcpu *vcpu, u64 *val)
+{
+	struct cpufreq_policy *policy;
+	u32 idx = smccc_get_arg1(vcpu);
+
+	policy = cpufreq_cpu_get(task_cpu(current));
+
+	if (!policy)
+		return;
+
+	val[0] = SMCCC_RET_SUCCESS;
+	val[1] = policy->freq_table[idx].frequency;
+
+	cpufreq_cpu_put(policy);
+}
+
 static void kvm_ptp_get_time(struct kvm_vcpu *vcpu, u64 *val)
 {
 	struct system_time_snapshot systime_snapshot;
@@ -148,6 +164,9 @@ static bool kvm_hvc_call_allowed(struct kvm_vcpu *vcpu, u32 func_id)
 	case ARM_SMCCC_VENDOR_HYP_KVM_UTIL_HINT_FUNC_ID:
 		return test_bit(KVM_REG_ARM_VENDOR_HYP_BIT_UTIL_HINT,
 				&smccc_feat->vendor_hyp_bmap);
+	case ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID:
+		return test_bit(KVM_REG_ARM_VENDOR_HYP_BIT_GET_CPUFREQ_TBL,
+				&smccc_feat->vendor_hyp_bmap);
 	default:
 		return kvm_hvc_call_default_allowed(func_id);
 	}
@@ -251,6 +270,9 @@ int kvm_hvc_call_handler(struct kvm_vcpu *vcpu)
 	case ARM_SMCCC_VENDOR_HYP_KVM_UTIL_HINT_FUNC_ID:
 		kvm_sched_set_util(vcpu, val);
 		break;
+	case ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID:
+		kvm_sched_get_cpufreq_table(vcpu, val);
+		break;
 	case ARM_SMCCC_TRNG_VERSION:
 	case ARM_SMCCC_TRNG_FEATURES:
 	case ARM_SMCCC_TRNG_GET_UUID:
diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 9f747e5025b6..19fefb73a9bd 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -114,6 +114,7 @@
 #define ARM_SMCCC_KVM_FUNC_PTP			1
 #define ARM_SMCCC_KVM_FUNC_GET_CUR_CPUFREQ	64
 #define ARM_SMCCC_KVM_FUNC_UTIL_HINT			65
+#define ARM_SMCCC_KVM_FUNC_GET_CPUFREQ_TBL	66
 #define ARM_SMCCC_KVM_FUNC_FEATURES_2		127
 #define ARM_SMCCC_KVM_NUM_FUNCS			128
 
@@ -152,6 +153,12 @@
 			   ARM_SMCCC_OWNER_VENDOR_HYP,			\
 			   ARM_SMCCC_KVM_FUNC_UTIL_HINT)
 
+#define ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID		\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
+			   ARM_SMCCC_SMC_32,				\
+			   ARM_SMCCC_OWNER_VENDOR_HYP,			\
+			   ARM_SMCCC_KVM_FUNC_GET_CPUFREQ_TBL)
+
 /* Paravirtualised time calls (defined by ARM DEN0057A) */
 #define ARM_SMCCC_HV_PV_TIME_FEATURES				\
 	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,			\
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 7f667ab344ae..90a7f37f046d 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1186,6 +1186,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_PMU_EVENT_MASKED_EVENTS 226
 #define KVM_CAP_GET_CUR_CPUFREQ 512
 #define KVM_CAP_UTIL_HINT 513
+#define KVM_CAP_GET_CPUFREQ_TBL 514
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
diff --git a/tools/arch/arm64/include/uapi/asm/kvm.h b/tools/arch/arm64/include/uapi/asm/kvm.h
index 61309ecb7241..ebf9a3395c1b 100644
--- a/tools/arch/arm64/include/uapi/asm/kvm.h
+++ b/tools/arch/arm64/include/uapi/asm/kvm.h
@@ -369,6 +369,7 @@ enum {
 	KVM_REG_ARM_VENDOR_HYP_BIT_PTP		= 1,
 	KVM_REG_ARM_VENDOR_HYP_BIT_GET_CUR_CPUFREQ	= 2,
 	KVM_REG_ARM_VENDOR_HYP_BIT_UTIL_HINT		= 3,
+	KVM_REG_ARM_VENDOR_HYP_BIT_CPUFREQ_TBL		= 4,
 #ifdef __KERNEL__
 	KVM_REG_ARM_VENDOR_HYP_BMAP_BIT_COUNT,
 #endif
-- 
2.40.0.348.gf938b09366-goog

