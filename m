Return-Path: <linux-doc+bounces-83198-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAnPCMWk3GkEUgkAu9opvQ
	(envelope-from <linux-doc+bounces-83198-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 13 Apr 2026 10:09:41 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 13ED83E8DCC
	for <lists+linux-doc@lfdr.de>; Mon, 13 Apr 2026 10:09:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 53C4F3006807
	for <lists+linux-doc@lfdr.de>; Mon, 13 Apr 2026 08:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA1193A6B79;
	Mon, 13 Apr 2026 08:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=rsg.ci.i.u-tokyo.ac.jp header.i=@rsg.ci.i.u-tokyo.ac.jp header.b="P4J5gXRx"
X-Original-To: linux-doc@vger.kernel.org
Received: from www3579.sakura.ne.jp (www3579.sakura.ne.jp [49.212.243.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A403A4F47;
	Mon, 13 Apr 2026 08:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.212.243.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067764; cv=none; b=t0JK9Qxugm4Sx+L7AFDLF4aaygCSmpYF7x2dXidHXipycnhcuda5Q5vYvJ2d2RA7SKR7y/oq6kDnTL1imO+I7R2LWByPSA4+NlzkL31uboRtNyT3sA0FvNDs++9VQ3HJH9RnYIWi55OMKe9xQTvBlgV6K2KVGpJ+89JExJOB9j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067764; c=relaxed/simple;
	bh=6pigEJb6MjU5WOzv3cHoV2MRbx3gnmposFMAjl091HA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YTWBO+q+TUY3Z25T+NxmCY9fEXQrjoQT5RscvG5CSFAWQz8ucTX50UncVv8hIblKMAsImMRIHmy4l003Z+5PbTuLUIL9KkMTLd1y5+j3QIvJ+8QbFgVA1+1EYk3Ivn0RYoe831pZGKP3C/kxJE7G0REKsJkGLBqYw7Lz+WiKAbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rsg.ci.i.u-tokyo.ac.jp; spf=pass smtp.mailfrom=rsg.ci.i.u-tokyo.ac.jp; dkim=fail (0-bit key) header.d=rsg.ci.i.u-tokyo.ac.jp header.i=@rsg.ci.i.u-tokyo.ac.jp header.b=P4J5gXRx reason="key not found in DNS"; arc=none smtp.client-ip=49.212.243.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rsg.ci.i.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rsg.ci.i.u-tokyo.ac.jp
Received: from h205.csg.ci.i.u-tokyo.ac.jp (h205.csg.ci.i.u-tokyo.ac.jp [133.11.54.205])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 63D87fmk084023
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 13 Apr 2026 17:07:53 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=Vpu164nWx4WQH4ej/oGZKppmfZaoPsbjbattGAiYgSg=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1776067673; v=1;
        b=P4J5gXRxCrE4raUo70biF1JbQD6BOlhA8HNY/1IVx30P4LdJxqmCVvlrdv62GSSY
         49fnSyGQMdhPOQX/aPkiItuz/A/7xtEmk5YpJJW6vTRROyRPhkjS+C/wZ1M9hr29
         4nUC6OGQ5garqfbZzN++pYOHtC//wUphdvS3EbBmq6vUqCfVyWH9g9MlVvH3622m
         Zj+XsCXZ74wpUr+UWG0Zx1OA3M1mJmcwg2YZHotnhijR5yjQX6+UdRbb5565SVaF
         58Ci1QfF5HE842DqQKGiCjhvXujeMps4iWk8clunwfHPfJB3jkfxPLgy/iWtsW9F
         hcbtPrpiteTL5n/lZE7T7Q==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Mon, 13 Apr 2026 17:07:35 +0900
Subject: [PATCH v6 1/4] KVM: arm64: PMU: Add kvm_pmu_enabled_counter_mask()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-hybrid-v6-1-e79d760f7f1b@rsg.ci.i.u-tokyo.ac.jp>
References: <20260413-hybrid-v6-0-e79d760f7f1b@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260413-hybrid-v6-0-e79d760f7f1b@rsg.ci.i.u-tokyo.ac.jp>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[u-tokyo.ac.jp : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-83198-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	R_DKIM_PERMFAIL(0.00)[rsg.ci.i.u-tokyo.ac.jp:s=rs20250326];
	DKIM_TRACE(0.00)[rsg.ci.i.u-tokyo.ac.jp:~];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[odaki@rsg.ci.i.u-tokyo.ac.jp,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.576];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,rsg.ci.i.u-tokyo.ac.jp:mid]
X-Rspamd-Queue-Id: 13ED83E8DCC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This function will be useful to enumerate enabled counters.

Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 arch/arm64/kvm/pmu-emul.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index b03dbda7f1ab..59ec96e09321 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -619,18 +619,24 @@ void kvm_pmu_handle_pmcr(struct kvm_vcpu *vcpu, u64 val)
 	}
 }
 
-static bool kvm_pmu_counter_is_enabled(struct kvm_pmc *pmc)
+static u64 kvm_pmu_enabled_counter_mask(struct kvm_vcpu *vcpu)
 {
-	struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
-	unsigned int mdcr = __vcpu_sys_reg(vcpu, MDCR_EL2);
+	u64 mask = 0;
 
-	if (!(__vcpu_sys_reg(vcpu, PMCNTENSET_EL0) & BIT(pmc->idx)))
-		return false;
+	if (__vcpu_sys_reg(vcpu, MDCR_EL2) & MDCR_EL2_HPME)
+		mask |= kvm_pmu_hyp_counter_mask(vcpu);
 
-	if (kvm_pmu_counter_is_hyp(vcpu, pmc->idx))
-		return mdcr & MDCR_EL2_HPME;
+	if (kvm_vcpu_read_pmcr(vcpu) & ARMV8_PMU_PMCR_E)
+		mask |= ~kvm_pmu_hyp_counter_mask(vcpu);
+
+	return __vcpu_sys_reg(vcpu, PMCNTENSET_EL0) & mask;
+}
+
+static bool kvm_pmu_counter_is_enabled(struct kvm_pmc *pmc)
+{
+	struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
 
-	return kvm_vcpu_read_pmcr(vcpu) & ARMV8_PMU_PMCR_E;
+	return kvm_pmu_enabled_counter_mask(vcpu) & BIT(pmc->idx);
 }
 
 static bool kvm_pmc_counts_at_el0(struct kvm_pmc *pmc)

-- 
2.53.0


