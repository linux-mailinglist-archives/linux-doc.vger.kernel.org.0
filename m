Return-Path: <linux-doc+bounces-83750-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mD93LvA942lCDwEAu9opvQ
	(envelope-from <linux-doc+bounces-83750-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 18 Apr 2026 10:16:48 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D01A420642
	for <lists+linux-doc@lfdr.de>; Sat, 18 Apr 2026 10:16:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 506603036EDC
	for <lists+linux-doc@lfdr.de>; Sat, 18 Apr 2026 08:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64CDB346A13;
	Sat, 18 Apr 2026 08:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=rsg.ci.i.u-tokyo.ac.jp header.i=@rsg.ci.i.u-tokyo.ac.jp header.b="Xz66r8Qg"
X-Original-To: linux-doc@vger.kernel.org
Received: from www3579.sakura.ne.jp (www3579.sakura.ne.jp [49.212.243.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D276430AAA6;
	Sat, 18 Apr 2026 08:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.212.243.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776500161; cv=none; b=lsOR4rJrQZnbn833qgitMzo9GAVZYJUg5dsEZBskawOhtA3bbpK3Sm7AohF7zSlhQoQrB97PFpG2WonNPPCYruFvGcFy5Rfnp0N5VKWUp8SM5XTj/episGegmzA4oUyilDY2jDNZ07nuWf16KxXQY5qv57zA/2uuIJNDdVQeml8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776500161; c=relaxed/simple;
	bh=iJr5toA1/CsmmyI6M1AbODpx/FMJj4ZMpGVZAMCOEe4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iPaUUPRJNeTWUe33WDsrCId0YOg3+9CIzsxzS7m7yHG2P0vfVAXof6N4z9KnhpANb5GX1hxyv5A8I+uyBAblOHy22LzgRyENISyJhygxAsL0AwvT+Y+b2W4fMVc9POkZJ+iL253Jup1HODTLupVhnD+zerDnjqelolkQhZAuxYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rsg.ci.i.u-tokyo.ac.jp; spf=pass smtp.mailfrom=rsg.ci.i.u-tokyo.ac.jp; dkim=fail (0-bit key) header.d=rsg.ci.i.u-tokyo.ac.jp header.i=@rsg.ci.i.u-tokyo.ac.jp header.b=Xz66r8Qg reason="key not found in DNS"; arc=none smtp.client-ip=49.212.243.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rsg.ci.i.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rsg.ci.i.u-tokyo.ac.jp
Received: from h205.csg.ci.i.u-tokyo.ac.jp (h205.csg.ci.i.u-tokyo.ac.jp [133.11.54.205])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 63I8EbAf001871
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sat, 18 Apr 2026 17:15:02 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=y+sZrQAT5sl0rgEx/XygAhgEwYefEMRbED57gjaRUBQ=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1776500102; v=1;
        b=Xz66r8Qg0/zVlkTjNC5uzAVewL1IwJGOL+60B/CazMd8aGAysrZMr8+FvUNPY6HD
         HQat39MdYcRo3+z+jc7/c1crn9T26KBNuY9WihUspLVywY+RNABy2s/dqsE85kgP
         u8NmKJDv064guvTg6iw+zduaK4dIIhahN6JZ64M4XiFNLuxsGMR5cgTpKl0OOb3c
         Q7Lp3X2xb4/uZwUKfQH4u87aYKWJ7L+TzBnIOJ9f5jbR1iUSap8F6aB5N3DnWpnc
         K1afLlY4+JD/UytVEybKUgLh7agDCpj7W9+jRXXaH+C8B8aqLE0R+aaDgRyvdUi+
         C/ebx585KM3RwIolkbe1og==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Sat, 18 Apr 2026 17:14:24 +0900
Subject: [PATCH v7 2/4] KVM: arm64: PMU: Protect the list of PMUs with RCU
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260418-hybrid-v7-2-2bf39ad009bf@rsg.ci.i.u-tokyo.ac.jp>
References: <20260418-hybrid-v7-0-2bf39ad009bf@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260418-hybrid-v7-0-2bf39ad009bf@rsg.ci.i.u-tokyo.ac.jp>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: b4 0.15-dev-5ab4c
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[u-tokyo.ac.jp : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-83750-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_PERMFAIL(0.00)[rsg.ci.i.u-tokyo.ac.jp:s=rs20250326];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[rsg.ci.i.u-tokyo.ac.jp:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[odaki@rsg.ci.i.u-tokyo.ac.jp,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.790];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rsg.ci.i.u-tokyo.ac.jp:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,u-tokyo.ac.jp:email]
X-Rspamd-Queue-Id: 5D01A420642
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert the list of PMUs to a RCU-protected list that has primitives to
avoid read-side contention.

Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 arch/arm64/kvm/pmu-emul.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 59ec96e09321..ef5140bbfe28 100644
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
@@ -26,7 +26,6 @@ static bool kvm_pmu_counter_is_enabled(struct kvm_pmc *pmc);
 
 bool kvm_supports_guest_pmuv3(void)
 {
-	guard(mutex)(&arm_pmus_lock);
 	return !list_empty(&arm_pmus);
 }
 
@@ -808,7 +807,7 @@ void kvm_host_pmu_init(struct arm_pmu *pmu)
 		return;
 
 	entry->arm_pmu = pmu;
-	list_add_tail(&entry->entry, &arm_pmus);
+	list_add_tail_rcu(&entry->entry, &arm_pmus);
 }
 
 static struct arm_pmu *kvm_pmu_probe_armpmu(void)
@@ -817,7 +816,7 @@ static struct arm_pmu *kvm_pmu_probe_armpmu(void)
 	struct arm_pmu *pmu;
 	int cpu;
 
-	guard(mutex)(&arm_pmus_lock);
+	guard(rcu)();
 
 	/*
 	 * It is safe to use a stale cpu to iterate the list of PMUs so long as
@@ -837,7 +836,7 @@ static struct arm_pmu *kvm_pmu_probe_armpmu(void)
 	 * carried here.
 	 */
 	cpu = raw_smp_processor_id();
-	list_for_each_entry(entry, &arm_pmus, entry) {
+	list_for_each_entry_rcu(entry, &arm_pmus, entry) {
 		pmu = entry->arm_pmu;
 
 		if (cpumask_test_cpu(cpu, &pmu->supported_cpus))
@@ -1088,9 +1087,9 @@ static int kvm_arm_pmu_v3_set_pmu(struct kvm_vcpu *vcpu, int pmu_id)
 	int ret = -ENXIO;
 
 	lockdep_assert_held(&kvm->arch.config_lock);
-	mutex_lock(&arm_pmus_lock);
+	guard(rcu)();
 
-	list_for_each_entry(entry, &arm_pmus, entry) {
+	list_for_each_entry_rcu(entry, &arm_pmus, entry) {
 		arm_pmu = entry->arm_pmu;
 		if (arm_pmu->pmu.type == pmu_id) {
 			if (kvm_vm_has_ran_once(kvm) ||
@@ -1106,7 +1105,6 @@ static int kvm_arm_pmu_v3_set_pmu(struct kvm_vcpu *vcpu, int pmu_id)
 		}
 	}
 
-	mutex_unlock(&arm_pmus_lock);
 	return ret;
 }
 

-- 
2.53.0


