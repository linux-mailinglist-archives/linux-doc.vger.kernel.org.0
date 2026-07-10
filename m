Return-Path: <linux-doc+bounces-96232-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r6jqD1vUUGoG5wIAu9opvQ
	(envelope-from <linux-doc+bounces-96232-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 13:15:39 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA9C73A0FA
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 13:15:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=rsg.ci.i.u-tokyo.ac.jp header.s=rs20250326 header.b=BmBSxaV5;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=u-tokyo.ac.jp (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96232-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-96232-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A8DC63040019
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 11:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A2D8416D0D;
	Fri, 10 Jul 2026 11:15:21 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from www3579.sakura.ne.jp (www3579.sakura.ne.jp [49.212.243.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B347413D8C
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 11:15:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783682121; cv=none; b=Yx0bfddp1sJMyt5vr155LgCMQjSSkVc/sFSXtxt4ieyZNJYw9RNnN6JxxRcRZdedkjjaOeuYF7YgcZoXIikhr1lMn8uTBXTodUv0SZXHB2NJbMLUc3/F8ifj+nwvAykt3+aO47AhyzpSV+AVS+aBZ/9+TDexChW3DgBV7QNxa/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783682121; c=relaxed/simple;
	bh=czv2g+GuK7rCFgQGkd6MIB0mjD9by6RlwHlZIF8LF0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZlpUIdzBeML6xmhfTSW9AQdgpV6Ir+DsahuJpuDBIxXCqXET5GLRxRY7U/ha2epFdfb2zcsDlaNbJWOVswSf6YbjbzAMJabFbJ9O/+1OlskHJO/IyAwkxcyI8+KVTeHoE8SUoSZPDETZvGg0YaaSwp1X8CKw4SElMivvpc2IRvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rsg.ci.i.u-tokyo.ac.jp; spf=pass smtp.mailfrom=rsg.ci.i.u-tokyo.ac.jp; dkim=fail (0-bit key) header.d=rsg.ci.i.u-tokyo.ac.jp header.i=@rsg.ci.i.u-tokyo.ac.jp header.b=BmBSxaV5 reason="key not found in DNS"; arc=none smtp.client-ip=49.212.243.89
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 66ABEvsK024946
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 10 Jul 2026 20:15:10 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=/U1Gw8hevVKM95vpLUwyV9E1e21wXByHb45PT6PY3mg=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1783682111; v=1;
        b=BmBSxaV5UzA5XSQgoXX+yskzpEDYEdnJVOJCUGr7Vj6yuiAVgqYdpfo4PGcmSeJU
         36G+MlsCngo6FfOpQnygDfWtjBiFQRxVRAyjnNfJXWmhHhEe+fZIRwbEFcY44LtD
         bBcWH+7Nn39MtS0L5FvOwjLd+oWCszp4GUOxnDFmFBFrBfS9NKkIBukTkwA54GMk
         TjfJbkaDEPuJMcKuM/57MDenyvlV4rg1PX16Qtp36+5n1rU2sCtiLCO7kCKHQs4Q
         gLLG23K3+h1lMGCy4LiESBHSlPEDn0WqM/RtKnKuDmJRlTo5o8GOMLKgxWWEW4xb
         X978avdK1iVwN9AaLYjW9A==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Fri, 10 Jul 2026 20:15:00 +0900
Subject: [PATCH v8 06/11] KVM: arm64: PMU: Protect the list of PMUs with
 RCU
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-hybrid-v8-6-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2695;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=czv2g+GuK7rCFgQGkd6MIB0mjD9by6RlwHlZIF8LF0c=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ1bAFYvZE3/Fnj+xkjfxXb7y0uqEaZLfrmt5cTpYTGxcP
 1X+m2FYRykLgxgXg6yYIktK0W5ujejaT4UJ8S0wc1iZQIYwcHEKwESe8zEybDC6URB7+35BYrHJ
 m0ajY/G+qf3NUxjMJVn2yt1h/Mazh+Gf6XuX1ReuTHULt99+79gevgXu+fev7wz+uTBJ+9cBhX4
 rBgA=
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
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
	TAGGED_FROM(0.00)[bounces-96232-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,u-tokyo.ac.jp:email,rsg.ci.i.u-tokyo.ac.jp:mid,rsg.ci.i.u-tokyo.ac.jp:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AAA9C73A0FA

Convert the list of PMUs to a RCU-protected list that has primitives to
avoid read-side contention.

Assisted-by: Codex:gpt-5.5
Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 arch/arm64/kvm/pmu-emul.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index c816db5d6761..68fce960ba69 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -7,9 +7,9 @@
 #include <linux/cpu.h>
 #include <linux/kvm.h>
 #include <linux/kvm_host.h>
-#include <linux/list.h>
 #include <linux/perf_event.h>
 #include <linux/perf/arm_pmu.h>
+#include <linux/rculist.h>
 #include <linux/uaccess.h>
 #include <asm/kvm_emulate.h>
 #include <kvm/arm_pmu.h>
@@ -17,6 +17,10 @@
 
 #define PERF_ATTR_CFG1_COUNTER_64BIT	BIT(0)
 
+/*
+ * arm_pmus is append-only. kvm_supports_guest_pmuv3() feeds persistent
+ * VM state, so a true result must remain valid after the check.
+ */
 static LIST_HEAD(arm_pmus);
 static DEFINE_MUTEX(arm_pmus_lock);
 
@@ -26,7 +30,6 @@ static bool kvm_pmu_counter_is_enabled(struct kvm_pmc *pmc);
 
 bool kvm_supports_guest_pmuv3(void)
 {
-	guard(mutex)(&arm_pmus_lock);
 	return !list_empty(&arm_pmus);
 }
 
@@ -802,7 +805,7 @@ void kvm_host_pmu_init(struct arm_pmu *pmu)
 		return;
 
 	entry->arm_pmu = pmu;
-	list_add_tail(&entry->entry, &arm_pmus);
+	list_add_tail_rcu(&entry->entry, &arm_pmus);
 }
 
 static struct arm_pmu *kvm_pmu_probe_armpmu(void)
@@ -811,7 +814,7 @@ static struct arm_pmu *kvm_pmu_probe_armpmu(void)
 	struct arm_pmu *pmu;
 	int cpu;
 
-	guard(mutex)(&arm_pmus_lock);
+	guard(rcu)();
 
 	/*
 	 * It is safe to use a stale cpu to iterate the list of PMUs so long as
@@ -831,7 +834,7 @@ static struct arm_pmu *kvm_pmu_probe_armpmu(void)
 	 * carried here.
 	 */
 	cpu = raw_smp_processor_id();
-	list_for_each_entry(entry, &arm_pmus, entry) {
+	list_for_each_entry_rcu(entry, &arm_pmus, entry) {
 		pmu = entry->arm_pmu;
 
 		if (cpumask_test_cpu(cpu, &pmu->supported_cpus))
@@ -1092,9 +1095,9 @@ static int kvm_arm_pmu_v3_set_pmu(struct kvm_vcpu *vcpu, int pmu_id)
 	int ret = -ENXIO;
 
 	lockdep_assert_held(&kvm->arch.config_lock);
-	mutex_lock(&arm_pmus_lock);
+	guard(rcu)();
 
-	list_for_each_entry(entry, &arm_pmus, entry) {
+	list_for_each_entry_rcu(entry, &arm_pmus, entry) {
 		arm_pmu = entry->arm_pmu;
 		if (arm_pmu->pmu.type == pmu_id) {
 			if (kvm_vm_has_ran_once(kvm) ||
@@ -1110,7 +1113,6 @@ static int kvm_arm_pmu_v3_set_pmu(struct kvm_vcpu *vcpu, int pmu_id)
 		}
 	}
 
-	mutex_unlock(&arm_pmus_lock);
 	return ret;
 }
 

-- 
2.55.0


