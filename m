Return-Path: <linux-doc+bounces-95122-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QTmqLSKAS2rSSQEAu9opvQ
	(envelope-from <linux-doc+bounces-95122-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 12:14:58 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 521F670EFD2
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 12:14:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=rsg.ci.i.u-tokyo.ac.jp header.s=rs20250326 header.b=DU1X6V89;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=u-tokyo.ac.jp (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95122-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-95122-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C8FBB3025483
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2026 10:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F83420E72;
	Mon,  6 Jul 2026 10:09:20 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from www3579.sakura.ne.jp (www3579.sakura.ne.jp [49.212.243.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4963C73DE;
	Mon,  6 Jul 2026 10:09:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783332560; cv=none; b=SOXoo8Xmt7LP977kMbjJKqGXrQKM6XU7aWwkFeQRopz39EKy6Xiw8fmThgAKqu8G7RSuCV9O0u3IrUnyHUofPHNEJYz+rEQcVRzRhEnvnNYDyUNDQ/64bEbQnhyZ2bPEii68ThfroAf8FrhMIcreHZImxSEJqdso21WxK1IAsxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783332560; c=relaxed/simple;
	bh=r6e98YlV4OLCCvE9+/j+v6Rli9RH4Iy/ZRmHUETXBw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cvuj3J7r3UxTGiRy3R2MvC7tuxS3mXYsMrusKxcNbGxVmTPnUXnrFiA3IXRd3wXMPIXf0d79zqQ1quBeAu9jxtoNbg1Y9CfFA5dGaIwwkhArlRFuaFR/9JoeDqB2pfqC2Z9d1ZF9V8OAP1dMBP9NOHOBlfdkdQ2XnizcL4fl4bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rsg.ci.i.u-tokyo.ac.jp; spf=pass smtp.mailfrom=rsg.ci.i.u-tokyo.ac.jp; dkim=fail (0-bit key) header.d=rsg.ci.i.u-tokyo.ac.jp header.i=@rsg.ci.i.u-tokyo.ac.jp header.b=DU1X6V89 reason="key not found in DNS"; arc=none smtp.client-ip=49.212.243.89
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 666A3TQ4013128
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 6 Jul 2026 19:03:43 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=nCwZNeDZlJVGlaWCLeWYvbGvxte1zenM4jubK+YhaG0=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1783332223; v=1;
        b=DU1X6V895JVkXdpTIAHNPQNWV5xjYrmYk8nt6k0TwVv2ESbhpC7q09iWxmCFBnSM
         LjlIq0647f8DMew/wQ0GlTAwmY+reFS9YOSeIUPzsVQz5wTxfpuIQmim3mGYqOJ8
         1INSgWTuy2fUXrfv1+YN9KCwKDaBYeGH3szy2HijVP4BJwNBlqd1RrkufE/DmfRG
         o3Q88L81VzlPKx4sdBFXTtZwWvsRFVuWNPqIbRA3eoy4rGDA5BvZwCPg7s7Zzbgg
         OeptxjvHbFbfkXxPccrcR1BvsKXMwrqPP24wl7HFYMrxPnGTTI9V5BUY8Hnji/py
         zuI1kyA7vN5/z7NMNtqtLg==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Mon, 06 Jul 2026 19:03:24 +0900
Subject: [PATCH v8 1/7] KVM: arm64: Disallow vPMU when pPMUs do not cover
 all CPUs
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-hybrid-v8-1-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
References: <20260706-hybrid-v8-0-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260706-hybrid-v8-0-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: b4 0.16-dev-925f5
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[u-tokyo.ac.jp : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-95122-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:maz@kernel.org,m:oupton@kernel.org,m:joey.gouly@arm.com,m:suzuki.poulose@arm.com,m:yuzenghui@huawei.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:pbonzini@redhat.com,m:corbet@lwn.net,m:shuah@kernel.org,m:skhan@linuxfoundation.org,m:linux-arm-kernel@lists.infradead.org,m:kvmarm@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:devel@daynix.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:odaki@rsg.ci.i.u-tokyo.ac.jp,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[rsg.ci.i.u-tokyo.ac.jp:~];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[odaki@rsg.ci.i.u-tokyo.ac.jp,linux-doc@vger.kernel.org];
	R_DKIM_PERMFAIL(0.00)[rsg.ci.i.u-tokyo.ac.jp:s=rs20250326];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[odaki@rsg.ci.i.u-tokyo.ac.jp,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[u-tokyo.ac.jp:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 521F670EFD2

Commit ec3eb9ed6081 ("KVM: arm64: PMU: Disallow vPMU on non-uniform
PMUVer") made KVM reject vPMU unless the system-wide PMUVer is usable.
That covers systems where PMUv3 is absent or non-uniform, as well as
systems where IMPDEF PMUv3 sysreg traps are unavailable.

However, KVM can still accept vPMU when all CPUs uniformly trap PMUv3
sysregs, but the pPMUs registered with KVM only cover a subset of
possible CPUs.

Reject vPMU unless the registered pPMUs cover every possible CPU.
This avoids carrying support for partial pPMU coverage into the
fixed-counters-only UAPI introduced later in the series.

Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 arch/arm64/kvm/arm.c      | 16 +++++++++++++---
 arch/arm64/kvm/pmu-emul.c | 20 ++++++++++++++++++--
 include/kvm/arm_pmu.h     |  6 +++---
 3 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 29f48f2c63ec..68767bb08285 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1527,14 +1527,19 @@ int kvm_vm_ioctl_irq_line(struct kvm *kvm, struct kvm_irq_level *irq_level,
 	return -EINVAL;
 }
 
-static unsigned long system_supported_vcpu_features(void)
+static long system_supported_vcpu_features(void)
 {
 	unsigned long features = KVM_VCPU_VALID_FEATURES;
+	int r;
 
 	if (!cpus_have_final_cap(ARM64_HAS_32BIT_EL1))
 		clear_bit(KVM_ARM_VCPU_EL1_32BIT, &features);
 
-	if (!kvm_supports_guest_pmuv3())
+	r = kvm_supports_guest_pmuv3();
+	if (r < 0)
+		return r;
+
+	if (!r)
 		clear_bit(KVM_ARM_VCPU_PMU_V3, &features);
 
 	if (!system_supports_sve())
@@ -1555,6 +1560,7 @@ static int kvm_vcpu_init_check_features(struct kvm_vcpu *vcpu,
 					const struct kvm_vcpu_init *init)
 {
 	unsigned long features = init->features[0];
+	long r;
 	int i;
 
 	if (features & ~KVM_VCPU_VALID_FEATURES)
@@ -1565,7 +1571,11 @@ static int kvm_vcpu_init_check_features(struct kvm_vcpu *vcpu,
 			return -ENOENT;
 	}
 
-	if (features & ~system_supported_vcpu_features())
+	r = system_supported_vcpu_features();
+	if (r < 0)
+		return r;
+
+	if (features & ~r)
 		return -EINVAL;
 
 	/*
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index c816db5d6761..f50bb9d9a1e7 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -24,10 +24,26 @@ static void kvm_pmu_create_perf_event(struct kvm_pmc *pmc);
 static void kvm_pmu_release_perf_event(struct kvm_pmc *pmc);
 static bool kvm_pmu_counter_is_enabled(struct kvm_pmc *pmc);
 
-bool kvm_supports_guest_pmuv3(void)
+int kvm_supports_guest_pmuv3(void)
 {
+	cpumask_var_t cpus __free(free_cpumask_var) = CPUMASK_VAR_NULL;
+	struct arm_pmu_entry *entry;
+
+	if (!alloc_cpumask_var(&cpus, GFP_KERNEL))
+		return -ENOMEM;
+
+	cpumask_copy(cpus, cpu_possible_mask);
+
 	guard(mutex)(&arm_pmus_lock);
-	return !list_empty(&arm_pmus);
+
+	list_for_each_entry(entry, &arm_pmus, entry) {
+		struct arm_pmu *pmu = entry->arm_pmu;
+
+		if (!cpumask_andnot(cpus, cpus, &pmu->supported_cpus))
+			return 1;
+	}
+
+	return 0;
 }
 
 static struct kvm_vcpu *kvm_pmc_to_vcpu(const struct kvm_pmc *pmc)
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 0a36a3d5c894..354f06edfdee 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -40,7 +40,7 @@ struct arm_pmu_entry {
 	struct arm_pmu *arm_pmu;
 };
 
-bool kvm_supports_guest_pmuv3(void);
+int kvm_supports_guest_pmuv3(void);
 #define kvm_arm_pmu_irq_initialized(v)	((v)->arch.pmu.irq_num != 0)
 u64 kvm_pmu_get_counter_value(struct kvm_vcpu *vcpu, u64 select_idx);
 void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu, u64 select_idx, u64 val);
@@ -99,9 +99,9 @@ void kvm_pmu_nested_transition(struct kvm_vcpu *vcpu);
 struct kvm_pmu {
 };
 
-static inline bool kvm_supports_guest_pmuv3(void)
+static inline int kvm_supports_guest_pmuv3(void)
 {
-	return false;
+	return 0;
 }
 
 #define kvm_arm_pmu_irq_initialized(v)	(false)

-- 
2.55.0


