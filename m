Return-Path: <linux-doc+bounces-96228-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0ApGCVPUUGqZ5gIAu9opvQ
	(envelope-from <linux-doc+bounces-96228-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 13:15:31 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6664A73A0BA
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 13:15:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=rsg.ci.i.u-tokyo.ac.jp header.s=rs20250326 header.b="mZ/mHjw+";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=u-tokyo.ac.jp (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96228-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-96228-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0F2D8300E6AA
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 11:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0F1416CF5;
	Fri, 10 Jul 2026 11:15:20 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from www3579.sakura.ne.jp (www3579.sakura.ne.jp [49.212.243.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C8341168A
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 11:15:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783682120; cv=none; b=cnddzb5h2cU4e1oHdqcMr5N77QVvUTROzvOnz7ii9nOK2BAOi7Z7viin3JtsgHrjVNbcwGCcg6vbwRAcEPQoadTfXSmELNSZbwv1+NFghJhdzuzb4xyBIlecPoCSYbyjUcCoxNylVH3SX5/nOBERO8K8a6UBOiF1m7YpeE05dl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783682120; c=relaxed/simple;
	bh=U9MEpE2Ih98r0rKIS5ukgUhQF9OCUYmg2BREdlUGgos=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n5e8wudbR28BOFNjgf2qTbkWzUIFpGg6snvJ6V/r0s+3zQVpHUQW3qWMz0FHNpQ+Qv+G+l9E4Kd+uvATNVUvQ+RboHEddxndGAQkJRBOqyJRp7fPIMlkYmuVrWtY85a3dhezZtfJjdF6HbpuEYCKxSawIx1Q2VQ2/ISKt1NhsjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rsg.ci.i.u-tokyo.ac.jp; spf=pass smtp.mailfrom=rsg.ci.i.u-tokyo.ac.jp; dkim=fail (0-bit key) header.d=rsg.ci.i.u-tokyo.ac.jp header.i=@rsg.ci.i.u-tokyo.ac.jp header.b=mZ/mHjw+ reason="key not found in DNS"; arc=none smtp.client-ip=49.212.243.89
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 66ABEvsH024946
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 10 Jul 2026 20:15:10 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=uYrOcz7cPsXjyBNdYSNHFBXBQv6JgbTYi8PN49aaXZ8=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1783682110; v=1;
        b=mZ/mHjw+q5qmL6SJzncK0NvUHK9WAcp5mzhrd+351BTQ3OTW9tPlk8hESlrpH9eu
         WvTo7LkX++pgZuuMDnEmALooMjv0hO0A04LoqC/4A3otIkV07uAY+XjdwAoPWgGo
         yRUSqXk9XRdEfnmK9P3Fq5GSlCllRghQ1G5NsSpAEyEZ6hRnEBSzzBLdG34xVVFt
         EDKMRxkTq9HDwrSCgmnAOxifIua5gxb1wZW+JboMnZ3aEZM5fulciA4NnS31W//E
         UV9bw192xIrz4ExCj/R89VqKrh9460iRgoZ38dANsub5tnHciSEnJwPXS5LkDLAi
         OkRtOUVpJwByY1bh9TdNpA==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Fri, 10 Jul 2026 20:14:57 +0900
Subject: [PATCH v8 03/11] KVM: arm64: selftests: Cover PMU state in
 MDCR_EL2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-hybrid-v8-3-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
References: <20260710-hybrid-v8-0-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260710-hybrid-v8-0-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: b4 0.16-dev-925f5
X-Developer-Signature: v=1; a=openpgp-sha256; l=4101;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=U9MEpE2Ih98r0rKIS5ukgUhQF9OCUYmg2BREdlUGgos=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ1bAFdOoCdslkj9tDK85mGkeprzlWJKYd6tsW/56hf+r2
 KNM+uZ2lLIwiHExyIopsqQU7ebWiK79VJgQ3wIzh5UJZAgDF6cATORBAiPD4fz/qRuFXrndFrHc
 6Tv74rv96UenzKrcc69SWX9L16LQcwz//Ts3vivq/XrNsfHy8XrPi112U4xuZvXquH6r6vTXVrz
 DAgA=
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[u-tokyo.ac.jp : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[odaki@rsg.ci.i.u-tokyo.ac.jp,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:maz@kernel.org,m:oupton@kernel.org,m:joey.gouly@arm.com,m:suzuki.poulose@arm.com,m:yuzenghui@huawei.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:pbonzini@redhat.com,m:corbet@lwn.net,m:shuah@kernel.org,m:skhan@linuxfoundation.org,m:yury.norov@gmail.com,m:linux@rasmusvillemoes.dk,m:linux-arm-kernel@lists.infradead.org,m:kvmarm@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:devel@daynix.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:odaki@rsg.ci.i.u-tokyo.ac.jp,m:yurynorov@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,huawei.com,redhat.com,lwn.net,linuxfoundation.org,gmail.com,rasmusvillemoes.dk];
	FORWARDED(0.00)[lists@lfdr.de];
	R_DKIM_PERMFAIL(0.00)[rsg.ci.i.u-tokyo.ac.jp:s=rs20250326];
	TAGGED_FROM(0.00)[bounces-96228-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[odaki@rsg.ci.i.u-tokyo.ac.jp,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[rsg.ci.i.u-tokyo.ac.jp:~];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,u-tokyo.ac.jp:email,rsg.ci.i.u-tokyo.ac.jp:mid,rsg.ci.i.u-tokyo.ac.jp:from_mime,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6664A73A0BA

Add MDCR_EL2 coverage to vpmu_counter_access when EL2 is available.

For each configured PMCR_EL0.N value, verify that HPMN tracks the
configured counter count, HPME can be toggled without disturbing HPMN,
and KVM_SET_ONE_REG rejects an out-of-range HPMN without changing
MDCR_EL2. Reset the vCPU and verify that HPMN is restored from the
configured count.

Assisted-by: Codex:gpt-5.5
Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 .../selftests/kvm/arm64/vpmu_counter_access.c      | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
index 22223395969e..25203ea117b0 100644
--- a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
+++ b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
@@ -25,6 +25,14 @@
 /* The cycle counter bit position that's common among the PMU registers */
 #define ARMV8_PMU_CYCLE_IDX		31
 
+#ifndef MDCR_EL2_HPMN
+#define MDCR_EL2_HPMN			GENMASK_ULL(4, 0)
+#endif
+
+#ifndef MDCR_EL2_HPME
+#define MDCR_EL2_HPME			BIT_ULL(7)
+#endif
+
 struct vpmu_vm {
 	struct kvm_vm *vm;
 	struct kvm_vcpu *vcpu;
@@ -583,6 +591,73 @@ static void run_pmregs_validity_test(u64 pmcr_n)
 	destroy_vpmu_vm();
 }
 
+static void run_mdcr_el2_validity_test(u64 pmcr_n)
+{
+	struct kvm_vcpu_init init;
+	struct kvm_vcpu *vcpu;
+	u64 mdcr, old_mdcr;
+	int ret;
+
+	pr_debug("MDCR_EL2 test with pmcr_n %lu\n", pmcr_n);
+
+	test_create_vpmu_vm_with_nr_counters(pmcr_n, false);
+	if (!vm_supports_el2(vpmu_vm.vm)) {
+		destroy_vpmu_vm();
+		return;
+	}
+
+	vcpu = vpmu_vm.vcpu;
+
+	mdcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MDCR_EL2));
+	TEST_ASSERT(FIELD_GET(MDCR_EL2_HPMN, mdcr) == pmcr_n,
+		    "MDCR_EL2.HPMN is not updated after PMU_V3_SET_NR_COUNTERS (expected %lu, got %lu)",
+		    pmcr_n, FIELD_GET(MDCR_EL2_HPMN, mdcr));
+
+	old_mdcr = mdcr;
+	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MDCR_EL2),
+		     old_mdcr ^ MDCR_EL2_HPME);
+
+	mdcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MDCR_EL2));
+	TEST_ASSERT(mdcr == (old_mdcr ^ MDCR_EL2_HPME),
+		    "MDCR_EL2 was not properly updated after HPME write (expected 0x%lx, got 0x%lx)",
+		    old_mdcr ^ MDCR_EL2_HPME, mdcr);
+
+	if (pmcr_n < FIELD_MAX(MDCR_EL2_HPMN)) {
+		errno = 0;
+		old_mdcr = mdcr;
+		ret = __vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MDCR_EL2),
+				     u64_replace_bits(mdcr, pmcr_n + 1, MDCR_EL2_HPMN));
+		TEST_ASSERT(ret == -1 && errno == EINVAL,
+			    "Setting MDCR_EL2.HPMN to %lu unexpectedly succeeded",
+			    pmcr_n + 1);
+
+		mdcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MDCR_EL2));
+		TEST_ASSERT(mdcr == old_mdcr,
+			    "MDCR_EL2 changed after failed HPMN write (expected 0x%lx, got 0x%lx)",
+			    old_mdcr, mdcr);
+	}
+
+	old_mdcr = mdcr;
+	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MDCR_EL2),
+		     u64_replace_bits(mdcr, 0, MDCR_EL2_HPMN));
+
+	mdcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MDCR_EL2));
+	TEST_ASSERT(mdcr == u64_replace_bits(old_mdcr, 0, MDCR_EL2_HPMN),
+		    "MDCR_EL2 was not properly updated after HPMN write (expected 0x%lx, got 0x%lx)",
+		    u64_replace_bits(old_mdcr, 0, MDCR_EL2_HPMN), mdcr);
+
+	kvm_get_default_vcpu_target(vpmu_vm.vm, &init);
+	init.features[0] |= (1 << KVM_ARM_VCPU_PMU_V3);
+	aarch64_vcpu_setup(vcpu, &init);
+
+	mdcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MDCR_EL2));
+	TEST_ASSERT(FIELD_GET(MDCR_EL2_HPMN, mdcr) == pmcr_n,
+		    "MDCR_EL2.HPMN is not updated after INIT (expected %lu, got %lu)",
+		    pmcr_n, FIELD_GET(MDCR_EL2_HPMN, mdcr));
+
+	destroy_vpmu_vm();
+}
+
 /*
  * Create a guest with one vCPU, and attempt to set the PMCR_EL0.N for
  * the vCPU to @pmcr_n, which is larger than the host value.
@@ -634,6 +709,7 @@ int main(void)
 	for (i = 0; i <= pmcr_n; i++) {
 		run_access_test(i);
 		run_pmregs_validity_test(i);
+		run_mdcr_el2_validity_test(i);
 	}
 
 	for (i = pmcr_n + 1; i < ARMV8_PMU_MAX_COUNTERS; i++)

-- 
2.55.0


